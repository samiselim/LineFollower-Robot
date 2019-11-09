
_AutoCalibration:

	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      AutoCalibration_S_L0+0
	MOVF       R0+1, 0
	MOVWF      AutoCalibration_S_L0+1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      AutoCalibration_S_L0+2
	MOVF       R0+1, 0
	MOVWF      AutoCalibration_S_L0+3
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      AutoCalibration_S_L0+4
	MOVF       R0+1, 0
	MOVWF      AutoCalibration_S_L0+5
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      AutoCalibration_S_L0+6
	MOVF       R0+1, 0
	MOVWF      AutoCalibration_S_L0+7
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      AutoCalibration_S_L0+8
	MOVF       R0+1, 0
	MOVWF      AutoCalibration_S_L0+9
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      AutoCalibration_S_L0+10
	MOVF       R0+1, 0
	MOVWF      AutoCalibration_S_L0+11
	MOVF       AutoCalibration_S_L0+0, 0
	MOVWF      AutoCalibration_Max1_L0+0
	MOVF       AutoCalibration_S_L0+1, 0
	MOVWF      AutoCalibration_Max1_L0+1
	CLRF       AutoCalibration_i_L0+0
	CLRF       AutoCalibration_i_L0+1
L_AutoCalibration0:
	MOVLW      128
	XORWF      AutoCalibration_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__AutoCalibration87
	MOVLW      6
	SUBWF      AutoCalibration_i_L0+0, 0
L__AutoCalibration87:
	BTFSC      STATUS+0, 0
	GOTO       L_AutoCalibration1
	MOVF       AutoCalibration_i_L0+0, 0
	MOVWF      R0+0
	MOVF       AutoCalibration_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      AutoCalibration_S_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      AutoCalibration_Max1_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__AutoCalibration88
	MOVF       R1+0, 0
	SUBWF      AutoCalibration_Max1_L0+0, 0
L__AutoCalibration88:
	BTFSC      STATUS+0, 0
	GOTO       L_AutoCalibration3
	MOVF       AutoCalibration_i_L0+0, 0
	MOVWF      R0+0
	MOVF       AutoCalibration_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      AutoCalibration_S_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      AutoCalibration_Max1_L0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      AutoCalibration_Max1_L0+1
L_AutoCalibration3:
	INCF       AutoCalibration_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       AutoCalibration_i_L0+1, 1
	GOTO       L_AutoCalibration0
L_AutoCalibration1:
	MOVLW      150
	ADDWF      AutoCalibration_Max1_L0+0, 0
	MOVWF      _Limit+0
	MOVF       AutoCalibration_Max1_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      _Limit+1
L_end_AutoCalibration:
	RETURN
; end of _AutoCalibration

_ReadSensors:

	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _S1+0
	MOVF       R0+1, 0
	MOVWF      _S1+1
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _S2+0
	MOVF       R0+1, 0
	MOVWF      _S2+1
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _S3+0
	MOVF       R0+1, 0
	MOVWF      _S3+1
	MOVLW      4
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _S4+0
	MOVF       R0+1, 0
	MOVWF      _S4+1
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _S5+0
	MOVF       R0+1, 0
	MOVWF      _S5+1
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _S6+0
	MOVF       R0+1, 0
	MOVWF      _S6+1
	MOVLW      128
	XORWF      _Limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _S1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors90
	MOVF       _S1+0, 0
	SUBWF      _Limit+0, 0
L__ReadSensors90:
	BTFSC      STATUS+0, 0
	GOTO       L_ReadSensors4
	MOVLW      1
	MOVWF      _S1+0
	MOVLW      0
	MOVWF      _S1+1
	BSF        PORTD+0, 7
	GOTO       L_ReadSensors5
L_ReadSensors4:
	CLRF       _S1+0
	CLRF       _S1+1
	BCF        PORTD+0, 7
L_ReadSensors5:
	MOVLW      128
	XORWF      _Limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _S2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors91
	MOVF       _S2+0, 0
	SUBWF      _Limit+0, 0
L__ReadSensors91:
	BTFSC      STATUS+0, 0
	GOTO       L_ReadSensors6
	MOVLW      1
	MOVWF      _S2+0
	MOVLW      0
	MOVWF      _S2+1
	BSF        PORTD+0, 6
	GOTO       L_ReadSensors7
L_ReadSensors6:
	CLRF       _S2+0
	CLRF       _S2+1
	BCF        PORTD+0, 6
