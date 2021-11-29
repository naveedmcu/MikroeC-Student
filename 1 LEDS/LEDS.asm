
_wait:

;LEDS.c,3 :: 		void wait() {
;LEDS.c,4 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_wait0:
	DECFSZ      R13, 1, 1
	BRA         L_wait0
	DECFSZ      R12, 1, 1
	BRA         L_wait0
	DECFSZ      R11, 1, 1
	BRA         L_wait0
	NOP
	NOP
;LEDS.c,5 :: 		}
	RETURN      0
; end of _wait

_main:

;LEDS.c,7 :: 		void main() {
;LEDS.c,11 :: 		TRISA = 0x00;        // set direction to be output
	CLRF        TRISA+0 
;LEDS.c,12 :: 		TRISB = 0x00;        // set direction to be output
	CLRF        TRISB+0 
;LEDS.c,13 :: 		TRISC = 0x00;        // set direction to be output
	CLRF        TRISC+0 
;LEDS.c,14 :: 		TRISD = 0x00;        // set direction to be output
	CLRF        TRISD+0 
;LEDS.c,15 :: 		TRISE = 0x00;        // set direction to be output
	CLRF        TRISE+0 
;LEDS.c,18 :: 		LATA = 0x00;        // turn OFF the PORTA leds
	CLRF        LATA+0 
;LEDS.c,19 :: 		LATB = 0x00;        // turn OFF the PORTB leds
	CLRF        LATB+0 
;LEDS.c,20 :: 		LATC = 0x00;        // turn OFF the PORTC leds
	CLRF        LATC+0 
;LEDS.c,21 :: 		LATD = 0x00;        // turn OFF the PORTD leds
	CLRF        LATD+0 
;LEDS.c,22 :: 		LATE = 0x00;        // turn OFF the PORTE leds
	CLRF        LATE+0 
;LEDS.c,25 :: 		while (1) {
L_main1:
;LEDS.c,26 :: 		for (counter=0; counter<8; counter++){
	CLRF        _counter+0 
L_main3:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;LEDS.c,27 :: 		LATA |= 1 << counter;
	MOVF        _counter+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main8:
	BZ          L__main9
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main8
L__main9:
	MOVF        R0, 0 
	IORWF       LATA+0, 1 
;LEDS.c,28 :: 		LATB |= 1 << counter;
	MOVF        R0, 0 
	IORWF       LATB+0, 1 
;LEDS.c,29 :: 		LATC |= 1 << counter;
	MOVF        R0, 0 
	IORWF       LATC+0, 1 
;LEDS.c,30 :: 		LATD |= 1 << counter;
	MOVF        R0, 0 
	IORWF       LATD+0, 1 
;LEDS.c,31 :: 		LATE |= 1 << counter;
	MOVF        R0, 0 
	IORWF       LATE+0, 1 
;LEDS.c,32 :: 		wait();
	CALL        _wait+0, 0
;LEDS.c,26 :: 		for (counter=0; counter<8; counter++){
	INCF        _counter+0, 1 
;LEDS.c,33 :: 		}
	GOTO        L_main3
L_main4:
;LEDS.c,35 :: 		counter = 0;
	CLRF        _counter+0 
;LEDS.c,36 :: 		while (counter<8) {
L_main6:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;LEDS.c,37 :: 		LATA &= ~(1 << counter);
	MOVF        _counter+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main10:
	BZ          L__main11
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main10
L__main11:
	COMF        R0, 1 
	MOVF        R0, 0 
	ANDWF       LATA+0, 1 
;LEDS.c,38 :: 		LATB &= ~(1 << counter);
	MOVF        R0, 0 
	ANDWF       LATB+0, 1 
;LEDS.c,39 :: 		LATC &= ~(1 << counter);
	MOVF        R0, 0 
	ANDWF       LATC+0, 1 
;LEDS.c,40 :: 		LATD &= ~(1 << counter);
	MOVF        R0, 0 
	ANDWF       LATD+0, 1 
;LEDS.c,41 :: 		LATE &= ~(1 << counter);
	MOVF        R0, 0 
	ANDWF       LATE+0, 1 
;LEDS.c,42 :: 		wait();
	CALL        _wait+0, 0
;LEDS.c,43 :: 		counter++;
	INCF        _counter+0, 1 
;LEDS.c,44 :: 		}
	GOTO        L_main6
L_main7:
;LEDS.c,45 :: 		}
	GOTO        L_main1
;LEDS.c,46 :: 		}
	GOTO        $+0
; end of _main
