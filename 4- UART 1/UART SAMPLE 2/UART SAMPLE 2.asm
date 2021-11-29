
_LF_CR:

;UART SAMPLE 2.c,2 :: 		void LF_CR()
;UART SAMPLE 2.c,4 :: 		UART1_Write(10); //LF
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART SAMPLE 2.c,5 :: 		UART1_Write(13); //CR
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART SAMPLE 2.c,6 :: 		}
L_end_LF_CR:
	RETURN      0
; end of _LF_CR

_main:

;UART SAMPLE 2.c,8 :: 		void main() {
;UART SAMPLE 2.c,10 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW       129
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UART SAMPLE 2.c,11 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;UART SAMPLE 2.c,13 :: 		UART1_Write_Text("Start");
	MOVLW       ?lstr1_UART_32SAMPLE_322+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_UART_32SAMPLE_322+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART SAMPLE 2.c,14 :: 		LF_CR();
	CALL        _LF_CR+0, 0
;UART SAMPLE 2.c,16 :: 		while (1)
L_main1:
;UART SAMPLE 2.c,18 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;UART SAMPLE 2.c,19 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;UART SAMPLE 2.c,20 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART SAMPLE 2.c,21 :: 		}
L_main3:
;UART SAMPLE 2.c,22 :: 		if (portc.B4==0)
	BTFSC       PORTC+0, 4 
	GOTO        L_main4
;UART SAMPLE 2.c,24 :: 		UART1_Write_Text("portc.B4==0");
	MOVLW       ?lstr2_UART_32SAMPLE_322+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_UART_32SAMPLE_322+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART SAMPLE 2.c,25 :: 		while(portc.B4==0); // stay here until button press
L_main5:
	BTFSC       PORTC+0, 4 
	GOTO        L_main6
	GOTO        L_main5
L_main6:
;UART SAMPLE 2.c,26 :: 		LF_CR();
	CALL        _LF_CR+0, 0
;UART SAMPLE 2.c,27 :: 		}
	GOTO        L_main7
L_main4:
;UART SAMPLE 2.c,28 :: 		else if (portc.B5==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_main8
;UART SAMPLE 2.c,30 :: 		UART1_Write_Text("portc.B5==0");
	MOVLW       ?lstr3_UART_32SAMPLE_322+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_UART_32SAMPLE_322+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART SAMPLE 2.c,31 :: 		while(portc.B5==0); // stay here until button press
L_main9:
	BTFSC       PORTC+0, 5 
	GOTO        L_main10
	GOTO        L_main9
L_main10:
;UART SAMPLE 2.c,32 :: 		LF_CR();
	CALL        _LF_CR+0, 0
;UART SAMPLE 2.c,33 :: 		}
L_main8:
L_main7:
;UART SAMPLE 2.c,34 :: 		}
	GOTO        L_main1
;UART SAMPLE 2.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
