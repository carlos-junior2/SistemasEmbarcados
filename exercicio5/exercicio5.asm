
_mask:

;exercicio5.c,22 :: 		unsigned short mask(unsigned short num)
;exercicio5.c,24 :: 		switch (num)
	GOTO        L_mask0
;exercicio5.c,26 :: 		case 0 : return 0x3F;
L_mask2:
	MOVLW       63
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,27 :: 		case 1 : return 0x06;
L_mask3:
	MOVLW       6
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,28 :: 		case 2 : return 0x5B;
L_mask4:
	MOVLW       91
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,29 :: 		case 3 : return 0x4F;
L_mask5:
	MOVLW       79
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,30 :: 		case 4 : return 0x66;
L_mask6:
	MOVLW       102
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,31 :: 		case 5 : return 0x6D;
L_mask7:
	MOVLW       109
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,32 :: 		case 6 : return 0x7D;
L_mask8:
	MOVLW       125
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,33 :: 		case 7 : return 0x07;
L_mask9:
	MOVLW       7
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,34 :: 		case 8 : return 0x7F;
L_mask10:
	MOVLW       127
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,35 :: 		case 9 : return 0x6F;
L_mask11:
	MOVLW       111
	MOVWF       R0 
	GOTO        L_end_mask
;exercicio5.c,36 :: 		}
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
;exercicio5.c,37 :: 		}
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

;exercicio5.c,67 :: 		void separarMil(unsigned num){
;exercicio5.c,70 :: 		mil = num/1000;
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
;exercicio5.c,71 :: 		resto = num%1000;
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
;exercicio5.c,73 :: 		cen = resto/100;
	MOVF        R0, 0 
	MOVWF       _cen+0 
	MOVF        R1, 0 
	MOVWF       _cen+1 
;exercicio5.c,74 :: 		resto = resto%100;
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
;exercicio5.c,76 :: 		dez = resto/10;
	MOVF        R0, 0 
	MOVWF       _dez+0 
	MOVF        R1, 0 
	MOVWF       _dez+1 
;exercicio5.c,78 :: 		uni = resto%10;
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
;exercicio5.c,79 :: 		}
L_end_separarMil:
	RETURN      0
; end of _separarMil

_separarCen:

;exercicio5.c,82 :: 		void separarCen(unsigned num){
;exercicio5.c,85 :: 		mil = 0;
	CLRF        _mil+0 
	CLRF        _mil+1 
;exercicio5.c,87 :: 		cen = num/100;
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
;exercicio5.c,88 :: 		resto = num%100;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_separarCen_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_separarCen_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FLOC__separarCen+0 
	MOVF        R1, 0 
	MOVWF       FLOC__separarCen+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__separarCen+0, 0 
	MOVWF       R0 
	MOVF        FLOC__separarCen+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;exercicio5.c,90 :: 		dez = resto/10;
	MOVF        R0, 0 
	MOVWF       _dez+0 
	MOVF        R1, 0 
	MOVWF       _dez+1 
;exercicio5.c,92 :: 		uni = resto%10;
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
;exercicio5.c,93 :: 		}
L_end_separarCen:
	RETURN      0
; end of _separarCen

_separarDez:

;exercicio5.c,96 :: 		void separarDez(unsigned num){
;exercicio5.c,99 :: 		mil = 0;
	CLRF        _mil+0 
	CLRF        _mil+1 
;exercicio5.c,101 :: 		cen = 0;
	CLRF        _cen+0 
	CLRF        _cen+1 
;exercicio5.c,103 :: 		dez = num/10;
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
;exercicio5.c,105 :: 		uni = num%10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FARG_separarDez_num+0, 0 
	MOVWF       R0 
	MOVF        FARG_separarDez_num+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _uni+0 
	MOVF        R1, 0 
	MOVWF       _uni+1 
;exercicio5.c,106 :: 		}
L_end_separarDez:
	RETURN      0
; end of _separarDez

_separarUni:

