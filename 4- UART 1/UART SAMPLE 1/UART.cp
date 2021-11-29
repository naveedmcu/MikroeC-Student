#line 1 "E:/MICROCONTROLLER PROGRAMS/MIKRO C PROGRAM FOR STUDENT/4- UART 1/UART SAMPLE 1/UART.c"
char uart_rd;

void main() {

 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Start");
 UART1_Write(10);
 UART1_Write(13);

 UART1_Write_Text("Type Text");
 UART1_Write(10);
 UART1_Write(13);

 while (1) {
 if (UART1_Data_Ready())
 {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 }
}
