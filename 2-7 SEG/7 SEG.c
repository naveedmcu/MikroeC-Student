 unsigned char  i=0 , j=0 ,k=0;
 char unit,ten,hun,thu,button_flag,button_flag_1;
 int value;

  unsigned char display [10] = {215,80,229,117,114,55,183,81,247,119};    //  comman cathod
//------------------------------------------------------------------------------
// to get_digit for com cathod
//------------------------------------------------------------------------------
char get_digit(char _data)
{
 if (_data==0)
 {
 return display [0];
 }
 else if(_data==1)
 {
 return display [1];
 }
  else if(_data==2)
 {
 return display [2];
 }
  else if(_data==3)
 {
 return display [3];
 }
  else if(_data==4)
 {
 return display [4];
 }
  else if(_data==5)
 {
 return display [5];
 }
  else if(_data==6)
 {
 return display [6];
 }
  else if(_data==7)
 {
 return display [7];
 }
  else if(_data==8)
 {
 return display [8];
 }
  else if(_data==9)
 {
  return display [9];
 }
}
//------------------------------------------------------------------------------
// void dis_play(char _data_ , char place) // display digit at Desire position
//------------------------------------------------------------------------------
void dis_play(char _data_ , char place)
 {
  if (place==1)
  {
   porta.b5=1;
   porte.b2=0;
   porte.b1=0;
   porte.b0=0;
   portb=get_digit(_data_);
  }
  if (place==2)
  {
   porta.b5=0;
   porte.b2=1;
   porte.b1=0;
   porte.b0=0;
   portb=get_digit(_data_);
  }
  if (place==3)
  {
   porta.b5=0;
   porte.b2=0;
   porte.b1=1;
   porte.b0=0;
   portb=get_digit(_data_);
  }
  if (place==4)
  {
   porta.b5=0;
   porte.b2=0;
   porte.b1=0;
   porte.b0=1;
   portb=get_digit(_data_);
  }
 }
 
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// main function always start here
//------------------------------------------------------------------------------
 void main ()
 {
  adcon1=0x06;
  trisb=0; //out of portb
  trisa=0; //out of portb
  trise=0;
  trisC=255; // input up counter
  trisD.b7=1; // input down counter
  
  porta=0; // all pin are off state

  porta=255; // porta on state
  porte=255;
//loop for blinking
  for(i=0 ; i<3 ; i++)
  {
   portb=0; // portb off
   delay_ms(300);
   portb=255; // portb on
   delay_ms(300);
  }


/*
  while(1)
  {
  thu=1;
  hun=0;
  ten=0;
  unit=0;
  dis_play(unit,1);
  delay_ms(1);
  dis_play(ten,2);
  delay_ms(1);
  dis_play(hun,3);
  delay_ms(1);
  dis_play(thu,4);
  delay_ms(1);
  }
*/

   value=0;
//------------------------------------------------------------------------------
// up counter
//------------------------------------------------------------------------------

   button_flag=0;
   button_flag_1=0;
   for(;;)
   {
    if (portc.b4==0 && button_flag==0)
   {
    button_flag=1;
    value++;
    if (value==10000) 
    {
     value=0;
    }
   }
   else if (portc.b4==1 && button_flag==1 )
   {
    button_flag=0;
   }
//------------------------------------------------------------------------------
   else if (portc.b5==0 && button_flag_1==0)
   {
    button_flag_1=1;
    value--;
    if (value < 0)
    {
     value=0;
    }
   }
   else if (portc.b5==1 && button_flag_1==1)
   {
    button_flag_1=0;
   }
//-------------------------
//- display value
//-------------------------

   thu=(value/1000)%10;
   hun=(value/100)%10;
   ten=(value/10)%10;
   unit=value%10;

    dis_play(unit,1);
    delay_ms(1);
    dis_play(ten,2);
    delay_ms(1);
    dis_play(hun,3);
    delay_ms(1);
    dis_play(thu,4);
    delay_ms(1);
  }
 }