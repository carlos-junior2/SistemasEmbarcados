#line 1 "C:/Users/carlos.junior2/Desktop/exercicio4/exercicio4.c"
#line 16 "C:/Users/carlos.junior2/Desktop/exercicio4/exercicio4.c"
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
#line 44 "C:/Users/carlos.junior2/Desktop/exercicio4/exercicio4.c"
void LCD(char texto[16])
{
 Lcd_Out(1,1,texto);
}

void LCDSenha(char texto[1], int indice)
{
 Lcd_Out(2,6+indice,texto);
}

char teclaDigitada(){
 char saida;
 portb.rb0 = 0;
 delay_ms( 50 );
 if (portd.rd1 == 0) saida = '7';
 else if (portd.rd2 == 0) saida = '4';
 else if (portd.rd3 == 0) saida = '1';
 portb.rb0 = 1;
 delay_ms( 50 );


 portb.rb1 = 0;
 delay_ms( 50 );
 if (portd.rd1 == 0) saida = '8';
 else if (portd.rd2 == 0) saida = '5';
 else if (portd.rd3 == 0) saida = '2';

 portb.rb1 = 1;
 delay_ms( 50 );


 portb.rb2 = 0;
 delay_ms( 50 );
 if (portd.rd1 == 0) saida = '9';
 else if (portd.rd2 == 0) saida = '6';
 else if (portd.rd3 == 0) saida = '3';

 portb.rb2 = 1;
 delay_ms( 50 );
 return saida;
}

void main(){

 char senha[4];
 char senhaDigitada[4];
 int i, j, k;
 ADCON0 = 0X00;
 ADCON1 = 0x06;

 trisd = 0x0F;




 trisb = 0xF8;

 portb = 0xFF;

 Lcd_Init();
 delay_ms( 50 );
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms( 50 );
 Lcd_Cmd(_LCD_CURSOR_OFF);
 delay_ms( 50 );


 for (i=0; i<4; i++){
 senha[i] = 9;
 }

 do
 {

 LCD("Digite a senha:");
 for (j=0; j<4; j++){
 senhaDigitada[j] = teclaDigitada();
 LCDSenha(senhaDigitada[j], j);
 }

 } while(1);

}
