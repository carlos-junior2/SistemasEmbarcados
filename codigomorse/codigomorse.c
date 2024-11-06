/* ****************************************************************
**                          Exerc�cio 01                         **
**                                                               **
**     Ao apertar o pushbutton RB0, � mostrado as inicias do     **
**     aluno em c�digo morse no LED1 PORTD                       **
**     Ao apertar o pushbutton RB1, � mostrado o n�mero de       **
**     matr�cula do aluno em c�digo morse no LED1 PORTD          **
**                                                               **
**     Aluno: Carlos Magno do Nascimento Junior                  **
**                                                               **
**     Arquivo: codigomorse.c                                    **
**     Compilador : MikroC PRO PIC v7.2.0                        **
**                                                               **
**     UFLA - Lavras /MG - 16/10/2024                            **
******************************************************************/

//fun��o para mostrar um ponto em c�digo morse
void escrevePonto(){
     portd = 1;
     delay_ms(200);
     portd = 0;
}

//fun��o para mostrar um tra�o em c�digo morse
void escreveTraco(){
     portd = 1;
     delay_ms(600);
     portd = 0;
}

//fun��o para dar intervalo entre um caracter e outro
void intervalo(){
     portd = 0;
     delay_ms(900);
}

//fun��o para escrever n�mero 0 em c�digo morse
void numero0(){
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o
     escreveTraco();
}

//fun��o para escrever n�mero 1 em c�digo morse
void numero1(){
     //Ponto mais intervalo
     escrevePonto();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o
     escreveTraco();
}

//fun��o para escrever n�mero 2 em c�digo morse
void numero2(){
    //Ponto mais intervalo
    escrevePonto();
    delay_ms(300);
    //Ponto mais intervalo
    escrevePonto();
    delay_ms(300);
    //Tra�o mais intervalo
    escreveTraco();
    delay_ms(300);
    //Tra�o mais intervalo
    escreveTraco();
    delay_ms(300);
    //Tra�o
    escreveTraco();
}

//fun��o para escrever n�mero 8 em c�digo morse
void numero8(){
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Tra�o mais intervalo
     escreveTraco();
     delay_ms(300);
     //Ponto mais intervalo
     escrevePonto();
     delay_ms(300);
     //Ponto
     escrevePonto();
}

void main ()
{
        // Ativa os pinos RB0 e RB1 como entrada da PORTB.
        // Os demais pinos sao configurados como saida.
        // Seta macro "trisb" com valor 0b00000011 (bin) = 0d3 (dec)
        trisb = 3;

        // Todos os pinos da PORTD (RD) sao configurados como saida.
        // Seta macro "trisd" com valor 0b0000000 (bin) = 0d0 (dec)
        trisd = 0;

        // Loop Infinito
        while (1)
        {
                // Le o estado do push button conectado ao pinon RB0.
                // Caso seja pressionado (valor = 0), executa bloco.
                if (portb.rb0 == 0)
                {
                     //Iniciais: CMNJ
                     //Letra C
                     //Tra�o mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //ponto mais intervalo
                     escrevePonto();
                     delay_ms(300);
                     //Tra�o mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //ponto
                     escrevePonto();
                     //encerra letra C
                     intervalo();
                     
                     //Letra M
                     //Tra�o mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Tra�o
                     escreveTraco();
                     //encerra letra M
                     intervalo();
                     
                     //Letra N
                     //Tra�o mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Ponto
                     escrevePonto();
                     //encerra letra N
                     intervalo();
                     
                     //Letra J
                     //Ponto mais intervalo
                     escrevePonto();
                     delay_ms(300);
                     //Tra�o mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Tra�o mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Tra�o
                     escreveTraco();
                 }
                 
                 // Le o estado do push button conectado ao pinon RB1.
                // Caso seja pressionado (valor = 0), executa bloco.
                 else if (portb.rb1 == 0)
                 {
                      //Matricula 201810088
                      //N�mero 2
                      numero2();
                      //Encerra numero 2
                      intervalo();
                      
                      //Numero 0
                      numero0();
                      //encerra 0
                      intervalo();
                      
                      //Numero 1
                      numero1();
                      //Encerra numero 1
                      intervalo();
                      
                      //Numero 8
                      numero8();
                      //Encerra 8
                      intervalo();
                      
                      //Numero 1
                      numero1();
                      //Encerra numero 1
                      intervalo();
                      
                      //Numero 0
                      numero0();
                      //encerra 0
                      intervalo();

                      //Numero 0
                      numero0();
                      //encerra 0
                      intervalo();

                      //Numero 8
                      numero8();
                      //Encerra 8
                      intervalo();

                      //Numero 8
                      numero8();
                      //Encerra 8
                      intervalo();
                 }
        }
}