;exercicio5.c,109 :: 		void separarUni(unsigned num){
;exercicio5.c,112 :: 		mil = 0;
	CLRF        _mil+0 
	CLRF        _mil+1 
;exercicio5.c,114 :: 		cen = 0;
	CLRF        _cen+0 
	CLRF        _cen+1 
;exercicio5.c,116 :: 		dez = 0;
	CLRF        _dez+0 
	CLRF        _dez+1 
;exercicio5.c,118 :: 		uni = num;
	MOVF        FARG_separarUni_num+0, 0 
	MOVWF       _uni+0 
	MOVF        FARG_separarUni_num+1, 0 
	MOVWF       _uni+1 
;exercicio5.c,119 :: 		}
L_end_separarUni:
	RETURN      0
; end of _separarUni

_atualizaValor:

;exercicio5.c,122 :: 		void atualizaValor(unsigned valorTempo){
;exercicio5.c,123 :: 		if (valorTempo >= 1000){
	MOVLW       3
	SUBWF       FARG_atualizaValor_valorTempo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__atualizaValor49
	MOVLW       232
	SUBWF       FARG_atualizaValor_valorTempo+0, 0 
L__atualizaValor49:
	BTFSS       STATUS+0, 0 
	GOTO        L_atualizaValor16
;exercicio5.c,124 :: 		separarMil(valorTempo);
	MOVF        FARG_atualizaValor_valorTempo+0, 0 
	MOVWF       FARG_separarMil_num+0 
	MOVF        FARG_atualizaValor_valorTempo+1, 0 
	MOVWF       FARG_separarMil_num+1 
	CALL        _separarMil+0, 0
;exercicio5.c,125 :: 		}
	GOTO        L_atualizaValor17
L_atualizaValor16:
;exercicio5.c,126 :: 		else if (valorTempo >= 100 && valorTempo < 1000){
	MOVLW       0
	SUBWF       FARG_atualizaValor_valorTempo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__atualizaValor50
	MOVLW       100
	SUBWF       FARG_atualizaValor_valorTempo+0, 0 
L__atualizaValor50:
	BTFSS       STATUS+0, 0 
	GOTO        L_atualizaValor20
	MOVLW       3
	SUBWF       FARG_atualizaValor_valorTempo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__atualizaValor51
	MOVLW       232
	SUBWF       FARG_atualizaValor_valorTempo+0, 0 
L__atualizaValor51:
	BTFSC       STATUS+0, 0 
	GOTO        L_atualizaValor20
L__atualizaValor41:
;exercicio5.c,127 :: 		separarCen(valorTempo);
	MOVF        FARG_atualizaValor_valorTempo+0, 0 
	MOVWF       FARG_separarCen_num+0 
	MOVF        FARG_atualizaValor_valorTempo+1, 0 
	MOVWF       FARG_separarCen_num+1 
	CALL        _separarCen+0, 0
;exercicio5.c,128 :: 		}
	GOTO        L_atualizaValor21
L_atualizaValor20:
;exercicio5.c,129 :: 		else if (valorTempo >= 10 && valorTempo < 100){
	MOVLW       0
	SUBWF       FARG_atualizaValor_valorTempo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__atualizaValor52
	MOVLW       10
	SUBWF       FARG_atualizaValor_valorTempo+0, 0 
L__atualizaValor52:
	BTFSS       STATUS+0, 0 
	GOTO        L_atualizaValor24
	MOVLW       0
	SUBWF       FARG_atualizaValor_valorTempo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__atualizaValor53
	MOVLW       100
	SUBWF       FARG_atualizaValor_valorTempo+0, 0 
L__atualizaValor53:
	BTFSC       STATUS+0, 0 
	GOTO        L_atualizaValor24
L__atualizaValor40:
;exercicio5.c,130 :: 		separarDez(valorTempo);
	MOVF        FARG_atualizaValor_valorTempo+0, 0 
	MOVWF       FARG_separarDez_num+0 
	MOVF        FARG_atualizaValor_valorTempo+1, 0 
	MOVWF       FARG_separarDez_num+1 
	CALL        _separarDez+0, 0
;exercicio5.c,131 :: 		}
	GOTO        L_atualizaValor25
L_atualizaValor24:
;exercicio5.c,133 :: 		separarUni(valorTempo);
	MOVF        FARG_atualizaValor_valorTempo+0, 0 
	MOVWF       FARG_separarUni_num+0 
	MOVF        FARG_atualizaValor_valorTempo+1, 0 
	MOVWF       FARG_separarUni_num+1 
	CALL        _separarUni+0, 0
;exercicio5.c,134 :: 		}
L_atualizaValor25:
L_atualizaValor21:
L_atualizaValor17:
;exercicio5.c,135 :: 		mostrar(mil, cen, dez, uni);
	MOVF        _mil+0, 0 
	MOVWF       FARG_mostrar_num1+0 
	MOVF        _cen+0, 0 
	MOVWF       FARG_mostrar_num2+0 
	MOVF        _dez+0, 0 
	MOVWF       FARG_mostrar_num3+0 
	MOVF        _uni+0, 0 
	MOVWF       FARG_mostrar_num4+0 
	CALL        _mostrar+0, 0
