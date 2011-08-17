   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  82                     ; 69 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  82                     ; 70 {
  84                     	switch	.text
  85  0000               _IWDG_WriteAccessCmd:
  89                     ; 73   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  91                     ; 75   IWDG->KR = (u8)IWDG_WriteAccess; /* Write Access */
  93  0000 c750e0        	ld	20704,a
  94                     ; 77 }
  97  0003 81            	ret	
 187                     ; 104 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 187                     ; 105 {
 188                     	switch	.text
 189  0004               _IWDG_SetPrescaler:
 193                     ; 107   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 195                     ; 109   IWDG->PR = (u8)IWDG_Prescaler;
 197  0004 c750e1        	ld	20705,a
 198                     ; 110 }
 201  0007 81            	ret	
 235                     ; 127 void IWDG_SetReload(u8 IWDG_Reload)
 235                     ; 128 {
 236                     	switch	.text
 237  0008               _IWDG_SetReload:
 241                     ; 129   IWDG->RLR = IWDG_Reload;
 243  0008 c750e2        	ld	20706,a
 244                     ; 130 }
 247  000b 81            	ret	
 270                     ; 151 void IWDG_ReloadCounter(void)
 270                     ; 152 {
 271                     	switch	.text
 272  000c               _IWDG_ReloadCounter:
 276                     ; 153   IWDG->KR = IWDG_KEY_REFRESH;
 278  000c 35aa50e0      	mov	20704,#170
 279                     ; 154 }
 282  0010 81            	ret	
 305                     ; 174 void IWDG_Enable(void)
 305                     ; 175 {
 306                     	switch	.text
 307  0011               _IWDG_Enable:
 311                     ; 176   IWDG->KR = IWDG_KEY_ENABLE;
 313  0011 35cc50e0      	mov	20704,#204
 314                     ; 177 }
 317  0015 81            	ret	
 330                     	xdef	_IWDG_Enable
 331                     	xdef	_IWDG_ReloadCounter
 332                     	xdef	_IWDG_SetReload
 333                     	xdef	_IWDG_SetPrescaler
 334                     	xdef	_IWDG_WriteAccessCmd
 353                     	end
