      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * This file contains the generated language structure(s) for
      *  request JSON schema 'getRedbook_request.json'.
      * This structure was generated using 'DFHJS2LS' at mapping level
      *  '5.0'.
      * 
      *  
      *   01 BAQBASE-RBK00Q01.
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
      *     03 requestQueryParameters.
      * 
      *  
      * JSON schema keyword 'requestQueryParameters->author' is
      *  optional. The existence of the field is indicated by field
      *  'Xauthor-existence'.
      *       06 Xauthor-existence             PIC S9(9) COMP-5 SYNC.
      * 
      *  
      *       06 Xauthor.
      * 
      * Comments for field 'Xauthor2':
      * This field represents the value of JSON schema keyword
      *  'requestQueryParameters->author'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '0'.
      * JSON schema keyword 'maxLength' value: '40'.
      * This field contains a varying length array of characters or
      *  binary data.
      *         09 Xauthor2-length               PIC S9999 COMP-5 SYNC.
      *         09 Xauthor2                      PIC X(40).
      * 
      *  
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
          01 BAQBASE-RBK00Q01.
            03 requestPathParameters.
              06 Xtitle-length                 PIC S9999 COMP-5 SYNC.
              06 Xtitle                        PIC X(80).
            03 requestQueryParameters.
 
              06 Xauthor-existence             PIC S9(9) COMP-5 SYNC.
 
              06 Xauthor.
                09 Xauthor2-length               PIC S9999 COMP-5 SYNC.
                09 Xauthor2                      PIC X(40).
 
