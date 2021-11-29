
_wait:

;LEDS SAMPLE 2.c,3 :: 		void wait() {
;LEDS SAMPLE 2.c,4 :: 		Delay_ms(150);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       207
	MOVWF       R12, 0
	MOVLW       1
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
;LEDS SAMPLE 2.c,5 :: 		}
	RETURN      0
; end of _wait

_refresh:

;LEDS SAMPLE 2.c,6 :: 		void refresh()
;LEDS SAMPLE 2.c,8 :: 		LATD = 0x00;        // turn OFF the PORTD leds
	CLRF        LATD+0 
;LEDS SAMPLE 2.c,9 :: 		LATB = 0x00;        // turn OFF the PORTD leds
	CLRF        LATB+0 
;LEDS SAMPLE 2.c,10 :: 		LATC = 0x00;        // turn OFF the PORTD leds
	CLRF        LATC+0 
;LEDS SAMPLE 2.c,11 :: 		LATA = 0x00;        // turn OFF the PORTD leds
	CLRF        LATA+0 
;LEDS SAMPLE 2.c,12 :: 		LATE = 0x00;        // turn OFF the PORTD leds
	CLRF        LATE+0 
;LEDS SAMPLE 2.c,13 :: 		}
	RETURN      0
; end of _refresh

_main:

;LEDS SAMPLE 2.c,15 :: 		void main() {
;LEDS SAMPLE 2.c,18 :: 		TRISD = 0x00;        // set direction to be output
	CLRF        TRISD+0 
;LEDS SAMPLE 2.c,19 :: 		TRISC = 0x00;        // set direction to be output
	CLRF        TRISC+0 
;LEDS SAMPLE 2.c,20 :: 		TRISB = 0x00;        // set direction to be output
	CLRF        TRISB+0 
;LEDS SAMPLE 2.c,21 :: 		TRISA = 0x00;        // set direction to be output
	CLRF        TRISA+0 
;LEDS SAMPLE 2.c,22 :: 		TRISE = 0x00;        // set direction to be output
	CLRF        TRISE+0 
;LEDS SAMPLE 2.c,24 :: 		LATD = 0x00;        // turn OFF the PORTD leds
	CLRF        LATD+0 
;LEDS SAMPLE 2.c,25 :: 		LATB = 0x00;        // turn OFF the PORTD leds
	CLRF        LATB+0 
;LEDS SAMPLE 2.c,26 :: 		LATC = 0x00;        // turn OFF the PORTD leds
	CLRF        LATC+0 
;LEDS SAMPLE 2.c,27 :: 		LATA = 0x00;        // turn OFF the PORTD leds
	CLRF        LATA+0 
;LEDS SAMPLE 2.c,28 :: 		LATE = 0x00;        // turn OFF the PORTD leds
	CLRF        LATE+0 
;LEDS SAMPLE 2.c,29 :: 		while(1)
L_main1:
;LEDS SAMPLE 2.c,31 :: 		counter =0;
	CLRF        _counter+0 
;LEDS SAMPLE 2.c,32 :: 		while(counter<8)
L_main3:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;LEDS SAMPLE 2.c,35 :: 		LATB= 1 << counter ;
	MOVF        _counter+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main13:
	BZ          L__main14
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main13
L__main14:
	MOVF        R0, 0 
	MOVWF       LATB+0 
;LEDS SAMPLE 2.c,36 :: 		LATD= 1 << counter ;
	MOVF        R0, 0 
	MOVWF       LATD+0 
;LEDS SAMPLE 2.c,37 :: 		LATC= 1 << counter ;
	MOVF        R0, 0 
	MOVWF       LATC+0 
;LEDS SAMPLE 2.c,38 :: 		counter++;
	INCF        _counter+0, 1 
;LEDS SAMPLE 2.c,39 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,40 :: 		}
	GOTO        L_main3
L_main4:
;LEDS SAMPLE 2.c,41 :: 		counter =0;
	CLRF        _counter+0 
;LEDS SAMPLE 2.c,42 :: 		while(counter<8)
L_main5:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;LEDS SAMPLE 2.c,45 :: 		LATB= 0x80 >> counter ;
	MOVF        _counter+0, 0 
	MOVWF       R1 
	MOVLW       128
	MOVWF       R0 
	MOVF        R1, 0 
L__main15:
	BZ          L__main16
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__main15
L__main16:
	MOVF        R0, 0 
	MOVWF       LATB+0 