L_ReadSensors7:
	MOVLW      128
	XORWF      _Limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _S3+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors92
	MOVF       _S3+0, 0
	SUBWF      _Limit+0, 0
L__ReadSensors92:
	BTFSC      STATUS+0, 0
	GOTO       L_ReadSensors8
	MOVLW      1
	MOVWF      _S3+0
	MOVLW      0
	MOVWF      _S3+1
	BSF        PORTD+0, 5
	GOTO       L_ReadSensors9
L_ReadSensors8:
	CLRF       _S3+0
	CLRF       _S3+1
	BCF        PORTD+0, 5
L_ReadSensors9:
	MOVLW      128
	XORWF      _Limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _S4+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors93
	MOVF       _S4+0, 0
	SUBWF      _Limit+0, 0
L__ReadSensors93:
	BTFSC      STATUS+0, 0
	GOTO       L_ReadSensors10
	MOVLW      1
	MOVWF      _S4+0
	MOVLW      0
	MOVWF      _S4+1
	BSF        PORTC+0, 7
	GOTO       L_ReadSensors11
L_ReadSensors10:
	CLRF       _S4+0
	CLRF       _S4+1
	BCF        PORTC+0, 7
L_ReadSensors11:
	MOVLW      128
	XORWF      _Limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _S5+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors94
	MOVF       _S5+0, 0
	SUBWF      _Limit+0, 0
L__ReadSensors94:
	BTFSC      STATUS+0, 0
	GOTO       L_ReadSensors12
	MOVLW      1
	MOVWF      _S5+0
	MOVLW      0
	MOVWF      _S5+1
	BSF        PORTC+0, 6
	GOTO       L_ReadSensors13
L_ReadSensors12:
	CLRF       _S5+0
	CLRF       _S5+1
	BCF        PORTC+0, 6
L_ReadSensors13:
	MOVLW      128
	XORWF      _Limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _S6+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors95
	MOVF       _S6+0, 0
	SUBWF      _Limit+0, 0
L__ReadSensors95:
	BTFSC      STATUS+0, 0
	GOTO       L_ReadSensors14
	MOVLW      1
	MOVWF      _S6+0
	MOVLW      0
	MOVWF      _S6+1
	BSF        PORTD+0, 4
	GOTO       L_ReadSensors15
L_ReadSensors14:
	CLRF       _S6+0
	CLRF       _S6+1
	BCF        PORTD+0, 4
L_ReadSensors15:
	MOVF       _S2+0, 0
	MOVWF      R0+0
	MOVF       _S2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      _S1+0, 0
	MOVWF      _Reading+0
	MOVF       _S1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      _Reading+1
	MOVF       _S3+0, 0
	MOVWF      R0+0
	MOVF       _S3+1, 0
	MOVWF      R0+1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      _Reading+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _Reading+1, 1
	MOVF       _S4+0, 0
	MOVWF      R0+0
	MOVF       _S4+1, 0
	MOVWF      R0+1
	MOVLW      9
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      _Reading+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _Reading+1, 1
	MOVF       _S5+0, 0
	MOVWF      R0+0
	MOVF       _S5+1, 0
	MOVWF      R0+1
	MOVLW      20
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      _Reading+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _Reading+1, 1
L_end_ReadSensors:
	RETURN
; end of _ReadSensors

_Motors:

	MOVLW      128
	XORWF      FARG_Motors_LM+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Motors97
	MOVLW      0
	SUBWF      FARG_Motors_LM+0, 0
L__Motors97:
	BTFSC      STATUS+0, 0
	GOTO       L_Motors16
	BCF        PORTD+0, 2
	BSF        PORTD+0, 3
	MOVF       FARG_Motors_LM+0, 0
	SUBLW      0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	GOTO       L_Motors17
L_Motors16:
	BSF        PORTD+0, 2
	BCF        PORTD+0, 3
	MOVF       FARG_Motors_LM+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L_Motors17:
	MOVLW      128
	XORWF      FARG_Motors_RM+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Motors98
	MOVLW      0
	SUBWF      FARG_Motors_RM+0, 0
L__Motors98:
	BTFSC      STATUS+0, 0
	GOTO       L_Motors18
	BCF        PORTD+0, 0
	BSF        PORTD+0, 1
	MOVF       FARG_Motors_RM+0, 0
	SUBLW      0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
	GOTO       L_Motors19
L_Motors18:
	BSF        PORTD+0, 0
	BCF        PORTD+0, 1
	MOVF       FARG_Motors_RM+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
L_Motors19:
L_end_Motors:
	RETURN
