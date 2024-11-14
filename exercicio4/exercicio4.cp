#line 1 "C:/Users/junin/OneDrive/Área de Trabalho/UFLA/2024-2/Sistemas Embarcados/SistemasEmbarcados/exercicio4/exercicio4.c"
#line 16 "C:/Users/junin/OneDrive/Área de Trabalho/UFLA/2024-2/Sistemas Embarcados/SistemasEmbarcados/exercicio4/exercicio4.c"
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;



char senhaDigitada[5];


void LCD(char texto[16]) {
 Lcd_Out(1,1,texto);
}


char teclaDigitada(int j) {
 char saida;
 char str[2];

 portb.rb0 = 0;
 delay_ms( 50 );
 if (portd.rd1 == 0) saida = '7';
 else if (portd.rd2 == 0) saida = '4';
 else if (portd.rd3 == 0) saida = '1';
 else saida = '\0';
 portb.rb0 = 1;
 delay_ms( 50 );

 portb.rb1 = 0;
 delay_ms( 50 );
 if (saida == '\0' && portd.rd0 == 0) saida = '0';
 else if (saida == '\0' && portd.rd1 == 0) saida = '8';
 else if (saida == '\0' && portd.rd2 == 0) saida = '5';
 else if (saida == '\0' && portd.rd3 == 0) saida = '2';
 portb.rb1 = 1;
 delay_ms( 50 );

 portb.rb2 = 0;
 delay_ms( 50 );
 if (saida == '\0' && portd.rd1 == 0) saida = '9';
 else if (saida == '\0' && portd.rd2 == 0) saida = '6';
 else if (saida == '\0' && portd.rd3 == 0) saida = '3';
 portb.rb2 = 1;
 delay_ms( 50 );

 if (saida != '\0') {
 str[0] = saida;
 str[1] = '\0';

 Lcd_Out(2, j + 1, str);
 senhaDigitada[j] = saida;
 return 1;
 }

 return 0;
}

void ascendeLed(){
 portb = 240;
 delay_ms(250);
 portb = 0;
 delay_ms(250);
}

void main() {
 char senhaCorreta[5] = "9999";
 int i, j;

 ADCON0 = 0X00;
 ADCON1 = 0x06;



 trisc = 0xFD;


 portc.rc1 = 0;

 trisd = 0x0F;
 trisb = 0;
 portb = 7;

 Lcd_Init();
 delay_ms( 50 );
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms( 50 );
 Lcd_Cmd(_LCD_CURSOR_OFF);
 delay_ms( 50 );

 LCD("Digite a senha:");

 j = 0;
 do {
 if (teclaDigitada(j)) {
 j++;
 if (j >= 4) {
 senhaDigitada[4] = '\0';


 if (strcmp(senhaDigitada, senhaCorreta) == 0) {
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 LCD("Senha correta!");
 ascendeLed();
 ascendeLed();
 ascendeLed();
 } else {
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 LCD("Senha incorreta!");
 portc.rc1 = 1;
 delay_ms(500);
 portc.rc1 = 0;
 }

 delay_ms(500);
 Lcd_Cmd(_LCD_CLEAR);

 LCD("Digite a senha:");
 j = 0;
 }
 }
 delay_ms( 50 );
 } while(1);
}
