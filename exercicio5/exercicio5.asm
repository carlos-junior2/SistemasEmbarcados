
_mask:

;exercicio5.c,23 :: 		unsigned short mask(unsigned short num)
;exercicio5.c,25 :: 		switch (num)
	GOTO        L_mask0
;exercicio5.c,27 :: 		case 0 : return 0x3F;
L_mask2:
	MOVLW       63
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,28 :: 		case 1 : return 0x06;
L_mask3:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,29 :: 		case 2 : return 0x5B;
L_mask4:
	MOVLW       91
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,30 :: 		case 3 : return 0x4F;
L_mask5:
	MOVLW       79
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,31 :: 		case 4 : return 0x66;
L_mask6:
	MOVLW       102
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,32 :: 		case 5 : return 0x6D;
L_mask7:
	MOVLW       109
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,33 :: 		case 6 : return 0x7D;
L_mask8:
	MOVLW       125
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,34 :: 		case 7 : return 0x07;
L_mask9:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,35 :: 		case 8 : return 0x7F;
L_mask10:
	MOVLW       127
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,36 :: 		case 9 : return 0x6F;
L_mask11:
	MOVLW       111
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,37 :: 		}
L_mask0:
	MOVF        FARG_mask_num+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_mask2
	MOVF        FARG_mask_num+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_mask3
	MOVF        FARG_mask_num+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_mask4
	MOVF        FARG_mask_num+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_mask5
	MOVF        FARG_mask_num+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_mask6
	MOVF        FARG_mask_num+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_mask7
	MOVF        FARG_mask_num+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_mask8
	MOVF        FARG_mask_num+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_mask9
	MOVF        FARG_mask_num+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_mask10
	MOVF        FARG_mask_num+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_mask11
;exercicio5.c,38 :: 		}
L_end_mask:
	RETURN      0
; end of _mask

_mostrar:

;exercicio5.c,40 :: 		void mostrar(unsigned short num1, unsigned short num2, unsigned short num3, unsigned short num4){
;exercicio5.c,42 :: 		PORTD = mask(num1);
	MOVF        FARG_mostrar_num1+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;exercicio5.c,43 :: 		porta.f2 = 1;     // Ativa display 1.
	BSF         PORTA+0, 2 
;exercicio5.c,44 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_mostrar12:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar12
	DECFSZ      R12, 1, 1
	BRA         L_mostrar12
	NOP
	NOP
;exercicio5.c,45 :: 		porta.f2 = 0;     // Desativa display 1.
	BCF         PORTA+0, 2 
;exercicio5.c,48 :: 		PORTD = mask(num2);
	MOVF        FARG_mostrar_num2+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;exercicio5.c,49 :: 		porta.f3 = 1;     // Ativa display 2.
	BSF         PORTA+0, 3 
;exercicio5.c,50 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_mostrar13:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar13
	DECFSZ      R12, 1, 1
	BRA         L_mostrar13
	NOP
	NOP
;exercicio5.c,51 :: 		porta.f3 = 0;     // Desativa display 2.
	BCF         PORTA+0, 3 
;exercicio5.c,54 :: 		PORTD = mask(num3);
	MOVF        FARG_mostrar_num3+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;exercicio5.c,55 :: 		porta.f4 = 1;     // Ativa display 3.
	BSF         PORTA+0, 4 
;exercicio5.c,56 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_mostrar14:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar14
	DECFSZ      R12, 1, 1
	BRA         L_mostrar14
	NOP
	NOP
;exercicio5.c,57 :: 		porta.f4 = 0;     // Desativa display 3.
	BCF         PORTA+0, 4 
;exercicio5.c,60 :: 		PORTD = mask(num4);
	MOVF        FARG_mostrar_num4+0, 0 
	MOVWF       FARG_mask_num+0 
	CALL        _mask+0, 0
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;exercicio5.c,61 :: 		porta.f5 = 1;     // Ativa display 4.
	BSF         PORTA+0, 5 
;exercicio5.c,62 :: 		Delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_mostrar15:
	DECFSZ      R13, 1, 1
	BRA         L_mostrar15
	DECFSZ      R12, 1, 1
	BRA         L_mostrar15
	NOP
	NOP
;exercicio5.c,63 :: 		porta.f5 = 0;     // desativa display 4.
	BCF         PORTA+0, 5 
;exercicio5.c,64 :: 		}
L_end_mostrar:
	RETURN      0
