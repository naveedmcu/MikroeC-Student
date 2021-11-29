void main()
{
 ADCON1=0X06;
 TRISB=255;
 TRISC=0;
 TRISD=0;

 PORTB=0;
 PORTC=0;
 PORTD=0;

 INTCON.INT0IE=1;   //Int0 Enable
 INTCON2.INTEDG0=1; // ZERO FOR LOW EDGE SELEVT
 INTCON.GIE=1;
 while(1)
 {
  delay_ms(300);
  PORTC=~PORTC;
 }
}

 void interrupt()
 {
  if (INTCON.INT0IF) {                      // Check for External INT0 Interrupt
    INTCON.INT0IF = 0;                     // Clear INT0 interrupt flag
    PORTD=~PORTD;
   }
 }