#line 1 "F:/final/New/Project.c"

sbit LCD_RS at RB5_bit;
sbit LCD_EN at RB4_bit;
sbit LCD_D4 at RB3_bit;
sbit LCD_D5 at RB2_bit;
sbit LCD_D6 at RB1_bit;
sbit LCD_D7 at RB0_bit;

sbit LCD_RS_Direction at TRISB5_bit;
sbit LCD_EN_Direction at TRISB4_bit;
sbit LCD_D4_Direction at TRISB3_bit;
sbit LCD_D5_Direction at TRISB2_bit;
sbit LCD_D6_Direction at TRISB1_bit;
sbit LCD_D7_Direction at TRISB0_bit;

char *ch[4]= {"    A     ","    B     ","    C     ","    D     "};
int Speed = 230,S1,S2,S3,S4,S5,S6,Limit,Reading,j=0,LR = 0;
void AutoCalibration()
{
 int S[6],Max1,i;
 S[0] = ADC_Read(0);
 S[1] = ADC_Read(1);
 S[2] = ADC_Read(2);
 S[3] = ADC_Read(3);
 S[4] = ADC_Read(4);
 S[5] = ADC_Read(5);
 Max1 = S[0];
 for ( i = 0; i< 6; i++ )
 {
 if ( S[i] > Max1 )
 Max1 = S[i];
 }
 Limit = Max1 + 150;
}
void ReadSensors()
{
 S1 = ADC_Read(0);
 S2 = ADC_Read(1);
 S3 = ADC_Read(2);
 S4 = ADC_Read(4);
 S5 = ADC_Read(5);
 S6 = ADC_Read(3);

 if ( S1 > Limit )
 {
 S1 = 1;
 portd.b7 = 1;
 }
 else
 {
 S1 = 0;
 portd.b7 = 0;
 }

 if ( S2 > Limit )
 {
 S2 = 1;
 portd.b6 = 1;
 }
 else
 {
 S2 = 0;
 portd.b6 = 0;
 }

 if ( S3 > Limit )
 {
 S3 = 1;
 portd.b5 = 1;
 }
 else
 {
 S3 = 0;
 portd.b5 = 0;
 }

 if ( S4 > Limit )
 {
 S4 = 1;
 portc.b7 = 1;
 }
 else
 {
 S4 = 0;
 portc.b7 = 0;
 }

 if ( S5 > Limit )
 {
 S5 = 1;
 portc.b6 = 1;
 }
 else
 {
 S5 = 0;
 portc.b6 = 0;
 }

 if ( S6 > Limit )
 {
 S6 = 1;
 portd.b4 = 1;
 }
 else
 {
 S6 = 0;
 portd.b4 = 0;
 }

 Reading = S1 + S2*2 + S3*5 + S4*9 + S5*20;
}
void Motors(int LM,int RM)
{
 if ( LM < 0 )
 {
 PORTD.B2 = 0;
 PORTD.B3 = 1;
 PWM2_Set_Duty(-LM);
 }
 else
 {
 PORTD.B2 = 1;
 PORTD.B3 = 0;
 PWM2_Set_Duty(LM);
 }

 if ( RM < 0 )
 {
 PORTD.B0 = 0;
 PORTD.B1 = 1;
 PWM1_Set_Duty(-RM);
 }
 else
 {
 PORTD.B0 = 1;
 PORTD.B1 = 0;
 PWM1_Set_Duty(RM);
 }
}
void Stop()
{
 Motors(-Speed,-Speed);
 delay_ms(25);
 Motors(0,0);
}
void main()
{
 LCD_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 PWM1_Init(4000);
 PWM2_Init(4000);
 PWM1_Start();
 PWM2_Start();
 ADC_Init();

 trisc = 0;
 portc = 0;
 trisb = 0;
 portb = 0;
 trisd = 0;
 portd = 0;

 LCD_Out(1,5,"digiminds");
 delay_ms(2000);
 AutoCalibration();
 Lcd_Cmd(_LCD_CLEAR);
 while(1){
 ReadSensors();

 if ( Reading == 5 || Reading == 16 )
 Motors(Speed,Speed);
 else if ( Reading == 14 || Reading == 9 )
 Motors(Speed,0);
 else if ( Reading == 29 || Reading == 20 )
 Motors(Speed,-Speed);
 else if ( Reading == 34 )
 {
 Motors(speed,speed);
 delay_ms(25);
 ReadSensors();
 if ( Reading == 0 )
 {
 do
 {
 Motors(Speed,-Speed);
 ReadSensors();
 }
 while( S4 == 0 );
 }
 }
 else if ( Reading == 7 || Reading == 2 )
 {
 Motors(speed,speed);
 delay_ms(20);
 if ( Reading == 7 || Reading == 2 )
 Motors(0,Speed);
 }
 else if ( Reading == 3 || Reading == 1 )
 Motors(-Speed,Speed);
 else if ( Reading == 8 )
 {
 Motors(speed,speed);
 delay_ms(25);
 ReadSensors();
 if ( Reading == 0 )
 {
 do
 {
 Motors(-Speed,Speed);
 ReadSensors();
 }
 while( S2 == 0 );
 }
 }
 else if(Reading == 37)
 {
 Motors(speed,-speed);
 do{
 ReadSensors();
 }while(S4 == 0);
 }
 else if( Reading == 0 && S6 == 1 && ( LR != 26 && LR != 1 && LR != 20 && LR != 0 ) )
 {
 portc.f5 = 1;
 Lcd_Out(1,5,ch[j]);
 while( Reading == 0 && S6 == 1 )
 ReadSensors();
 portc.f5 = 0;
 j++;
 if ( j > 3) j = 3;
 }
 LR = Reading;
 }
}
