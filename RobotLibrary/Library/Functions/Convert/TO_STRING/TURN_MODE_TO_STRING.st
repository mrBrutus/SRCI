FUNCTION TURN_MODE_TO_STRING : STRING
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      TURN_MODE_TO_STRING                                       
//  Author:      Thorsten Brach                                                
//  Date:        2025-01-23
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
  /// TurnMode
  Value : TurnMode;
END_VAR

  CASE Value 
  OF
    TurnMode.USE_TURN_NUMBER : TURN_MODE_TO_STRING := StrReplace('USE_TURN_NUMBER ({0})','{0}' , USINT_TO_STRING(Value));
    TurnMode.SAME            : TURN_MODE_TO_STRING := StrReplace('SAME ({0})'           ,'{0}' , USINT_TO_STRING(Value));
    TurnMode.FREE            : TURN_MODE_TO_STRING := StrReplace('FREE ({0})'           ,'{0}' , USINT_TO_STRING(Value));
  ELSE
    TURN_MODE_TO_STRING := CONCAT('TURN_MODE_TO_STRING Function: Error -> no parsing for value ', USINT_TO_STRING(Value));
  END_CASE

END_FUNCTION

