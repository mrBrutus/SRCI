TYPE DataEnableSync :
{attribute 'pack_mode' := '1'} 
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      DataEnableSync                                       
//  Author:      Thorsten Brach                                                
//  Date:        2024-06-22
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
STRUCT
  /// Set TRUE (default), to activate the synchronizationrelated comparison mechanism for tool data
  EnableSyncTool              : BOOL := TRUE;
  /// Set TRUE (default), to activate the synchronizationrelated comparison mechanism for frame data
  EnableSyncFrame             : BOOL := TRUE;
  ///  Set TRUE (default), to activate the synchronizationrelated comparison mechanism for load data
  EnableSyncLoad              : BOOL := TRUE;
  /// Set TRUE (default), to activate the synchronizationrelated comparison mechanism for work area data
  EnableSyncWorkArea          : BOOL := TRUE;
  /// Set TRUE (default), to activate the synchronizationrelated comparison mechanism for software limits
  EnableSyncSWLimits          : BOOL := TRUE;
  /// Set TRUE (default), to activate the synchronizationrelated comparison mechanism for default dynamics
  EnableSyncDefaultDynamics   : BOOL := TRUE;
  /// Set TRUE (default), to activate the synchronizationrelated comparison mechanism for reference dynamics
  EnableSyncReferenceDynamics : BOOL := TRUE;
END_STRUCT
END_TYPE


