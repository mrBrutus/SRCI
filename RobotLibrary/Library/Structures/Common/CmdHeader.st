{attribute 'pack_mode' := '1'}
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      CmdHeader                                       
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
TYPE CmdHeader :
STRUCT
  /// Type of command - For more information see chapter 5.6.4.
 CmdTyp          : CmdType;
 /// Specifies target buffer and processing behavior - For more information see chapter 5.6.4.5
 ExecMode        : ExecutionMode;
 /// Parameter Sequence, used to identify sets of CMD parameter
 ParSeq          : BYTE;
 /// Priority of this command
 Priority        : PriorityLevel;  
END_STRUCT
END_TYPE


