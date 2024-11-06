
_formatarHora:

;relogio.c,40 :: 		void formatarHora(int horas, int minutos, int segundos, char* horaFormatada) {
;relogio.c,46 :: 		IntToStr(horas, strHoras);
	MOVF        FARG_formatarHora_horas+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FARG_formatarHora_horas+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       formatarHora_strHoras_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(formatarHora_strHoras_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;relogio.c,47 :: 		IntToStr(minutos, strMinutos);
	MOVF        FARG_formatarHora_minutos+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FARG_formatarHora_minutos+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       formatarHora_strMinutos_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(formatarHora_strMinutos_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;relogio.c,48 :: 		IntToStr(segundos, strSegundos);
	MOVF        FARG_formatarHora_segundos+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FARG_formatarHora_segundos+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       formatarHora_strSegundos_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(formatarHora_strSegundos_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;relogio.c,51 :: 		if (horas < 10) {
	MOVLW       128
	XORWF       FARG_formatarHora_horas+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__formatarHora40
	MOVLW       10
	SUBWF       FARG_formatarHora_horas+0, 0 
L__formatarHora40:
	BTFSC       STATUS+0, 0 
	GOTO        L_formatarHora0
;relogio.c,52 :: 		horaFormatada[0] = '0';
	MOVFF       FARG_formatarHora_horaFormatada+0, FSR1
	MOVFF       FARG_formatarHora_horaFormatada+1, FSR1H
	MOVLW       48
	MOVWF       POSTINC1+0 
;relogio.c,53 :: 		horaFormatada[1] = strHoras[5];
	MOVLW       1
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strHoras_L0+5, 0 
	MOVWF       POSTINC1+0 
;relogio.c,54 :: 		} else {
	GOTO        L_formatarHora1
L_formatarHora0:
;relogio.c,55 :: 		horaFormatada[0] = strHoras[4];
	MOVFF       FARG_formatarHora_horaFormatada+0, FSR1
	MOVFF       FARG_formatarHora_horaFormatada+1, FSR1H
	MOVF        formatarHora_strHoras_L0+4, 0 
	MOVWF       POSTINC1+0 
;relogio.c,56 :: 		horaFormatada[1] = strHoras[5];
	MOVLW       1
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strHoras_L0+5, 0 
	MOVWF       POSTINC1+0 
;relogio.c,57 :: 		}
L_formatarHora1:
;relogio.c,58 :: 		horaFormatada[2] = ':';  // Adiciona o separador
	MOVLW       2
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVLW       58
	MOVWF       POSTINC1+0 
;relogio.c,60 :: 		if (minutos < 10) {
	MOVLW       128
	XORWF       FARG_formatarHora_minutos+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__formatarHora41
	MOVLW       10
	SUBWF       FARG_formatarHora_minutos+0, 0 
L__formatarHora41:
	BTFSC       STATUS+0, 0 
	GOTO        L_formatarHora2
;relogio.c,61 :: 		horaFormatada[3] = '0';
	MOVLW       3
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVLW       48
	MOVWF       POSTINC1+0 
;relogio.c,62 :: 		horaFormatada[4] = strMinutos[5];
	MOVLW       4
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strMinutos_L0+5, 0 
	MOVWF       POSTINC1+0 
;relogio.c,63 :: 		} else {
	GOTO        L_formatarHora3
L_formatarHora2:
;relogio.c,64 :: 		horaFormatada[3] = strMinutos[4];
	MOVLW       3
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strMinutos_L0+4, 0 
	MOVWF       POSTINC1+0 
;relogio.c,65 :: 		horaFormatada[4] = strMinutos[5];
	MOVLW       4
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strMinutos_L0+5, 0 
	MOVWF       POSTINC1+0 
;relogio.c,66 :: 		}
L_formatarHora3:
;relogio.c,67 :: 		horaFormatada[5] = ':';  // Adiciona o separador
	MOVLW       5
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVLW       58
	MOVWF       POSTINC1+0 
;relogio.c,69 :: 		if (segundos < 10) {
	MOVLW       128
	XORWF       FARG_formatarHora_segundos+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__formatarHora42
	MOVLW       10
	SUBWF       FARG_formatarHora_segundos+0, 0 
L__formatarHora42:
	BTFSC       STATUS+0, 0 
	GOTO        L_formatarHora4
;relogio.c,70 :: 		horaFormatada[6] = '0';
	MOVLW       6
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVLW       48
	MOVWF       POSTINC1+0 
;relogio.c,71 :: 		horaFormatada[7] = strSegundos[5];
	MOVLW       7
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strSegundos_L0+5, 0 
	MOVWF       POSTINC1+0 
;relogio.c,72 :: 		} else {
	GOTO        L_formatarHora5
L_formatarHora4:
;relogio.c,73 :: 		horaFormatada[6] = strSegundos[4];
	MOVLW       6
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strSegundos_L0+4, 0 
	MOVWF       POSTINC1+0 
;relogio.c,74 :: 		horaFormatada[7] = strSegundos[5];
	MOVLW       7
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	MOVF        formatarHora_strSegundos_L0+5, 0 
	MOVWF       POSTINC1+0 
;relogio.c,75 :: 		}
L_formatarHora5:
;relogio.c,76 :: 		horaFormatada[8] = '\0'; // Adiciona o caractere nulo para finalizar a string
	MOVLW       8
	ADDWF       FARG_formatarHora_horaFormatada+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_formatarHora_horaFormatada+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;relogio.c,77 :: 		}
L_end_formatarHora:
	RETURN      0
; end of _formatarHora

_main:

;relogio.c,79 :: 		void main()
;relogio.c,81 :: 		int horas = 15, minutos = 5, segundos = 50; //inicialização das variáveis
	MOVLW       15
	MOVWF       main_horas_L0+0 
	MOVLW       0
	MOVWF       main_horas_L0+1 
	MOVLW       5
	MOVWF       main_minutos_L0+0 
	MOVLW       0
	MOVWF       main_minutos_L0+1 
	MOVLW       50
	MOVWF       main_segundos_L0+0 
	MOVLW       0
	MOVWF       main_segundos_L0+1 
;relogio.c,84 :: 		ADCON0  = 0x00;        // Configura todos pinos das portas para digital e
	CLRF        ADCON0+0 
;relogio.c,85 :: 		ADCON1  = 0x0F;       // desabilita o conversor A/D
	MOVLW       15
	MOVWF       ADCON1+0 
;relogio.c,86 :: 		trisb = 7;
	MOVLW       7
	MOVWF       TRISB+0 
;relogio.c,88 :: 		Lcd_Init();                  	//Inicializa o Display
	CALL        _Lcd_Init+0, 0
;relogio.c,89 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;relogio.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;relogio.c,91 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;relogio.c,92 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;relogio.c,93 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;relogio.c,96 :: 		while(1){
L_main9:
;relogio.c,98 :: 		while (portb.rb0 == 0){
L_main11:
	BTFSC       PORTB+0, 0 
	GOTO        L_main12
;relogio.c,99 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
;relogio.c,100 :: 		if (segundos < 59){
	MOVLW       128
	XORWF       main_segundos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main44
	MOVLW       59
	SUBWF       main_segundos_L0+0, 0 
L__main44:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;relogio.c,101 :: 		segundos += 1;
	INFSNZ      main_segundos_L0+0, 1 
	INCF        main_segundos_L0+1, 1 
;relogio.c,102 :: 		}
	GOTO        L_main15
L_main14:
;relogio.c,104 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;relogio.c,105 :: 		if (minutos <59){
	MOVLW       128
	XORWF       main_minutos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main45
	MOVLW       59
	SUBWF       main_minutos_L0+0, 0 
L__main45:
	BTFSC       STATUS+0, 0 
	GOTO        L_main16
;relogio.c,106 :: 		minutos+=1;
	INFSNZ      main_minutos_L0+0, 1 
	INCF        main_minutos_L0+1, 1 
;relogio.c,107 :: 		}
	GOTO        L_main17
L_main16:
;relogio.c,109 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;relogio.c,110 :: 		if(horas < 23){
	MOVLW       128
	XORWF       main_horas_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
	MOVLW       23
	SUBWF       main_horas_L0+0, 0 
L__main46:
	BTFSC       STATUS+0, 0 
	GOTO        L_main18
;relogio.c,111 :: 		horas += 1;
	INFSNZ      main_horas_L0+0, 1 
	INCF        main_horas_L0+1, 1 
;relogio.c,112 :: 		}
	GOTO        L_main19
L_main18:
;relogio.c,114 :: 		horas = 0;
	CLRF        main_horas_L0+0 
	CLRF        main_horas_L0+1 
;relogio.c,115 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;relogio.c,116 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;relogio.c,117 :: 		}
L_main19:
;relogio.c,118 :: 		}
L_main17:
;relogio.c,119 :: 		}
L_main15:
;relogio.c,121 :: 		formatarHora(horas, minutos, segundos, horaFormatada);
	MOVF        main_horas_L0+0, 0 
	MOVWF       FARG_formatarHora_horas+0 
	MOVF        main_horas_L0+1, 0 
	MOVWF       FARG_formatarHora_horas+1 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       FARG_formatarHora_minutos+0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       FARG_formatarHora_minutos+1 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       FARG_formatarHora_segundos+0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       FARG_formatarHora_segundos+1 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_formatarHora_horaFormatada+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_formatarHora_horaFormatada+1 
	CALL        _formatarHora+0, 0
;relogio.c,123 :: 		Lcd_Out(1,5,horaFormatada);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;relogio.c,124 :: 		}
	GOTO        L_main11
L_main12:
;relogio.c,127 :: 		while (portb.rb1 == 0){
L_main20:
	BTFSC       PORTB+0, 1 
	GOTO        L_main21
;relogio.c,128 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
;relogio.c,129 :: 		if (minutos <59){
	MOVLW       128
	XORWF       main_minutos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVLW       59
	SUBWF       main_minutos_L0+0, 0 
L__main47:
	BTFSC       STATUS+0, 0 
	GOTO        L_main23
;relogio.c,130 :: 		minutos+=1;
	INFSNZ      main_minutos_L0+0, 1 
	INCF        main_minutos_L0+1, 1 
;relogio.c,131 :: 		}
	GOTO        L_main24
L_main23:
;relogio.c,133 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;relogio.c,134 :: 		if(horas < 23){
	MOVLW       128
	XORWF       main_horas_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       23
	SUBWF       main_horas_L0+0, 0 
L__main48:
	BTFSC       STATUS+0, 0 
	GOTO        L_main25
;relogio.c,135 :: 		horas += 1;
	INFSNZ      main_horas_L0+0, 1 
	INCF        main_horas_L0+1, 1 
;relogio.c,136 :: 		}
	GOTO        L_main26
L_main25:
;relogio.c,138 :: 		horas = 0;
	CLRF        main_horas_L0+0 
	CLRF        main_horas_L0+1 
;relogio.c,139 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;relogio.c,140 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;relogio.c,141 :: 		}
L_main26:
;relogio.c,142 :: 		}
L_main24:
;relogio.c,144 :: 		formatarHora(horas, minutos, segundos, horaFormatada);
	MOVF        main_horas_L0+0, 0 
	MOVWF       FARG_formatarHora_horas+0 
	MOVF        main_horas_L0+1, 0 
	MOVWF       FARG_formatarHora_horas+1 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       FARG_formatarHora_minutos+0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       FARG_formatarHora_minutos+1 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       FARG_formatarHora_segundos+0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       FARG_formatarHora_segundos+1 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_formatarHora_horaFormatada+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_formatarHora_horaFormatada+1 
	CALL        _formatarHora+0, 0
