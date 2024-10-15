
_escrevePonto:

;codigomorse.c,16 :: 		void escrevePonto(){
;codigomorse.c,17 :: 		portd = 1;
	MOVLW       1
	MOVWF       PORTD+0 
;codigomorse.c,18 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_escrevePonto0:
	DECFSZ      R13, 1, 1
	BRA         L_escrevePonto0
	DECFSZ      R12, 1, 1
	BRA         L_escrevePonto0
	DECFSZ      R11, 1, 1
	BRA         L_escrevePonto0
;codigomorse.c,19 :: 		portd = 0;
	CLRF        PORTD+0 
;codigomorse.c,20 :: 		}
L_end_escrevePonto:
	RETURN      0
; end of _escrevePonto

_escreveTraco:

;codigomorse.c,23 :: 		void escreveTraco(){
;codigomorse.c,24 :: 		portd = 0;
	CLRF        PORTD+0 
;codigomorse.c,25 :: 		delay_ms(600);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_escreveTraco1:
	DECFSZ      R13, 1, 1
	BRA         L_escreveTraco1
	DECFSZ      R12, 1, 1
	BRA         L_escreveTraco1
	DECFSZ      R11, 1, 1
	BRA         L_escreveTraco1
	NOP
;codigomorse.c,26 :: 		}
L_end_escreveTraco:
	RETURN      0
; end of _escreveTraco

_intervalo:

;codigomorse.c,29 :: 		void intervalo(){
;codigomorse.c,30 :: 		portd = 0;
	CLRF        PORTD+0 
;codigomorse.c,31 :: 		delay_ms(900);
	MOVLW       10
	MOVWF       R11, 0
	MOVLW       34
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_intervalo2:
	DECFSZ      R13, 1, 1
	BRA         L_intervalo2
	DECFSZ      R12, 1, 1
	BRA         L_intervalo2
	DECFSZ      R11, 1, 1
	BRA         L_intervalo2
;codigomorse.c,32 :: 		}
L_end_intervalo:
	RETURN      0
; end of _intervalo

_numero0:

;codigomorse.c,35 :: 		void numero0(){
;codigomorse.c,37 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,38 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero03:
	DECFSZ      R13, 1, 1
	BRA         L_numero03
	DECFSZ      R12, 1, 1
	BRA         L_numero03
	DECFSZ      R11, 1, 1
	BRA         L_numero03
	NOP
	NOP
;codigomorse.c,40 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,41 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero04:
	DECFSZ      R13, 1, 1
	BRA         L_numero04
	DECFSZ      R12, 1, 1
	BRA         L_numero04
	DECFSZ      R11, 1, 1
	BRA         L_numero04
	NOP
	NOP
;codigomorse.c,43 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,44 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero05:
	DECFSZ      R13, 1, 1
	BRA         L_numero05
	DECFSZ      R12, 1, 1
	BRA         L_numero05
	DECFSZ      R11, 1, 1
	BRA         L_numero05
	NOP
	NOP
;codigomorse.c,46 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,47 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero06:
	DECFSZ      R13, 1, 1
	BRA         L_numero06
	DECFSZ      R12, 1, 1
	BRA         L_numero06
	DECFSZ      R11, 1, 1
	BRA         L_numero06
	NOP
	NOP
;codigomorse.c,49 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,50 :: 		}
L_end_numero0:
	RETURN      0
; end of _numero0

_numero1:

;codigomorse.c,53 :: 		void numero1(){
;codigomorse.c,55 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,56 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero17:
	DECFSZ      R13, 1, 1
	BRA         L_numero17
	DECFSZ      R12, 1, 1
	BRA         L_numero17
	DECFSZ      R11, 1, 1
	BRA         L_numero17
	NOP
	NOP
;codigomorse.c,58 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,59 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero18:
	DECFSZ      R13, 1, 1
	BRA         L_numero18
	DECFSZ      R12, 1, 1
	BRA         L_numero18
	DECFSZ      R11, 1, 1
	BRA         L_numero18
	NOP
	NOP
;codigomorse.c,61 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,62 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero19:
	DECFSZ      R13, 1, 1
	BRA         L_numero19
	DECFSZ      R12, 1, 1
	BRA         L_numero19
	DECFSZ      R11, 1, 1
	BRA         L_numero19
	NOP
	NOP
;codigomorse.c,64 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,65 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero110:
	DECFSZ      R13, 1, 1
	BRA         L_numero110
	DECFSZ      R12, 1, 1
	BRA         L_numero110
	DECFSZ      R11, 1, 1
	BRA         L_numero110
	NOP
	NOP
;codigomorse.c,67 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,68 :: 		}
L_end_numero1:
	RETURN      0
; end of _numero1

_numero2:

