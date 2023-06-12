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
      * RBKSETUP - Setup the TSQs used by the Redbook store           *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RBKSETUP.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY RBKWSTOR.

       PROCEDURE DIVISION.

      * ENQUEUE
           EXEC CICS ENQ RESOURCE(WS-REDBOOKS-TSQ)
                     LENGTH(16)
	                NOHANDLE
           END-EXEC.

      * Delete existing book data
           EXEC CICS DELETEQ TS QNAME(WS-REDBOOKS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      ************************************************
      * ABCs of IBM z/OS System Programming Volume 1 *
      ************************************************

      * Create the authors TSQ
           MOVE "SG24-6981-04" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Lydia Parziale"
           INITIALIZE WS-AUTHOR.
           MOVE "Lydia Parziale" TO authors IN WS-AUTHOR.
           MOVE 14 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Luiz Fadel"
           INITIALIZE WS-AUTHOR.
           MOVE "Luiz Fadel" TO authors IN WS-AUTHOR.
           MOVE 10 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Stanley Jon"
           INITIALIZE WS-AUTHOR.
           MOVE "Stanley Jon" TO authors IN WS-AUTHOR.
           MOVE 11 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-REDBOOKS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * First real book
           INITIALIZE WS-BOOK.

           MOVE "ABCs of IBM z/OS System Programming Volume 1" TO
              Xtitle IN Redbook.
           MOVE 44 TO Xtitle-length IN Redbook.

           MOVE 3 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2018-01-22T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-6981-04" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 4.1 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg246981.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      ************************************************
      * ABCs of IBM z/OS System Programming Volume 2 *
      ************************************************

      * Create the authors TSQ
           MOVE "SG24-6982-04" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Lydia Parziale"
           INITIALIZE WS-AUTHOR.
           MOVE "Lydia Parziale" TO authors IN WS-AUTHOR.
           MOVE 14 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Guillermo Cosimo"
           INITIALIZE WS-AUTHOR.
           MOVE "Guillermo Cosimo" TO authors IN WS-AUTHOR.
           MOVE 16 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Lutz Kuehner"
           INITIALIZE WS-AUTHOR.
           MOVE "Lutz Kuehner" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "ABCs of IBM z/OS System Programming Volume 2" TO
              Xtitle IN Redbook.
           MOVE 44 TO Xtitle-length IN Redbook.

           MOVE 3 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2018-04-07T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-6982-04" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 3.2 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg246982.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      ************************************************
      * ABCs of IBM z/OS System Programming Volume 3 *
      ************************************************

      * Create the authors TSQ
           MOVE "SG24-6983-04" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Jose Gilberto Biondo Jr"
           INITIALIZE WS-AUTHOR.
           MOVE "Jose Gilberto Biondo Jr" TO authors
              IN WS-AUTHOR.
           MOVE 23 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      ** Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "ABCs of IBM z/OS System Programming Volume 3" TO
              Xtitle IN Redbook.
           MOVE 44 TO Xtitle-length IN Redbook.

           MOVE 1 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN
           Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2018-01-19T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-6983-04" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 2.8 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg246983.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      *****************************************************
      * What AI Can Do for You: Use Cases for AI on IBM Z *
      *****************************************************

      * Create the authors TSQ
           MOVE "REDP-5679-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Makenzie Mannaksu"
           INITIALIZE WS-AUTHOR.
           MOVE "Makenzie Mannaksu" TO authors IN WS-AUTHOR.
           MOVE 17 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Diego Cardalliaguet"
           INITIALIZE WS-AUTHOR.
           MOVE "Diego Cardalliaguet" TO authors IN WS-AUTHOR.
           MOVE 19 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Mehmet Cuneyt Goksu"
           INITIALIZE WS-AUTHOR.
           MOVE "Mehmet Cuneyt Goksu" TO authors IN WS-AUTHOR.
           MOVE 19 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Alex Osadchyy"
           INITIALIZE WS-AUTHOR.
           MOVE "Alex Osadchyy" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Lih M Wang"
           INITIALIZE WS-AUTHOR.
           MOVE "Lih M Wang" TO authors IN WS-AUTHOR.
           MOVE 10 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Sherry Yu"
           INITIALIZE WS-AUTHOR.
           MOVE "Sherry Yu" TO authors IN WS-AUTHOR.
           MOVE 9 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Poonam Zham"
           INITIALIZE WS-AUTHOR.
           MOVE "Poonam Zham" TO authors IN WS-AUTHOR.
           MOVE 11 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Erica Ross"
           INITIALIZE WS-AUTHOR.
           MOVE "Erica Ross" TO authors IN WS-AUTHOR.
           MOVE 10 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "What AI Can Do for You: Use Cases for AI on IBM Z" TO
              Xtitle IN Redbook.
           MOVE 49 TO Xtitle-length IN Redbook.

           MOVE 8 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2022-08-02T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "REDP-5679-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 9.3 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redpapers/pdfs/redp5679.pdf"
              TO url2 IN Redbook.
           MOVE 56 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      ******************************************
      * Getting Started with IBM Z Cyber Vault *
      ******************************************

      * Create the authors TSQ
           MOVE "SG24-8511-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Bill White"
           INITIALIZE WS-AUTHOR.
           MOVE "Bill White" TO authors IN WS-AUTHOR.
           MOVE 10 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Matthias Bangert"
           INITIALIZE WS-AUTHOR.
           MOVE "Matthias Bangert" TO authors IN WS-AUTHOR.
           MOVE 16 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Cyril Armand"
           INITIALIZE WS-AUTHOR.
           MOVE "Cyril Armand" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Roger Bales"
           INITIALIZE WS-AUTHOR.
           MOVE "Roger Bales" TO authors IN WS-AUTHOR.
           MOVE 11 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Diego Bessone"
           INITIALIZE WS-AUTHOR.
           MOVE "Diego Bessone" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Anthony Ciabattoni"
           INITIALIZE WS-AUTHOR.
           MOVE "Anthony Ciabattoni" TO authors IN WS-AUTHOR.
           MOVE 18 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Michael Frankenberg"
           INITIALIZE WS-AUTHOR.
           MOVE "Michael Frankenberg" TO authors IN WS-AUTHOR.
           MOVE 19 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Debra Hallen"
           INITIALIZE WS-AUTHOR.
           MOVE "Debra Hallen" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "DeWayne Hughes"
           INITIALIZE WS-AUTHOR.
           MOVE "DeWayne Hughes" TO authors IN WS-AUTHOR.
           MOVE 14 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Vinod Kanwal"
           INITIALIZE WS-AUTHOR.
           MOVE "Vinod Kanwal" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Karen Smolar"
           INITIALIZE WS-AUTHOR.
           MOVE "Karen Smolar" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Jean-Marc Vandon"
           INITIALIZE WS-AUTHOR.
           MOVE "Jean-Marc Vandon" TO authors IN WS-AUTHOR.
           MOVE 16 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Paolo Vitali"
           INITIALIZE WS-AUTHOR.
           MOVE "Paolo Vitali" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Knud Vraa"
           INITIALIZE WS-AUTHOR.
           MOVE "Knud Vraa" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "Getting Started with IBM Z Cyber Vault" TO
              Xtitle IN Redbook.
           MOVE 38 TO Xtitle-length IN Redbook.

           MOVE 14 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN
              Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2021-11-18T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-8511-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 5.3 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg248511.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      ********************************************************
      * Getting Started: Journey to Modernization with IBM Z *
      ********************************************************

      * Create the authors TSQ
           MOVE "REDP-5627-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Makenzie Manna"
           INITIALIZE WS-AUTHOR.
           MOVE "Makenzie Manna" TO authors IN WS-AUTHOR.
           MOVE 14 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Ravinder Akula"
           INITIALIZE WS-AUTHOR.
           MOVE "Ravinder Akula" TO authors IN WS-AUTHOR.
           MOVE 14 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Matthew Cousens"
           INITIALIZE WS-AUTHOR.
           MOVE "Matthew Cousens" TO authors IN WS-AUTHOR.
           MOVE 15 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Pabitra Mukhopadhyay"
           INITIALIZE WS-AUTHOR.
           MOVE "Pabitra Mukhopadhyay" TO authors IN WS-AUTHOR.
           MOVE 20 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Anand Shukla"
           INITIALIZE WS-AUTHOR.
           MOVE "Anand Shukla" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "Getting Started: Journey to Modernization with IBM Z"
              TO Xtitle IN Redbook.
           MOVE 52 TO Xtitle-length IN Redbook.

           MOVE 5 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2021-03-15T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "REDP-5627-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 5.6 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redpapers/pdfs/redp5627.pdf"
              TO url2 IN Redbook.
           MOVE 56 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      *****************************************************************
      * Liberty in IBM CICS: Deploying and Managing Java EE Applic... *
      *****************************************************************

      * Create the authors TSQ
           MOVE "SG24-8418-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Phil Wakelin"
           INITIALIZE WS-AUTHOR.
           MOVE "Phil Wakelin" TO authors IN WS-AUTHOR.
           MOVE 12 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Carlos Donatucci"
           INITIALIZE WS-AUTHOR.
           MOVE "Carlos Donatucci" TO authors IN WS-AUTHOR.
           MOVE 16 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Jonathan Lawrence"
           INITIALIZE WS-AUTHOR.
           MOVE "Jonathan Lawrence" TO authors IN WS-AUTHOR.
           MOVE 17 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Mitch Johnson"
           INITIALIZE WS-AUTHOR.
           MOVE "Mitch Johnson" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Michael Jones"
           INITIALIZE WS-AUTHOR.
           MOVE "Michael Jones" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Tito Paiva"
           INITIALIZE WS-AUTHOR.
           MOVE "Tito Paiva" TO authors IN WS-AUTHOR.
           MOVE 10 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "Liberty in IBM CICS: Deploying and Managing Java EE App
      -    "lications" TO Xtitle IN Redbook.
           MOVE 64 TO Xtitle-length IN Redbook.

           MOVE 6 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2018-03-29T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-8418-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 11.1 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg248418.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      **************************************************
      * Exploring IBM Db2 for z/OS Continuous Delivery *
      **************************************************

      * Create the authors TSQ
           MOVE "REDP-5469-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Chris Crone"
           INITIALIZE WS-AUTHOR.
           MOVE "Chris Crone" TO authors IN WS-AUTHOR.
           MOVE 11 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "Exploring IBM Db2 for z/OS Continuous Delivery"
            TO Xtitle IN Redbook.
           MOVE 46 TO Xtitle-length IN Redbook.

           MOVE 1 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2018-03-21T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "REDP-5469-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 2.8 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redpapers/pdfs/redp5469.pdf"
              TO url2 IN Redbook.
           MOVE 56 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      *********************************************************
      * IBM CICS and the Coupling Facility: Beyond the Basics *
      *********************************************************

      * Create the authors TSQ
           MOVE "SG24-8420-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Arndt Eade"
           INITIALIZE WS-AUTHOR.
           MOVE "Arndt Eade" TO authors IN WS-AUTHOR.
           MOVE 10 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Randy Frerking"
           INITIALIZE WS-AUTHOR.
           MOVE "Randy Frerking" TO authors IN WS-AUTHOR.
           MOVE 14 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Rich Jacksons"
           INITIALIZE WS-AUTHOR.
           MOVE "Rich Jacksons" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Kellie Mathis"
           INITIALIZE WS-AUTHOR.
           MOVE "Kellie Mathis" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.
      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "IBM CICS and the Coupling Facility: Beyond the Basics"
            TO Xtitle IN Redbook.
           MOVE 53 TO Xtitle-length IN Redbook.

           MOVE 4 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2018-02-21T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-8420-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 4.6 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg248420.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      ****************************************************
      * z/OS PKI Services: Quick Set-up for Multiple CAs *
      ****************************************************

      * Create the authors TSQ
           MOVE "SG24-8337-00" TO WS-AUTH-TSQ-FORMNUM.

      * Delete existing author data
           EXEC CICS DELETEQ TS QNAME(WS-AUTHORS-TSQ)
                     Resp(WS-RESP)
           END-EXEC.

      * Control entry
           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHORS-TSQ)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Keith Winnard"
           INITIALIZE WS-AUTHOR.
           MOVE "Keith Winnard" TO authors IN WS-AUTHOR.
           MOVE 13 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Wai Choi"
           INITIALIZE WS-AUTHOR.
           MOVE "Wai Choi" TO authors IN WS-AUTHOR.
           MOVE 8 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * "Martina vondem Bussche"
           INITIALIZE WS-AUTHOR.
           MOVE "Martina vondem Bussche" TO authors IN WS-AUTHOR.
           MOVE 22 TO authors-length IN WS-AUTHOR.

           EXEC CICS WRITEQ TS QNAME(WS-AUTHORS-TSQ)
                       FROM(WS-AUTHOR)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * Now add the book information
           INITIALIZE WS-BOOK.
           MOVE "z/OS PKI Services: Quick Set-up for Multiple CAs"
            TO Xtitle IN Redbook.
           MOVE 48 TO Xtitle-length IN Redbook.

           MOVE 3 TO authors-num IN Redbook.
           MOVE WS-AUTHORS-TSQ TO authors-cont IN Redbook.

           MOVE "PUBLISHED" TO Xstatus IN Redbook.
           MOVE 9 TO Xstatus-length IN Redbook.

           MOVE 1 TO publicationDate-existence IN Redbook.
           MOVE "2017-01-20T00:00:00Z[UTC]" TO publicationDate2
              IN Redbook.
           MOVE 25 TO publicationDate2-length IN Redbook.

           MOVE "SG24-8337-00" TO formNumber IN Redbook.

           MOVE 1 TO documentType-existence in Redbook.
           MOVE "PDF" TO documentType2 IN Redbook.
           MOVE 3 TO documentType2-length IN Redbook.

           MOVE 1 TO sizeMB-existence IN Redbook.
           MOVE 3.3 TO sizeMB IN Redbook.

           MOVE 1 TO url-existence IN Redbook.
           MOVE
              "https://www.redbooks.ibm.com/redbooks/pdfs/sg248337.pdf"
              TO url2 IN Redbook.
           MOVE 55 TO url2-length IN Redbook.

           EXEC CICS WRITEQ TS QNAME(WS-REDBOOKS-TSQ)
                       FROM(WS-BOOK)
                       MAIN
                       RESP(WS-RESP)
                       NOSUSPEND
           END-EXEC.

      * DEQUEUE
	      EXEC CICS DEQ RESOURCE(WS-REDBOOKS-TSQ)
                     LENGTH(16)
		           RESP(WS-RESP)
           END-EXEC.

       EXIT-PROGRAM.
           EXEC CICS RETURN END-EXEC.