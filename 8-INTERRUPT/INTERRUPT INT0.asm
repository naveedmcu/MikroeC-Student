
_main:

;INTERRUPT INT0.c,1 :: 		void main()
;INTERRUPT INT0.c,3 :: 		ADCON1=0X06;
	MOVLW       6
	MOVWF       ADCON1+0 
;INTERRUPT INT0.c,4 :: 		TRISB=255;
	MOVLW       255
	MOVWF       TRISB+0 
;INTERRUPT INT0.c,5 :: 		TRISC=0;
	CLRF        TRISC+0 
;INTERRUPT INT0.c,6 :: 		TRISD=0;
	CLRF        TRISD+0 
;INTERRUPT INT0.c,8 :: 		PORTB=0;
	CLRF        PORTB+0 
;INTERRUPT INT0.c,9 :: 		PORTC=0;
	CLRF        PORTC+0 
;INTERRUPT INT0.c,10 :: 		PORTD=0;
	CLRF        PORTD+0 
;INTERRUPT INT0.c,12 :: 		INTCON.INT0IE=1;   //Int0 Enable
	BSF         INTCON+0, 4 
;INTERRUPT INT0.c,13 :: 		INTCON2.INTEDG0=1; // ZERO FOR LOW EDGE SELEVT
	BSF         INTCON2+0, 6 
;INTERRUPT INT0.c,14 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;INTERRUPT INT0.c,15 :: 		while(1)
L_main0:
;INTERRUPT INT0.c,17 :: 		delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;INTERRUPT INT0.c,18 :: 		PORTC=~PORTC;
	COMF        PORTC+0, 1 
;INTERRUPT INT0.c,19 :: 		}
	GOTO        L_main0
;INTERRUPT INT0.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;INTERRUPT INT0.c,22 :: 		void interrupt()
;INTERRUPT INT0.c,24 :: 		if (INTCON.INT0IF) {                      // Check for External INT0 Interrupt
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt3
;INTERRUPT INT0.c,25 :: 		INTCON.INT0IF = 0;                     // Clear INT0 interrupt flag
	BCF         INTCON+0, 1 
;INTERRUPT INT0.c,26 :: 		PORTD=~PORTD;
	COMF        PORTD+0, 1 
;INTERRUPT INT0.c,27 :: 		}
L_interrupt3:
;INTERRUPT INT0.c,28 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt
