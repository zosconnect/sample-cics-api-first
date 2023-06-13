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
      * RBKRTITL - Search the store for a book based on the title     *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKRTITL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBKWSTOR.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Get the title of the book to find
           EXEC CICS GET CONTAINER(WS-RBKPARM-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(WS-TITLE)
           END-EXEC.

           MOVE Xtitle OF WS-TITLE (1:Xtitle-length OF WS-TITLE)
              TO WS-TITLE-INPUT.

      * Ensure we're the only task accessing the Redbook store TSQ
           EXEC CICS ENQ RESOURCE(WS-REDBOOKS-TSQ)
                         LENGTH(16)
           END-EXEC.

      * Read control entry to start at the beginning of the TSQ
           EXEC CICS READQ TS QNAME(WS-REDBOOKS-TSQ)
                       INTO(WS-BOOK)
                       ITEM(1)
                       RESP(WS-BOOK-RESP)
           END-EXEC.

           IF WS-BOOK-RESP = DFHRESP(NORMAL) THEN
      * Start with the book as not found
              SET WS-TITLE-NOT-FOUND TO TRUE
      * Loop over the books and check their titles
              PERFORM UNTIL EXIT
                 EXEC CICS READQ TS QNAME(WS-REDBOOKS-TSQ)
                     INTO(WS-BOOK)
                     NEXT
                     RESP(WS-BOOK-RESP)
                 END-EXEC
      * We reached the end of the TSQ
                 IF WS-BOOK-RESP NOT = DFHRESP(NORMAL) THEN
                    EXIT PERFORM
                 END-IF
      * If the title matches, exit the loop
                 IF WS-TITLE-INPUT IS EQUAL TO Xtitle IN WS-BOOK THEN
                    SET WS-TITLE-FOUND TO TRUE
                    EXIT PERFORM
                 END-IF
              END-PERFORM
           ELSE
      * The book was not found
              SET WS-TITLE-NOT-FOUND TO TRUE
      * There was an error reading the control entry
              INITIALIZE WS-ERROR
              STRING "RBKRTITL: TSQ "
                       DELIMITED BY SIZE
                     WS-REDBOOKS-TSQ
                       DELIMITED BY SIZE
                     " is unavailable."
                       DELIMITED BY SIZE
                     INTO errorMessage OF WS-ERROR
              INSPECT errorMessage OF WS-ERROR TALLYING
               errorMessage-length OF WS-ERROR FOR CHARACTERS
              MOVE 1 TO errorMessage-existence OF WS-ERROR
              EXEC CICS PUT CONTAINER(WS-RBKEROR-CONT-NAME)
                            FROM(WS-ERROR)
                            FLENGTH(LENGTH OF WS-ERROR)
                            BIT
              END-EXEC
           END-IF.

      * No book was found that matched the provided title so return
           IF WS-TITLE-NOT-FOUND THEN
             GO TO EXIT-PROGRAM
           END-IF.

      * The book was found so prepare the return containers for
      * the caller

      * Read the BAQ-<formNumber> TSQ and copy the data into
      * the required container
           MOVE formNumber OF WS-BOOK TO
             WS-AUTH-TSQ-FORMNUM OF WS-AUTHORS-TSQ.

      * Read control entry to start at the beginning of the TSQ
           EXEC CICS READQ TS QNAME(WS-AUTHORS-TSQ)
                       INTO(WS-AUTHOR)
                       ITEM(1)
                       RESP(WS-AUTH-RESP)
           END-EXEC.

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
           END-IF.

      * Store the book for the caller
           EXEC CICS PUT CONTAINER(WS-REDBOOK-CONT-NAME)
                      FROM(WS-BOOK)
                      FLENGTH(LENGTH OF WS-BOOK)
                      BIT
           END-EXEC.

       EXIT-PROGRAM.
      * Free the Redbook store TSQ for another task to use
  	      EXEC CICS DEQ RESOURCE(WS-REDBOOKS-TSQ)
                         LENGTH(16)
           END-EXEC.

           EXEC CICS RETURN END-EXEC.