;exercicio5.c,136 :: 		}
L_end_atualizaValor:
	RETURN      0
; end of _atualizaValor

_main:

;exercicio5.c,138 :: 		void main(void)
;exercicio5.c,140 :: 		unsigned valorTempo = 0;
	CLRF        main_valorTempo_L0+0 
	CLRF        main_valorTempo_L0+1 
;exercicio5.c,141 :: 		ADCON0 = 0X00;
	CLRF        ADCON0+0 
;exercicio5.c,142 :: 		ADCON1 = 0X06;          // desabilita conversor A/D.
	MOVLW       6
	MOVWF       ADCON1+0 
;exercicio5.c,143 :: 		INTCON = 0;            // desabilita interrupcoes.
	CLRF        INTCON+0 
;exercicio5.c,144 :: 		TRISA  = 0;            // configura portA como saida.
	CLRF        TRISA+0 
;exercicio5.c,145 :: 		PORTA  = 0;
	CLRF        PORTA+0 
;exercicio5.c,146 :: 		TRISD  = 0;            // configura portD como saida.
	CLRF        TRISD+0 
;exercicio5.c,147 :: 		PORTD  = 0;
	CLRF        PORTD+0 
;exercicio5.c,148 :: 		TRISB  = 7;
	MOVLW       7
	MOVWF       TRISB+0 
;exercicio5.c,149 :: 		TRISC  = 0xFD; // 0b11111101
	MOVLW       253
	MOVWF       TRISC+0 
;exercicio5.c,152 :: 		portc.rc1 = 0;
	BCF         PORTC+0, 1 
;exercicio5.c,153 :: 		while(1)                         // inicio do loop infinito.
L_main26:
;exercicio5.c,155 :: 		atualizaValor(valorTempo);
	MOVF        main_valorTempo_L0+0, 0 
	MOVWF       FARG_atualizaValor_valorTempo+0 
	MOVF        main_valorTempo_L0+1, 0 
	MOVWF       FARG_atualizaValor_valorTempo+1 
	CALL        _atualizaValor+0, 0