; end of _Motors

_Stop:

	MOVF       _Speed+0, 0
	SUBLW      0
	MOVWF      R0+0
	MOVF       _Speed+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       R0+1
	SUBWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       R0+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       R0+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       R0+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_Stop20:
	DECFSZ     R13+0, 1
	GOTO       L_Stop20
	DECFSZ     R12+0, 1
	GOTO       L_Stop20
	NOP
	CLRF       FARG_Motors_LM+0
	CLRF       FARG_Motors_LM+1
	CLRF       FARG_Motors_RM+0
	CLRF       FARG_Motors_RM+1
	CALL       _Motors+0
L_end_Stop:
	RETURN
; end of _Stop

_main:

	CALL       _Lcd_Init+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
	CALL       _PWM1_Start+0
	CALL       _PWM2_Start+0
	CALL       _ADC_Init+0
	CLRF       TRISC+0
	CLRF       PORTC+0
	CLRF       TRISB+0
	CLRF       PORTB+0
	CLRF       TRISD+0
	CLRF       PORTD+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Project+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	CALL       _AutoCalibration+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
L_main22:
	CALL       _ReadSensors+0
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main101
	MOVLW      5
	XORWF      _Reading+0, 0
L__main101:
	BTFSC      STATUS+0, 2
	GOTO       L__main85
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main102
	MOVLW      16
	XORWF      _Reading+0, 0
L__main102:
	BTFSC      STATUS+0, 2
	GOTO       L__main85
	GOTO       L_main26
L__main85:
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	GOTO       L_main27
L_main26:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main103
	MOVLW      14
	XORWF      _Reading+0, 0
L__main103:
	BTFSC      STATUS+0, 2
	GOTO       L__main84
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main104
	MOVLW      9
	XORWF      _Reading+0, 0
L__main104:
	BTFSC      STATUS+0, 2
	GOTO       L__main84
	GOTO       L_main30
L__main84:
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	CLRF       FARG_Motors_RM+0
	CLRF       FARG_Motors_RM+1
	CALL       _Motors+0
	GOTO       L_main31
L_main30:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main105
	MOVLW      29
	XORWF      _Reading+0, 0
L__main105:
	BTFSC      STATUS+0, 2
	GOTO       L__main83
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main106
	MOVLW      20
	XORWF      _Reading+0, 0
L__main106:
	BTFSC      STATUS+0, 2
	GOTO       L__main83
	GOTO       L_main34
L__main83:
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	SUBLW      0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_Motors_RM+1
	SUBWF      FARG_Motors_RM+1, 1
	CALL       _Motors+0
	GOTO       L_main35
L_main34:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main107
	MOVLW      34
	XORWF      _Reading+0, 0
L__main107:
	BTFSS      STATUS+0, 2
	GOTO       L_main36
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	NOP
	CALL       _ReadSensors+0
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main108
	MOVLW      0
	XORWF      _Reading+0, 0
L__main108:
	BTFSS      STATUS+0, 2
	GOTO       L_main38
L_main39:
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	SUBLW      0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_Motors_RM+1
	SUBWF      FARG_Motors_RM+1, 1
	CALL       _Motors+0
	CALL       _ReadSensors+0
	MOVLW      0
	XORWF      _S4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main109
	MOVLW      0
	XORWF      _S4+0, 0
L__main109:
	BTFSC      STATUS+0, 2
	GOTO       L_main39
L_main38:
	GOTO       L_main42
L_main36:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main110
	MOVLW      7
	XORWF      _Reading+0, 0
L__main110:
	BTFSC      STATUS+0, 2
	GOTO       L__main82
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main111
	MOVLW      2
	XORWF      _Reading+0, 0
L__main111:
	BTFSC      STATUS+0, 2
	GOTO       L__main82
	GOTO       L_main45
L__main82:
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	NOP
	NOP
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main112
	MOVLW      7
	XORWF      _Reading+0, 0
L__main112:
	BTFSC      STATUS+0, 2
	GOTO       L__main81
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main113
	MOVLW      2
	XORWF      _Reading+0, 0
L__main113:
	BTFSC      STATUS+0, 2
	GOTO       L__main81
	GOTO       L_main49
L__main81:
	CLRF       FARG_Motors_LM+0
	CLRF       FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
L_main49:
	GOTO       L_main50
L_main45:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main114
	MOVLW      3
	XORWF      _Reading+0, 0
L__main114:
	BTFSC      STATUS+0, 2
	GOTO       L__main80
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main115
	MOVLW      1
	XORWF      _Reading+0, 0
