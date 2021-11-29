#line 1 "F:/LAPTOP DRIVE E/PROGRAM of  microcontroller/MIKRO C PROGRAM FOR STUDENT/LEDS/LEDS SAMPLE 2/LEDS SAMPLE 2.c"
 char counter;

void wait() {
 Delay_ms(150);
}
void refresh()
{
 LATD = 0x00;
 LATB = 0x00;
 LATC = 0x00;
 LATA = 0x00;
 LATE = 0x00;
}

void main() {

 ADCON1 == 0x06;
 TRISD = 0x00;
 TRISC = 0x00;
 TRISB = 0x00;
 TRISA = 0x00;
 TRISE = 0x00;

 LATD = 0x00;
 LATB = 0x00;
 LATC = 0x00;
 LATA = 0x00;
 LATE = 0x00;
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
