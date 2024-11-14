
_LCD:

;exercicio4.c,35 :: 		void LCD(char texto[16]) {
;exercicio4.c,36 :: 		Lcd_Out(1,1,texto);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_LCD_texto+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_LCD_texto+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;exercicio4.c,37 :: 		}
L_end_LCD:
	RETURN      0
; end of _LCD

_teclaDigitada:

;exercicio4.c,40 :: 		char teclaDigitada(int j) {
;exercicio4.c,44 :: 		portb.rb0 = 0;          // habilita primeira coluna do teclado
	BCF         PORTB+0, 0 
;exercicio4.c,45 :: 		delay_ms(atraso);
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
;exercicio4.c,46 :: 		if (portd.rd1 == 0)               saida = '7';
	BTFSC       PORTD+0, 1 
	GOTO        L_teclaDigitada1
	MOVLW       55
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada2
L_teclaDigitada1:
;exercicio4.c,47 :: 		else if (portd.rd2 == 0)          saida = '4';
	BTFSC       PORTD+0, 2 
	GOTO        L_teclaDigitada3
	MOVLW       52
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada4
L_teclaDigitada3:
;exercicio4.c,48 :: 		else if (portd.rd3 == 0)          saida = '1';
	BTFSC       PORTD+0, 3 
	GOTO        L_teclaDigitada5
	MOVLW       49
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada6
L_teclaDigitada5:
;exercicio4.c,49 :: 		else saida = '\0';
	CLRF        teclaDigitada_saida_L0+0 
L_teclaDigitada6:
L_teclaDigitada4:
L_teclaDigitada2:
;exercicio4.c,50 :: 		portb.rb0 = 1;          // desabilita primeira coluna do teclado
	BSF         PORTB+0, 0 
;exercicio4.c,51 :: 		delay_ms(atraso);
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
;exercicio4.c,53 :: 		portb.rb1 = 0;          // habilita segunda coluna do teclado
	BCF         PORTB+0, 1 
;exercicio4.c,54 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada8:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada8
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada8
	NOP
	NOP
;exercicio4.c,55 :: 		if (saida == '\0' && portd.rd0 == 0)                saida = '0';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada11
	BTFSC       PORTD+0, 0 
	GOTO        L_teclaDigitada11
L__teclaDigitada62:
	MOVLW       48
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada12
L_teclaDigitada11:
;exercicio4.c,56 :: 		else if (saida == '\0' && portd.rd1 == 0)        saida = '8';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada15
	BTFSC       PORTD+0, 1 
	GOTO        L_teclaDigitada15
L__teclaDigitada61:
	MOVLW       56
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada16
L_teclaDigitada15:
;exercicio4.c,57 :: 		else if (saida == '\0' && portd.rd2 == 0)     saida = '5';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada19
	BTFSC       PORTD+0, 2 
	GOTO        L_teclaDigitada19
L__teclaDigitada60:
	MOVLW       53
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada20
L_teclaDigitada19:
;exercicio4.c,58 :: 		else if (saida == '\0' && portd.rd3 == 0)  saida = '2';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada23
	BTFSC       PORTD+0, 3 
	GOTO        L_teclaDigitada23
L__teclaDigitada59:
	MOVLW       50
	MOVWF       teclaDigitada_saida_L0+0 
L_teclaDigitada23:
L_teclaDigitada20:
L_teclaDigitada16:
L_teclaDigitada12:
;exercicio4.c,59 :: 		portb.rb1 = 1;          // desabilita segunda coluna do teclado
	BSF         PORTB+0, 1 
;exercicio4.c,60 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada24:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada24
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada24
	NOP
	NOP
;exercicio4.c,62 :: 		portb.rb2 = 0;         // habilita terceira coluna do teclado
	BCF         PORTB+0, 2 
;exercicio4.c,63 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada25:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada25
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada25
	NOP
	NOP
;exercicio4.c,64 :: 		if (saida == '\0' && portd.rd1 == 0)       saida = '9';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada28
	BTFSC       PORTD+0, 1 
	GOTO        L_teclaDigitada28
L__teclaDigitada58:
	MOVLW       57
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada29
L_teclaDigitada28:
;exercicio4.c,65 :: 		else if (saida == '\0' && portd.rd2 == 0)  saida = '6';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada32
	BTFSC       PORTD+0, 2 
	GOTO        L_teclaDigitada32
L__teclaDigitada57:
	MOVLW       54
	MOVWF       teclaDigitada_saida_L0+0 
	GOTO        L_teclaDigitada33
L_teclaDigitada32:
;exercicio4.c,66 :: 		else if (saida == '\0' && portd.rd3 == 0)  saida = '3';
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_teclaDigitada36
	BTFSC       PORTD+0, 3 
	GOTO        L_teclaDigitada36
L__teclaDigitada56:
	MOVLW       51
	MOVWF       teclaDigitada_saida_L0+0 
L_teclaDigitada36:
L_teclaDigitada33:
L_teclaDigitada29:
;exercicio4.c,67 :: 		portb.rb2 = 1;         // desabilita terceira coluna do teclado
	BSF         PORTB+0, 2 
;exercicio4.c,68 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_teclaDigitada37:
	DECFSZ      R13, 1, 1
	BRA         L_teclaDigitada37
	DECFSZ      R12, 1, 1
	BRA         L_teclaDigitada37
	NOP
	NOP
;exercicio4.c,70 :: 		if (saida != '\0') {
	MOVF        teclaDigitada_saida_L0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_teclaDigitada38
;exercicio4.c,71 :: 		str[0] = saida; // Converte caractere para string
	MOVF        teclaDigitada_saida_L0+0, 0 
	MOVWF       teclaDigitada_str_L0+0 
;exercicio4.c,72 :: 		str[1] = '\0'; // Finaliza string
	CLRF        teclaDigitada_str_L0+1 
;exercicio4.c,74 :: 		Lcd_Out(2, j + 1, str); // Exibe o dígito no LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        FARG_teclaDigitada_j+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       teclaDigitada_str_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(teclaDigitada_str_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;exercicio4.c,75 :: 		senhaDigitada[j] = saida; // Armazena o dígito na senha digitada
	MOVLW       _senhaDigitada+0
	ADDWF       FARG_teclaDigitada_j+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_senhaDigitada+0)
	ADDWFC      FARG_teclaDigitada_j+1, 0 
	MOVWF       FSR1H 
	MOVF        teclaDigitada_saida_L0+0, 0 
	MOVWF       POSTINC1+0 
;exercicio4.c,76 :: 		return 1; // Retorna 1 para indicar que uma tecla foi pressionada
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_teclaDigitada
;exercicio4.c,77 :: 		}
L_teclaDigitada38:
;exercicio4.c,79 :: 		return 0; // Retorna 0 se nenhuma tecla foi pressionada
	CLRF        R0 
