#line 1 "C:/Users/carlos.junior2/Desktop/piscapisca/piscapisca.c"
#line 15 "C:/Users/carlos.junior2/Desktop/piscapisca/piscapisca.c"
void main ()
{



 trisb = 1;



 trisd = 0;


 while (1)
 {


 while (portb.rb0 == 0)
 {

 portd = 0;


 delay_ms(1000);


 portd = 255;


 delay_ms(1000) ;
 }
 }
}
