{attribute 'pack_mode' := '1'}
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      WriteWorkAreaSendData                                       
//  Author:      Thorsten Brach                                                
//  Date:        2024-08-08
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
TYPE WriteWorkAreaSendData EXTENDS CmdHeader: 
STRUCT
  /// Reserve
  Reserve           : BYTE;
  /// Index of the robot work area
  /// • 0 (default)..254
  WorkAreaNo         : USINT;
  /// Data specific to the work area requested by Index.
  WorkAreaData       : RobotWorkAreaData;
  /// Data changed 
  DataChanged        : BOOL;
END_STRUCT
END_TYPE


