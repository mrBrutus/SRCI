{attribute 'pack_mode' := '1'} 
FUNCTION_BLOCK RobotLibraryRecvDataBaseFB
// ------------------------------------------------------------------------- 
//  SRCI Robot Library                                                
// ------------------------------------------------------------------------- 
//                                                                           
//  Object:      RobotLibraryRecvDataFB                                       
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
VAR_INPUT
  /// Payload length
  PayloadLen : UDINT;
  /// Payload pointer
  PayloadPtr : DINT;
END_VAR

VAR
  /// internal pointer to payload 
  pPayload : POINTER TO BYTE;
END_VAR


END_FUNCTION_BLOCK

/// returns a ArmConfigParameter from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetArmConfig : ArmConfigParameter
VAR
  /// temporary byte
 _tmpByte : BYTE;
END_VAR
// Table 5-17: Meaning of “Config” byte
// BIT 0 Shoulder TRUE : Shoulder is Back
//                FALSE: Shoulder is Front
// BIT 1 Elbow    TRUE : Elbow is Down
//                FALSE: Elbow is Up
// BIT 2 Wrist    TRUE : Wrist is Flip
//                FALSE: Wrist is Non-Flip
// BIT 3 Spare Not used
// BIT 4 Spare Not Used
// BIT 5 Spare Not Used
// BIT 6 Spare Not Used
// BIT 7 Spare Not Used

  // get 1st Byte
  _tmpByte := GetByte();
  
  IF ( _tmpByte.0 ) 
  THEN
    GetArmConfig.Shoulder := ArmConfigShoulder.BACK;
  ELSE
    GetArmConfig.Shoulder := ArmConfigShoulder.FRONT;
  END_IF
  
  IF ( _tmpByte.1 ) 
  THEN
    GetArmConfig.Elbow := ArmConfigElbow.DOWN;
  ELSE
    GetArmConfig.Elbow := ArmConfigElbow.UP;
  END_IF
  
  IF ( _tmpByte.2 ) 
  THEN
    GetArmConfig.Wrist := ArmConfigWrist.FLIP;
  ELSE
    GetArmConfig.Wrist := ArmConfigWrist.NON_FLIP;
  END_IF
  
  
  // get 2nd byte to inc the PayloadPointer
  _tmpByte := GetByte();

END_METHOD

/// returns a BOOL from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetBool : BOOL
VAR
  /// temporary byte
  _tmpByte : BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  
  _tmpByte := GetByte();
  
  // copy data
  GetBool := _tmpByte.0;

END_METHOD

/// returns a BYTE from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetByte : BYTE
VAR
  /// internal pointer to byte
  _tmpPointer : POINTER TO BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  
  _tmpPointer := pPayload + DINT_TO_DWORD(PayloadPtr);
  
  // copy data
  GetByte := _tmpPointer^;
  // inc payload pointer 
  PayloadPtr := PayloadPtr + SIZEOF(BYTE);

END_METHOD

/// returns a datablock from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetDataBlock
VAR_INPUT
  /// Target
  pData    : POINTER TO BYTE;
  /// Size of data block
  Size     : UDINT;
  /// Target data type is string ? 
  IsString : BOOL;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  
  IF ( pData <> RobotLibraryConstants.NULL_POINTER)
  THEN
    IF ( IsString)
    THEN
      Size := Size -1;
    END_IF
  
    // copy data
    SysDepMemCpy(pDest := pData, pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := Size);
    
    // inc payload pointer 
    PayloadPtr := PayloadPtr + UDINT_TO_DINT(Size);
  END_IF

END_METHOD

/// returns a DataInSync from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetDataInSync : DataInSync
VAR
  /// temporary byte
 _tmpByte : BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  
  // copy data
  _tmpByte := GetByte();
  
  GetDataInSync.ToolsInSync             := _tmpByte.0;
  GetDataInSync.FramesInSync            := _tmpByte.1;
  GetDataInSync.LoadsInSync             := _tmpByte.2;
  GetDataInSync.WorkAreasInSync         := _tmpByte.3;
  GetDataInSync.SoftwareLimitsInSync    := _tmpByte.4;
  GetDataInSync.DefaultDynamicsInSync   := _tmpByte.5;
  GetDataInSync.ReferenceDynamicsInSync := _tmpByte.6;

END_METHOD

/// returns a DWORD from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetDword : DWORD

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetDword), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(DWORD));
  // inc payload pointer 
  PayloadPtr := PayloadPtr + SIZEOF(DWORD);

END_METHOD

/// returns a FragmentAction from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetFragmentAction : FragmentAction
VAR
  /// temporary byte
 _tmpByte : BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  _tmpByte := GetByte();
  
  GetFragmentAction.Complete := _tmpByte.0;
  GetFragmentAction.Reset    := _tmpByte.1;
  GetFragmentAction.Clear    := _tmpByte.2;
  GetFragmentAction.BIT03    := _tmpByte.3;
  GetFragmentAction.BIT04    := _tmpByte.4;
  GetFragmentAction.BIT05    := _tmpByte.5;
  GetFragmentAction.BIT06    := _tmpByte.6;
  GetFragmentAction.BIT07    := _tmpByte.7;

END_METHOD

/// returns the 1st halfe BYTE from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetHalfeByte1 : BYTE
VAR_INPUT
  /// Increase payload pointer 
  IncPayloadPtr : BOOL;
END_VAR

VAR
  /// temporary byte
 _tmpByte    : BYTE;
  /// internal pointer to byte
 _tmpPointer : POINTER TO BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // set pointer
  _tmpPointer := pPayload + DINT_TO_DWORD(PayloadPtr); 
  // copy data
  _tmpByte := _tmpPointer^;
  
  GetHalfeByte1.0 := _tmpByte.0;
  GetHalfeByte1.1 := _tmpByte.1;
  GetHalfeByte1.2 := _tmpByte.2;
  GetHalfeByte1.3 := _tmpByte.3;
  
  IF (IncPayloadPtr)
  THEN  
    // inc payload pointer
    PayloadPtr := PayloadPtr + SIZEOF(BYTE);
  END_IF

