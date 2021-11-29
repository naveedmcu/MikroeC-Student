char uart_rd;
void LF_CR()
{
 UART1_Write(10); //LF
 UART1_Write(13); //CR
}

void main() {

  UART1_Init(9600);               // Initialize UART module at 9600 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  UART1_Write_Text("Start");
  LF_CR();

  while (1) 
  {                     // Endless loop
    if (UART1_Data_Ready()) {     // If data is received,
      uart_rd = UART1_Read();     // read the received data,
      UART1_Write(uart_rd);       // and send data via UART
   }
   if (portc.B4==0)
   {
    UART1_Write_Text("portc.B4==0");
    while(portc.B4==0); // stay here until button press
    LF_CR();
   }
   else if (portc.B5==0)
   {
    UART1_Write_Text("portc.B5==0");
    while(portc.B5==0); // stay here until button press
    LF_CR();
   }
  }
}