{attribute 'pack_mode' := '1'} 
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      MoveDepartLinearParCmd                                       
//  Author:      Thorsten Brach                                                
//  Date:        2024-07-29
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
TYPE MoveDepartLinearParCmd :
STRUCT
  /// Absolute target coordinates in the selected coordinate system (see input parameters ToolNo and FrameNo).
  TargetPosition     : RobotCartesianPosition;
  /// Offset distance of auxiliary position from TargetPosition
  Offset             : AuxOffset;
  /// Defines type of reference coordinate system of the offset position
  ReferenceType      : ReferenceType;
  /// TCP velocity in % of nominal velocity
  /// •  <0%: (default) - Use default velocity
  /// •   0%:           - Use internal minimal velocity
  /// • 100%:           - Use maximal reference velocity
  /// See chapter 5.5.7 Robot dynamics
  VelocityRate       : REAL;
  /// Acceleration for movement in % of nominal acceleration
  /// •  <0%: (default) - Use default acceleration
  /// •   0%:           - Use internal minimal acceleration
  /// • 100%:           - Use maximal reference acceleration
  /// See chapter 5.5.7 Robot dynamics
  AccelerationRate   : REAL;
  /// Deceleration for movement in % of nominal deceleration
  /// •  <0%: (default) - Use default deceleration 
  /// •   0%:           - Use internal minimal deceleration
  /// • 100%:           - Use maximal reference deceleration
  /// See chapter 5.5.7 Robot dynamics
  DecelerationRate   : REAL;
  /// Jerk of the movement in % of nominal jerk
  /// •  <0%: (default) - Use default jerk
  /// •   0%:           - Use internal minimal jerk
  /// • 100%:           - Use maximal reference jerk
  /// See chapter 5.5.7 Robot dynamics
  JerkRate           : REAL;
  /// Index of tool
  /// •      0: Flange (default)
  /// • 1..254: Tool frames
  ToolNo             : USINT;
  /// Index of frame
  /// •      0: WCS (default)
  /// • 1..254: User frames
  FrameNo            : USINT;
  /// Parameter which determines the transition behavior at the end of the movement to be sent to the next command. 
  /// The user can choose a transition type between exact stop and different blend possibilities
  BlendingMode       : BlendingMode;
  /// Additional parameter for the blending mode, to define i.e. velocity limit (%) or blending radius
  BlendingParameter  : ARRAY [0..1] OF REAL := [10,0];
  /// Define blending sphere with radius around auxiliary position. For exact stop define AuxCornerDistance = 0
  AuxCornerDistance  : REAL;
  /// Parameter is used if it is greater than 0 (default)
  /// • Velocity input is ignored
  /// • Parameter defines the time for the movement to reach the target position
  /// Error is sent by the RC if the time cannot be kept
  MoveTime           : TIME;
  /// Parameter to describe how the orientation axes (RX, RY, RZ) will be interpolated during the movement
  OriMode            : OriMode;
  /// Defines the usage of the config byte inside the position according to Table 6-238
  ConfigMode         : ArmConfigParameter;
  /// Defines the usage of the TurnNumber byte inside the position.
  TurnMode           : TurnMode;
  /// Factor by which VelocityRate is multiplied to define the velocity for the second segment of the motion. Always positive.
  /// • 0: use the minimal velocity
  /// • 1: use the velocity set with VelocityRate 
  /// Input values below 1 to reduce velocity, 
  /// Input values above 1 to increase velocity.
  /// See chapter 5.5.7 Robot dynamics
  VelocityCoefficient: REAL;
  /// Set TRUE to allow manipulation of this move command through superimposing functions.
  /// For more information see chapter 5.5.9.5
  Manipulation       : BOOL;
  /// ID of Action that will be executed when this command is active
  /// • >0: Start Action - Start executing the Action function with the identical ListenerID.
  /// • <0: Stop Action  -  Stop executing the Action function with the identical ListenerID.
  /// • 0: No trigger (default)-  If no EmitterID is defined, the function will not trigger any Action during its execution
  /// For more information see section Triggers of this chapter or chapter 5.5.12.4.
  EmitterID          : ARRAY [0..3] OF SINT;
END_STRUCT
END_TYPE


