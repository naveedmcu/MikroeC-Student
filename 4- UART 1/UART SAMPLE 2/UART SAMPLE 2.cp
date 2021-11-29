#line 1 "E:/MICROCONTROLLER PROGRAMS/MIKRO C PROGRAM FOR STUDENT/4- UART 1/UART SAMPLE 2/UART SAMPLE 2.c"
char uart_rd;
void LF_CR()
{
 UART1_Write(10);
 UART1_Write(13);
}

void main() {

 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Start");
 LF_CR();

 while (1)
 {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 if (portc.B4==0)
 {
 UART1_Write_Text("portc.B4==0");
 while(portc.B4==0);
 LF_CR();
 }
 else if (portc.B5==0)
 {
 UART1_Write_Text("portc.B5==0");
 while(portc.B5==0);
 LF_CR();
 }
 }
}