L__main115:
	BTFSC      STATUS+0, 2
	GOTO       L__main80
	GOTO       L_main53
L__main80:
	MOVF       _Speed+0, 0
	SUBLW      0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_Motors_LM+1
	SUBWF      FARG_Motors_LM+1, 1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	GOTO       L_main54
L_main53:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main116
	MOVLW      8
	XORWF      _Reading+0, 0
L__main116:
	BTFSS      STATUS+0, 2
	GOTO       L_main55
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	NOP
	CALL       _ReadSensors+0
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main117
	MOVLW      0
	XORWF      _Reading+0, 0
L__main117:
	BTFSS      STATUS+0, 2
	GOTO       L_main57
L_main58:
	MOVF       _Speed+0, 0
	SUBLW      0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_Motors_LM+1
	SUBWF      FARG_Motors_LM+1, 1
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_RM+1
	CALL       _Motors+0
	CALL       _ReadSensors+0
	MOVLW      0
	XORWF      _S2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main118
	MOVLW      0
	XORWF      _S2+0, 0
L__main118:
	BTFSC      STATUS+0, 2
	GOTO       L_main58
L_main57:
	GOTO       L_main61
L_main55:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main119
	MOVLW      37
	XORWF      _Reading+0, 0
L__main119:
	BTFSS      STATUS+0, 2
	GOTO       L_main62
	MOVF       _Speed+0, 0
	MOVWF      FARG_Motors_LM+0
	MOVF       _Speed+1, 0
	MOVWF      FARG_Motors_LM+1
	MOVF       _Speed+0, 0
	SUBLW      0
	MOVWF      FARG_Motors_RM+0
	MOVF       _Speed+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_Motors_RM+1
	SUBWF      FARG_Motors_RM+1, 1
	CALL       _Motors+0
L_main63:
	CALL       _ReadSensors+0
	MOVLW      0
	XORWF      _S4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main120
	MOVLW      0
	XORWF      _S4+0, 0
L__main120:
	BTFSC      STATUS+0, 2
	GOTO       L_main63
	GOTO       L_main66
L_main62:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main121
	MOVLW      0
	XORWF      _Reading+0, 0
L__main121:
	BTFSS      STATUS+0, 2
	GOTO       L_main71
	MOVLW      0
	XORWF      _S6+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main122
	MOVLW      1
	XORWF      _S6+0, 0
L__main122:
	BTFSS      STATUS+0, 2
	GOTO       L_main71
	MOVLW      0
	XORWF      _LR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main123
	MOVLW      26
	XORWF      _LR+0, 0
L__main123:
	BTFSC      STATUS+0, 2
	GOTO       L_main71
	MOVLW      0
	XORWF      _LR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main124
	MOVLW      1
	XORWF      _LR+0, 0
L__main124:
	BTFSC      STATUS+0, 2
	GOTO       L_main71
	MOVLW      0
	XORWF      _LR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main125
	MOVLW      20
	XORWF      _LR+0, 0
L__main125:
	BTFSC      STATUS+0, 2
	GOTO       L_main71
	MOVLW      0
	XORWF      _LR+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main126
	MOVLW      0
	XORWF      _LR+0, 0
L__main126:
	BTFSC      STATUS+0, 2
	GOTO       L_main71
L__main79:
L__main78:
	BSF        PORTC+0, 5
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _j+0, 0
	ADDLW      _ch+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main72:
	MOVLW      0
	XORWF      _Reading+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main127
	MOVLW      0
	XORWF      _Reading+0, 0
L__main127:
	BTFSS      STATUS+0, 2
	GOTO       L_main73
	MOVLW      0
	XORWF      _S6+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main128
	MOVLW      1
	XORWF      _S6+0, 0
L__main128:
	BTFSS      STATUS+0, 2
	GOTO       L_main73
L__main77:
	CALL       _ReadSensors+0
	GOTO       L_main72
L_main73:
	BCF        PORTC+0, 5
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _j+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main129
	MOVF       _j+0, 0
	SUBLW      3
L__main129:
	BTFSC      STATUS+0, 0
	GOTO       L_main76
	MOVLW      3
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_main76:
L_main71:
L_main66:
L_main61:
L_main54:
L_main50:
L_main42:
L_main35:
L_main31:
L_main27:
	MOVF       _Reading+0, 0
	MOVWF      _LR+0
	MOVF       _Reading+1, 0
	MOVWF      _LR+1
	GOTO       L_main22
L_end_main:
	GOTO       $+0
; end of _main
