      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * This file contains the generated language structure(s) for
      *  response JSON schema 'getAllRedbooks_response.json'.
      * This structure was generated using 'DFHJS2LS' at mapping level
      *  '5.0'.
      * 
      *  
      *   01 BAQBASE-RBK02P01.
      * 
      *  
      * CONTAINER 'responseCode200-cont' contains
      *  'responseCode200-num' instances of structure
      *  'RBK02P01-responseCode200', each of which represents an
      *  instance of JSON schema keyword 'responseCode200'. The
      *  CONTAINER must be read from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There is no maximum number of instances.
      *     03 responseCode200-num           PIC S9(9) COMP-5 SYNC.
      *     03 responseCode200-cont          PIC X(16).
      * 
      *  
      *  
      * CONTAINER 'responseCode404-cont' contains 0 or 1 instances of
      *  structure 'RBK02P01-responseCode404', each of which
      *  represents an instance of JSON schema keyword
      *  'responseCode404'. The CONTAINER must be read from and
      *  written to in BIT mode.
      *     03 responseCode404-existence     PIC S9(9) COMP-5 SYNC.
      *     03 responseCode404-cont          PIC X(16).
      * 
      *  
      *  
      * CONTAINER 'responseCode500-cont' contains 0 or 1 instances of
      *  structure 'RBK02P01-responseCode500', each of which
      *  represents an instance of JSON schema keyword
      *  'responseCode500'. The CONTAINER must be read from and
      *  written to in BIT mode.
      *     03 responseCode500-existence     PIC S9(9) COMP-5 SYNC.
      *     03 responseCode500-cont          PIC X(16).
      * 
      *  
      *  
      * This structure describes one instance of the data in Data Area
      *  'responseCode200-cont'.
      *  01 RBK02P01-responseCode200.
      *    03 responseCode200.
      * 
      * Comments for field 'Xtitle':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->title'.
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
      *  structure 'RBK02P01-authors', each of which represents an
      *  instance of JSON schema keyword 'responseCode200->authors'.
      *  The CONTAINER must be read from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There should be at most '20' instance(s).
      *      06 authors-num                   PIC S9(9) COMP-5 SYNC.
      *      06 authors-cont                  PIC X(16).
      * 
      *  
      * Comments for field 'Xstatus':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->status'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(DRAFT, PUBLISHED)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xstatus-length                PIC S9999 COMP-5 SYNC.
      *      06 Xstatus                       PIC X(9).
      * 
      * Comments for field 'formNumber':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->formNumber'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '12'.
      * JSON schema keyword 'maxLength' value: '12'.
      *      06 formNumber                    PIC X(12).
      * 
      *  
      * JSON schema keyword 'responseCode200->publicationDate' is
      *  optional. The existence of the field is indicated by field
      *  'publicationDate-existence'.
      *      06 publicationDate-existence     PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 publicationDate.
      * 
      * Comments for field 'publicationDate2':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->publicationDate'.
      * JSON schema type: 'date'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 publicationDate2-length       PIC S9999 COMP-5 SYNC.
      *        09 publicationDate2              PIC X(32).
      * 
      *  
      * JSON schema keyword 'responseCode200->documentType' is
      *  optional. The existence of the field is indicated by field
      *  'documentType-existence'.
      *      06 documentType-existence        PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 documentType.
      * 
      * Comments for field 'documentType2':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->documentType'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(PDF, HARDCOPY)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 documentType2-length          PIC S9999 COMP-5 SYNC.
      *        09 documentType2                 PIC X(8).
      * 
      *  
      * JSON schema keyword 'responseCode200->sizeMB' is optional. The
      *  existence of the field is indicated by field
      *  'sizeMB-existence'.
      *      06 sizeMB-existence              PIC S9(9) COMP-5 SYNC.
      * 
      *  
      * Comments for field 'sizeMB':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->sizeMB'.
      * JSON schema type: 'number'.
      * JSON schema keyword 'format' value: 'decimal'.
      * JSON schema keyword 'minimum' value: '0'.
      *      06 sizeMB                        PIC 9(16)V9(2) COMP-3.
      * 
      *  
      * JSON schema keyword 'responseCode200->url' is optional. The
      *  existence of the field is indicated by field 'url-existence'.
      *      06 url-existence                 PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 url.
      * 
      * Comments for field 'url2':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->url'.
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
      *  01 RBK02P01-authors.
      * 
      * Comments for field 'authors':
      * This field represents the value of JSON schema keyword
      *  'responseCode200->authors'.
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
      *  'responseCode404-cont'.
      *  01 RBK02P01-responseCode404.
      *    03 responseCode404.
      * 
      * Comments for field 'Xmessage':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->message'.
      * JSON schema type: 'string'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xmessage-length               PIC S9999 COMP-5 SYNC.
      *      06 Xmessage                      PIC X(50).
      * 
      *  
      * CONTAINER 'authorsBooks-cont' contains 'authorsBooks-num'
      *  instances of structure 'RBK02P01-authorsBooks', each of which
      *  represents an instance of JSON schema keyword
      *  'responseCode404->authorsBooks'. The CONTAINER must be read
      *  from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There is no maximum number of instances.
      *      06 authorsBooks-num              PIC S9(9) COMP-5 SYNC.
      *      06 authorsBooks-cont             PIC X(16).
      * 
      *  
      *  
      * This structure describes one instance of the data in Data Area
      *  'authorsBooks-cont'.
      *  01 RBK02P01-authorsBooks.
      *    03 authorsBooks.
      * 
      * Comments for field 'Xtitle':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->title'.
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
      *  structure 'RBK02P01-authors2', each of which represents an
      *  instance of JSON schema keyword
      *  'responseCode404->authorsBooks->authors'. The CONTAINER must
      *  be read from and written to in BIT mode.
      * There should be at least '0' instance(s).
      * There should be at most '20' instance(s).
      *      06 authors2-num                  PIC S9(9) COMP-5 SYNC.
      *      06 authors2-cont                 PIC X(16).
      * 
      *  
      * Comments for field 'Xstatus':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->status'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(DRAFT, PUBLISHED)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *      06 Xstatus-length                PIC S9999 COMP-5 SYNC.
      *      06 Xstatus                       PIC X(9).
      * 
      * Comments for field 'formNumber':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->formNumber'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '12'.
      * JSON schema keyword 'maxLength' value: '12'.
      *      06 formNumber                    PIC X(12).
      * 
      *  
      * JSON schema keyword
      *  'responseCode404->authorsBooks->publicationDate' is optional.
      *  The existence of the field is indicated by field
      *  'publicationDate2-existence'.
      *      06 publicationDate2-existence    PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 publicationDate2.
      * 
      * Comments for field 'publicationDate':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->publicationDate'.
      * JSON schema type: 'date'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 publicationDate-length        PIC S9999 COMP-5 SYNC.
      *        09 publicationDate               PIC X(32).
      * 
      *  
      * JSON schema keyword
      *  'responseCode404->authorsBooks->documentType' is optional.
      *  The existence of the field is indicated by field
      *  'documentType2-existence'.
      *      06 documentType2-existence       PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 documentType2.
      * 
      * Comments for field 'documentType':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->documentType'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'enumeration' value: '(PDF, HARDCOPY)'.
      * This field contains a varying length array of characters or
      *  binary data.
      *        09 documentType-length           PIC S9999 COMP-5 SYNC.
      *        09 documentType                  PIC X(8).
      * 
      *  
      * JSON schema keyword 'responseCode404->authorsBooks->sizeMB' is
      *  optional. The existence of the field is indicated by field
      *  'sizeMB2-existence'.
      *      06 sizeMB2-existence             PIC S9(9) COMP-5 SYNC.
      * 
      *  
      * Comments for field 'sizeMB':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->sizeMB'.
      * JSON schema type: 'number'.
      * JSON schema keyword 'format' value: 'decimal'.
      * JSON schema keyword 'minimum' value: '0'.
      *      06 sizeMB                        PIC 9(16)V9(2) COMP-3.
      * 
      *  
      * JSON schema keyword 'responseCode404->authorsBooks->url' is
      *  optional. The existence of the field is indicated by field
      *  'url2-existence'.
      *      06 url2-existence                PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *      06 url2.
      * 
      * Comments for field 'url':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->url'.
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
      *  01 RBK02P01-authors2.
      * 
      * Comments for field 'authors':
      * This field represents the value of JSON schema keyword
      *  'responseCode404->authorsBooks->authors'.
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
      *  01 RBK02P01-responseCode500.
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
 
          01 BAQBASE-RBK02P01.
 
            03 responseCode200-num           PIC S9(9) COMP-5 SYNC.
            03 responseCode200-cont          PIC X(16).
 
 
            03 responseCode404-existence     PIC S9(9) COMP-5 SYNC.
            03 responseCode404-cont          PIC X(16).
 
 
            03 responseCode500-existence     PIC S9(9) COMP-5 SYNC.
            03 responseCode500-cont          PIC X(16).
 
 
         01 RBK02P01-responseCode200.
           03 responseCode200.
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
 
         01 RBK02P01-authors.
           03 authors-length                PIC S9999 COMP-5 SYNC.
           03 authors                       PIC X(40).
 
         01 RBK02P01-responseCode404.
           03 responseCode404.
             06 Xmessage-length               PIC S9999 COMP-5 SYNC.
             06 Xmessage                      PIC X(50).
 
             06 authorsBooks-num              PIC S9(9) COMP-5 SYNC.
             06 authorsBooks-cont             PIC X(16).
 
 
         01 RBK02P01-authorsBooks.
           03 authorsBooks.
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
 
         01 RBK02P01-authors2.
           03 authors-length                PIC S9999 COMP-5 SYNC.
           03 authors                       PIC X(40).
 
         01 RBK02P01-responseCode500.
           03 responseCode500.
 
             06 Xmessage-existence            PIC S9(9) COMP-5 SYNC.
 
             06 Xmessage.
               09 Xmessage2-length              PIC S9999 COMP-5 SYNC.
               09 Xmessage2                     PIC X(50).
 
