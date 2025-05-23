{attribute 'pack_mode' := '1'} 
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      MeasuringInputRecvData                                       
//  Author:      Thorsten Brach                                                
//  Date:        2024-06-21
//
//  Description:                                              
//   
//                                                                           
//  Copyright: 
//    (C) 2024 Thorsten Brach. All rights reserved                                                                                                                                            
//             Licensed under the LGPL-3.0 license.
//                                                                           
//  Disclaimer:                                                                           
//    This project is provided without any guarantee and can be used for   
//    private and commercial purposes. Any use is at the user’s 
//    own risk and responsibility.
//
// -------------------------------------------------------------------------
TYPE MeasuringInputRecvData EXTENDS RspHeader :
STRUCT
  /// FB is returning a unique ID for the called measurement.
  MeasuringID        : UINT;
  /// Measured robot position value at the rising edge of the digital input in selected coordinate systems (see input parameters ToolNo and FrameNo).
  Measurings         : ARRAY[1..2] OF MeasuringInputResult;  
END_STRUCT
END_TYPE