;codigomorse.c,71 :: 		void numero2(){
;codigomorse.c,73 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,74 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero211:
	DECFSZ      R13, 1, 1
	BRA         L_numero211
	DECFSZ      R12, 1, 1
	BRA         L_numero211
	DECFSZ      R11, 1, 1
	BRA         L_numero211
	NOP
	NOP
;codigomorse.c,76 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,77 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero212:
	DECFSZ      R13, 1, 1
	BRA         L_numero212
	DECFSZ      R12, 1, 1
	BRA         L_numero212
	DECFSZ      R11, 1, 1
	BRA         L_numero212
	NOP
	NOP
;codigomorse.c,79 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,80 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero213:
	DECFSZ      R13, 1, 1
	BRA         L_numero213
	DECFSZ      R12, 1, 1
	BRA         L_numero213
	DECFSZ      R11, 1, 1
	BRA         L_numero213
	NOP
	NOP
;codigomorse.c,82 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,83 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero214:
	DECFSZ      R13, 1, 1
	BRA         L_numero214
	DECFSZ      R12, 1, 1
	BRA         L_numero214
	DECFSZ      R11, 1, 1
	BRA         L_numero214
	NOP
	NOP
;codigomorse.c,85 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,86 :: 		}
L_end_numero2:
	RETURN      0
; end of _numero2

_numero8:

;codigomorse.c,89 :: 		void numero8(){
;codigomorse.c,91 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,92 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero815:
	DECFSZ      R13, 1, 1
	BRA         L_numero815
	DECFSZ      R12, 1, 1
	BRA         L_numero815
	DECFSZ      R11, 1, 1
	BRA         L_numero815
	NOP
	NOP
;codigomorse.c,94 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,95 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero816:
	DECFSZ      R13, 1, 1
	BRA         L_numero816
	DECFSZ      R12, 1, 1
	BRA         L_numero816
	DECFSZ      R11, 1, 1
	BRA         L_numero816
	NOP
	NOP
;codigomorse.c,97 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,98 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero817:
	DECFSZ      R13, 1, 1
	BRA         L_numero817
	DECFSZ      R12, 1, 1
	BRA         L_numero817
	DECFSZ      R11, 1, 1
	BRA         L_numero817
	NOP
	NOP
;codigomorse.c,100 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,101 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_numero818:
	DECFSZ      R13, 1, 1
	BRA         L_numero818
	DECFSZ      R12, 1, 1
	BRA         L_numero818
	DECFSZ      R11, 1, 1
	BRA         L_numero818
	NOP
	NOP
;codigomorse.c,103 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,104 :: 		}
L_end_numero8:
	RETURN      0
; end of _numero8

_main:

;codigomorse.c,106 :: 		void main ()
;codigomorse.c,111 :: 		trisb = 3;
	MOVLW       3
	MOVWF       TRISB+0 
;codigomorse.c,115 :: 		trisd = 0;
	CLRF        TRISD+0 
;codigomorse.c,118 :: 		while (1)
L_main19:
;codigomorse.c,122 :: 		if (portb.rb0 == 0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main21
;codigomorse.c,127 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,128 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;codigomorse.c,130 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,131 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
	NOP
;codigomorse.c,133 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,134 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
	NOP
	NOP
;codigomorse.c,136 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,138 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,142 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,143 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
	NOP
;codigomorse.c,145 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,147 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,151 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,152 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;codigomorse.c,154 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,156 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,160 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,161 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
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
;codigomorse.c,163 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,164 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
	NOP
;codigomorse.c,166 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,167 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
	NOP
;codigomorse.c,169 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,170 :: 		}
	GOTO        L_main30
L_main21:
;codigomorse.c,171 :: 		else if (portb.rb1 == 0)
	BTFSC       PORTB+0, 1 
	GOTO        L_main31
;codigomorse.c,175 :: 		numero2();
	CALL        _numero2+0, 0
;codigomorse.c,177 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,180 :: 		numero0();
	CALL        _numero0+0, 0
;codigomorse.c,182 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,185 :: 		numero1();
	CALL        _numero1+0, 0
;codigomorse.c,187 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,190 :: 		numero8();
	CALL        _numero8+0, 0
;codigomorse.c,192 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,195 :: 		numero1();
	CALL        _numero1+0, 0
;codigomorse.c,197 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,200 :: 		numero0();
	CALL        _numero0+0, 0
;codigomorse.c,202 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,205 :: 		numero0();
	CALL        _numero0+0, 0
;codigomorse.c,207 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,210 :: 		numero8();
	CALL        _numero8+0, 0
;codigomorse.c,212 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,215 :: 		numero8();
	CALL        _numero8+0, 0
;codigomorse.c,217 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,218 :: 		}
L_main31:
L_main30:
;codigomorse.c,219 :: 		}
	GOTO        L_main19
;codigomorse.c,220 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
