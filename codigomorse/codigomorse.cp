#line 1 "C:/Users/junin/OneDrive/Área de Trabalho/UFLA/2024-2/Sistemas Embarcados/codigomorse.c"
#line 16 "C:/Users/junin/OneDrive/Área de Trabalho/UFLA/2024-2/Sistemas Embarcados/codigomorse.c"
void escrevePonto(){
 portd = 1;
 delay_ms(200);
 portd = 0;
}


void escreveTraco(){
 portd = 0;
 delay_ms(600);
}


void intervalo(){
 portd = 0;
 delay_ms(900);
}


void numero0(){

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
}


void numero1(){

 escrevePonto();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
}


void numero2(){

 escrevePonto();
 delay_ms(300);

 escrevePonto();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
}


void numero8(){

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escrevePonto();
 delay_ms(300);

 escrevePonto();
}

void main ()
{



 trisb = 3;



 trisd = 0;


 while (1)
 {


 if (portb.rb0 == 0)
 {



 escreveTraco();
 delay_ms(300);

 escrevePonto();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escrevePonto();

 intervalo();



 escreveTraco();
 delay_ms(300);

 escreveTraco();

 intervalo();



 escreveTraco();
 delay_ms(300);

 escrevePonto();

 intervalo();



 escrevePonto();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 delay_ms(300);

 escreveTraco();
 }
 else if (portb.rb1 == 0)
 {


 numero2();

 intervalo();


 numero0();

 intervalo();


 numero1();

 intervalo();


 numero8();

 intervalo();


 numero1();

 intervalo();


 numero0();

 intervalo();


 numero0();

 intervalo();


 numero8();

 intervalo();


 numero8();

 intervalo();
 }
 }
}
