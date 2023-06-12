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
      * RBKTEARD - Tear down the TSQs used by the Redbook store       *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKTEARD.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBKWSTOR.

       PROCEDURE DIVISION.

      * ENQUEUE
           EXEC CICS ENQ RESOURCE(WS-REDBOOKS-TSQ)
                     LENGTH(16)
	                NOHANDLE
           END-EXEC.

      ************************************************
      * ABCs of IBM z/OS System Programming Volume 1 *
      ************************************************

      * Delete the authors TSQ
           MOVE "SG24-6981-04" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ************************************************
      * ABCs of IBM z/OS System Programming Volume 2 *
      ************************************************

      * Delete the authors TSQ
           MOVE "SG24-6982-04" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ************************************************
      * ABCs of IBM z/OS System Programming Volume 3 *
      ************************************************

      * Delete the authors TSQ
           MOVE "SG24-6983-04" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.


      *****************************************************
      * What AI Can Do for You: Use Cases for AI on IBM Z *
      *****************************************************

      * Delete the authors TSQ
           MOVE "REDP-5679-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ******************************************
      * Getting Started with IBM Z Cyber Vault *
      ******************************************

      * Delete the authors TSQ
           MOVE "SG24-8511-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ********************************************************
      * Getting Started: Journey to Modernization with IBM Z *
      ********************************************************

      * Delete the authors TSQ
           MOVE "REDP-5627-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      *****************************************************************
      * Liberty in IBM CICS: Deploying and Managing Java EE Applic... *
      *****************************************************************

      * Delete the authors TSQ
           MOVE "SG24-8418-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      **************************************************
      * Exploring IBM Db2 for z/OS Continuous Delivery *
      **************************************************

      * Delete the authors TSQ
           MOVE "REDP-5469-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      *********************************************************
      * IBM CICS and the Coupling Facility: Beyond the Basics *
      *********************************************************

      * Delete the authors TSQ
           MOVE "SG24-8420-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ****************************************************
      * z/OS PKI Services: Quick Set-up for Multiple CAs *
      ****************************************************

      * Delete the authors TSQ
           MOVE "SG24-8337-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ****************************
      * Delete all the book data *
      ****************************
           EXEC CICS DELETEQ TS QNAME(WS-REDBOOKS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * DEQUEUE
	      EXEC CICS DEQ RESOURCE(WS-REDBOOKS-TSQ)
                     LENGTH(16)
		           RESP(WS-RESP)
           END-EXEC.

       EXIT-PROGRAM.
           EXEC CICS RETURN END-EXEC.