;relogio.c,146 :: 		Lcd_Out(1,5,horaFormatada);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;relogio.c,147 :: 		}
	GOTO        L_main20
L_main21:
;relogio.c,150 :: 		while (portb.rb2 == 0){
L_main27:
	BTFSC       PORTB+0, 2 
	GOTO        L_main28
;relogio.c,151 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
;relogio.c,152 :: 		if(horas < 23){
	MOVLW       128
	XORWF       main_horas_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVLW       23
	SUBWF       main_horas_L0+0, 0 
L__main49:
	BTFSC       STATUS+0, 0 
	GOTO        L_main30
;relogio.c,153 :: 		horas += 1;
	INFSNZ      main_horas_L0+0, 1 
	INCF        main_horas_L0+1, 1 
;relogio.c,154 :: 		}
	GOTO        L_main31
L_main30:
;relogio.c,156 :: 		horas = 0;
	CLRF        main_horas_L0+0 
	CLRF        main_horas_L0+1 
;relogio.c,157 :: 		}
L_main31:
;relogio.c,159 :: 		formatarHora(horas, minutos, segundos, horaFormatada);
	MOVF        main_horas_L0+0, 0 
	MOVWF       FARG_formatarHora_horas+0 
	MOVF        main_horas_L0+1, 0 
	MOVWF       FARG_formatarHora_horas+1 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       FARG_formatarHora_minutos+0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       FARG_formatarHora_minutos+1 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       FARG_formatarHora_segundos+0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       FARG_formatarHora_segundos+1 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_formatarHora_horaFormatada+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_formatarHora_horaFormatada+1 
	CALL        _formatarHora+0, 0