END_METHOD

/// returns the 1st halfe BYTE from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetHalfeByte2 : BYTE
VAR_INPUT
  /// Increase payload pointer 
  IncPayloadPtr : BOOL;
END_VAR

VAR
  /// temporary byte
 _tmpByte    : BYTE;
  /// internal pointer to byte
 _tmpPointer : POINTER TO BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // set pointer
  _tmpPointer := pPayload + DINT_TO_DWORD(PayloadPtr); 
  // copy data
  _tmpByte := _tmpPointer^;
  
  GetHalfeByte2.0 := _tmpByte.4;
  GetHalfeByte2.1 := _tmpByte.5;
  GetHalfeByte2.2 := _tmpByte.6;
  GetHalfeByte2.3 := _tmpByte.7;
  
  IF (IncPayloadPtr)
  THEN  
    // inc payload pointer
    PayloadPtr := PayloadPtr + SIZEOF(BYTE);
  END_IF

END_METHOD

/// returns a IEC_Date from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetIecDate : IEC_Date

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetIecDate), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(IEC_DATE));
  // swap byte order
  GetIecDate := SwapIecDate(GetIecDate);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(IEC_DATE);

END_METHOD

/// returns a IEC_TIME from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetIecTime : IEC_TIME

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetIecTime), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(IEC_TIME));
  // swap byte order
  GetIecTime := SwapIecTime(GetIecTime);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(IEC_TIME);

END_METHOD

/// returns a INT from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetInt : INT

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetInt), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(INT));
  // swap byte order
  GetInt := SwapInt(GetInt);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(INT);

END_METHOD

/// returns a REAL from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetReal : REAL

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetReal), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(REAL));
  // swap byte order
  GetReal := SwapReal(GetReal);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(Real);

END_METHOD

/// returns a SINT from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetSint : SINT

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetSint), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(SINT));
  // inc payload pointer 
  PayloadPtr := PayloadPtr + SIZEOF(SINT);

END_METHOD

/// returns a String from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetString : STRING(255)
VAR_INPUT
  Size : DINT;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetString), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := DINT_TO_UDINT(Size));
  
  // inc payload pointer 
  PayloadPtr := PayloadPtr + Size;

END_METHOD

/// returns a TrackingStatus from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetTrackingStatus : TrackingStatus
VAR
  /// temporary byte
  tmpByte : BYTE;
END_VAR

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  tmpByte := GetByte();
  
  GetTrackingStatus.ConveyorTrackingEnabled   := tmpByte.0;  
  GetTrackingStatus.WaitingForSynchronization := tmpByte.1;
  GetTrackingStatus.Synchronizing             := tmpByte.2;
  GetTrackingStatus.Synchronous               := tmpByte.3;
  GetTrackingStatus.Desynchronizing           := tmpByte.4;
  GetTrackingStatus.SyncOutZoneEntered        := tmpByte.5;
  GetTrackingStatus.SyncOutZoneLeft           := tmpByte.6;
  GetTrackingStatus.NotUsed                   := tmpByte.7;

END_METHOD

/// returns a TurnNumber from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetTurnNumbers : TurnNumber

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  GetTurnNumbers.J1Turns := BYTE_TO_SINT(GetHalfeByte1(FALSE));
  GetTurnNumbers.J2Turns := BYTE_TO_SINT(GetHalfeByte2(TRUE));
  
  GetTurnNumbers.J3Turns := BYTE_TO_SINT(GetHalfeByte1(FALSE));
  GetTurnNumbers.J4Turns := BYTE_TO_SINT(GetHalfeByte2(TRUE));
  
  GetTurnNumbers.J5Turns := BYTE_TO_SINT(GetHalfeByte1(FALSE));
  GetTurnNumbers.J6Turns := BYTE_TO_SINT(GetHalfeByte2(TRUE));
  
  GetTurnNumbers.E1Turns := BYTE_TO_SINT(GetByte());

END_METHOD

/// returns a UDINT from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetUdint : UDINT

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetUdint), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(UDINT));
  // swap byte order
  GetUdint := SwapUdint(GetUdint);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(UDINT);

END_METHOD

/// returns a UINT from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetUint : UINT

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetUint), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(UINT));
  // swap byte order
  GetUint := SwapUint(GetUint);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(UINT);

END_METHOD

/// returns a USINT from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetUsint : USINT

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetUsint), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(USINT));
  // inc payload pointer 
  PayloadPtr := PayloadPtr + SIZEOF(USINT);

END_METHOD

/// returns a WORD from the payload buffer from the current payload pointer address and increase the payload pointer afterwards
METHOD GetWord : WORD

  // update internal pointer
  UpdatePointer();
  
  // check pointer is valid ? 
  IF (pPayload = RobotLibraryConstants.NULL_POINTER)
  THEN
    RETURN;
  END_IF
  
  // copy data
  SysDepMemCpy(pDest := ADR(GetWord), pSrc := pPayload + DINT_TO_DWORD(PayloadPtr), DataLen := SIZEOF(WORD));
  // swap byte order
  GetWord := SwapWord(GetWord);
  // inc payload pointer   
  PayloadPtr := PayloadPtr + SIZEOF(WORD);

END_METHOD

/// Resets the payload buffer, the payload pointer and the payload length
METHOD Reset
VAR_INPUT
END_VAR


END_METHOD

METHOD UpdatePointer
VAR_INPUT
END_VAR


END_METHOD

