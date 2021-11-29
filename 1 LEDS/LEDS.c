char counter;

void wait() {
  Delay_ms(100);
}

void main() {

  ADCON1 == 0x06;      // Configure AN pins as digital

  TRISA = 0x00;        // set direction to be output
  TRISB = 0x00;        // set direction to be output
  TRISC = 0x00;        // set direction to be output
  TRISD = 0x00;        // set direction to be output
  TRISE = 0x00;        // set direction to be output


  LATA = 0x00;        // turn OFF the PORTA leds
  LATB = 0x00;        // turn OFF the PORTB leds
  LATC = 0x00;        // turn OFF the PORTC leds
  LATD = 0x00;        // turn OFF the PORTD leds
  LATE = 0x00;        // turn OFF the PORTE leds


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