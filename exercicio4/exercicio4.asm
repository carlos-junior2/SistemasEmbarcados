
_LCD:

;exercicio4.c,44 :: 		void LCD(char texto[16])
;exercicio4.c,46 :: 		Lcd_Out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCD_texto+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCD_texto+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;exercicio4.c,47 :: 		}
L_end_LCD:
	RETURN      0
; end of _LCD

_LCDSenha:

;exercicio4.c,49 :: 		void LCDSenha(char texto[1], int indice)
;exercicio4.c,51 :: 		Lcd_Out(2,6+indice,texto);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        FARG_LCDSenha_indice+0, 0 
	ADDLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCDSenha_texto+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCDSenha_texto+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;exercicio4.c,52 :: 		}
L_end_LCDSenha:
	RETURN      0
; end of _LCDSenha

_teclaDigitada:

;exercicio4.c,54 :: 		char teclaDigitada(){
;exercicio4.c,56 :: 		portb.rb0 = 0;          //habilita primeira coluna  do teclado
	BCF         PORTB+0, 0 
;exercicio4.c,57 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada0:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada0
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada0
	NOP
	NOP
;exercicio4.c,58 :: 		if (portd.rd1 == 0) saida = '7';
	BTFSC       PORTD+0, 1 
	GOTO        L_teclaDigitada1
	MOVLW       55
	MOVWF       R1 
	GOTO        L_teclaDigitada2
L_teclaDigitada1:
;exercicio4.c,59 :: 		else if (portd.rd2 == 0) saida = '4';
	BTFSC       PORTD+0, 2 
	GOTO        L_teclaDigitada3
	MOVLW       52
	MOVWF       R1 
	GOTO        L_teclaDigitada4
L_teclaDigitada3:
;exercicio4.c,60 :: 		else if (portd.rd3 == 0) saida =  '1';
	BTFSC       PORTD+0, 3 
	GOTO        L_teclaDigitada5
	MOVLW       49
	MOVWF       R1 
L_teclaDigitada5:
L_teclaDigitada4:
L_teclaDigitada2:
;exercicio4.c,61 :: 		portb.rb0 = 1;          //desabilita primeira coluna do teclado
	BSF         PORTB+0, 0 
;exercicio4.c,62 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada6:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada6
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada6
	NOP
	NOP
;exercicio4.c,65 :: 		portb.rb1 = 0;          //habilita segunda coluna do teclado
	BCF         PORTB+0, 1 
;exercicio4.c,66 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada7:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada7
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada7
	NOP
	NOP
;exercicio4.c,67 :: 		if (portd.rd1 == 0)               saida = '8';
	BTFSC       PORTD+0, 1 
	GOTO        L_teclaDigitada8
	MOVLW       56
	MOVWF       R1 
	GOTO        L_teclaDigitada9
L_teclaDigitada8:
;exercicio4.c,68 :: 		else if (portd.rd2 == 0)       saida = '5';
	BTFSC       PORTD+0, 2 
	GOTO        L_teclaDigitada10
	MOVLW       53
	MOVWF       R1 
	GOTO        L_teclaDigitada11
L_teclaDigitada10:
;exercicio4.c,69 :: 		else if (portd.rd3 == 0)    saida = '2';
	BTFSC       PORTD+0, 3 
	GOTO        L_teclaDigitada12
	MOVLW       50
	MOVWF       R1 
L_teclaDigitada12:
L_teclaDigitada11:
L_teclaDigitada9:
;exercicio4.c,71 :: 		portb.rb1 = 1;          //desabilita segunda coluna do teclado
	BSF         PORTB+0, 1 
;exercicio4.c,72 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada13:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada13
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada13
	NOP
	NOP
;exercicio4.c,75 :: 		portb.rb2 = 0;         //habilita terceira coluna do teclado
	BCF         PORTB+0, 2 
;exercicio4.c,76 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada14:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada14
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada14
	NOP
	NOP
;exercicio4.c,77 :: 		if (portd.rd1 == 0)              saida = '9';
	BTFSC       PORTD+0, 1 
	GOTO        L_teclaDigitada15
	MOVLW       57
	MOVWF       R1 
	GOTO        L_teclaDigitada16
L_teclaDigitada15:
;exercicio4.c,78 :: 		else if (portd.rd2 == 0)      saida = '6';
	BTFSC       PORTD+0, 2 
	GOTO        L_teclaDigitada17
	MOVLW       54
	MOVWF       R1 
	GOTO        L_teclaDigitada18
L_teclaDigitada17:
;exercicio4.c,79 :: 		else if (portd.rd3 == 0)   saida = '3';
	BTFSC       PORTD+0, 3 
	GOTO        L_teclaDigitada19
	MOVLW       51
	MOVWF       R1 
L_teclaDigitada19:
L_teclaDigitada18:
L_teclaDigitada16:
;exercicio4.c,81 :: 		portb.rb2 = 1;        //desabilita terceira coluna do teclado
	BSF         PORTB+0, 2 
;exercicio4.c,82 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada20:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada20
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada20
	NOP
	NOP
;exercicio4.c,83 :: 		return saida;
	MOVF        R1, 0 
	MOVWF       R0 
;exercicio4.c,84 :: 		}
L_end_teclaDigitada:
	RETURN      0
