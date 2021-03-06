#line 1 "F:/LAPTOP DRIVE E/PROGRAM of  microcontroller/MIKRO C PROGRAM FOR STUDENT/LEDS/LEDS.c"
char counter;

void wait() {
 Delay_ms(100);
}

void main() {

 ADCON1 == 0x06;

 TRISA = 0x00;
 TRISB = 0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;


 LATA = 0x00;
 LATB = 0x00;
 LATC = 0x00;
 LATD = 0x00;
 LATE = 0x00;


 while (1) {
 for (counter=0; counter<8; counter++){
 LATA |= 1 << counter;
 LATB |= 1 << counter;
 LATC |= 1 << counter;
 LATD |= 1 << counter;
 LATE |= 1 << counter;
 wait();
 }

 counter = 0;
 while (counter<8) {
 LATA &= ~(1 << counter);
 LATB &= ~(1 << counter);
 LATC &= ~(1 << counter);
 LATD &= ~(1 << counter);
 LATE &= ~(1 << counter);
 wait();
 counter++;
 }
 }
}
