FUNCTION IsLoadDataEqual : BOOL
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      IsLoadDataEqual                                       
//  Author:      Thorsten Brach                                                
//  Date:        2025-04-23
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
  /// LoadData 1 to compare
  Data1           : LoadData;
  /// LoadData 2 to compare
  Data2           : LoadData;
  /// Flag to ignore the timestamp during the comparison
  IgnoreTimestamp : BOOL;
END_VAR

  IF (IgnoreTimestamp)
  THEN
    Data1.Timestamp := Data2.Timestamp;
  END_IF                    
                      
  IsLoadDataEqual := ( SysDepMemCmp( pData1 := ADR(Data1), pData2 :=  ADR(Data2), DataLen := SIZEOF(Data1)) = RobotLibraryConstants.OK );

END_FUNCTION

