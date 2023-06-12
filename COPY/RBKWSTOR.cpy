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
             
       01 WS-REDBOOKS-TSQ       PIC X(16) VALUE 'BAQ-RED-BOOK-TSQ'.

       01 WS-AUTHORS-TSQ.
         03 WS-AUTH-TSQ-PREFIX  PIC X(4) VALUE 'BAQ-'.
         03 WS-AUTH-TSQ-FORMNUM PIC X(12).

       01 WS-CHANNEL-NAME       PIC X(16) VALUE SPACES.
       01 WS-BAQBASE-CONT-NAME  PIC X(16) VALUE 'BAQBASE         '.
       01 WS-RBKPARM-CONT-NAME  PIC X(16) VALUE 'BAQ-RBKPARM-CONT'.
       01 WS-RBKEROR-CONT-NAME  PIC X(16) VALUE 'BAQ-RBKEROR-CONT'.
       01 WS-REDBOOK-CONT-NAME  PIC X(16) VALUE 'BAQ-REDBOOK-CONT'.
       01 WS-NUMBOOK-CONT-NAME  PIC X(16) VALUE 'BAQ-NUMBOOK-CONT'.
       01 WS-RESP200-CONT-NAME  PIC X(16) VALUE 'BAQ-RESP200-CONT'.
       01 WS-RESP404-CONT-NAME  PIC X(16) VALUE 'BAQ-RESP404-CONT'.

       01 WS-RESP               PIC S9(8) COMP.
       01 WS-BOOK-RESP          PIC S9(8) COMP.
       01 WS-AUTH-RESP          PIC S9(8) COMP.

       01 WS-MESG-COUNTER       PIC 9(4) COMP-5 VALUE 0.
       01 WS-BOOK-COUNTER       PIC S9(8) COMP-5 VALUE 0.

       01 WS-LENGTH             PIC S9(8) COMP VALUE 0.
       01 WS-OFFSET             PIC S9(8) COMP VALUE 0.

       01 WS-TITLE-INPUT        PIC X(80) VALUE SPACES.
       01 WS-TITLE-SEARCH       PIC X.
         88 WS-TITLE-FOUND      VALUE "T".
         88 WS-TITLE-NOT-FOUND  VALUE "F".

       01 WS-AUTH-INPUT         PIC X(40) VALUE SPACES.
       01 WS-AUTH-SEARCH        PIC X.
          88 WS-AUTH-FOUND      VALUE "T".
          88 WS-AUTH-NOT-FOUND  VALUE "F".

       01 WS-BOOK.
         03 Redbook.
           06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
           06 Xtitle                        PIC X(80).
           06 authors-num                   PIC S9(9) COMP-5 SYNC.
           06 authors-cont                  PIC X(16).
           06 Xstatus-length                PIC S9999 COMP-5 SYNC.
           06 Xstatus                       PIC X(9).
           06 formNumber                    PIC X(12).
           06 publicationDate-existence     PIC S9(9) COMP-5 SYNC.
           06 publicationDate.
             09 publicationDate2-length     PIC S9999 COMP-5 SYNC.
             09 publicationDate2            PIC X(32).
           06 documentType-existence        PIC S9(9) COMP-5 SYNC.
           06 documentType.
             09 documentType2-length        PIC S9999 COMP-5 SYNC.
             09 documentType2               PIC X(8).
           06 sizeMB-existence              PIC S9(9) COMP-5 SYNC.
           06 sizeMB                        PIC 9(16)V9(2) COMP-3.
           06 url-existence                 PIC S9(9) COMP-5 SYNC.
           06 url.
             09 url2-length                 PIC S9999 COMP-5 SYNC.
             09 url2                        PIC X(100).
           06 reservedFiller                PIC X(2).

       01 WS-AUTHOR.
         03 authors-length                  PIC S9999 COMP-5 SYNC.
         03 authors                         PIC X(40).

       01 WS-TITLE.
         03 Xtitle-length                   PIC S9999 COMP-5 SYNC.
         03 Xtitle                          PIC X(80).

       01 WS-ERROR.
         03 errorMessage-existence          PIC S9(9) COMP-5 SYNC.
         03 errorMessage-length             PIC S9999 COMP-5 SYNC.
         03 errorMessage                    PIC X(50).