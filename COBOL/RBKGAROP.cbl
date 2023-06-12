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
      * RBKGAROP - Implement the getAllRedbooks operation             *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKGAROP.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBK02Q01.
       COPY RBK02P01.
       COPY RBKWSTOR.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Initiliase the request structure
           INITIALIZE BAQBASE-RBK02Q01.

      * Get the request structure
           EXEC CICS GET CONTAINER(WS-BAQBASE-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(BAQBASE-RBK02Q01)
                         RESP(WS-RESP)
           END-EXEC.

      * Prepare the response structure
           INITIALIZE BAQBASE-RBK02P01.

      * If an author was specified, get all the author's books
           IF Xauthor-existence IN requestQueryParameters > 0 AND
              Xauthor2-length IN requestQueryParameters > 0 THEN

      * Put the author as a parameter
              EXEC CICS PUT CONTAINER(WS-RBKPARM-CONT-NAME)
                    CHANNEL(WS-CHANNEL-NAME)
                    FROM(Xauthor)
                    BIT
              END-EXEC

      * Retrieve this author's books
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
                 MOVE 1 TO responseCode500-existence OF BAQBASE-RBK02P01
                 MOVE WS-RBKEROR-CONT-NAME TO responseCode500-cont
                      OF BAQBASE-RBK02P01
                 GO TO EXIT-PROGRAM
              END-IF

      * Check if WS-REDBOOK-CONT-NAME was returned in the channel
              EXEC CICS GET CONTAINER(WS-REDBOOK-CONT-NAME)
                            CHANNEL(WS-CHANNEL-NAME)
                            NODATA
                            FLENGTH(WS-LENGTH)
                            RESP(WS-RESP)
              END-EXEC

      * If no books returned, return a 404
              IF WS-RESP NOT = DFHRESP(NORMAL) THEN
                 MOVE 1 TO responseCode404-existence OF BAQBASE-RBK02P01
                 MOVE WS-RESP404-CONT-NAME TO responseCode404-cont
                   OF BAQBASE-RBK02P01

                 INITIALIZE RBK02P01-responseCode404
                 STRING "No Redbooks located for author "
                          DELIMITED BY SIZE
                        Xauthor2
                          DELIMITED BY x'00'
                      INTO Xmessage OF responseCode404
      * Set length of message
                 INSPECT FUNCTION REVERSE (Xmessage OF responseCode404)
                    TALLYING WS-MESG-COUNTER FOR LEADING SPACES

                 COMPUTE Xmessage-length OF responseCode404 =
                 LENGTH OF Xmessage OF responseCode404 - WS-MESG-COUNTER

      * Put the 404 data into a container
                 EXEC CICS PUT CONTAINER(WS-RESP404-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         FROM(RBK02P01-responseCode404)
                         FLENGTH(LENGTH OF RBK02P01-responseCode404)
                         BIT
                 END-EXEC

                 GO TO EXIT-PROGRAM
              END-IF

      * We got some books back for this author, find out how many
              EXEC CICS GET CONTAINER(WS-NUMBOOK-CONT-NAME)
                               CHANNEL(WS-CHANNEL-NAME)
                               INTO(responseCode200-num)
                               RESP(WS-RESP)
              END-EXEC

      * Set the container name for the 200 response
              MOVE WS-REDBOOK-CONT-NAME TO responseCode200-cont
              GO TO EXIT-PROGRAM
           END-IF.

      * If no author specified, get all the books
           EXEC CICS LINK PROGRAM('RBKRALLB')
                          CHANNEL(WS-CHANNEL-NAME)
           END-EXEC

      * Check if an error occurred
           EXEC CICS GET CONTAINER(WS-RBKEROR-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         NODATA
                         FLENGTH(WS-LENGTH)
                         RESP(WS-RESP)
           END-EXEC.

      * If so, return a 500
           IF WS-RESP = DFHRESP(NORMAL) THEN
              MOVE 1 TO responseCode500-existence OF BAQBASE-RBK02P01
              MOVE WS-RBKEROR-CONT-NAME TO responseCode500-cont
                   OF BAQBASE-RBK02P01
              GO TO EXIT-PROGRAM
           END-IF.

      * Get how many are in the store
           EXEC CICS GET CONTAINER(WS-NUMBOOK-CONT-NAME)
                               CHANNEL(WS-CHANNEL-NAME)
                               INTO(responseCode200-num)
                               RESP(WS-RESP)
           END-EXEC.

      * Prepare the 200 response
           MOVE WS-REDBOOK-CONT-NAME TO responseCode200-cont.

       EXIT-PROGRAM.

      * Update the BAQBASE container with the results
           EXEC CICS PUT CONTAINER(WS-BAQBASE-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         FROM(BAQBASE-RBK02P01)
                         FLENGTH(LENGTH OF BAQBASE-RBK02P01)
                         BIT
           END-EXEC.
           EXEC CICS RETURN END-EXEC.