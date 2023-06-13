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
      * RBKCRTOP - Implement the createRedbook operation              *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKCRTOP.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBK01Q01.
       COPY RBK01P01.
       COPY RBKWSTOR.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Get the request structure
           EXEC CICS GET CONTAINER(WS-BAQBASE-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(BAQBASE-RBK01Q01)
                         RESP(WS-RESP)
           END-EXEC.

      * Prepare the response structure
           INITIALIZE BAQBASE-RBK01P01.

      * Use the title as a parameter
           EXEC CICS PUT CONTAINER(WS-RBKPARM-CONT-NAME)
                 CHANNEL(WS-CHANNEL-NAME)
                 FROM(requestPathParameters)
                 BIT
           END-EXEC

      * See if this title is already in the store
           EXEC CICS LINK PROGRAM('RBKRTITL')
                     CHANNEL(WS-CHANNEL-NAME)
           END-EXEC.

      * Check if an error occurred
           EXEC CICS GET CONTAINER(WS-RBKEROR-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         NODATA
                         FLENGTH(WS-LENGTH)
                         RESP(WS-RESP)
           END-EXEC.

      * If so, return a 500
           IF WS-RESP = DFHRESP(NORMAL) THEN
              MOVE 1 TO responseCode500-existence OF BAQBASE-RBK01P01
              MOVE WS-RBKEROR-CONT-NAME TO responseCode500-cont
                   OF BAQBASE-RBK01P01
              GO TO EXIT-PROGRAM
           END-IF.

      * Check if a book was found with the provided title
           EXEC CICS GET CONTAINER(WS-REDBOOK-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(WS-BOOK)
                         RESP(WS-RESP)
           END-EXEC.

      * If we already have a book of with the requested title, 
      * return a 409
           IF WS-RESP = DFHRESP(NORMAL) THEN

      * Prepare the 409 response, sending back the details of the
      * existing book with that title
              MOVE 1 TO responseCode409-existence IN BAQBASE-RBK01P01
              MOVE WS-REDBOOK-CONT-NAME TO responseCode409-cont
              GO TO EXIT-PROGRAM
           END-IF.

      * Otherwise add the new book to the store and return a 201
           INITIALIZE WS-BOOK.

      * Copy the book details across into the internal format
           MOVE Xtitle2 OF requestBody(1:Xtitle2-length) TO Xtitle
              OF Redbook OF WS-BOOK.
           MOVE Xtitle2-length OF requestBody TO Xtitle-length
              OF Redbook OF WS-BOOK.
           MOVE CORR requestBody OF BAQBASE-RBK01Q01 TO Redbook OF
              WS-BOOK.

      * Set this data as an input parameter
           EXEC CICS PUT CONTAINER(WS-RBKPARM-CONT-NAME)
                         FROM(WS-BOOK)
                         FLENGTH(LENGTH OF WS-BOOK)
                         BIT
           END-EXEC

      * Write the book to the store
           EXEC CICS LINK PROGRAM('RBKWBOOK')
                     CHANNEL(WS-CHANNEL-NAME)
           END-EXEC.

      * Return a 201
           MOVE 1 to responseCode201-existence.
           MOVE WS-RBKPARM-CONT-NAME TO responseCode201-cont.

       EXIT-PROGRAM.
      * Update the BAQBASE container with the results
           EXEC CICS PUT CONTAINER(WS-BAQBASE-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         FROM(BAQBASE-RBK01P01)
                         FLENGTH(LENGTH OF BAQBASE-RBK01P01)
                         BIT
           END-EXEC.
           EXEC CICS RETURN END-EXEC.