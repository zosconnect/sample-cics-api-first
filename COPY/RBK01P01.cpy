      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * This file contains the generated language structure(s) for
      *  response JSON schema 'createRedbook_response.json'.
      * This structure was generated using 'DFHJS2LS' at mapping level
      *  '5.0'.
      * 
      *  
      *   01 BAQBASE-RBK01P01.
      * 
      *  
      * CONTAINER 'responseCode201-cont' contains 0 or 1 instances of
      *  structure 'RBK01P01-responseCode201', each of which
      *  represents an instance of JSON schema keyword
      *  'responseCode201'. The CONTAINER must be read from and
      *  written to in BIT mode.
      *     03 responseCode201-existence     PIC S9(9) COMP-5 SYNC.
      *     03 responseCode201-cont          PIC X(16).
      * 
      *  
      *  
      * CONTAINER 'responseCode409-cont' contains 0 or 1 instances of
      *  structure 'RBK01P01-responseCode409', each of which
      *  represents an instance of JSON schema keyword
      *  'responseCode409'. The CONTAINER must be read from and
      *  written to in BIT mode.
      *     03 responseCode409-existence     PIC S9(9) COMP-5 SYNC.
      *     03 responseCode409-cont          PIC X(16).
      * 
      *  
      *  
      * CONTAINER 'responseCode500-cont' contains 0 or 1 instances of
      *  structure 'RBK01P01-responseCode500', each of which
      *  represents an instance of JSON schema keyword
      *  'responseCode500'. The CONTAINER must be read from and
      *  written to in BIT mode.
      *     03 responseCode500-existence     PIC S9(9) COMP-5 SYNC.
      *     03 responseCode500-cont          PIC X(16).
      * 
      *  
      *  
      * This structure describes one instance of the data in Data Area
      *  'responseCode201-cont'.
      *  01 RBK01P01-responseCode201.
      *    03 responseCode201.
      * 
      * Comments for field 'Xtitle':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->title'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '80'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
      *      06 Xtitle                        PIC X(80).
      * 
      *  
      * CONTAINER 'authors-cont' contains 'authors-num' instances of
      *  structure 'RBK01P01-authors', each of which represents an
      *  instance of JSON schema keyword 'responseCode201->authors'.
      *  The CONTAINER must be read from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There should be at most '20' instance(s).
      *      06 authors-num                   PIC S9(9) COMP-5 SYNC.
      *      06 authors-cont                  PIC X(16).
      * 
      *  
      * Comments for field 'Xstatus':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->status'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(DRAFT, PUBLISHED)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xstatus-length                PIC S9999 COMP-5 SYNC.
      *      06 Xstatus                       PIC X(9).
      * 
      * Comments for field 'formNumber':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->formNumber'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '12'.
      * JSON schema keyword 'maxLength' value: '12'.
      *      06 formNumber                    PIC X(12).
      * 
      *  
      * JSON schema keyword 'responseCode201->publicationDate' is
      *  optional. The existence of the field is indicated by field
      *  'publicationDate-existence'.
      *      06 publicationDate-existence     PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 publicationDate.
      * 
      * Comments for field 'publicationDate2':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->publicationDate'.
      * JSON schema type: 'date'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 publicationDate2-length       PIC S9999 COMP-5 SYNC.
      *        09 publicationDate2              PIC X(32).
      * 
      *  
      * JSON schema keyword 'responseCode201->documentType' is
      *  optional. The existence of the field is indicated by field
      *  'documentType-existence'.
      *      06 documentType-existence        PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 documentType.
      * 
      * Comments for field 'documentType2':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->documentType'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(PDF, HARDCOPY)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 documentType2-length          PIC S9999 COMP-5 SYNC.
      *        09 documentType2                 PIC X(8).
      * 
      *  
      * JSON schema keyword 'responseCode201->sizeMB' is optional. The
      *  existence of the field is indicated by field
      *  'sizeMB-existence'.
      *      06 sizeMB-existence              PIC S9(9) COMP-5 SYNC.
      * 
      *  
      * Comments for field 'sizeMB':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->sizeMB'.
      * JSON schema type: 'number'.
      * JSON schema keyword 'format' value: 'decimal'.
      * JSON schema keyword 'minimum' value: '0'.
      *      06 sizeMB                        PIC 9(16)V9(2) COMP-3.
      * 
      *  
      * JSON schema keyword 'responseCode201->url' is optional. The
      *  existence of the field is indicated by field 'url-existence'.
      *      06 url-existence                 PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 url.
      * 
      * Comments for field 'url2':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->url'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '100'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 url2-length                   PIC S9999 COMP-5 SYNC.
      *        09 url2                          PIC X(100).
      * 
      * Comments for field 'filler':
      * This is a filler entry to ensure the correct padding for a
      *  structure. These slack bytes do not contain any application
      *  data.
      *      06 filler                        PIC X(2).
      * 
      *  
      * This structure describes one instance of the data in Data Area
      *  'authors-cont'.
      *  01 RBK01P01-authors.
      * 
      * Comments for field 'authors':
      * This field represents the value of JSON schema keyword
      *  'responseCode201->authors'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '40'.
      * This field contains a varying length array of characters or
      *  binary data.
      *    03 authors-length                PIC S9999 COMP-5 SYNC.
      *    03 authors                       PIC X(40).
      * 
      *  
      * This structure describes one instance of the data in Data Area
      *  'responseCode409-cont'.
      *  01 RBK01P01-responseCode409.
      *    03 responseCode409.
      * 
      * Comments for field 'Xtitle':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->title'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '80'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
      *      06 Xtitle                        PIC X(80).
      * 
      *  
      * CONTAINER 'authors2-cont' contains 'authors2-num' instances of
      *  structure 'RBK01P01-authors2', each of which represents an
      *  instance of JSON schema keyword 'responseCode409->authors'.
      *  The CONTAINER must be read from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There should be at most '20' instance(s).
      *      06 authors2-num                  PIC S9(9) COMP-5 SYNC.
      *      06 authors2-cont                 PIC X(16).
      * 
      *  
      * Comments for field 'Xstatus':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->status'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(DRAFT, PUBLISHED)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xstatus-length                PIC S9999 COMP-5 SYNC.
      *      06 Xstatus                       PIC X(9).
      * 
      * Comments for field 'formNumber':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->formNumber'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '12'.
      * JSON schema keyword 'maxLength' value: '12'.
      *      06 formNumber                    PIC X(12).
      * 
      *  
      * JSON schema keyword 'responseCode409->publicationDate' is
      *  optional. The existence of the field is indicated by field
      *  'publicationDate2-existence'.
      *      06 publicationDate2-existence    PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 publicationDate2.
      * 
      * Comments for field 'publicationDate':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->publicationDate'.
      * JSON schema type: 'date'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 publicationDate-length        PIC S9999 COMP-5 SYNC.
      *        09 publicationDate               PIC X(32).
      * 
      *  
      * JSON schema keyword 'responseCode409->documentType' is
      *  optional. The existence of the field is indicated by field
      *  'documentType2-existence'.
      *      06 documentType2-existence       PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 documentType2.
      * 
      * Comments for field 'documentType':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->documentType'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(PDF, HARDCOPY)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 documentType-length           PIC S9999 COMP-5 SYNC.
      *        09 documentType                  PIC X(8).
      * 
      *  
      * JSON schema keyword 'responseCode409->sizeMB' is optional. The
      *  existence of the field is indicated by field
      *  'sizeMB2-existence'.
      *      06 sizeMB2-existence             PIC S9(9) COMP-5 SYNC.
      * 
      *  
      * Comments for field 'sizeMB':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->sizeMB'.
      * JSON schema type: 'number'.
      * JSON schema keyword 'format' value: 'decimal'.
      * JSON schema keyword 'minimum' value: '0'.
      *      06 sizeMB                        PIC 9(16)V9(2) COMP-3.
      * 
      *  
      * JSON schema keyword 'responseCode409->url' is optional. The
      *  existence of the field is indicated by field 'url2-existence'.
      *      06 url2-existence                PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 url2.
      * 
      * Comments for field 'url':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->url'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '100'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 url-length                    PIC S9999 COMP-5 SYNC.
      *        09 url                           PIC X(100).
      * 
      * Comments for field 'filler':
      * This is a filler entry to ensure the correct padding for a
      *  structure. These slack bytes do not contain any application
      *  data.
      *      06 filler                        PIC X(2).
      * 
      *  
      * This structure describes one instance of the data in Data Area
      *  'authors2-cont'.
      *  01 RBK01P01-authors2.
      * 
      * Comments for field 'authors':
      * This field represents the value of JSON schema keyword
      *  'responseCode409->authors'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '40'.
      * This field contains a varying length array of characters or
      *  binary data.
      *    03 authors-length                PIC S9999 COMP-5 SYNC.
      *    03 authors                       PIC X(40).
      * 
      *  
      * This structure describes one instance of the data in Data Area
      *  'responseCode500-cont'.
      *  01 RBK01P01-responseCode500.
      *    03 responseCode500.
      * 
      *  
      * JSON schema keyword 'responseCode500->message' is optional.
      *  The existence of the field is indicated by field
      *  'Xmessage-existence'.
      *      06 Xmessage-existence            PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 Xmessage.
      * 
      * Comments for field 'Xmessage2':
      * This field represents the value of JSON schema keyword
      *  'responseCode500->message'.
      * JSON schema type: 'string'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 Xmessage2-length              PIC S9999 COMP-5 SYNC.
      *        09 Xmessage2                     PIC X(50).
      * 
      *  
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
          01 BAQBASE-RBK01P01.
 
            03 responseCode201-existence     PIC S9(9) COMP-5 SYNC.
            03 responseCode201-cont          PIC X(16).
 
 
            03 responseCode409-existence     PIC S9(9) COMP-5 SYNC.
            03 responseCode409-cont          PIC X(16).
 
 
            03 responseCode500-existence     PIC S9(9) COMP-5 SYNC.
            03 responseCode500-cont          PIC X(16).
 
 
         01 RBK01P01-responseCode201.
           03 responseCode201.
             06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
             06 Xtitle                        PIC X(80).
 
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
             06 filler                        PIC X(2).
 
         01 RBK01P01-authors.
           03 authors-length                PIC S9999 COMP-5 SYNC.
           03 authors                       PIC X(40).
 
         01 RBK01P01-responseCode409.
           03 responseCode409.
             06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
             06 Xtitle                        PIC X(80).
 
             06 authors2-num                  PIC S9(9) COMP-5 SYNC.
             06 authors2-cont                 PIC X(16).
 
             06 Xstatus-length                PIC S9999 COMP-5 SYNC.
             06 Xstatus                       PIC X(9).
             06 formNumber                    PIC X(12).
 
             06 publicationDate2-existence    PIC S9(9) COMP-5 SYNC.
 
             06 publicationDate2.
               09 publicationDate-length        PIC S9999 COMP-5 SYNC.
               09 publicationDate               PIC X(32).
 
             06 documentType2-existence       PIC S9(9) COMP-5 SYNC.
 
             06 documentType2.
               09 documentType-length           PIC S9999 COMP-5 SYNC.
               09 documentType                  PIC X(8).
 
             06 sizeMB2-existence             PIC S9(9) COMP-5 SYNC.
 
             06 sizeMB                        PIC 9(16)V9(2) COMP-3.
 
             06 url2-existence                PIC S9(9) COMP-5 SYNC.
 
             06 url2.
               09 url-length                    PIC S9999 COMP-5 SYNC.
               09 url                           PIC X(100).
             06 filler                        PIC X(2).
 
         01 RBK01P01-authors2.
           03 authors-length                PIC S9999 COMP-5 SYNC.
           03 authors                       PIC X(40).
 
         01 RBK01P01-responseCode500.
           03 responseCode500.
 
             06 Xmessage-existence            PIC S9(9) COMP-5 SYNC.
 
             06 Xmessage.
               09 Xmessage2-length              PIC S9999 COMP-5 SYNC.
               09 Xmessage2                     PIC X(50).
 
