/* ****************************************************************
**                          Exercício 01                         **
**                                                               **
**     Ao apertar o pushbutton RB0, é mostrado as inicias do     **
**     aluno em código morse no LED1 PORTD                       **
**     Ao apertar o pushbutton RB1, é mostrado o número de       **
**     matrícula do aluno em código morse no LED1 PORTD          **
**                                                               **
**     Aluno: Carlos Magno do Nascimento Junior                  **
**                                                               **
**     Arquivo: codigomorse.c                                    **
**     Compilador : MikroC PRO PIC v7.2.0                        **
**                                                               **
**     UFLA - Lavras /MG - 16/10/2024                            **
******************************************************************/

//função para mostrar um ponto em código morse
void escrevePonto(){
     portd = 1;
     delay_ms(200);
     portd = 0;
}

//função para mostrar um traço em código morse
void escreveTraco(){
     portd = 1;
     delay_ms(600);
     portd = 0;
}

//função para dar intervalo entre um caracter e outro
void intervalo(){
     portd = 0;
     delay_ms(900);
}

//função para escrever número 0 em código morse
void numero0(){
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço
     escreveTraco();
}

//função para escrever número 1 em código morse
void numero1(){
     //Ponto mais intervalo
     escrevePonto();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço
     escreveTraco();
}

//função para escrever número 2 em código morse
void numero2(){
    //Ponto mais intervalo
    escrevePonto();
    delay_ms(300);
    //Ponto mais intervalo
    escrevePonto();
    delay_ms(300);
    //Traço mais intervalo
    escreveTraco();
    delay_ms(300);
    //Traço mais intervalo
    escreveTraco();
    delay_ms(300);
    //Traço
    escreveTraco();
}

//função para escrever número 8 em código morse
void numero8(){
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
     escreveTraco();
     delay_ms(300);
     //Traço mais intervalo
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
                     //Traço mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //ponto mais intervalo
                     escrevePonto();
                     delay_ms(300);
                     //Traço mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //ponto
                     escrevePonto();
                     //encerra letra C
                     intervalo();
                     
                     //Letra M
                     //Traço mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Traço
                     escreveTraco();
                     //encerra letra M
                     intervalo();
                     
                     //Letra N
                     //Traço mais intervalo
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
                     //Traço mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Traço mais intervalo
                     escreveTraco();
                     delay_ms(300);
                     //Traço
                     escreveTraco();
                 }
                 
                 // Le o estado do push button conectado ao pinon RB1.
                // Caso seja pressionado (valor = 0), executa bloco.
                 else if (portb.rb1 == 0)
                 {
                      //Matricula 201810088
                      //Número 2
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