;relogio.c,161 :: 		Lcd_Out(1,5,horaFormatada);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;relogio.c,162 :: 		}
	GOTO        L_main27
L_main28:
;relogio.c,165 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
	NOP
;relogio.c,166 :: 		if (segundos < 59){
	MOVLW       128
	XORWF       main_segundos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	MOVLW       59
	SUBWF       main_segundos_L0+0, 0 
L__main50:
	BTFSC       STATUS+0, 0 
	GOTO        L_main33
;relogio.c,167 :: 		segundos += 1;
	INFSNZ      main_segundos_L0+0, 1 
	INCF        main_segundos_L0+1, 1 
;relogio.c,168 :: 		}
	GOTO        L_main34
L_main33:
;relogio.c,170 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;relogio.c,171 :: 		if (minutos <59){
	MOVLW       128
	XORWF       main_minutos_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVLW       59
	SUBWF       main_minutos_L0+0, 0 
L__main51:
	BTFSC       STATUS+0, 0 
	GOTO        L_main35
;relogio.c,172 :: 		minutos+=1;
	INFSNZ      main_minutos_L0+0, 1 
	INCF        main_minutos_L0+1, 1 
;relogio.c,173 :: 		}
	GOTO        L_main36
L_main35:
;relogio.c,175 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;relogio.c,176 :: 		if(horas < 23){
	MOVLW       128
	XORWF       main_horas_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main52
	MOVLW       23
	SUBWF       main_horas_L0+0, 0 
L__main52:
	BTFSC       STATUS+0, 0 
	GOTO        L_main37
;relogio.c,177 :: 		horas += 1;
	INFSNZ      main_horas_L0+0, 1 
	INCF        main_horas_L0+1, 1 
;relogio.c,178 :: 		}
	GOTO        L_main38
