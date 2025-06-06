{attribute 'pack_mode' := '1'} 
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      ReadActualTCPVelocityOutCmd                                       
//  Author:      Thorsten Brach                                                
//  Date:        2024-08-09
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
TYPE ReadActualTCPVelocityOutCmd :
STRUCT
  /// Absolute actual velocity of the robot’s TCP. [mm/s]
  ActualTCPVelocity  : REAL;
  /// Index of tool of returned velocity
  /// •      0: Flange
  /// • 1..254: Tool frames
  ToolNoReturn       : USINT;
  /// Index of frame of returned position
  /// •      0: WCS
  /// • 1..254: User frames
  FrameNoReturn      : USINT;
  /// Unique system-generated ID of the "Action" when the function is triggered
  /// • >0: The "Action" is started by the trigger function with identical FollowID.
  /// • <0: The "Action" is stopped by the trigger function with identical FollowID.
  /// For more information see chapter 5.5.12.4
  OriginID           : INT;
  /// Relates to ListenerID >0 Number of successful trigger -based command invocations 
  /// For more information refer to chapter 5.5.12.4
  InvocationCounter  : USINT;
END_STRUCT
END_TYPE


