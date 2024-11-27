/*****************************************************************
**                          Exercício 05                        **
**                                                              **
**       Exercício realizado durante aula prática 05            **
**       Temporizador Digital usando display 7 segmentos        **
**                                                              **
** Arquivo: exercicio5.c                                        **
** Compilador: MikroC PRO PIC v.7.2.0                           **
**                                                              **
** Aluno: Carlos Magno do Nascimento Junior                     **
**                                                              **
** UFLA - Lavras/MG - 27/11/2024                                **
******************************************************************/

// Define o tempo de acendimento do display em ms.
#define tempo 5

//Declaração de variáveis globais
int mil, cen, dez, uni, cont=0;

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

//função para mostrar valores no display
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

//Decomponhe número inteiro em 4 números inteiros
void separarMil(unsigned num){
   int resto;
   
   mil = num/1000;
   resto = num%1000;
   
   cen = resto/100;
   resto = resto%100;
   
   dez = resto/10;
   
   uni = resto%10;
}

//Decomponhe número inteiro em 4 números inteiros
void separarCen(unsigned num){
   int resto;

   mil = 0;

   cen = num/100;
   resto = num%100;

   dez = resto/10;

   uni = resto%10;
}

//Decomponhe número inteiro em 4 números inteiros
void separarDez(unsigned num){
   int resto;

   mil = 0;

   cen = 0;
   
   dez = num/10;

   uni = num%10;
}

//Decomponhe número inteiro em 4 números inteiros
void separarUni(unsigned num){
   int resto;

   mil = 0;

   cen = 0;

   dez = 0;

   uni = num;
}

//atualiza valor e mostra no display
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
  ADCON1 = 0X06;          // desabilita conversor A/D.
  INTCON = 0;            // desabilita interrupcoes.
  TRISA  = 0;            // configura portA como saida.
  PORTA  = 0;
  TRISD  = 0;            // configura portD como saida.
  PORTD  = 0;
  TRISB  = 7;
  TRISC  = 0xFD; // 0b11111101

   // Inicia com buzzer desligado.
   portc.rc1 = 0;
  while(1)                         // inicio do loop infinito.
  {
    atualizaValor(valorTempo);
    if (portb.rb0 == 0){  //se botão RB0 for pressionado, incrementa valor do tempo
       valorTempo += 1;
       delay_ms(tempo);
    }
    if (portb.rb1 == 0){ //se botão RB1 for pressionado, decrementa valor do tempo
       valorTempo -= 1;
       delay_ms(tempo);
    }

    if (portb.rb2 == 0){ //se botão RB1 for pressionado, incia a contagem regressiva até 0
       while (valorTempo > 0){
          while (cont < 45){  //atraso de 1s garantindo o display sempre aceso
              atualizaValor(valorTempo);
              cont+=1;
           }
          valorTempo -=1;
          cont = 0;
       }
       if (valorTempo == 0){ //se o valor for 0
          atualizaValor(valorTempo);
          portc.rc1 = 1;    //toca buzzer
          while (cont < 25){  //atraso de 1s garantindo o display sempre aceso
              atualizaValor(valorTempo);
              cont+=1;
           }
          portc.rc1 = 0;    //para buzzer
       }
    }
  } // Fim do loop infinito
}   // Fim do programa principal.