L_main37:
;relogio.c,180 :: 		horas = 0;
	CLRF        main_horas_L0+0 
	CLRF        main_horas_L0+1 
;relogio.c,181 :: 		minutos = 0;
	CLRF        main_minutos_L0+0 
	CLRF        main_minutos_L0+1 
;relogio.c,182 :: 		segundos = 0;
	CLRF        main_segundos_L0+0 
	CLRF        main_segundos_L0+1 
;relogio.c,183 :: 		}
L_main38:
;relogio.c,184 :: 		}
L_main36:
;relogio.c,185 :: 		}
L_main34:
;relogio.c,187 :: 		formatarHora(horas, minutos, segundos, horaFormatada);
	MOVF        main_horas_L0+0, 0 
	MOVWF       FARG_formatarHora_horas+0 
	MOVF        main_horas_L0+1, 0 
	MOVWF       FARG_formatarHora_horas+1 
	MOVF        main_minutos_L0+0, 0 
	MOVWF       FARG_formatarHora_minutos+0 
	MOVF        main_minutos_L0+1, 0 
	MOVWF       FARG_formatarHora_minutos+1 
	MOVF        main_segundos_L0+0, 0 
	MOVWF       FARG_formatarHora_segundos+0 
	MOVF        main_segundos_L0+1, 0 
	MOVWF       FARG_formatarHora_segundos+1 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_formatarHora_horaFormatada+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_formatarHora_horaFormatada+1 
	CALL        _formatarHora+0, 0
;relogio.c,189 :: 		Lcd_Out(1,5,horaFormatada);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_horaFormatada_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_horaFormatada_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;relogio.c,190 :: 		}
	GOTO        L_main9
;relogio.c,191 :: 		} // fim do programa
L_end_main:
	GOTO        $+0
; end of _main