;exercicio4.c,80 :: 		}
L_end_teclaDigitada:
	RETURN      0
; end of _teclaDigitada

_ascendeLed:

;exercicio4.c,82 :: 		void ascendeLed(){
;exercicio4.c,83 :: 		portb = 240;
	MOVLW       240
	MOVWF       PORTB+0 
;exercicio4.c,84 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_ascendeLed39:
	DECFSZ      R13, 1, 1
	BRA         L_ascendeLed39
	DECFSZ      R12, 1, 1
	BRA         L_ascendeLed39
	DECFSZ      R11, 1, 1
	BRA         L_ascendeLed39
	NOP
	NOP
;exercicio4.c,85 :: 		portb = 0;
	CLRF        PORTB+0 
;exercicio4.c,86 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_ascendeLed40:
	DECFSZ      R13, 1, 1
	BRA         L_ascendeLed40
	DECFSZ      R12, 1, 1
	BRA         L_ascendeLed40
	DECFSZ      R11, 1, 1
	BRA         L_ascendeLed40
	NOP
	NOP
;exercicio4.c,87 :: 		}
L_end_ascendeLed:
	RETURN      0
; end of _ascendeLed

_main:

;exercicio4.c,89 :: 		void main() {
;exercicio4.c,90 :: 		char senhaCorreta[5] = "9999"; // Senha correta para comparação
	MOVLW       57
	MOVWF       main_senhaCorreta_L0+0 
	MOVLW       57
	MOVWF       main_senhaCorreta_L0+1 
	MOVLW       57
	MOVWF       main_senhaCorreta_L0+2 
	MOVLW       57
	MOVWF       main_senhaCorreta_L0+3 
	CLRF        main_senhaCorreta_L0+4 
;exercicio4.c,93 :: 		ADCON0 = 0X00;     // Desabilita o conversor A/D
	CLRF        ADCON0+0 
;exercicio4.c,94 :: 		ADCON1 = 0x06;     // Configura todos pinos da porta A para digital
	MOVLW       6
	MOVWF       ADCON1+0 
;exercicio4.c,98 :: 		trisc = 0xFD; // 0b11111101
	MOVLW       253
	MOVWF       TRISC+0 
;exercicio4.c,101 :: 		portc.rc1 = 0;
	BCF         PORTC+0, 1 
;exercicio4.c,103 :: 		trisd = 0x0F;      // Configura pinos RD0,RD1,RD2,RD3 da PORTD como entradas (teclado) e RD4,RD5,RD6,RD7 como saída (LCD)
	MOVLW       15
	MOVWF       TRISD+0 
;exercicio4.c,104 :: 		trisb = 0;      // Configura pinos RB0,RB1,RB2 da PORTB como saída (teclado) e o restante como entrada
	CLRF        TRISB+0 
;exercicio4.c,105 :: 		portb = 7;
	MOVLW       7
	MOVWF       PORTB+0 
;exercicio4.c,107 :: 		Lcd_Init();                      // Inicializa o Display
	CALL        _Lcd_Init+0, 0
;exercicio4.c,108 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	NOP
	NOP
;exercicio4.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);             // Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,110 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	NOP
	NOP