;LEDS SAMPLE 2.c,46 :: 		LATD= 0x80 >> counter ;
	MOVF        R0, 0 
	MOVWF       LATD+0 
;LEDS SAMPLE 2.c,47 :: 		LATC= 0x80 >> counter ;
	MOVF        R0, 0 
	MOVWF       LATC+0 
;LEDS SAMPLE 2.c,48 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,50 :: 		counter++;
	INCF        _counter+0, 1 
;LEDS SAMPLE 2.c,51 :: 		}
	GOTO        L_main5
L_main6:
;LEDS SAMPLE 2.c,52 :: 		counter=0;
	CLRF        _counter+0 
;LEDS SAMPLE 2.c,53 :: 		while(counter<8)
L_main7:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;LEDS SAMPLE 2.c,55 :: 		LATB= 0x55;
	MOVLW       85
	MOVWF       LATB+0 
;LEDS SAMPLE 2.c,56 :: 		LATD= 0x55;
	MOVLW       85
	MOVWF       LATD+0 
;LEDS SAMPLE 2.c,57 :: 		LATC= 0x55;
	MOVLW       85
	MOVWF       LATC+0 
;LEDS SAMPLE 2.c,58 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,59 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,60 :: 		LATB= 0xAA;
	MOVLW       170
	MOVWF       LATB+0 
;LEDS SAMPLE 2.c,61 :: 		LATD= 0xAA;
	MOVLW       170
	MOVWF       LATD+0 
;LEDS SAMPLE 2.c,62 :: 		LATC= 0xAA;
	MOVLW       170
	MOVWF       LATC+0 
;LEDS SAMPLE 2.c,63 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,64 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,65 :: 		counter++;
	INCF        _counter+0, 1 
;LEDS SAMPLE 2.c,66 :: 		}
	GOTO        L_main7
L_main8:
;LEDS SAMPLE 2.c,67 :: 		refresh();
	CALL        _refresh+0, 0
;LEDS SAMPLE 2.c,68 :: 		counter =0;
	CLRF        _counter+0 
;LEDS SAMPLE 2.c,69 :: 		while(counter<8)
L_main9:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
;LEDS SAMPLE 2.c,71 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,72 :: 		LATB |= 0x01 << counter ;
	MOVF        _counter+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main17:
	BZ          L__main18
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main17
L__main18:
	MOVF        R0, 0 
	IORWF       LATB+0, 1 
;LEDS SAMPLE 2.c,73 :: 		LATD |= 0x01 << counter ;
	MOVF        R0, 0 
	IORWF       LATD+0, 1 
;LEDS SAMPLE 2.c,74 :: 		LATC |= 0x01 << counter ;
	MOVF        R0, 0 
	IORWF       LATC+0, 1 
;LEDS SAMPLE 2.c,75 :: 		counter++;
	INCF        _counter+0, 1 
;LEDS SAMPLE 2.c,76 :: 		}
	GOTO        L_main9
L_main10:
;LEDS SAMPLE 2.c,77 :: 		counter =0;
	CLRF        _counter+0 
;LEDS SAMPLE 2.c,78 :: 		while(counter<8)
L_main11:
	MOVLW       8
	SUBWF       _counter+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;LEDS SAMPLE 2.c,80 :: 		wait();
	CALL        _wait+0, 0
;LEDS SAMPLE 2.c,81 :: 		LATB &= 0x80 >> counter ;
	MOVF        _counter+0, 0 
	MOVWF       R1 
	MOVLW       128
	MOVWF       R0 
	MOVF        R1, 0 
L__main19:
	BZ          L__main20
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__main19
L__main20:
	MOVF        R0, 0 
	ANDWF       LATB+0, 1 
;LEDS SAMPLE 2.c,82 :: 		LATD &= 0x80 >> counter ;
	MOVF        R0, 0 
	ANDWF       LATD+0, 1 
;LEDS SAMPLE 2.c,83 :: 		LATC &= 0x80 >> counter ;
	MOVF        R0, 0 
	ANDWF       LATC+0, 1 
;LEDS SAMPLE 2.c,84 :: 		counter++;
	INCF        _counter+0, 1 
;LEDS SAMPLE 2.c,85 :: 		}
	GOTO        L_main11
L_main12:
;LEDS SAMPLE 2.c,86 :: 		}
	GOTO        L_main1
;LEDS SAMPLE 2.c,87 :: 		}
	GOTO        $+0
; end of _main
