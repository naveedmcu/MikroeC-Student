
_get_digit:

;7 SEG.c,9 :: 		char get_digit(char _data)
;7 SEG.c,11 :: 		if (_data==0)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit0
;7 SEG.c,13 :: 		return display [0];
	MOVF        _display+0, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,14 :: 		}
L_get_digit0:
;7 SEG.c,15 :: 		else if(_data==1)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit2
;7 SEG.c,17 :: 		return display [1];
	MOVF        _display+1, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,18 :: 		}
L_get_digit2:
;7 SEG.c,19 :: 		else if(_data==2)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit4
;7 SEG.c,21 :: 		return display [2];
	MOVF        _display+2, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,22 :: 		}
L_get_digit4:
;7 SEG.c,23 :: 		else if(_data==3)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit6
;7 SEG.c,25 :: 		return display [3];
	MOVF        _display+3, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,26 :: 		}
L_get_digit6:
;7 SEG.c,27 :: 		else if(_data==4)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit8
;7 SEG.c,29 :: 		return display [4];
	MOVF        _display+4, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,30 :: 		}
L_get_digit8:
;7 SEG.c,31 :: 		else if(_data==5)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit10
;7 SEG.c,33 :: 		return display [5];
	MOVF        _display+5, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,34 :: 		}
L_get_digit10:
;7 SEG.c,35 :: 		else if(_data==6)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit12
;7 SEG.c,37 :: 		return display [6];
	MOVF        _display+6, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,38 :: 		}
L_get_digit12:
;7 SEG.c,39 :: 		else if(_data==7)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit14
;7 SEG.c,41 :: 		return display [7];
	MOVF        _display+7, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,42 :: 		}
L_get_digit14:
;7 SEG.c,43 :: 		else if(_data==8)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit16
;7 SEG.c,45 :: 		return display [8];
	MOVF        _display+8, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,46 :: 		}
L_get_digit16:
;7 SEG.c,47 :: 		else if(_data==9)
	MOVF        FARG_get_digit__data+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_get_digit18
;7 SEG.c,49 :: 		return display [9];
	MOVF        _display+9, 0 
	MOVWF       R0 
	GOTO        L_end_get_digit
;7 SEG.c,50 :: 		}
L_get_digit18:
;7 SEG.c,51 :: 		}
L_end_get_digit:
	RETURN      0
; end of _get_digit

_dis_play:

;7 SEG.c,55 :: 		void dis_play(char _data_ , char place)
;7 SEG.c,57 :: 		if (place==1)
	MOVF        FARG_dis_play_place+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_dis_play19
;7 SEG.c,59 :: 		porta.b5=1;
	BSF         PORTA+0, 5 
;7 SEG.c,60 :: 		porte.b2=0;
	BCF         PORTE+0, 2 
;7 SEG.c,61 :: 		porte.b1=0;
	BCF         PORTE+0, 1 
;7 SEG.c,62 :: 		porte.b0=0;
	BCF         PORTE+0, 0 
;7 SEG.c,63 :: 		portb=get_digit(_data_);
	MOVF        FARG_dis_play__data_+0, 0 
	MOVWF       FARG_get_digit__data+0 
	CALL        _get_digit+0, 0
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;7 SEG.c,64 :: 		}
L_dis_play19:
;7 SEG.c,65 :: 		if (place==2)
	MOVF        FARG_dis_play_place+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_dis_play20
;7 SEG.c,67 :: 		porta.b5=0;
	BCF         PORTA+0, 5 
;7 SEG.c,68 :: 		porte.b2=1;
	BSF         PORTE+0, 2 
;7 SEG.c,69 :: 		porte.b1=0;
	BCF         PORTE+0, 1 
;7 SEG.c,70 :: 		porte.b0=0;
	BCF         PORTE+0, 0 
;7 SEG.c,71 :: 		portb=get_digit(_data_);
	MOVF        FARG_dis_play__data_+0, 0 
	MOVWF       FARG_get_digit__data+0 
	CALL        _get_digit+0, 0
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;7 SEG.c,72 :: 		}
L_dis_play20:
;7 SEG.c,73 :: 		if (place==3)
	MOVF        FARG_dis_play_place+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_dis_play21
;7 SEG.c,75 :: 		porta.b5=0;
	BCF         PORTA+0, 5 
;7 SEG.c,76 :: 		porte.b2=0;
	BCF         PORTE+0, 2 
