                                      char counter;

void wait() {
  Delay_ms(150);
}
void refresh()
{
  LATD = 0x00;        // turn OFF the PORTD leds
  LATB = 0x00;        // turn OFF the PORTD leds
  LATC = 0x00;        // turn OFF the PORTD leds
  LATA = 0x00;        // turn OFF the PORTD leds
  LATE = 0x00;        // turn OFF the PORTD leds
}

void main() {

  ADCON1 == 0x06;      // Configure AN pins as digital
  TRISD = 0x00;        // set direction to be output
  TRISC = 0x00;        // set direction to be output
  TRISB = 0x00;        // set direction to be output
  TRISA = 0x00;        // set direction to be output
  TRISE = 0x00;        // set direction to be output
  
  LATD = 0x00;        // turn OFF the PORTD leds
  LATB = 0x00;        // turn OFF the PORTD leds
  LATC = 0x00;        // turn OFF the PORTD leds
  LATA = 0x00;        // turn OFF the PORTD leds
  LATE = 0x00;        // turn OFF the PORTD leds
 while(1)
 {
  counter =0;
  while(counter<8)
  {

   LATB= 1 << counter ;
   LATD= 1 << counter ;
   LATC= 1 << counter ;
   counter++;
   wait();
  }
  counter =0;
  while(counter<8)
  {

   LATB= 0x80 >> counter ;
   LATD= 0x80 >> counter ;
   LATC= 0x80 >> counter ;
   wait();

   counter++;
  }
  counter=0;
  while(counter<8)
  {
   LATB= 0x55;
   LATD= 0x55;
   LATC= 0x55;
   wait();
   wait();
   LATB= 0xAA;
   LATD= 0xAA;
   LATC= 0xAA;
   wait();
   wait();
   counter++;
  }
  refresh();
  counter =0;
  while(counter<8)
  {
   wait();
   LATB |= 0x01 << counter ;
   LATD |= 0x01 << counter ;
   LATC |= 0x01 << counter ;
   counter++;
  }
  counter =0;
  while(counter<8)
  {
   wait();
   LATB &= 0x80 >> counter ;
   LATD &= 0x80 >> counter ;
   LATC &= 0x80 >> counter ;
   counter++;
  }
 }
}