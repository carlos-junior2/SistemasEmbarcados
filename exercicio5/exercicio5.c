/*****************************************************************
**                          Exemplo 05                          **
**                                                              **
**       Exemplo para utilizacao dos displays de 7 segmentos    **
**       presente no kit PIC 18F452. Cada um dos 4 displays     **
**       são acessos, um de cada, vez, exibindo seu indice     **
**       Ex: display 1 = 1, display 2 = 2, etc...               **
**                                                              **
** Arquivo: display7seg.c                                       **
** Compilador: MikroC PRO PIC v.6.4.0                           **
**                                                              **
** Obs: Ativar dips switchs: DISP1 a DISP4                      **
**                                                              **
** UFLA - Lavras/MG - 12/07/2017                                **
******************************************************************/

// Define o tempo de acendimento do display em ms.
#define tempo 5

int mil, cen, dez, uni;

// Converte valor numerico decimal para codigo 7 segmentos
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
    // Escreve valor 1 no display 1 em codigo 7 segmentos.
    PORTD = mask(num1);
    porta.f2 = 1;     // Ativa display 1.
    Delay_ms(tempo);
    porta.f2 = 0;     // Desativa display 1.

    // Escreve valor 2 no display 2 em codigo 7 segmentos.
    PORTD = mask(num2);
    porta.f3 = 1;     // Ativa display 2.
    Delay_ms(tempo);
    porta.f3 = 0;     // Desativa display 2.

    // Escreve valor 3 no display 3 em codigo 7 segmentos
    PORTD = mask(num3);
    porta.f4 = 1;     // Ativa display 3.
    Delay_ms(tempo);
    porta.f4 = 0;     // Desativa display 3.

    // Escreve valor 4 no display 4 em codigo 7 segmentos.
    PORTD = mask(num4);
    porta.f5 = 1;     // Ativa display 4.
    Delay_ms(tempo);
    porta.f5 = 0;     // desativa display 4.
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
   resto = resto%100;

   dez = resto/10;

   uni = resto%10;
}

void separarDez(unsigned num){
   int resto;

   mil = 0;

   cen = 0;
   
   dez = num/10;

   uni = resto%10;
}

void separarUni(unsigned num){
   int resto;

   mil = 0;

   cen = 0;

   dez = 0;

   uni = num;
}

void main(void)
{
  unsigned temp = 19;
  ADCON0 = 0X00;
  ADCON1 = 0X06;          // desabilita conversor A/D.
  INTCON = 0;            // desabilita interrupcoes.
  TRISA  = 0;            // configura portA como saida.
  PORTA  = 0;
  TRISD  = 0;            // configura portD como saida.
  PORTD  = 0;

  while(1)                         // inicio do loop infinito.
  {
    if (temp >= 1000){
       separarMil(temp);
    }
    else if (tempo >= 100 && tempo < 1000){
       separarCen(temp);
    }
    else if (tempo >= 10 && tempo < 100){
       separarDez(temp);
    }
    else{
       separarUni(temp);
    }
    mostrar(mil, cen, dez, uni);
  } // Fim do loop infinito

}   // Fim do programa principal.