; end of _mostrar

_separarMil:

;exercicio5.c,66 :: 		void separarMil(unsigned num){
;exercicio5.c,69 :: 		mil = num/1000;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_separarMil_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_separarMil_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _mil+0 
	MOVF        R1, 0 
	MOVWF       _mil+1 
;exercicio5.c,70 :: 		resto = num%1000;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_separarMil_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_separarMil_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FLOC__separarMil+0 
	MOVF        R1, 0 
	MOVWF       FLOC__separarMil+1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarMil+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarMil+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;exercicio5.c,72 :: 		cen = resto/100;
	MOVF        R0, 0 
	MOVWF       _cen+0 
	MOVF        R1, 0 
	MOVWF       _cen+1 
;exercicio5.c,73 :: 		resto = resto%100;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarMil+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarMil+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FLOC__separarMil+0 
	MOVF        R1, 0 
	MOVWF       FLOC__separarMil+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarMil+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarMil+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;exercicio5.c,75 :: 		dez = resto/10;
	MOVF        R0, 0 
	MOVWF       _dez+0 
	MOVF        R1, 0 
	MOVWF       _dez+1 
;exercicio5.c,77 :: 		uni = resto%10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarMil+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarMil+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _uni+0 
	MOVF        R1, 0 
	MOVWF       _uni+1 
;exercicio5.c,78 :: 		}
L_end_separarMil:
	RETURN      0
; end of _separarMil

_separarCen:

;exercicio5.c,80 :: 		void separarCen(unsigned num){
;exercicio5.c,83 :: 		mil = 0;
	CLRF        _mil+0 
	CLRF        _mil+1 
;exercicio5.c,85 :: 		cen = num/100;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_separarCen_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_separarCen_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _cen+0 
	MOVF        R1, 0 
	MOVWF       _cen+1 
;exercicio5.c,86 :: 		resto = resto%100;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        separarCen_resto_L0+0, 0 
	MOVWF       R0 
	MOVF        separarCen_resto_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FLOC__separarCen+0 
	MOVF        R1, 0 
	MOVWF       FLOC__separarCen+1 
	MOVF        FLOC__separarCen+0, 0 
	MOVWF       separarCen_resto_L0+0 
	MOVF        FLOC__separarCen+1, 0 
	MOVWF       separarCen_resto_L0+1 
;exercicio5.c,88 :: 		dez = resto/10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarCen+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarCen+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _dez+0 
	MOVF        R1, 0 
	MOVWF       _dez+1 
;exercicio5.c,90 :: 		uni = resto%10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarCen+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarCen+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _uni+0 
	MOVF        R1, 0 
	MOVWF       _uni+1 
;exercicio5.c,91 :: 		}
L_end_separarCen:
	RETURN      0
; end of _separarCen

_separarDez:

;exercicio5.c,93 :: 		void separarDez(unsigned num){
;exercicio5.c,96 :: 		mil = 0;
	CLRF        _mil+0 
	CLRF        _mil+1 
;exercicio5.c,98 :: 		cen = 0;
	CLRF        _cen+0 
	CLRF        _cen+1 
;exercicio5.c,100 :: 		dez = num/10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_separarDez_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_separarDez_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _dez+0 
	MOVF        R1, 0 
	MOVWF       _dez+1 
;exercicio5.c,102 :: 		uni = resto%10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        separarDez_resto_L0+0, 0 
	MOVWF       R0 
	MOVF        separarDez_resto_L0+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _uni+0 
	MOVF        R1, 0 
	MOVWF       _uni+1 
;exercicio5.c,103 :: 		}
L_end_separarDez:
	RETURN      0
