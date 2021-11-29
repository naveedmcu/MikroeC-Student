
_main:

;LM35.c,23 :: 		void main()
;LM35.c,25 :: 		ADCON1=0X14; // AN-O ENABLE AND ALL IS DIGITAL REF IS VSS(-) AND VDD(+)
	MOVLW       20
	MOVWF       ADCON1+0 
;LM35.c,26 :: 		ADCON0=0;
	CLRF        ADCON0+0 
;LM35.c,27 :: 		TRISC=0;
	CLRF        TRISC+0 
;LM35.c,28 :: 		TRISD=0;
	CLRF        TRISD+0 
;LM35.c,29 :: 		TRISB=0;
	CLRF        TRISB+0 
;LM35.c,30 :: 		TRISE=0;
	CLRF        TRISE+0 
;LM35.c,31 :: 		PORTE=0;
	CLRF        PORTE+0 
;LM35.c,32 :: 		PORTA=0;
	CLRF        PORTA+0 
;LM35.c,34 :: 		INTCON = 0;                          // disable all interrupts
	CLRF        INTCON+0 
;LM35.c,35 :: 		Lcd_Init();                    // Lcd_Init_EP4, see Autocomplete
	CALL        _Lcd_Init+0, 0
;LM35.c,36 :: 		LCD_Cmd(_LCD_CURSOR_OFF);             // send command to LCD (cursor off)
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LM35.c,37 :: 		LCD_Cmd(_LCD_CLEAR);                  // send command  to LCD (clear LCD)
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;LM35.c,38 :: 		Lcd_Out(1, 1, "LM 35");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_LM35+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_LM35+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LM35.c,40 :: 		while(1)
L_main0:
;LM35.c,42 :: 		tlong=(adc_read(0)/1023.0)*5.0;              // read ADC channel(0)& divide by 1024.0 to scale
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _Word2Double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tlong+0 
	MOVF        R1, 0 
	MOVWF       _tlong+1 
	MOVF        R2, 0 
	MOVWF       _tlong+2 
	MOVF        R3, 0 
	MOVWF       _tlong+3 
;LM35.c,43 :: 		tlong*=1000.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tlong+0 
	MOVF        R1, 0 
	MOVWF       _tlong+1 
	MOVF        R2, 0 
	MOVWF       _tlong+2 
	MOVF        R3, 0 
	MOVWF       _tlong+3 
;LM35.c,44 :: 		adc=tlong;
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       _adc+0 
	MOVF        R1, 0 
	MOVWF       _adc+1 
;LM35.c,45 :: 		temp[0] = ((adc/100) % 10)+48;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _temp+0 
;LM35.c,46 :: 		temp[1] = ((adc/10) % 10)+48;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _adc+0, 0 
	MOVWF       R0 
	MOVF        _adc+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       48
	ADDWF       R0, 0 
	MOVWF       _temp+1 
;LM35.c,49 :: 		temp[2] = 'C';
	MOVLW       67
	MOVWF       _temp+2 
;LM35.c,50 :: 		temp[3] = 0;
	CLRF        _temp+3 
;LM35.c,51 :: 		Lcd_Out(2, 0,temp);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	CLRF        FARG_Lcd_Out_column+0 
	MOVLW       _temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;LM35.c,52 :: 		DELAY_MS(500);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;LM35.c,53 :: 		}
	GOTO        L_main0
;LM35.c,55 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
