FUNCTION MEASUREING_UNIT_MODE_TO_STRING : STRING
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      MEASUREING_UNIT_MODE_TO_STRING                                       
//  Author:      Thorsten Brach                                                
//  Date:        2025-01-24
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
  /// MeasuringUnitMode
  Value : MeasuringUnitMode;
END_VAR

  CASE Value 
  OF
    MeasuringUnitMode.VECTOR_LENGTH  : MEASUREING_UNIT_MODE_TO_STRING := StrReplace('VECTOR_LENGTH ({0})'  ,'{0}' , USINT_TO_STRING(Value));
    MeasuringUnitMode.SEGMENT_LENGTH : MEASUREING_UNIT_MODE_TO_STRING := StrReplace('SEGMENT_LENGTH ({0})' ,'{0}' , USINT_TO_STRING(Value));
    MeasuringUnitMode.TIME_DURATION  : MEASUREING_UNIT_MODE_TO_STRING := StrReplace('TIME_DURATION ({0})'  ,'{0}' , USINT_TO_STRING(Value));
  ELSE
    MEASUREING_UNIT_MODE_TO_STRING := CONCAT('MEASUREING_UNIT_MODE_TO_STRING Function: Error -> no parsing for value ', USINT_TO_STRING(Value));
  END_CASE

END_FUNCTION

