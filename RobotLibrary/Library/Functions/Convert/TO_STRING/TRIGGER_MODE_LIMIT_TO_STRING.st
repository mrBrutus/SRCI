FUNCTION TRIGGER_MODE_LIMIT_TO_STRING : STRING
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      TRIGGER_MODE_LIMIT_TO_STRING                                       
//  Author:      Thorsten Brach                                                
//  Date:        2025-03-02
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
  /// TriggerModeLimit
  Value : TriggerModeLimit;
END_VAR

  CASE Value 
  OF
    TriggerModeLimit.INVALID         : TRIGGER_MODE_LIMIT_TO_STRING := StrReplace('INVALID ({0})'         ,'{0}' , SINT_TO_STRING(Value));
    TriggerModeLimit.JOINT_CURRENT   : TRIGGER_MODE_LIMIT_TO_STRING := StrReplace('JOINT_CURRENT ({0})'   ,'{0}' , SINT_TO_STRING(Value));
    TriggerModeLimit.FORCE           : TRIGGER_MODE_LIMIT_TO_STRING := StrReplace('FORCE ({0})'           ,'{0}' , SINT_TO_STRING(Value));
    TriggerModeLimit.FOLLOWING_ERROR : TRIGGER_MODE_LIMIT_TO_STRING := StrReplace('FOLLOWING_ERROR ({0})' ,'{0}' , SINT_TO_STRING(Value));
    TriggerModeLimit.TEMPERATURE     : TRIGGER_MODE_LIMIT_TO_STRING := StrReplace('TEMPERATURE ({0})'     ,'{0}' , SINT_TO_STRING(Value));
  ELSE
    TRIGGER_MODE_LIMIT_TO_STRING := CONCAT('TRIGGER_MODE_LIMIT_TO_STRING Function: Error -> no parsing for value ', SINT_TO_STRING(Value));
  END_CASE

END_FUNCTION

