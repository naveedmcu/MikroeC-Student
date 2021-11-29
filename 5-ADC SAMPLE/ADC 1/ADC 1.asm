
_main:

;ADC 1.c,20 :: 		void main()
;ADC 1.c,22 :: 		ADCON1=0X14; // AN-O ENABLE AND ALL IS DIGITAL REF IS VSS(-) AND VDD(+)
	MOVLW       20
	MOVWF       ADCON1+0 
;ADC 1.c,23 :: 		ADCON0=0;
	CLRF        ADCON0+0 
;ADC 1.c,24 :: 		TRISC=0;
	CLRF        TRISC+0 
;ADC 1.c,25 :: 		TRISD=0;
	CLRF        TRISD+0 
;ADC 1.c,26 :: 		TRISB=0;
	CLRF        TRISB+0 
;ADC 1.c,27 :: 		TRISE=0;
	CLRF        TRISE+0 
;ADC 1.c,28 :: 		PORTE=0;
	CLRF        PORTE+0 
;ADC 1.c,29 :: 		PORTA=0;
	CLRF        PORTA+0 
;ADC 1.c,31 :: 		INTCON = 0;                          // disable all interrupts
	CLRF        INTCON+0 
;ADC 1.c,32 :: 		Lcd_Init();                    // Lcd_Init_EP4, see Autocomplete
	CALL        _Lcd_Init+0, 0
;ADC 1.c,33 :: 		LCD_Cmd(_LCD_CURSOR_OFF);             // send command to LCD (cursor off)
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ADC 1.c,34 :: 		LCD_Cmd(_LCD_CLEAR);                  // send command  to LCD (clear LCD)
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ADC 1.c,35 :: 		Lcd_Out(1, 1, "LM 35");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_ADC_321+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_ADC_321+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC 1.c,38 :: 		Lcd_Out(2, 0,temp);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	CLRF        FARG_Lcd_Out_column+0 
	MOVLW       _temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC 1.c,40 :: 		while(1)
L_main0:
;ADC 1.c,43 :: 		tlong=adc_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _Word2Double+0, 0
	MOVF        R0, 0 
	MOVWF       _tlong+0 
	MOVF        R1, 0 
	MOVWF       _tlong+1 
	MOVF        R2, 0 
	MOVWF       _tlong+2 
	MOVF        R3, 0 
	MOVWF       _tlong+3 
;ADC 1.c,44 :: 		floatToStr(tlong,temp);                  // convert integer to string.
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _temp+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;ADC 1.c,45 :: 		Lcd_Out(2, 0,temp);                 // number of digits to display
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	CLRF        FARG_Lcd_Out_column+0 
	MOVLW       _temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC 1.c,46 :: 		DELAY_MS(500);
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
;ADC 1.c,47 :: 		}
	GOTO        L_main0
;ADC 1.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