; end of _teclaDigitada

_main:

;exercicio4.c,86 :: 		void main(){
;exercicio4.c,91 :: 		ADCON0 = 0X00;     // Desabilita o conversor A/D
	CLRF        ADCON0+0 
;exercicio4.c,92 :: 		ADCON1 = 0x06;     // Configura todos pinos da porta A para digital
	MOVLW       6
	MOVWF       ADCON1+0 
;exercicio4.c,94 :: 		trisd = 0x0F;      //configura os pinos RD0,RD1,RD2,RD3 da PORTD como
	MOVLW       15
	MOVWF       TRISD+0 
;exercicio4.c,99 :: 		trisb = 0xF8;     // configura pinos RB0,RB1,RB2 da PORTB como saida (teclado)
	MOVLW       248
	MOVWF       TRISB+0 
;exercicio4.c,101 :: 		portb = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;exercicio4.c,103 :: 		Lcd_Init();                      //Inicializa o Display
	CALL        _Lcd_Init+0, 0
;exercicio4.c,104 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	NOP
	NOP
;exercicio4.c,105 :: 		Lcd_Cmd(_LCD_CLEAR);             //limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,106 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	NOP
	NOP
;exercicio4.c,107 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        //Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,108 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	NOP
	NOP
;exercicio4.c,111 :: 		for (i=0; i<4; i++){
	CLRF        main_i_L0+0 
	CLRF        main_i_L0+1 
L_main24:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVLW       4
	SUBWF       main_i_L0+0, 0 
L__main37:
	BTFSC       STATUS+0, 0 
	GOTO        L_main25
;exercicio4.c,112 :: 		senha[i] = 9;
	MOVLW       main_senha_L0+0
	ADDWF       main_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(main_senha_L0+0)
	ADDWFC      main_i_L0+1, 0 
	MOVWF       FSR1H 
	MOVLW       9
	MOVWF       POSTINC1+0 
;exercicio4.c,111 :: 		for (i=0; i<4; i++){
	INFSNZ      main_i_L0+0, 1 
	INCF        main_i_L0+1, 1 
;exercicio4.c,113 :: 		}
	GOTO        L_main24
L_main25:
;exercicio4.c,115 :: 		do
L_main27:
;exercicio4.c,118 :: 		LCD("Digite a senha:");
	MOVLW       ?lstr1_exercicio4+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr1_exercicio4+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;exercicio4.c,119 :: 		for (j=0; j<4; j++){
	CLRF        main_j_L0+0 
	CLRF        main_j_L0+1 
L_main30:
	MOVLW       128
	XORWF       main_j_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       4
	SUBWF       main_j_L0+0, 0 
L__main38:
	BTFSC       STATUS+0, 0 
	GOTO        L_main31
;exercicio4.c,120 :: 		senhaDigitada[j] = teclaDigitada();
	MOVLW       main_senhaDigitada_L0+0
	ADDWF       main_j_L0+0, 0 
	MOVWF       FLOC__main+0 
	MOVLW       hi_addr(main_senhaDigitada_L0+0)
	ADDWFC      main_j_L0+1, 0 
	MOVWF       FLOC__main+1 
	CALL        _teclaDigitada+0, 0
	MOVFF       FLOC__main+0, FSR1
	MOVFF       FLOC__main+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;exercicio4.c,121 :: 		LCDSenha(senhaDigitada[j], j);
	MOVLW       main_senhaDigitada_L0+0
	ADDWF       main_j_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_senhaDigitada_L0+0)
	ADDWFC      main_j_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_LCDSenha_texto+0 
	MOVLW       0
	MOVWF       FARG_LCDSenha_texto+1 
	MOVLW       0
	MOVWF       FARG_LCDSenha_texto+1 
	MOVF        main_j_L0+0, 0 
	MOVWF       FARG_LCDSenha_indice+0 
	MOVF        main_j_L0+1, 0 
	MOVWF       FARG_LCDSenha_indice+1 
	CALL        _LCDSenha+0, 0
;exercicio4.c,119 :: 		for (j=0; j<4; j++){
	INFSNZ      main_j_L0+0, 1 
	INCF        main_j_L0+1, 1 
;exercicio4.c,122 :: 		}
	GOTO        L_main30
L_main31:
;exercicio4.c,124 :: 		} while(1);
	GOTO        L_main27
;exercicio4.c,126 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main
