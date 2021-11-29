// Lcd pinout settings
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;
//-----------------------------
float tlong;
char temp[7];

void main() 
{
  ADCON1=0X14; // AN-O ENABLE AND ALL IS DIGITAL REF IS VSS(-) AND VDD(+)
  ADCON0=0;
  TRISC=0;
  TRISD=0;
  TRISB=0;
  TRISE=0;
  PORTE=0;
  PORTA=0;
  
  INTCON = 0;                          // disable all interrupts
   Lcd_Init();                    // Lcd_Init_EP4, see Autocomplete
   LCD_Cmd(_LCD_CURSOR_OFF);             // send command to LCD (cursor off)
   LCD_Cmd(_LCD_CLEAR);                  // send command  to LCD (clear LCD)
   Lcd_Out(1, 1, "Hello!");
  //aaa= adc_read(0)/10.24;
  //IntToStr(aaa,temp);
  Lcd_Out(2, 0,temp);

 while(1)
 {
//  tlong=(adc_read(0)/1023.0)*5.0;              // read ADC channel(0)& divide by 1024.0 to scale
  tlong=adc_read(0);
  floatToStr(tlong,temp);                  // convert integer to string.
  Lcd_Out(2, 0,temp);                 // number of digits to display
  DELAY_MS(500);
 }
 
}