; end of _separarDez

_separarUni:

;exercicio5.c,105 :: 		void separarUni(unsigned num){
;exercicio5.c,108 :: 		mil = 0;
	CLRF        _mil+0 
	CLRF        _mil+1 
;exercicio5.c,110 :: 		cen = 0;
	CLRF        _cen+0 
	CLRF        _cen+1 
;exercicio5.c,112 :: 		dez = 0;
	CLRF        _dez+0 
	CLRF        _dez+1 
;exercicio5.c,114 :: 		uni = num;
	MOVF        FARG_separarUni_num+0, 0 
	MOVWF       _uni+0 
	MOVF        FARG_separarUni_num+1, 0 
	MOVWF       _uni+1 
;exercicio5.c,115 :: 		}
L_end_separarUni:
	RETURN      0
; end of _separarUni

_main:

;exercicio5.c,117 :: 		void main(void)
;exercicio5.c,119 :: 		unsigned temp = 19;
	MOVLW       19
	MOVWF       main_temp_L0+0 
	MOVLW       0
	MOVWF       main_temp_L0+1 
;exercicio5.c,120 :: 		ADCON0 = 0X00;
	CLRF        ADCON0+0 
;exercicio5.c,121 :: 		ADCON1 = 0X06;          // desabilita conversor A/D.
	MOVLW       6
	MOVWF       ADCON1+0 
;exercicio5.c,122 :: 		INTCON = 0;            // desabilita interrupcoes.
	CLRF        INTCON+0 
;exercicio5.c,123 :: 		TRISA  = 0;            // configura portA como saida.
	CLRF        TRISA+0 
;exercicio5.c,124 :: 		PORTA  = 0;
	CLRF        PORTA+0 
;exercicio5.c,125 :: 		TRISD  = 0;            // configura portD como saida.
	CLRF        TRISD+0 
;exercicio5.c,126 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;exercicio5.c,128 :: 		while(1)                         // inicio do loop infinito.
L_main16:
;exercicio5.c,130 :: 		if (temp >= 1000){
	MOVLW       3
	SUBWF       main_temp_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVLW       232
	SUBWF       main_temp_L0+0, 0 
L__main31:
	BTFSS       STATUS+0, 0 
	GOTO        L_main18
;exercicio5.c,131 :: 		separarMil(temp);
	MOVF        main_temp_L0+0, 0 
	MOVWF       FARG_separarMil_num+0 
	MOVF        main_temp_L0+1, 0 
	MOVWF       FARG_separarMil_num+1 
	CALL        _separarMil+0, 0
;exercicio5.c,132 :: 		}
	GOTO        L_main19
L_main18:
;exercicio5.c,135 :: 		}
L_main20:
;exercicio5.c,138 :: 		}
L_main22:
;exercicio5.c,140 :: 		separarUni(temp);
	MOVF        main_temp_L0+0, 0 
	MOVWF       FARG_separarUni_num+0 
	MOVF        main_temp_L0+1, 0 
	MOVWF       FARG_separarUni_num+1 
	CALL        _separarUni+0, 0
;exercicio5.c,141 :: 		}
L_main19:
;exercicio5.c,142 :: 		mostrar(mil, cen, dez, uni);
	MOVF        _mil+0, 0 
	MOVWF       FARG_mostrar_num1+0 
	MOVF        _cen+0, 0 
	MOVWF       FARG_mostrar_num2+0 
	MOVF        _dez+0, 0 
	MOVWF       FARG_mostrar_num3+0 
	MOVF        _uni+0, 0 
	MOVWF       FARG_mostrar_num4+0 
	CALL        _mostrar+0, 0
;exercicio5.c,143 :: 		} // Fim do loop infinito
	GOTO        L_main16
;exercicio5.c,145 :: 		}   // Fim do programa principal.
L_end_main:
	GOTO        $+0
; end of _main
