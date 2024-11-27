#line 1 "C:/exercicio5/exercicio5.c"
#line 19 "C:/exercicio5/exercicio5.c"
int mil, cen, dez, uni, cont=0;


unsigned short mask(unsigned short num)
{
 switch (num)
 {
 case 0 : return 0x3F;
 case 1 : return 0x06;
 case 2 : return 0x5B;
 case 3 : return 0x4F;
 case 4 : return 0x66;
 case 5 : return 0x6D;
 case 6 : return 0x7D;
 case 7 : return 0x07;
 case 8 : return 0x7F;
 case 9 : return 0x6F;
 }
}


void mostrar(unsigned short num1, unsigned short num2, unsigned short num3, unsigned short num4){

 PORTD = mask(num1);
 porta.f2 = 1;
 Delay_ms( 5 );
 porta.f2 = 0;


 PORTD = mask(num2);
 porta.f3 = 1;
 Delay_ms( 5 );
 porta.f3 = 0;


 PORTD = mask(num3);
 porta.f4 = 1;
 Delay_ms( 5 );
 porta.f4 = 0;


 PORTD = mask(num4);
 porta.f5 = 1;
 Delay_ms( 5 );
 porta.f5 = 0;
}


void separarMil(unsigned num){
 int resto;

 mil = num/1000;
 resto = num%1000;

 cen = resto/100;
 resto = resto%100;

 dez = resto/10;

 uni = resto%10;
}


void separarCen(unsigned num){
 int resto;

 mil = 0;

 cen = num/100;
 resto = num%100;

 dez = resto/10;

 uni = resto%10;
}


void separarDez(unsigned num){
 int resto;

 mil = 0;

 cen = 0;

 dez = num/10;

 uni = num%10;
}


void separarUni(unsigned num){
 int resto;

 mil = 0;

 cen = 0;

 dez = 0;

 uni = num;
}


void atualizaValor(unsigned valorTempo){
 if (valorTempo >= 1000){
 separarMil(valorTempo);
 }
 else if (valorTempo >= 100 && valorTempo < 1000){
 separarCen(valorTempo);
 }
 else if (valorTempo >= 10 && valorTempo < 100){
 separarDez(valorTempo);
 }
 else{
 separarUni(valorTempo);
 }
 mostrar(mil, cen, dez, uni);
}

void main(void)
{
 unsigned valorTempo = 0;
 ADCON0 = 0X00;
 ADCON1 = 0X06;
 INTCON = 0;
 TRISA = 0;
 PORTA = 0;
 TRISD = 0;
 PORTD = 0;
 TRISB = 7;
 TRISC = 0xFD;


 portc.rc1 = 0;
 while(1)
 {
 atualizaValor(valorTempo);
 if (portb.rb0 == 0){
 valorTempo += 1;
 delay_ms( 5 );
 }
 if (portb.rb1 == 0){
 valorTempo -= 1;
 delay_ms( 5 );
 }

 if (portb.rb2 == 0){
 while (valorTempo > 0){
 while (cont < 45){
 atualizaValor(valorTempo);
 cont+=1;
 }
 valorTempo -=1;
 cont = 0;
 }
 if (valorTempo == 0){
 atualizaValor(valorTempo);
 portc.rc1 = 1;
 while (cont < 25){
 atualizaValor(valorTempo);
 cont+=1;
 }
 portc.rc1 = 0;
 }
 }
 }
}
