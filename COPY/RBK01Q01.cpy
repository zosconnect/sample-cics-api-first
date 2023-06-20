      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * This file contains the generated language structure(s) for
      *  request JSON schema 'createRedbook_request.json'.
      * This structure was generated using 'DFHJS2LS' at mapping level
      *  '5.0'.
      * 
      *  
      *   01 BAQBASE-RBK01Q01.
      *     03 requestPathParameters.
      * 
      * Comments for field 'Xtitle':
      * This field represents the value of JSON schema keyword
      *  'requestPathParameters->title'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '80'.
      * This field contains a varying length array of characters or
      *  binary data.
      *       06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
      *       06 Xtitle                        PIC X(80).
      *     03 requestBody.
      * 
      * Comments for field 'Xtitle2':
      * This field represents the value of JSON schema keyword
      *  'requestBody->title'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '80'.
      * This field contains a varying length array of characters or
      *  binary data.
      *       06 Xtitle2-length                PIC S9999 COMP-5 SYNC.
      *       06 Xtitle2                       PIC X(80).
      * 
      *  
      * CONTAINER 'authors-cont' contains 'authors-num' instances of
      *  structure 'RBK01Q01-authors', each of which represents an
      *  instance of JSON schema keyword 'requestBody->authors'. The
      *  CONTAINER must be read from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There should be at most '20' instance(s).
      *       06 authors-num                   PIC S9(9) COMP-5 SYNC.
      *       06 authors-cont                  PIC X(16).
      * 
      *  
      * Comments for field 'Xstatus':
      * This field represents the value of JSON schema keyword
      *  'requestBody->status'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(DRAFT, PUBLISHED)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *       06 Xstatus-length                PIC S9999 COMP-5 SYNC.
      *       06 Xstatus                       PIC X(9).
      * 
      * Comments for field 'formNumber':
      * This field represents the value of JSON schema keyword
      *  'requestBody->formNumber'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '12'.
      * JSON schema keyword 'maxLength' value: '12'.
      *       06 formNumber                    PIC X(12).
      * 
      *  
      * JSON schema keyword 'requestBody->publicationDate' is
      *  optional. The existence of the field is indicated by field
      *  'publicationDate-existence'.
      *       06 publicationDate-existence     PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *       06 publicationDate.
      * 
      * Comments for field 'publicationDate2':
      * This field represents the value of JSON schema keyword
      *  'requestBody->publicationDate'.
      * JSON schema type: 'date'.
      * This field contains a varying length array of characters or
      *  binary data.
      *         09 publicationDate2-length       PIC S9999 COMP-5 SYNC.
      *         09 publicationDate2              PIC X(32).
      * 
      *  
      * JSON schema keyword 'requestBody->documentType' is optional.
      *  The existence of the field is indicated by field
      *  'documentType-existence'.
      *       06 documentType-existence        PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *       06 documentType.
      * 
      * Comments for field 'documentType2':
      * This field represents the value of JSON schema keyword
      *  'requestBody->documentType'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(PDF, HARDCOPY)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *         09 documentType2-length          PIC S9999 COMP-5 SYNC.
      *         09 documentType2                 PIC X(8).
      * 
      *  
      * JSON schema keyword 'requestBody->sizeMB' is optional. The
      *  existence of the field is indicated by field
      *  'sizeMB-existence'.
      *       06 sizeMB-existence              PIC S9(9) COMP-5 SYNC.
      * 
      *  
      * Comments for field 'sizeMB':
      * This field represents the value of JSON schema keyword
      *  'requestBody->sizeMB'.
      * JSON schema type: 'number'.
      * JSON schema keyword 'format' value: 'decimal'.
      * JSON schema keyword 'minimum' value: '0'.
      *       06 sizeMB                        PIC 9(16)V9(2) COMP-3.
      * 
      *  
      * JSON schema keyword 'requestBody->url' is optional. The
      *  existence of the field is indicated by field 'url-existence'.
      *       06 url-existence                 PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *       06 url.
      * 
      * Comments for field 'url2':
      * This field represents the value of JSON schema keyword
      *  'requestBody->url'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '100'.
      * This field contains a varying length array of characters or
      *  binary data.
      *         09 url2-length                   PIC S9999 COMP-5 SYNC.
      *         09 url2                          PIC X(100).
      * 
      *  
      * This structure describes one instance of the data in Data Area
      *  'authors-cont'.
      *  01 RBK01Q01-authors.
      * 
      * Comments for field 'authors':
      * This field represents the value of JSON schema keyword
      *  'requestBody->authors'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '40'.
      * This field contains a varying length array of characters or
      *  binary data.
      *    03 authors-length                PIC S9999 COMP-5 SYNC.
      *    03 authors                       PIC X(40).
      * 
      *  
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
          01 BAQBASE-RBK01Q01.
            03 requestPathParameters.
              06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
              06 Xtitle                        PIC X(80).
            03 requestBody.
              06 Xtitle2-length                PIC S9999 COMP-5 SYNC.
              06 Xtitle2                       PIC X(80).
 
              06 authors-num                   PIC S9(9) COMP-5 SYNC.
              06 authors-cont                  PIC X(16).
 
              06 Xstatus-length                PIC S9999 COMP-5 SYNC.
              06 Xstatus                       PIC X(9).
              06 formNumber                    PIC X(12).
 
              06 publicationDate-existence     PIC S9(9) COMP-5 SYNC.
 
              06 publicationDate.
                09 publicationDate2-length       PIC S9999 COMP-5 SYNC.
                09 publicationDate2              PIC X(32).
 
              06 documentType-existence        PIC S9(9) COMP-5 SYNC.
 
              06 documentType.
                09 documentType2-length          PIC S9999 COMP-5 SYNC.
                09 documentType2                 PIC X(8).
 
              06 sizeMB-existence              PIC S9(9) COMP-5 SYNC.
 
              06 sizeMB                        PIC 9(16)V9(2) COMP-3.
 
              06 url-existence                 PIC S9(9) COMP-5 SYNC.
 
              06 url.
                09 url2-length                   PIC S9999 COMP-5 SYNC.
                09 url2                          PIC X(100).
 
         01 RBK01Q01-authors.
           03 authors-length                PIC S9999 COMP-5 SYNC.
           03 authors                       PIC X(40).
 
