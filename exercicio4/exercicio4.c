/*****************************************************************
**                          Exercício 4                         **
**                                                              **
**     Exercício 4: Jogo das senhas                             **
** Ao digitar uma senha de 4 dígitos no teclado do kit Pic      **
** Genius, o programa verifica se a senha digitada é a senha    **
** correta, se sim, pisca os leds 3 vezes, e da uma mensgaem no **
** display lcd, se não, emite um sinal sonoro no buzzer e uma   **
** mensgaem de mensagem incorreta no display lcd.               **
**                                                              **
** Arquivo: exercicio4.c                                        **
** Compilador: MikroC PRO PIC v.6.4.0                           **
** UFLA - Lavras/MG - 14/11/2024                                **
******************************************************************/

// Conexoes LCD do kit PICGenios
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

#define atraso 50

char senhaDigitada[5]; // Array para armazenar senha digitada (4 dígitos + '\0' para finalizar a string)

// Função para mostrar texto no LCD
void LCD(char texto[16]) {
   Lcd_Out(1,1,texto);
}

// Função para ler tecla digitada e retornar 1 se uma tecla foi pressionada, ou 0 se não
char teclaDigitada(int j) {
   char saida;
   char str[2]; // Array para converter `saida` em string

   portb.rb0 = 0;          // habilita primeira coluna do teclado
   delay_ms(atraso);
   if (portd.rd1 == 0)               saida = '7';
   else if (portd.rd2 == 0)          saida = '4';
   else if (portd.rd3 == 0)          saida = '1';
   else saida = '\0';
   portb.rb0 = 1;          // desabilita primeira coluna do teclado
  delay_ms(atraso);

   portb.rb1 = 0;          // habilita segunda coluna do teclado
   delay_ms(atraso);
   if (saida == '\0' && portd.rd0 == 0)                saida = '0';
      else if (saida == '\0' && portd.rd1 == 0)        saida = '8';
         else if (saida == '\0' && portd.rd2 == 0)     saida = '5';
            else if (saida == '\0' && portd.rd3 == 0)  saida = '2';
   portb.rb1 = 1;          // desabilita segunda coluna do teclado
   delay_ms(atraso);

   portb.rb2 = 0;         // habilita terceira coluna do teclado
   delay_ms(atraso);
   if (saida == '\0' && portd.rd1 == 0)       saida = '9';
   else if (saida == '\0' && portd.rd2 == 0)  saida = '6';
   else if (saida == '\0' && portd.rd3 == 0)  saida = '3';
   portb.rb2 = 1;         // desabilita terceira coluna do teclado
   delay_ms(atraso);

   if (saida != '\0') {
      str[0] = saida; // Converte caractere para string
      str[1] = '\0'; // Finaliza string

      Lcd_Out(2, j + 1, str); // Exibe o dígito no LCD
      senhaDigitada[j] = saida; // Armazena o dígito na senha digitada
      return 1; // Retorna 1 para indicar que uma tecla foi pressionada
   }

   return 0; // Retorna 0 se nenhuma tecla foi pressionada
}

//Função para piscar os leds
void ascendeLed(){
   portb = 240;
   delay_ms(250);
   portb = 0;
   delay_ms(250);
}

void main() {
   char senhaCorreta[5] = "9999"; // Senha correta para comparação
   int i, j; //variáveis para controle de loop

   ADCON0 = 0X00;     // Desabilita o conversor A/D
   ADCON1 = 0x06;     // Configura todos pinos da porta A para digital
   // trisc e' uma posicao (registrador) na memoria de dados
   // do microcontrolador. Configura o pino RC1 como saida para
   // comunicacao com o buzzer.
   trisc = 0xFD; // 0b11111101

   // Inicia com buzzer desligado.
   portc.rc1 = 0;

   trisd = 0x0F;      // Configura pinos RD0,RD1,RD2,RD3 da PORTD como entradas (teclado) e RD4,RD5,RD6,RD7 como saída (LCD)
   trisb = 0;      // Configura pinos RB0,RB1,RB2 da PORTB como saída (teclado) e o restante como entrada
   portb = 7;      // inicializa pinos RB0,RB1,RB2 com o valor 1 (para o teclado) e o restante como 0 (LEDs).

   Lcd_Init();                      // Inicializa o Display
   delay_ms(atraso);
   Lcd_Cmd(_LCD_CLEAR);             // Limpa o Display
   delay_ms(atraso);
   Lcd_Cmd(_LCD_CURSOR_OFF);        // Desabilita o cursor
   delay_ms(atraso);

   LCD("Digite a senha:");

   j = 0; // Índice para exibir números na posição correta
   do {
      if (teclaDigitada(j)) { // Chama teclaDigitada e só incrementa se uma tecla foi pressionada
         j++;
         if (j >= 4) { // Após digitar 4 dígitos, verifica a senha
            senhaDigitada[4] = '\0'; // Finaliza a string senhaDigitada

            // Compara a senha digitada com a senha correta
            if (strcmp(senhaDigitada, senhaCorreta) == 0) { //se for correta
               delay_ms(200);
               Lcd_Cmd(_LCD_CLEAR);
               LCD("Senha correta!");
               ascendeLed();
               ascendeLed();
               ascendeLed();
            } else {        //se for incorreta
               delay_ms(200);
               Lcd_Cmd(_LCD_CLEAR);
               LCD("Senha incorreta!");
               portc.rc1 = 1;
               delay_ms(500);
               portc.rc1 = 0;
            }

            delay_ms(500); // Espera meio segundo para mostrar a mensagem
            Lcd_Cmd(_LCD_CLEAR); // Limpa o display

            LCD("Digite a senha:"); // Reinicia a solicitação de senha
            j = 0; // Reinicia o índice para a próxima entrada de senha
         }
      }
      delay_ms(atraso);
   } while(1);
} // fim do programa
