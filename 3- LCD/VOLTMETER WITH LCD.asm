
_main:

;VOLTMETER WITH LCD.c,17 :: 		void main()
;VOLTMETER WITH LCD.c,22 :: 		adcon1=0x06;
	MOVLW       6
	MOVWF       ADCON1+0 
;VOLTMETER WITH LCD.c,23 :: 		trisa=0xff;
	MOVLW       255
	MOVWF       TRISA+0 
;VOLTMETER WITH LCD.c,25 :: 		trise =0;
	CLRF        TRISE+0 
;VOLTMETER WITH LCD.c,26 :: 		porte.b1=0;
	BCF         PORTE+0, 1 
;VOLTMETER WITH LCD.c,27 :: 		trisc=255;
	MOVLW       255
	MOVWF       TRISC+0 
;VOLTMETER WITH LCD.c,29 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;VOLTMETER WITH LCD.c,31 :: 		lcd_out(2,1,"hello world");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_VOLTMETER_32WITH_32LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_VOLTMETER_32WITH_32LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;VOLTMETER WITH LCD.c,32 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;VOLTMETER WITH LCD.c,33 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;VOLTMETER WITH LCD.c,34 :: 		while(1)
L_main1:
;VOLTMETER WITH LCD.c,36 :: 		if (portc.b4==0)
	BTFSC       PORTC+0, 4 
	GOTO        L_main3
;VOLTMETER WITH LCD.c,38 :: 		lcd_out(2,1,"portc.b4=0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_VOLTMETER_32WITH_32LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_VOLTMETER_32WITH_32LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;VOLTMETER WITH LCD.c,39 :: 		}
	GOTO        L_main4
L_main3:
;VOLTMETER WITH LCD.c,40 :: 		else if (portc.b4==1)
	BTFSS       PORTC+0, 4 
	GOTO        L_main5
;VOLTMETER WITH LCD.c,42 :: 		lcd_out(1,1,"portc.b4=1");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_VOLTMETER_32WITH_32LCD+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_VOLTMETER_32WITH_32LCD+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;VOLTMETER WITH LCD.c,43 :: 		}
L_main5:
L_main4:
;VOLTMETER WITH LCD.c,44 :: 		}
	GOTO        L_main1
;VOLTMETER WITH LCD.c,45 :: 		}
	GOTO        $+0
; end of _main
