   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  67                     ; 66 void WWDG_Init(u8 Counter, u8 WindowValue)
  67                     ; 67 {
  69                     	switch	.text
  70  0000               _WWDG_Init:
  72  0000 89            	pushw	x
  73       00000000      OFST:	set	0
  76                     ; 69   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  78                     ; 70   WWDG->WR = WWDG_WR_RESET_VALUE;
  80  0001 357f50d2      	mov	20690,#127
  81                     ; 71   WWDG->CR = (u8)(WWDG_CR_WDGA | WWDG_CR_T6 | Counter);
  83  0005 9e            	ld	a,xh
  84  0006 aac0          	or	a,#192
  85  0008 c750d1        	ld	20689,a
  86                     ; 72   WWDG->WR = (u8)((u8)(~WWDG_CR_WDGA) & (u8)(WWDG_CR_T6 | WindowValue));
  88  000b 7b02          	ld	a,(OFST+2,sp)
  89  000d a47f          	and	a,#127
  90  000f aa40          	or	a,#64
  91  0011 c750d2        	ld	20690,a
  92                     ; 73 }
  95  0014 85            	popw	x
  96  0015 81            	ret	
 130                     ; 92 void WWDG_SetCounter(u8 Counter)
 130                     ; 93 {
 131                     	switch	.text
 132  0016               _WWDG_SetCounter:
 134  0016 88            	push	a
 135       00000000      OFST:	set	0
 138                     ; 96   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 140                     ; 98   if ((WWDG->CR & (u8)(~WWDG_CR_WDGA)) < (WWDG->WR))
 142  0017 c650d1        	ld	a,20689
 143  001a a47f          	and	a,#127
 144  001c c150d2        	cp	a,20690
 145  001f 2407          	jruge	L15
 146                     ; 100     WWDG->CR = (u8)(WWDG_CR_WDGA | WWDG_CR_T6 | Counter);
 148  0021 7b01          	ld	a,(OFST+1,sp)
 149  0023 aac0          	or	a,#192
 150  0025 c750d1        	ld	20689,a
 151  0028               L15:
 152                     ; 103 }
 155  0028 84            	pop	a
 156  0029 81            	ret	
 179                     ; 123 u8 WWDG_GetCounter(void)
 179                     ; 124 {
 180                     	switch	.text
 181  002a               _WWDG_GetCounter:
 185                     ; 125   return(WWDG->CR);
 187  002a c650d1        	ld	a,20689
 190  002d 81            	ret	
 213                     ; 144 void WWDG_SWReset(void)
 213                     ; 145 {
 214                     	switch	.text
 215  002e               _WWDG_SWReset:
 219                     ; 146   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 221  002e 358050d1      	mov	20689,#128
 222                     ; 147 }
 225  0032 81            	ret	
 260                     ; 165 void WWDG_SetWindowValue(u8 WindowValue)
 260                     ; 166 {
 261                     	switch	.text
 262  0033               _WWDG_SetWindowValue:
 266                     ; 168   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 268                     ; 169   WWDG->WR = (u8)((u8)(~WWDG_CR_WDGA) & (u8)(WWDG_CR_T6 | WindowValue));
 270  0033 a47f          	and	a,#127
 271  0035 aa40          	or	a,#64
 272  0037 c750d2        	ld	20690,a
 273                     ; 170 }
 276  003a 81            	ret	
 289                     	xdef	_WWDG_SetWindowValue
 290                     	xdef	_WWDG_SWReset
 291                     	xdef	_WWDG_GetCounter
 292                     	xdef	_WWDG_SetCounter
 293                     	xdef	_WWDG_Init
 312                     	end
