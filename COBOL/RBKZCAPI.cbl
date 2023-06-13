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
      * RBKZCAPI - The first program called by z/OS Connect           *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKZCAPI.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBKZCWST.

       PROCEDURE DIVISION.

           EXEC CICS ASSIGN CHANNEL(WS-CHANNEL-NAME) END-EXEC.

      * Tell CICS how large the working storage fields are to receive
      * the data from the context containers
           MOVE LENGTH OF WS-REQUEST-URI TO WS-REQUEST-URI-LENGTH.
           MOVE LENGTH OF WS-REQUEST-METHOD TO WS-REQUEST-METHOD-LENGTH.

      * Now get the data
           EXEC CICS GET CONTAINER(WS-URI-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(WS-REQUEST-URI)
                         FLENGTH(WS-REQUEST-URI-LENGTH)
           END-EXEC.

           EXEC CICS GET CONTAINER(WS-METHOD-CONT-NAME)
                         CHANNEL(WS-CHANNEL-NAME)
                         INTO(WS-REQUEST-METHOD)
                         FLENGTH(WS-REQUEST-METHOD-LENGTH)
           END-EXEC.

      * Decide which program to call based on the API operation that
      * was invoked by the client
           IF WS-REQUEST-URI(1:9) EQUAL '/redbook/' THEN
              IF WS-REQUEST-METHOD(1:3) EQUAL 'GET' THEN
                 EXEC CICS LINK PROGRAM('RBKGETOP')
                                CHANNEL(WS-CHANNEL-NAME)
                 END-EXEC
              END-IF
              IF WS-REQUEST-METHOD(1:4) EQUAL 'POST' THEN
                 EXEC CICS LINK PROGRAM('RBKCRTOP')
                                CHANNEL(WS-CHANNEL-NAME)
                 END-EXEC
              END-IF
           END-IF.

           IF WS-REQUEST-URI(1:9) EQUAL '/redbooks' THEN
              IF WS-REQUEST-METHOD(1:3) EQUAL 'GET' THEN
                 EXEC CICS LINK PROGRAM('RBKGAROP')
                                CHANNEL(WS-CHANNEL-NAME)
                 END-EXEC
              END-IF
           END-IF.

       EXIT-PROGRAM.
           EXEC CICS RETURN END-EXEC.