#line 1 "C:/Users/junin/OneDrive/Área de Trabalho/UFLA/2024-2/Sistemas Embarcados/SistemasEmbarcados/relogio/relogio.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdio.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 24 "C:/Users/junin/OneDrive/Área de Trabalho/UFLA/2024-2/Sistemas Embarcados/SistemasEmbarcados/relogio/relogio.c"
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



void formatarHora(int horas, int minutos, int segundos, char* horaFormatada) {
 char strHoras[7];
 char strMinutos[7];
 char strSegundos[7];


 IntToStr(horas, strHoras);
 IntToStr(minutos, strMinutos);
 IntToStr(segundos, strSegundos);


 if (horas < 10) {
 horaFormatada[0] = '0';
 horaFormatada[1] = strHoras[5];
 } else {
 horaFormatada[0] = strHoras[4];
 horaFormatada[1] = strHoras[5];
 }
 horaFormatada[2] = ':';

 if (minutos < 10) {
 horaFormatada[3] = '0';
 horaFormatada[4] = strMinutos[5];
 } else {
 horaFormatada[3] = strMinutos[4];
 horaFormatada[4] = strMinutos[5];
 }
 horaFormatada[5] = ':';

 if (segundos < 10) {
 horaFormatada[6] = '0';
 horaFormatada[7] = strSegundos[5];
 } else {
 horaFormatada[6] = strSegundos[4];
 horaFormatada[7] = strSegundos[5];
 }
 horaFormatada[8] = '\0';
}

void main()
{
 int horas = 15, minutos = 5, segundos = 50;
 char horaFormatada[9];

 ADCON0 = 0x00;
 ADCON1 = 0x0F;
 trisb = 7;

 Lcd_Init();
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 delay_ms(100);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 delay_ms(100);


 while(1){

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

 formatarHora(horas, minutos, segundos, horaFormatada);

 Lcd_Out(1,5,horaFormatada);
 }


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

 formatarHora(horas, minutos, segundos, horaFormatada);

 Lcd_Out(1,5,horaFormatada);
 }


 while (portb.rb2 == 0){
 delay_ms(200);
 if(horas < 23){
 horas += 1;
 }
 else{
 horas = 0;
 }

 formatarHora(horas, minutos, segundos, horaFormatada);

 Lcd_Out(1,5,horaFormatada);
 }


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

 formatarHora(horas, minutos, segundos, horaFormatada);

 Lcd_Out(1,5,horaFormatada);
 }
}
