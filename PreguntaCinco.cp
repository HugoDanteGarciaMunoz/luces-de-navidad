#line 1 "C:/Users/HugoDante/Downloads/micro-5/PreguntaCinco.c"
int i,frecuencia;
unsigned short int k;
void main() {
 ADCON1=0;
 TRISC=0;
 PWM1_Init(5000);
 PWM2_Init(5000);
 ADC_Init();
 PWM1_Start();
 PWM2_Start();
 while(1){
 k=(int)(ADC_Read(0)*(255.0/1023));
 PWM1_Set_Duty(k);
 PWM2_Set_Duty(k);
 RC3_bit=0;
 RC4_bit=0;
 Delay_ms(150);
 RC3_bit=0;
 RC4_bit=1;
 Delay_ms(150);
 RC3_bit=1;
 RC4_bit=0;
 Delay_ms(150);
 RC3_bit=1;
 RC4_bit=1;
 Delay_ms(150);
 }
 Delay_ms(60);
}
