
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
;codigomorse.c,24 :: 		portd = 1;
	MOVLW       1
	MOVWF       PORTD+0 
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
;codigomorse.c,26 :: 		portd = 0;
	CLRF        PORTD+0 
;codigomorse.c,27 :: 		}
L_end_escreveTraco:
	RETURN      0
; end of _escreveTraco

_intervalo:

;codigomorse.c,30 :: 		void intervalo(){
;codigomorse.c,31 :: 		portd = 0;
	CLRF        PORTD+0 
;codigomorse.c,32 :: 		delay_ms(900);
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
;codigomorse.c,33 :: 		}
L_end_intervalo:
	RETURN      0
; end of _intervalo

_numero0:

;codigomorse.c,36 :: 		void numero0(){
;codigomorse.c,38 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,39 :: 		delay_ms(300);
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
;codigomorse.c,41 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,42 :: 		delay_ms(300);
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
;codigomorse.c,44 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,45 :: 		delay_ms(300);
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
;codigomorse.c,47 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,48 :: 		delay_ms(300);
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
;codigomorse.c,50 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,51 :: 		}
L_end_numero0:
	RETURN      0
; end of _numero0

_numero1:

;codigomorse.c,54 :: 		void numero1(){
;codigomorse.c,56 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,57 :: 		delay_ms(300);
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
;codigomorse.c,59 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,60 :: 		delay_ms(300);
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
;codigomorse.c,62 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,63 :: 		delay_ms(300);
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
;codigomorse.c,65 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,66 :: 		delay_ms(300);
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
;codigomorse.c,68 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,69 :: 		}
L_end_numero1:
	RETURN      0
; end of _numero1

_numero2:

;codigomorse.c,72 :: 		void numero2(){
;codigomorse.c,74 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,75 :: 		delay_ms(300);
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
;codigomorse.c,77 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,78 :: 		delay_ms(300);
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
;codigomorse.c,80 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,81 :: 		delay_ms(300);
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
;codigomorse.c,83 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,84 :: 		delay_ms(300);
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
;codigomorse.c,86 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,87 :: 		}
L_end_numero2:
	RETURN      0
; end of _numero2

_numero8:

;codigomorse.c,90 :: 		void numero8(){
;codigomorse.c,92 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,93 :: 		delay_ms(300);
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
;codigomorse.c,95 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,96 :: 		delay_ms(300);
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
;codigomorse.c,98 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,99 :: 		delay_ms(300);
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
;codigomorse.c,101 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,102 :: 		delay_ms(300);
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
;codigomorse.c,104 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,105 :: 		}
L_end_numero8:
	RETURN      0
; end of _numero8

_main:

;codigomorse.c,107 :: 		void main ()
;codigomorse.c,112 :: 		trisb = 3;
	MOVLW       3
	MOVWF       TRISB+0 
;codigomorse.c,116 :: 		trisd = 0;
	CLRF        TRISD+0 
;codigomorse.c,119 :: 		while (1)
L_main19:
;codigomorse.c,123 :: 		if (portb.rb0 == 0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main21
;codigomorse.c,128 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,129 :: 		delay_ms(300);
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
;codigomorse.c,131 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,132 :: 		delay_ms(300);
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
;codigomorse.c,134 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,135 :: 		delay_ms(300);
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
;codigomorse.c,137 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,139 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,143 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,144 :: 		delay_ms(300);
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
;codigomorse.c,146 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,148 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,152 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,153 :: 		delay_ms(300);
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
;codigomorse.c,155 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,157 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,161 :: 		escrevePonto();
	CALL        _escrevePonto+0, 0
;codigomorse.c,162 :: 		delay_ms(300);
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
;codigomorse.c,164 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,165 :: 		delay_ms(300);
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
;codigomorse.c,167 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,168 :: 		delay_ms(300);
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
;codigomorse.c,170 :: 		escreveTraco();
	CALL        _escreveTraco+0, 0
;codigomorse.c,171 :: 		}
	GOTO        L_main30
L_main21:
;codigomorse.c,172 :: 		else if (portb.rb1 == 0)
	BTFSC       PORTB+0, 1 
	GOTO        L_main31
;codigomorse.c,176 :: 		numero2();
	CALL        _numero2+0, 0
;codigomorse.c,178 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,181 :: 		numero0();
	CALL        _numero0+0, 0
;codigomorse.c,183 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,186 :: 		numero1();
	CALL        _numero1+0, 0
;codigomorse.c,188 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,191 :: 		numero8();
	CALL        _numero8+0, 0
;codigomorse.c,193 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,196 :: 		numero1();
	CALL        _numero1+0, 0
;codigomorse.c,198 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,201 :: 		numero0();
	CALL        _numero0+0, 0
;codigomorse.c,203 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,206 :: 		numero0();
	CALL        _numero0+0, 0
;codigomorse.c,208 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,211 :: 		numero8();
	CALL        _numero8+0, 0
;codigomorse.c,213 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,216 :: 		numero8();
	CALL        _numero8+0, 0
;codigomorse.c,218 :: 		intervalo();
	CALL        _intervalo+0, 0
;codigomorse.c,219 :: 		}
L_main31:
L_main30:
;codigomorse.c,220 :: 		}
	GOTO        L_main19
;codigomorse.c,221 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
