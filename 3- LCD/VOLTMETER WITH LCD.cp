#line 1 "F:/LAPTOP DRIVE E/PROGRAM of  microcontroller/MIKRO C PROGRAM FOR STUDENT/LCD/VOLTMETER WITH LCD.c"

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

void main()
{
 unsigned char v_in,mV;
 unsigned char op [12];
 unsigned char i,j,lcd[5];
 adcon1=0x06;
 trisa=0xff;

 trise =0;
 porte.b1=0;
 trisc=255;

 lcd_init();

 lcd_out(2,1,"hello world");
 lcd_cmd(_LCD_CURSOR_OFF);
 delay_ms(1000);
 while(1)
 {
 if (portc.b4==0)
 {
 lcd_out(2,1,"portc.b4=0");
 }
 else if (portc.b4==1)
 {
 lcd_out(1,1,"portc.b4=1");
 }
 }
}
