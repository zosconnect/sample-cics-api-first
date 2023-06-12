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
      * RBKGETOP - Implement the getRedbook operation                 *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKGETOP.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBK00Q01.
       COPY RBK00P01.
       COPY RBKWSTOR.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Get the request data sent by the client calling the API
           EXEC CICS GET CONTAINER(WS-BAQBASE-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(BAQBASE-RBK00Q01)
                         RESP(WS-RESP)
           END-EXEC.

      * Take a copy of the title stored in the path parameter so that
      * we can easily compare the it with the title of the stored books
           MOVE Xtitle OF requestPathParameters
              (1:Xtitle-length OF requestPathParameters )
              TO WS-TITLE-INPUT.

      * Prepare the response structure
           INITIALIZE BAQBASE-RBK00P01.

      * If an author was specified, get all the author's books
           IF Xauthor-existence IN requestQueryParameters > 0 AND
              Xauthor2-length IN requestQueryParameters > 0 THEN

      * Put the author's name as a parameter
              EXEC CICS PUT CONTAINER(WS-RBKPARM-CONT-NAME)
                    CHANNEL(WS-CHANNEL-NAME)
                    FROM(Xauthor OF requestQueryParameters)
                    BIT
              END-EXEC

      * Attempt to find all the books by this author
              EXEC CICS LINK PROGRAM('RBKRAUTH')
                  CHANNEL(WS-CHANNEL-NAME)
              END-EXEC

      * Check if an error occurred
              EXEC CICS GET CONTAINER(WS-RBKEROR-CONT-NAME)
                            CHANNEL(WS-CHANNEL-NAME)
                            NODATA
                            FLENGTH(WS-LENGTH)
                            RESP(WS-RESP)
              END-EXEC

      * If so, return a 500
              IF WS-RESP = DFHRESP(NORMAL) THEN
                 MOVE 1 TO responseCode500-existence OF BAQBASE-RBK00P01
                 MOVE WS-RBKEROR-CONT-NAME TO responseCode500-cont
                      OF BAQBASE-RBK00P01
                 GO TO EXIT-PROGRAM
              END-IF

      * Check if the author has written any books
              EXEC CICS GET CONTAINER(WS-REDBOOK-CONT-NAME)
                            CHANNEL(WS-CHANNEL-NAME)
                            NODATA
                            FLENGTH(WS-LENGTH)
                            RESP(WS-RESP)
              END-EXEC

              IF WS-RESP NOT = DFHRESP(NORMAL) THEN
      * If no books were returned, we return a 404
                 MOVE 1 TO responseCode404-existence OF BAQBASE-RBK00P01
                 MOVE WS-RESP404-CONT-NAME TO responseCode404-cont
                   OF BAQBASE-RBK00P01

                 INITIALIZE RBK00P01-responseCode404
                 STRING "No Redbooks located for author "
                          DELIMITED BY SIZE
                        Xauthor2
                          DELIMITED BY SPACE
                      INTO Xmessage OF responseCode404
      * Set length of message
                 INSPECT FUNCTION REVERSE (Xmessage OF responseCode404)
                    TALLYING WS-MESG-COUNTER FOR LEADING SPACES

                 COMPUTE Xmessage-length OF responseCode404 =
                 LENGTH OF Xmessage OF responseCode404 - WS-MESG-COUNTER
      * Put the 404 data into the container
                 EXEC CICS PUT CONTAINER(WS-RESP404-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         FROM(RBK00P01-responseCode404)
                         FLENGTH(LENGTH OF RBK00P01-responseCode404)
                         BIT
                 END-EXEC
                 GO TO EXIT-PROGRAM
              END-IF

      * We got some books back for this author so now we need to
      * loop over the returned container and check the for the title
              SET WS-TITLE-NOT-FOUND TO TRUE
              MOVE 0 TO WS-OFFSET

              PERFORM UNTIL EXIT

                 EXEC CICS GET CONTAINER(WS-REDBOOK-CONT-NAME)
                               CHANNEL(WS-CHANNEL-NAME)
                               INTO(WS-BOOK)
                               FLENGTH(LENGTH OF WS-BOOK)
                               BYTEOFFSET(WS-OFFSET)
                               RESP(WS-RESP)
                 END-EXEC

                 IF WS-RESP NOT = DFHRESP(NORMAL) THEN
                    EXIT PERFORM
                 END-IF

      * If this is the book we're looking for, store the book and
      * exit the loop
                 IF WS-TITLE-INPUT IS EQUAL TO Xtitle IN WS-BOOK THEN
                    SET WS-TITLE-FOUND TO TRUE
                    EXIT PERFORM
                 END-IF

      * Otherwise, try the next book
                 COMPUTE WS-OFFSET = WS-OFFSET + LENGTH OF WS-BOOK
              END-PERFORM

      * If the title was not found, return a 404 and
      * the authors other books
              IF WS-TITLE-NOT-FOUND THEN
                 MOVE 1 TO responseCode404-existence OF BAQBASE-RBK00P01
                 MOVE WS-RESP404-CONT-NAME TO responseCode404-cont
                   OF BAQBASE-RBK00P01
                 INITIALIZE RBK00P01-responseCode404
                 STRING "No Redbooks located for author "
                          DELIMITED BY SIZE
                        Xauthor2
                          DELIMITED BY X'00'
                        " authors works returned"
                          DELIMITED BY SIZE
                      INTO Xmessage OF responseCode404
      * Set message length
                 INSPECT FUNCTION REVERSE (Xmessage OF responseCode404)
                    TALLYING WS-MESG-COUNTER FOR LEADING SPACES

                 COMPUTE Xmessage-length OF responseCode404 =
                 LENGTH OF Xmessage OF responseCode404 - WS-MESG-COUNTER
      * Set the authors other books
                 MOVE WS-REDBOOK-CONT-NAME TO authorsBooks-cont OF
                   RBK00P01-responseCode404
      * Set the number of other books
                 EXEC CICS GET CONTAINER(WS-NUMBOOK-CONT-NAME)
                               CHANNEL(WS-CHANNEL-NAME)
                               INTO(authorsBooks-num)
                               RESP(WS-RESP)
                 END-EXEC
      * Put the 404 data into the container
                 EXEC CICS PUT CONTAINER(WS-RESP404-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         FROM(RBK00P01-responseCode404)
                         FLENGTH(LENGTH OF RBK00P01-responseCode404)
                         BIT
                 END-EXEC
                 GO TO EXIT-PROGRAM
              END-IF

      * Otherwise, we found the request book with the correct author
      * so we prepare a 200 response
              MOVE 1 TO responseCode200-existence OF
                 BAQBASE-RBK00P01
              MOVE WS-RESP200-CONT-NAME TO responseCode200-cont

              EXEC CICS PUT CONTAINER(WS-RESP200-CONT-NAME)
                   CHANNEL(WS-CHANNEL-NAME)
                   FROM(WS-BOOK)
                   FLENGTH(LENGTH OF WS-BOOK)
                   BIT
              END-EXEC

              GO TO EXIT-PROGRAM
           END-IF.

      * If no author was specified, just look for the title

      * Put the title as a parameter
           EXEC CICS PUT CONTAINER(WS-RBKPARM-CONT-NAME)
                 CHANNEL(WS-CHANNEL-NAME)
                 FROM(requestPathParameters)
                 BIT
           END-EXEC

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
              MOVE 1 TO responseCode500-existence OF BAQBASE-RBK00P01
              MOVE WS-RBKEROR-CONT-NAME TO responseCode500-cont
                   OF BAQBASE-RBK00P01
              GO TO EXIT-PROGRAM
           END-IF.

      * Check if WS-REDBOOK-CONT-NAME was returned in the channel
           EXEC CICS GET CONTAINER(WS-REDBOOK-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         NODATA
                         FLENGTH(WS-LENGTH)
                         RESP(WS-RESP)
           END-EXEC.

      * Do we have a book with the requested title?
           IF WS-RESP NOT = DFHRESP(NORMAL) THEN

      * The book was not found, so we return a 404
              MOVE 1 TO responseCode404-existence OF BAQBASE-RBK00P01
              MOVE WS-RESP404-CONT-NAME TO responseCode404-cont
                   OF BAQBASE-RBK00P01

              INITIALIZE RBK00P01-responseCode404
              STRING "Redbook "
                       DELIMITED BY SIZE
                     Xtitle OF requestPathParameters
                       DELIMITED BY X'00'
                     " is not located in inventory."
                       DELIMITED BY SIZE
                   INTO Xmessage OF responseCode404

      * Set length of message
              INSPECT FUNCTION REVERSE (Xmessage OF responseCode404)
                 TALLYING WS-MESG-COUNTER FOR LEADING SPACES

              COMPUTE Xmessage-length OF responseCode404 =
                LENGTH OF Xmessage OF responseCode404 - WS-MESG-COUNTER

      * Put the 404 data into the container
              EXEC CICS PUT CONTAINER(WS-RESP404-CONT-NAME)
                      CHANNEL(WS-CHANNEL-NAME)
                      FROM(RBK00P01-responseCode404)
                      FLENGTH(LENGTH OF RBK00P01-responseCode404)
                      BIT
              END-EXEC
              GO TO EXIT-PROGRAM
           END-IF.

      * Otherwise, the book was found and we will return a 200
           MOVE 1 TO responseCode200-existence OF BAQBASE-RBK00P01.
           MOVE WS-REDBOOK-CONT-NAME TO responseCode200-cont.

       EXIT-PROGRAM.

      * Update the BAQBASE container with the results
           EXEC CICS PUT CONTAINER(WS-BAQBASE-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         FROM(BAQBASE-RBK00P01)
                         FLENGTH(LENGTH OF BAQBASE-RBK00P01)
                         BIT
           END-EXEC
           EXEC CICS RETURN END-EXEC.