{attribute 'pack_mode' := '1'} 
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      SynchronizationModes                                       
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
TYPE SynchronizationModes :
STRUCT
 /// synchronization direction for tool
 Tool              : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode;
 /// synchronization direction for frame
 Frame             : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode;
 /// synchronization direction for load
 Load              : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode;
 /// synchronization direction for work areas
 WorkAreas         : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode;
 /// synchronization direction for SW limits
 SWLimits          : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode;
 /// synchronization direction for defaul dynamics
 DefaultDynamics   : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode;
 /// synchronization direction for reference dynamics 
 ReferenceDynamics : ARRAY[0..SyncTime.AFTER_START_UP] OF SyncMode; 
END_STRUCT
END_TYPE


