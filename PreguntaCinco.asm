
_main:

;PreguntaCinco.c,3 :: 		void main() {
;PreguntaCinco.c,4 :: 		ADCON1=0;
	CLRF       ADCON1+0
;PreguntaCinco.c,5 :: 		TRISC=0;
	CLRF       TRISC+0
;PreguntaCinco.c,6 :: 		PWM1_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PreguntaCinco.c,7 :: 		PWM2_Init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;PreguntaCinco.c,8 :: 		ADC_Init();
	CALL       _ADC_Init+0
;PreguntaCinco.c,9 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PreguntaCinco.c,10 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;PreguntaCinco.c,11 :: 		while(1){
L_main0:
;PreguntaCinco.c,12 :: 		k=(int)(ADC_Read(0)*(255.0/1023));
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      208
	MOVWF      R4+0
	MOVLW      63
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      124
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _k+0
;PreguntaCinco.c,13 :: 		PWM1_Set_Duty(k);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PreguntaCinco.c,14 :: 		PWM2_Set_Duty(k);
	MOVF       _k+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;PreguntaCinco.c,15 :: 		RC3_bit=0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;PreguntaCinco.c,16 :: 		RC4_bit=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;PreguntaCinco.c,17 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;PreguntaCinco.c,18 :: 		RC3_bit=0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;PreguntaCinco.c,19 :: 		RC4_bit=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;PreguntaCinco.c,20 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;PreguntaCinco.c,21 :: 		RC3_bit=1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
;PreguntaCinco.c,22 :: 		RC4_bit=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;PreguntaCinco.c,23 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;PreguntaCinco.c,24 :: 		RC3_bit=1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
;PreguntaCinco.c,25 :: 		RC4_bit=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;PreguntaCinco.c,26 :: 		Delay_ms(150);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;PreguntaCinco.c,27 :: 		}
	GOTO       L_main0
;PreguntaCinco.c,28 :: 		Delay_ms(60);
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;PreguntaCinco.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
