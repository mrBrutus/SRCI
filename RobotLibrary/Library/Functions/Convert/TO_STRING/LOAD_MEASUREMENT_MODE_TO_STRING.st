FUNCTION LOAD_MEASUREMENT_MODE_TO_STRING : STRING
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      LOAD_MEASUREMENT_MODE_TO_STRING                                       
//  Author:      Thorsten Brach                                                
//  Date:        2025-02-01
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
  /// LoadMeasurementMode
  Value : LoadMeasurementMode;
END_VAR

  CASE Value 
  OF
    LoadMeasurementMode.ONE_POSITION         : LOAD_MEASUREMENT_MODE_TO_STRING := StrReplace('ONE_POSITION ({0})'        ,'{0}' , USINT_TO_STRING(Value));
    LoadMeasurementMode.CONFIGURATION_ANGLE  : LOAD_MEASUREMENT_MODE_TO_STRING := StrReplace('CONFIGURATION_ANGLE ({0})' ,'{0}' , USINT_TO_STRING(Value));
    LoadMeasurementMode.AREA                 : LOAD_MEASUREMENT_MODE_TO_STRING := StrReplace('AREA ({0})'                ,'{0}' , USINT_TO_STRING(Value));
    LoadMeasurementMode.TWO_POSITIONS        : LOAD_MEASUREMENT_MODE_TO_STRING := StrReplace('TWO_POSITIONS ({0})'       ,'{0}' , USINT_TO_STRING(Value));
  ELSE
    LOAD_MEASUREMENT_MODE_TO_STRING := CONCAT('LOAD_MEASUREMENT_MODE_TO_STRING Function: Error -> no parsing for value ', USINT_TO_STRING(Value));
  END_CASE

END_FUNCTION

