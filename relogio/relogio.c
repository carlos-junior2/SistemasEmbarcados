/****************************************************************
**                          Exercício 03                        *
**                                                              *
**      Exercício realizado no laboratório com a finalidade     *
**      de mostrar um relógio no display LCD, ao apertar e      *
**      segurar o pushbutton RB0, é possível alterar os         *
**      segundos, ao segurar o pushbutton RB1, é possível       *
**      alterar os minutos e ao apertar o pushbutton RB2,       *
**      é possível alterar as horas.				*
**                                                              *
** Arquivo: relogio.c                                           *
** Compilador: Mikro C PRO PIC v.6.4.0                          *
**                                                              *
** Aluno: Carlos Magno do Nascimento Junior                     *
** UFLA - Lavras/MG - 06/11/2024                                *
*****************************************************************/


//Bibliotecas necessárias para manipulação de strings
#include <stdio.h>
#include <string.h>

// Conexoes LCD do kit PICGenios com 18F
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
// Fim das conexoes

// Função para formatar as horas
void formatarHora(int horas, int minutos, int segundos, char* horaFormatada) {
    char strHoras[7];    // Array para armazenar horas como string (tamanho 7 para IntToStr)
    char strMinutos[7];  // Array para armazenar minutos como string (tamanho 7 para IntToStr)
    char strSegundos[7]; // Array para armazenar segundos como string (tamanho 7 para IntToStr)

    // Converte horas, minutos e segundos para strings de 7 caracteres
    IntToStr(horas, strHoras);
    IntToStr(minutos, strMinutos);
    IntToStr(segundos, strSegundos);

    // Remove espaços em branco e ajusta para dois dígitos
    if (horas < 10) {
        horaFormatada[0] = '0';
        horaFormatada[1] = strHoras[5];
    } else {
        horaFormatada[0] = strHoras[4];
        horaFormatada[1] = strHoras[5];
    }
    horaFormatada[2] = ':';  // Adiciona o separador

    if (minutos < 10) {
        horaFormatada[3] = '0';
        horaFormatada[4] = strMinutos[5];
    } else {
        horaFormatada[3] = strMinutos[4];
        horaFormatada[4] = strMinutos[5];
    }
    horaFormatada[5] = ':';  // Adiciona o separador

    if (segundos < 10) {
        horaFormatada[6] = '0';
        horaFormatada[7] = strSegundos[5];
    } else {
        horaFormatada[6] = strSegundos[4];
        horaFormatada[7] = strSegundos[5];
    }
    horaFormatada[8] = '\0'; // Adiciona o caractere nulo para finalizar a string
}

void main()
{
        int horas = 15, minutos = 5, segundos = 50; //inicialização das variáveis
        char horaFormatada[9]; // Array para armazenar "HH:MM:SS" + '\0'
        
	ADCON0  = 0x00;        // Configura todos pinos das portas para digital e
   	ADCON1  = 0x0F;       // desabilita o conversor A/D
   	trisb = 7;

   	Lcd_Init();                  	//Inicializa o Display
   	delay_ms(100);
   	Lcd_Cmd(_LCD_CLEAR);         	//Limpa o Display
   	delay_ms(100);
   	Lcd_Cmd(_LCD_CURSOR_OFF);    	//Desabilita o cursor
   	delay_ms(100);
        
        //Loop infinito
        while(1){
           // Ao apertar botão RB0, ajusta os segundos
           while (portb.rb0 == 0){
             delay_ms(200);
             if (segundos < 59){
                segundos += 1;
             }
             else {
                segundos = 0;
                if (minutos <59){
                   minutos+=1;
                }
                else{
                   minutos = 0;
                   if(horas < 23){
                      horas += 1;
                   }
                   else{
                      horas = 0;
                      minutos = 0;
                      segundos = 0;
                   }
                }
             }
             //chama a função para formatar a hora com novos valores
             formatarHora(horas, minutos, segundos, horaFormatada);
             //Mostra hora no Display LCD
             Lcd_Out(1,5,horaFormatada);
           }
           
           // Ao apertar botão RB1, ajusta os minutos
           while (portb.rb1 == 0){
             delay_ms(200);
             if (minutos <59){
                minutos+=1;
             }
             else{
                minutos = 0;
                if(horas < 23){
                   horas += 1;
                }
                else{
                   horas = 0;
                   minutos = 0;
                   segundos = 0;
                }
             }
             //chama a função para formatar a hora com novos valores
             formatarHora(horas, minutos, segundos, horaFormatada);
             //Mostra hora no Display LCD
             Lcd_Out(1,5,horaFormatada);
           }

           // Ao apertar botão RB2, ajusta as horas
           while (portb.rb2 == 0){
             delay_ms(200);
             if(horas < 23){
                horas += 1;
             }
             else{
                horas = 0;
             }
             //chama a função para formatar a hora com novos valores
             formatarHora(horas, minutos, segundos, horaFormatada);
             //Mostra hora no Display LCD
             Lcd_Out(1,5,horaFormatada);
           }

           // Contador de horas normal
           delay_ms(1000);
           if (segundos < 59){
              segundos += 1;
           }
           else {
              segundos = 0;
              if (minutos <59){
                 minutos+=1;
              }
              else{
                 minutos = 0;
                 if(horas < 23){
                    horas += 1;
                 }
                 else{
                    horas = 0;
                    minutos = 0;
                    segundos = 0;
                 }
              }
           }
           //chama a função para formatar a hora com novos valores
           formatarHora(horas, minutos, segundos, horaFormatada);
           //Mostra hora no Display LCD
           Lcd_Out(1,5,horaFormatada);
        }
} // fim do programa
