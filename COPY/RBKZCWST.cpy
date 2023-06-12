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
      
       01 WS-CHANNEL-NAME          PIC X(16)  VALUE SPACES.

       01 WS-URI-CONT-NAME         PIC X(16)  VALUE 'DFHWS-URI       '.
       01 WS-METHOD-CONT-NAME      PIC X(16)  VALUE 'DFHHTTPMETHOD   '.

       01 WS-REQUEST-URI           PIC X(256) VALUE SPACES.
       01 WS-REQUEST-URI-LENGTH    PIC 9(9)   VALUE 0 COMP-5.

       01 WS-REQUEST-METHOD        PIC X(8)   VALUE SPACES.
       01 WS-REQUEST-METHOD-LENGTH PIC 9(9)   VALUE 0 COMP-5.