;exercicio5.c,156 :: 		if (portb.rb0 == 0){  //se botão RB0 for pressionado, incrementa valor do tempo
	BTFSC       PORTB+0, 0 
	GOTO        L_main28
;exercicio5.c,157 :: 		valorTempo += 1;
	INFSNZ      main_valorTempo_L0+0, 1 
	INCF        main_valorTempo_L0+1, 1 
;exercicio5.c,158 :: 		delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	NOP
	NOP
;exercicio5.c,159 :: 		}
L_main28:
;exercicio5.c,160 :: 		if (portb.rb1 == 0){ //se botão RB1 for pressionado, decrementa valor do tempo
	BTFSC       PORTB+0, 1 
	GOTO        L_main30
;exercicio5.c,161 :: 		valorTempo -= 1;
	MOVLW       1
	SUBWF       main_valorTempo_L0+0, 1 
	MOVLW       0
	SUBWFB      main_valorTempo_L0+1, 1 
;exercicio5.c,162 :: 		delay_ms(tempo);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	NOP
	NOP
;exercicio5.c,163 :: 		}
L_main30:
;exercicio5.c,165 :: 		if (portb.rb2 == 0){ //se botão RB1 for pressionado, incia a contagem regressiva até 0
	BTFSC       PORTB+0, 2 
	GOTO        L_main32
;exercicio5.c,166 :: 		while (valorTempo > 0){
L_main33:
	MOVLW       0
	MOVWF       R0 
	MOVF        main_valorTempo_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main55
	MOVF        main_valorTempo_L0+0, 0 
	SUBLW       0
L__main55:
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
;exercicio5.c,167 :: 		while (cont < 45){  //atraso de 1s garantindo o display sempre aceso
L_main35:
	MOVLW       128
	XORWF       _cont+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVLW       45
	SUBWF       _cont+0, 0 
L__main56:
	BTFSC       STATUS+0, 0 
	GOTO        L_main36
;exercicio5.c,168 :: 		atualizaValor(valorTempo);
	MOVF        main_valorTempo_L0+0, 0 
	MOVWF       FARG_atualizaValor_valorTempo+0 
	MOVF        main_valorTempo_L0+1, 0 
	MOVWF       FARG_atualizaValor_valorTempo+1 
	CALL        _atualizaValor+0, 0
;exercicio5.c,169 :: 		cont+=1;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
;exercicio5.c,170 :: 		}
	GOTO        L_main35
L_main36:
;exercicio5.c,171 :: 		valorTempo -=1;
	MOVLW       1
	SUBWF       main_valorTempo_L0+0, 1 
	MOVLW       0
	SUBWFB      main_valorTempo_L0+1, 1 
;exercicio5.c,172 :: 		cont = 0;
	CLRF        _cont+0 
	CLRF        _cont+1 
;exercicio5.c,173 :: 		}
	GOTO        L_main33
L_main34:
;exercicio5.c,174 :: 		if (valorTempo == 0){ //se o valor for 0
	MOVLW       0
	XORWF       main_valorTempo_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       0
	XORWF       main_valorTempo_L0+0, 0 
L__main57:
	BTFSS       STATUS+0, 2 
	GOTO        L_main37
;exercicio5.c,175 :: 		atualizaValor(valorTempo);
	MOVF        main_valorTempo_L0+0, 0 
	MOVWF       FARG_atualizaValor_valorTempo+0 
	MOVF        main_valorTempo_L0+1, 0 
	MOVWF       FARG_atualizaValor_valorTempo+1 
	CALL        _atualizaValor+0, 0
;exercicio5.c,176 :: 		portc.rc1 = 1;    //toca buzzer
	BSF         PORTC+0, 1 
;exercicio5.c,177 :: 		while (cont < 25){  //atraso de 1s garantindo o display sempre aceso
L_main38:
	MOVLW       128
	XORWF       _cont+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVLW       25
	SUBWF       _cont+0, 0 
L__main58:
	BTFSC       STATUS+0, 0 
	GOTO        L_main39
;exercicio5.c,178 :: 		atualizaValor(valorTempo);
	MOVF        main_valorTempo_L0+0, 0 
	MOVWF       FARG_atualizaValor_valorTempo+0 
	MOVF        main_valorTempo_L0+1, 0 
	MOVWF       FARG_atualizaValor_valorTempo+1 
	CALL        _atualizaValor+0, 0
;exercicio5.c,179 :: 		cont+=1;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
;exercicio5.c,180 :: 		}
	GOTO        L_main38
L_main39:
;exercicio5.c,181 :: 		portc.rc1 = 0;    //para buzzer
	BCF         PORTC+0, 1 
;exercicio5.c,182 :: 		}
L_main37:
;exercicio5.c,183 :: 		}
L_main32:
;exercicio5.c,184 :: 		} // Fim do loop infinito
	GOTO        L_main26
;exercicio5.c,185 :: 		}   // Fim do programa principal.
L_end_main:
	GOTO        $+0
; end of _main