;7 SEG.c,77 :: 		porte.b1=1;
	BSF         PORTE+0, 1 
;7 SEG.c,78 :: 		porte.b0=0;
	BCF         PORTE+0, 0 
;7 SEG.c,79 :: 		portb=get_digit(_data_);
	MOVF        FARG_dis_play__data_+0, 0 
	MOVWF       FARG_get_digit__data+0 
	CALL        _get_digit+0, 0
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;7 SEG.c,80 :: 		}
L_dis_play21:
;7 SEG.c,81 :: 		if (place==4)
	MOVF        FARG_dis_play_place+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_dis_play22
;7 SEG.c,83 :: 		porta.b5=0;
	BCF         PORTA+0, 5 
;7 SEG.c,84 :: 		porte.b2=0;
	BCF         PORTE+0, 2 
;7 SEG.c,85 :: 		porte.b1=0;
	BCF         PORTE+0, 1 
;7 SEG.c,86 :: 		porte.b0=1;
	BSF         PORTE+0, 0 
;7 SEG.c,87 :: 		portb=get_digit(_data_);
	MOVF        FARG_dis_play__data_+0, 0 
	MOVWF       FARG_get_digit__data+0 
	CALL        _get_digit+0, 0
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;7 SEG.c,88 :: 		}
L_dis_play22:
;7 SEG.c,89 :: 		}
L_end_dis_play:
	RETURN      0
; end of _dis_play

_main:

;7 SEG.c,96 :: 		void main ()
;7 SEG.c,98 :: 		adcon1=0x06;
	MOVLW       6
	MOVWF       ADCON1+0 
;7 SEG.c,99 :: 		trisb=0; //out of portb
	CLRF        TRISB+0 
;7 SEG.c,100 :: 		trisa=0; //out of portb
	CLRF        TRISA+0 
;7 SEG.c,101 :: 		trise=0;
	CLRF        TRISE+0 
;7 SEG.c,102 :: 		trisC=255; // input up counter
	MOVLW       255
	MOVWF       TRISC+0 
;7 SEG.c,103 :: 		trisD.b7=1; // input down counter
	BSF         TRISD+0, 7 
;7 SEG.c,105 :: 		porta=0; // all pin are off state
	CLRF        PORTA+0 
;7 SEG.c,107 :: 		porta=255; // porta on state
	MOVLW       255
	MOVWF       PORTA+0 
;7 SEG.c,108 :: 		porte=255;
	MOVLW       255
	MOVWF       PORTE+0 
;7 SEG.c,110 :: 		for(i=0 ; i<3 ; i++)
	CLRF        _i+0 
L_main23:
	MOVLW       3
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main24
;7 SEG.c,112 :: 		portb=0; // portb off
	CLRF        PORTB+0 
;7 SEG.c,113 :: 		delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
	NOP
;7 SEG.c,114 :: 		portb=255; // portb on
	MOVLW       255
	MOVWF       PORTB+0 
;7 SEG.c,115 :: 		delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
;7 SEG.c,110 :: 		for(i=0 ; i<3 ; i++)
	INCF        _i+0, 1 
;7 SEG.c,116 :: 		}
	GOTO        L_main23
L_main24:
;7 SEG.c,137 :: 		value=0;
	CLRF        _value+0 
	CLRF        _value+1 
;7 SEG.c,142 :: 		button_flag=0;
	CLRF        _button_flag+0 
;7 SEG.c,143 :: 		button_flag_1=0;
	CLRF        _button_flag_1+0 
;7 SEG.c,144 :: 		for(;;)
L_main28:
;7 SEG.c,146 :: 		if (portc.b4==0 && button_flag==0)
	BTFSC       PORTC+0, 4 
	GOTO        L_main33
	MOVF        _button_flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main33
L__main55:
;7 SEG.c,148 :: 		button_flag=1;
	MOVLW       1
	MOVWF       _button_flag+0 
;7 SEG.c,149 :: 		value++;
	INFSNZ      _value+0, 1 
	INCF        _value+1, 1 
;7 SEG.c,150 :: 		if (value==10000)
	MOVF        _value+1, 0 
	XORLW       39
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
	MOVLW       16
	XORWF       _value+0, 0 
L__main59:
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;7 SEG.c,152 :: 		value=0;
	CLRF        _value+0 
	CLRF        _value+1 
;7 SEG.c,153 :: 		}
L_main34:
;7 SEG.c,154 :: 		}
	GOTO        L_main35
