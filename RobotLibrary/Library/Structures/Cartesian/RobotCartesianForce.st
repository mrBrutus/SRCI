{attribute 'pack_mode' := '1'} 
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      RobotCartesianForce                                       
//  Author:      Thorsten Brach                                                
//  Date:        2024-06-01
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
TYPE RobotCartesianForce :
STRUCT
  /// Force on the X-Axis
  X : REAL;
  /// Force on the Y-Axis
  Y : REAL;
  /// Force on the Z-Axis
  Z : REAL;
  /// Force around the X-Axis (RX)
  Rx : REAL;
  /// Force around the Y-Axis (RY)
  Ry : REAL;
  /// Force around the Z-Axis (RZ)
  Rz : REAL;
  /// Force of first external axis
  E1 : REAL;
  /// Force of second external axis
  E2 : REAL;
  /// Force of third external axis
  E3 : REAL;
  /// Force of fourth external axis
  E4 : REAL;
  /// Force of fifth external axis
  E5 : REAL;
  /// Force of sixth external axis
  E6 : REAL;    
END_STRUCT
END_TYPE


