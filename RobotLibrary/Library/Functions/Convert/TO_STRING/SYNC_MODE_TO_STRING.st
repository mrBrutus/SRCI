FUNCTION SYNC_MODE_TO_STRING : STRING
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      SYNC_MODE_TO_STRING                                       
//  Author:      Thorsten Brach                                                
//  Date:        2025-02-23
//
//  Description:                                              
//   
//                                                                           
//  Copyright: 
//    (C) 2025 Thorsten Brach. All rights reserved                                                                                                                                            
//             Licensed under the LGPL-3.0 license.
//                                                                           
//  Disclaimer:                                                                           
//    This project is provided without any guarantee and can be used for   
//    private and commercial purposes. Any use is at the user’s 
//    own risk and responsibility.
//
// -------------------------------------------------------------------------
VAR_INPUT
  /// SyncMode
  Value : SyncMode;
END_VAR

  CASE Value 
  OF
    SyncMode.NO_SYNCHRONIZATION : SYNC_MODE_TO_STRING := StrReplace('NO_SYNCHRONIZATION ({0})','{0}' , USINT_TO_STRING(Value));
    SyncMode.CLIENT_TO_SERVER   : SYNC_MODE_TO_STRING := StrReplace('CLIENT_TO_SERVER ({0})'  ,'{0}' , USINT_TO_STRING(Value));
    SyncMode.SERVER_TO_CLIENT   : SYNC_MODE_TO_STRING := StrReplace('SERVER_TO_CLIENT ({0})'  ,'{0}' , USINT_TO_STRING(Value));
    SyncMode.AUTOMATIC          : SYNC_MODE_TO_STRING := StrReplace('AUTOMATIC ({0})'         ,'{0}' , USINT_TO_STRING(Value));
  ELSE
    SYNC_MODE_TO_STRING := CONCAT('SYNC_MODE_TO_STRING Function: Error -> no parsing for value ', USINT_TO_STRING(Value));
  END_CASE

END_FUNCTION

