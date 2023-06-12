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
      * RBKWBOOK - Write a book and its authors to the store TSQs     *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKWBOOK.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBKWSTOR.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Get the book to write
           EXEC CICS GET CONTAINER(WS-RBKPARM-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(WS-BOOK)
                         RESP(WS-RESP)
           END-EXEC.

           IF WS-RESP NOT = DFHRESP(NORMAL) THEN
      * No book was provided
              GO TO EXIT-PROGRAM
           END-IF.

      * Ensure we're the only task accessing the Redbook store TSQ
           EXEC CICS ENQ RESOURCE(WS-REDBOOKS-TSQ)
                         LENGTH(16)
	                    NOHANDLE
           END-EXEC.

      * Get the authors container and loop over the authors
      * adding them to a new authors TSQ for this form number
           MOVE formNumber OF WS-BOOK TO
             WS-AUTH-TSQ-FORMNUM OF WS-AUTHORS-TSQ

      * Add control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Loop over the authors and add each one
           PERFORM UNTIL EXIT

              EXEC CICS GET CONTAINER(authors-cont)
                            CHANNEL(WS-CHANNEL-NAME)
                            INTO(WS-AUTHOR)
                            FLENGTH(LENGTH OF WS-AUTHOR)
                            BYTEOFFSET(WS-OFFSET)
                            RESP(WS-RESP)
              END-EXEC

              IF WS-RESP NOT = DFHRESP(NORMAL) THEN
                 EXIT PERFORM
              END-IF

      * Add this author
              EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
              END-EXEC

      * Try the next author in the container
              COMPUTE WS-OFFSET = WS-OFFSET +
                                 LENGTH OF WS-AUTHOR
           END-PERFORM.

      * Update the name of the authors container to be the same as the
      * TSQ we just created (for future reads)
           MOVE WS-AUTHORS-TSQ TO authors-cont OF WS-BOOK

      * Write the new book to the TSQ
           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

       EXIT-PROGRAM.
      * Free the Redbook store TSQ for another task to use
  	      EXEC CICS DEQ RESOURCE(WS-REDBOOKS-TSQ)
                         LENGTH(16)
           END-EXEC.

           EXEC CICS RETURN END-EXEC.