;exercicio4.c,111 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,112 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	NOP
	NOP
;exercicio4.c,114 :: 		LCD("Digite a senha:");
	MOVLW       ?lstr1_exercicio4+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr1_exercicio4+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;exercicio4.c,116 :: 		j = 0; // Índice para exibir números na posição correta
	CLRF        main_j_L0+0 
	CLRF        main_j_L0+1 
;exercicio4.c,117 :: 		do {
L_main44:
;exercicio4.c,118 :: 		if (teclaDigitada(j)) { // Chama teclaDigitada e só incrementa se uma tecla foi pressionada
	MOVF        main_j_L0+0, 0 
	MOVWF       FARG_teclaDigitada_j+0 
	MOVF        main_j_L0+1, 0 
	MOVWF       FARG_teclaDigitada_j+1 
	CALL        _teclaDigitada+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
;exercicio4.c,119 :: 		j++;
	INFSNZ      main_j_L0+0, 1 
	INCF        main_j_L0+1, 1 
;exercicio4.c,120 :: 		if (j >= 4) { // Após digitar 4 dígitos, verifica a senha
	MOVLW       128
	XORWF       main_j_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main67
	MOVLW       4
	SUBWF       main_j_L0+0, 0 
L__main67:
	BTFSS       STATUS+0, 0 
	GOTO        L_main48
;exercicio4.c,121 :: 		senhaDigitada[4] = '\0'; // Finaliza a string senhaDigitada
	CLRF        _senhaDigitada+4 
;exercicio4.c,124 :: 		if (strcmp(senhaDigitada, senhaCorreta) == 0) {
	MOVLW       _senhaDigitada+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_senhaDigitada+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       main_senhaCorreta_L0+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(main_senhaCorreta_L0+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main68
	MOVLW       0
	XORWF       R0, 0 
L__main68:
	BTFSS       STATUS+0, 2 
	GOTO        L_main49
;exercicio4.c,125 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main50:
	DECFSZ      R13, 1, 1
	BRA         L_main50
	DECFSZ      R12, 1, 1
	BRA         L_main50
	DECFSZ      R11, 1, 1
	BRA         L_main50
;exercicio4.c,126 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,127 :: 		LCD("Senha correta!");
	MOVLW       ?lstr2_exercicio4+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr2_exercicio4+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;exercicio4.c,128 :: 		ascendeLed();
	CALL        _ascendeLed+0, 0
;exercicio4.c,129 :: 		ascendeLed();
	CALL        _ascendeLed+0, 0
;exercicio4.c,130 :: 		ascendeLed();
	CALL        _ascendeLed+0, 0
;exercicio4.c,131 :: 		} else {
	GOTO        L_main51
L_main49:
;exercicio4.c,132 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main52:
	DECFSZ      R13, 1, 1
	BRA         L_main52
	DECFSZ      R12, 1, 1
	BRA         L_main52
	DECFSZ      R11, 1, 1
	BRA         L_main52
;exercicio4.c,133 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,134 :: 		LCD("Senha incorreta!");
	MOVLW       ?lstr3_exercicio4+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr3_exercicio4+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;exercicio4.c,135 :: 		portc.rc1 = 1;
	BSF         PORTC+0, 1 
;exercicio4.c,136 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	NOP
	NOP
;exercicio4.c,137 :: 		portc.rc1 = 0;
	BCF         PORTC+0, 1 
;exercicio4.c,138 :: 		}
L_main51:
;exercicio4.c,140 :: 		delay_ms(500); // Espera meio segundo para mostrar a mensagem
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
	NOP
	NOP
;exercicio4.c,141 :: 		Lcd_Cmd(_LCD_CLEAR); // Limpa o display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;exercicio4.c,143 :: 		LCD("Digite a senha:"); // Reinicia a solicitação de senha
	MOVLW       ?lstr4_exercicio4+0
	MOVWF       FARG_LCD_texto+0 
	MOVLW       hi_addr(?lstr4_exercicio4+0)
	MOVWF       FARG_LCD_texto+1 
	CALL        _LCD+0, 0
;exercicio4.c,144 :: 		j = 0; // Reinicia o índice para a próxima entrada de senha
	CLRF        main_j_L0+0 
	CLRF        main_j_L0+1 
;exercicio4.c,145 :: 		}
L_main48:
;exercicio4.c,146 :: 		}
L_main47:
;exercicio4.c,147 :: 		delay_ms(atraso);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main55:
	DECFSZ      R13, 1, 1
	BRA         L_main55
	DECFSZ      R12, 1, 1
	BRA         L_main55
	NOP
	NOP
;exercicio4.c,148 :: 		} while(1);
	GOTO        L_main44
;exercicio4.c,149 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main