L_main33:
;7 SEG.c,155 :: 		else if (portc.b4==1 && button_flag==1 )
	BTFSS       PORTC+0, 4 
	GOTO        L_main38
	MOVF        _button_flag+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
L__main54:
;7 SEG.c,157 :: 		button_flag=0;
	CLRF        _button_flag+0 
;7 SEG.c,158 :: 		}
	GOTO        L_main39
L_main38:
;7 SEG.c,160 :: 		else if (portc.b5==0 && button_flag_1==0)
	BTFSC       PORTC+0, 5 
	GOTO        L_main42
	MOVF        _button_flag_1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
L__main53:
;7 SEG.c,162 :: 		button_flag_1=1;
	MOVLW       1
	MOVWF       _button_flag_1+0 
;7 SEG.c,163 :: 		value--;
	MOVLW       1
	SUBWF       _value+0, 1 
	MOVLW       0
	SUBWFB      _value+1, 1 
;7 SEG.c,164 :: 		if (value < 0)
	MOVLW       128
	XORWF       _value+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main60
	MOVLW       0
	SUBWF       _value+0, 0 
L__main60:
	BTFSC       STATUS+0, 0 
	GOTO        L_main43
;7 SEG.c,166 :: 		value=0;
	CLRF        _value+0 
	CLRF        _value+1 
;7 SEG.c,167 :: 		}
L_main43:
;7 SEG.c,168 :: 		}
	GOTO        L_main44
L_main42:
;7 SEG.c,169 :: 		else if (portc.b5==1 && button_flag_1==1)
	BTFSS       PORTC+0, 5 
	GOTO        L_main47
	MOVF        _button_flag_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main47
L__main52:
;7 SEG.c,171 :: 		button_flag_1=0;
	CLRF        _button_flag_1+0 
;7 SEG.c,172 :: 		}
L_main47:
L_main44:
L_main39:
L_main35:
;7 SEG.c,177 :: 		thu=(value/1000)%10;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        _value+0, 0 
	MOVWF       R0 
	MOVF        _value+1, 0 
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
	MOVF        R0, 0 
	MOVWF       _thu+0 
;7 SEG.c,178 :: 		hun=(value/100)%10;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _value+0, 0 
	MOVWF       R0 
	MOVF        _value+1, 0 
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
	MOVF        R0, 0 
	MOVWF       _hun+0 
;7 SEG.c,179 :: 		ten=(value/10)%10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _value+0, 0 
	MOVWF       R0 
	MOVF        _value+1, 0 
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
	MOVF        R0, 0 
	MOVWF       _ten+0 
;7 SEG.c,180 :: 		unit=value%10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _value+0, 0 
	MOVWF       R0 
	MOVF        _value+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _unit+0 
;7 SEG.c,182 :: 		dis_play(unit,1);
	MOVF        R0, 0 
	MOVWF       FARG_dis_play__data_+0 
	MOVLW       1
	MOVWF       FARG_dis_play_place+0 
	CALL        _dis_play+0, 0
;7 SEG.c,183 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main48:
	DECFSZ      R13, 1, 1
	BRA         L_main48
	DECFSZ      R12, 1, 1
	BRA         L_main48
;7 SEG.c,184 :: 		dis_play(ten,2);
	MOVF        _ten+0, 0 
	MOVWF       FARG_dis_play__data_+0 
	MOVLW       2
	MOVWF       FARG_dis_play_place+0 
	CALL        _dis_play+0, 0
;7 SEG.c,185 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
;7 SEG.c,186 :: 		dis_play(hun,3);
	MOVF        _hun+0, 0 
	MOVWF       FARG_dis_play__data_+0 
	MOVLW       3
	MOVWF       FARG_dis_play_place+0 
	CALL        _dis_play+0, 0
;7 SEG.c,187 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main50:
	DECFSZ      R13, 1, 1
	BRA         L_main50
	DECFSZ      R12, 1, 1
	BRA         L_main50
;7 SEG.c,188 :: 		dis_play(thu,4);
	MOVF        _thu+0, 0 
	MOVWF       FARG_dis_play__data_+0 
	MOVLW       4
	MOVWF       FARG_dis_play_place+0 
	CALL        _dis_play+0, 0
;7 SEG.c,189 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main51:
	DECFSZ      R13, 1, 1
	BRA         L_main51
	DECFSZ      R12, 1, 1
	BRA         L_main51
;7 SEG.c,190 :: 		}
	GOTO        L_main28
;7 SEG.c,191 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
