#line 1 "E:/MICROCONTROLLER PROGRAMS/MIKRO C PROGRAM FOR STUDENT/6- LM35/LM35.c"

sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;


sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;


int adc;
float tlong;

char temp[7];

void main()
{
 ADCON1=0X14;
 ADCON0=0;
 TRISC=0;
 TRISD=0;
 TRISB=0;
 TRISE=0;
 PORTE=0;
 PORTA=0;

 INTCON = 0;
 Lcd_Init();
 LCD_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "LM 35");

 while(1)
 {
 tlong=(adc_read(0)/1023.0)*5.0;
 tlong*=1000.0;
 adc=tlong;
 temp[0] = ((adc/100) % 10)+48;
 temp[1] = ((adc/10) % 10)+48;


 temp[2] = 'C';
 temp[3] = 0;
 Lcd_Out(2, 0,temp);
 DELAY_MS(500);
 }

}
