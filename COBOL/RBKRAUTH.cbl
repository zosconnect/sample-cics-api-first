      *****************************************************************
      * Copyright IBM Corp. 2023
      *
      * Licensed under the Apache License, Version 2.0 (the "License");
      * you may not use this file except in compliance with the License.
      * You may obtain a copy of the License at
      * 
      *     http://www.apache.org/licenses/LICENSE-2.0
      * 
      * Unless required by applicable law or agreed to in writing
      * , software distributed under the License is distributed on an 
      * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
      * either express or implied. See the License for the specific 
      * language governing permissions and limitations under the
      * License.
      *****************************************************************
	  
      *****************************************************************
      * RBKRAUTH - Search the store for all books by a given author   *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKRAUTH.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBKWSTOR.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Get the author whose books we are going to find
           EXEC CICS GET CONTAINER(WS-RBKPARM-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(WS-AUTHOR)
           END-EXEC.

           MOVE authors(1:authors-length) TO WS-AUTH-INPUT.

      * Ensure we're the only task accessing the Redbook store TSQ
           EXEC CICS ENQ RESOURCE(WS-REDBOOKS-TSQ)
                         LENGTH(16)
	                      NOHANDLE
	                      NOSUSPEND
           END-EXEC.

      * Read the control entry to start at the beginning of the TSQ
           EXEC CICS READQ TS QNAME(WS-REDBOOKS-TSQ)
                       INTO(WS-BOOK)
                       ITEM(1)
                       RESP(WS-BOOK-RESP)
           END-EXEC.

           IF WS-BOOK-RESP = DFHRESP(NORMAL)
      * Loop over the books and check their authors
              PERFORM UNTIL EXIT
                 EXEC CICS READQ TS QNAME(WS-REDBOOKS-TSQ)
                     INTO(WS-BOOK)
                     NEXT
                     RESP(WS-BOOK-RESP)
                 END-EXEC

                 IF WS-BOOK-RESP NOT = DFHRESP(NORMAL) THEN
                    EXIT PERFORM
                 END-IF

      * Start with the author as not found
                 SET WS-AUTH-NOT-FOUND TO TRUE

      * Now loop over the authors for this book

      * Read the BAQ-<formNumber> TSQ
                 MOVE formNumber OF WS-BOOK TO
                   WS-AUTH-TSQ-FORMNUM OF WS-AUTHORS-TSQ

      * Read control entry to start at the beginning of the TSQ
                 EXEC CICS READQ TS QNAME(WS-AUTHORS-TSQ)
                             INTO(WS-AUTHOR)
                             ITEM(1)
                             RESP(WS-AUTH-RESP)
                 END-EXEC

      * If the TSQ is available, loop over all the authors
                 IF WS-AUTH-RESP = DFHRESP(NORMAL)
                    PERFORM UNTIL EXIT
                       EXEC CICS READQ TS QNAME(WS-AUTHORS-TSQ)
                                  INTO(WS-AUTHOR)
                                  RESP(WS-AUTH-RESP)
                                  NEXT
                       END-EXEC
      * We reached the end of the TSQ
                       IF WS-AUTH-RESP NOT = DFHRESP(NORMAL) THEN
                          EXIT PERFORM
                       END-IF
      * If the author matches, exit the loop
                       IF WS-AUTH-INPUT IS EQUAL TO authors OF
                        WS-AUTHOR THEN
                          SET WS-AUTH-FOUND TO TRUE
                          EXIT PERFORM
                       END-IF
                    END-PERFORM
                 END-IF

      * The supplied author wrote this book so add the book to the
      * response container
                 IF WS-AUTH-FOUND THEN

      * Read control entry to start at the beginning of the TSQ
                    EXEC CICS READQ TS QNAME(WS-AUTHORS-TSQ)
                                      INTO(WS-AUTHOR)
                                      ITEM(1)
                                      RESP(WS-AUTH-RESP)
                    END-EXEC

                    IF WS-AUTH-RESP = DFHRESP(NORMAL)
      * Get all the authors
                       PERFORM UNTIL EXIT
                          EXEC CICS READQ TS QNAME(WS-AUTHORS-TSQ)
                                      INTO(WS-AUTHOR)
                                      RESP(WS-AUTH-RESP)
                                      NEXT
                          END-EXEC
      * We reached the end of the TSQ
                          IF WS-AUTH-RESP NOT = DFHRESP(NORMAL) THEN
                             EXIT PERFORM
                          END-IF
      * Add this author to the author container for this book
                          EXEC CICS PUT CONTAINER(authors-cont)
                                   FROM(WS-AUTHOR)
                                   FLENGTH(LENGTH OF WS-AUTHOR)
                                   BIT
                                   APPEND
                          END-EXEC
                       END-PERFORM
                    END-IF

      * Store the book for the caller
                    EXEC CICS PUT CONTAINER(WS-REDBOOK-CONT-NAME)
                         FROM(WS-BOOK)
                         FLENGTH(LENGTH OF WS-BOOK)
                         BIT
                         APPEND
                    END-EXEC

      * Increment the book counter
                    ADD 1 TO WS-BOOK-COUNTER
                  END-IF
              END-PERFORM
           ELSE
      * There was an error reading the control entry
              INITIALIZE WS-ERROR
              STRING "RBKRAUTH: TSQ "
                       DELIMITED BY SIZE
                     WS-REDBOOKS-TSQ
                       DELIMITED BY SIZE
                     " is unavailable."
                       DELIMITED BY SIZE
                     INTO errorMessage OF WS-ERROR
              INSPECT errorMessage OF WS-ERROR TALLYING
               errorMessage-length OF WS-ERROR FOR CHARACTERS
              MOVE 1 to errorMessage-existence IN WS-ERROR
              EXEC CICS PUT CONTAINER(WS-RBKEROR-CONT-NAME)
                            FROM(WS-ERROR)
                            FLENGTH(LENGTH OF WS-ERROR)
                            BIT
              END-EXEC
              GO TO EXIT-PROGRAM
           END-IF.

      * Store the book counter if we found any books
           IF WS-BOOK-COUNTER > 0 THEN
              EXEC CICS PUT CONTAINER(WS-NUMBOOK-CONT-NAME)
                            FROM(WS-BOOK-COUNTER)
                            FLENGTH(LENGTH OF WS-BOOK-COUNTER)
                            BIT
              END-EXEC
           END-IF.

       EXIT-PROGRAM.
      * Free the Redbook store TSQ for another task to use
  	        EXEC CICS DEQ RESOURCE(WS-REDBOOKS-TSQ)
                         LENGTH(16)
           END-EXEC.

           EXEC CICS RETURN END-EXEC.