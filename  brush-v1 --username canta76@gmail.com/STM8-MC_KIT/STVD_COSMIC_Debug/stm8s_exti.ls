   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 63 void EXTI_DeInit(void)
  47                     ; 64 {
  49                     	switch	.text
  50  0000               _EXTI_DeInit:
  54                     ; 65   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  56  0000 725f50a0      	clr	20640
  57                     ; 66   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  59  0004 725f50a1      	clr	20641
  60                     ; 67 }
  63  0008 81            	ret	
 188                     ; 86 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 188                     ; 87 {
 189                     	switch	.text
 190  0009               _EXTI_SetExtIntSensitivity:
 192  0009 89            	pushw	x
 193       00000000      OFST:	set	0
 196                     ; 90   assert_param(IS_EXTI_PORT_OK(Port));
 198                     ; 91   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 200                     ; 94   switch (Port)
 202  000a 9e            	ld	a,xh
 204                     ; 116     default:
 204                     ; 117       break;
 205  000b 4d            	tnz	a
 206  000c 270e          	jreq	L12
 207  000e 4a            	dec	a
 208  000f 271a          	jreq	L32
 209  0011 4a            	dec	a
 210  0012 2725          	jreq	L52
 211  0014 4a            	dec	a
 212  0015 2731          	jreq	L72
 213  0017 4a            	dec	a
 214  0018 2745          	jreq	L13
 215  001a 2053          	jra	L311
 216  001c               L12:
 217                     ; 96     case EXTI_PORT_GPIOA:
 217                     ; 97       EXTI->CR1 &= (u8)(~EXTI_CR1_PAIS);
 219  001c c650a0        	ld	a,20640
 220  001f a4fc          	and	a,#252
 221  0021 c750a0        	ld	20640,a
 222                     ; 98       EXTI->CR1 |= (u8)(SensitivityValue);
 224  0024 c650a0        	ld	a,20640
 225  0027 1a02          	or	a,(OFST+2,sp)
 226                     ; 99       break;
 228  0029 202f          	jp	LC001
 229  002b               L32:
 230                     ; 100     case EXTI_PORT_GPIOB:
 230                     ; 101       EXTI->CR1 &= (u8)(~EXTI_CR1_PBIS);
 232  002b c650a0        	ld	a,20640
 233  002e a4f3          	and	a,#243
 234  0030 c750a0        	ld	20640,a
 235                     ; 102       EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 2);
 237  0033 7b02          	ld	a,(OFST+2,sp)
 238  0035 48            	sll	a
 239  0036 48            	sll	a
 240                     ; 103       break;
 242  0037 201e          	jp	LC002
 243  0039               L52:
 244                     ; 104     case EXTI_PORT_GPIOC:
 244                     ; 105       EXTI->CR1 &= (u8)(~EXTI_CR1_PCIS);
 246  0039 c650a0        	ld	a,20640
 247  003c a4cf          	and	a,#207
 248  003e c750a0        	ld	20640,a
 249                     ; 106       EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 4);
 251  0041 7b02          	ld	a,(OFST+2,sp)
 252  0043 97            	ld	xl,a
 253  0044 a610          	ld	a,#16
 254                     ; 107       break;
 256  0046 200d          	jp	LC003
 257  0048               L72:
 258                     ; 108     case EXTI_PORT_GPIOD:
 258                     ; 109       EXTI->CR1 &= (u8)(~EXTI_CR1_PDIS);
 260  0048 c650a0        	ld	a,20640
 261  004b a43f          	and	a,#63
 262  004d c750a0        	ld	20640,a
 263                     ; 110       EXTI->CR1 |= (u8)((u8)(SensitivityValue) << 6);
 265  0050 7b02          	ld	a,(OFST+2,sp)
 266  0052 97            	ld	xl,a
 267  0053 a640          	ld	a,#64
 268  0055               LC003:
 269  0055 42            	mul	x,a
 270  0056 9f            	ld	a,xl
 271  0057               LC002:
 272  0057 ca50a0        	or	a,20640
 273  005a               LC001:
 274  005a c750a0        	ld	20640,a
 275                     ; 111       break;
 277  005d 2010          	jra	L311
 278  005f               L13:
 279                     ; 112     case EXTI_PORT_GPIOE:
 279                     ; 113       EXTI->CR2 &= (u8)(~EXTI_CR2_PEIS);
 281  005f c650a1        	ld	a,20641
 282  0062 a4fc          	and	a,#252
 283  0064 c750a1        	ld	20641,a
 284                     ; 114       EXTI->CR2 |= (u8)(SensitivityValue);
 286  0067 c650a1        	ld	a,20641
 287  006a 1a02          	or	a,(OFST+2,sp)
 288  006c c750a1        	ld	20641,a
 289                     ; 115       break;
 291                     ; 116     default:
 291                     ; 117       break;
 293  006f               L311:
 294                     ; 119 }
 297  006f 85            	popw	x
 298  0070 81            	ret	
 356                     ; 134 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 356                     ; 135 {
 357                     	switch	.text
 358  0071               _EXTI_SetTLISensitivity:
 362                     ; 138   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 364                     ; 141   EXTI->CR2 &= (u8)(~EXTI_CR2_TLIS);
 366  0071 721550a1      	bres	20641,#2
 367                     ; 142   EXTI->CR2 |= (u8)(SensitivityValue);
 369  0075 ca50a1        	or	a,20641
 370  0078 c750a1        	ld	20641,a
 371                     ; 144 }
 374  007b 81            	ret	
 420                     ; 161 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 420                     ; 162 {
 421                     	switch	.text
 422  007c               _EXTI_GetExtIntSensitivity:
 424  007c 88            	push	a
 425       00000001      OFST:	set	1
 428                     ; 164   u8 value = 0;
 430  007d 0f01          	clr	(OFST+0,sp)
 431                     ; 167   assert_param(IS_EXTI_PORT_OK(Port));
 433                     ; 169   switch (Port)
 436                     ; 186     default:
 436                     ; 187       break;
 437  007f 4d            	tnz	a
 438  0080 2710          	jreq	L341
 439  0082 4a            	dec	a
 440  0083 2712          	jreq	L541
 441  0085 4a            	dec	a
 442  0086 2718          	jreq	L741
 443  0088 4a            	dec	a
 444  0089 271b          	jreq	L151
 445  008b 4a            	dec	a
 446  008c 2722          	jreq	L351
 447  008e 7b01          	ld	a,(OFST+0,sp)
 448  0090 2023          	jra	LC004
 449  0092               L341:
 450                     ; 171     case EXTI_PORT_GPIOA:
 450                     ; 172       value = (u8)(EXTI->CR1 & EXTI_CR1_PAIS);
 452  0092 c650a0        	ld	a,20640
 453                     ; 173       break;
 455  0095 201c          	jp	LC005
 456  0097               L541:
 457                     ; 174     case EXTI_PORT_GPIOB:
 457                     ; 175       value = (u8)((EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 459  0097 c650a0        	ld	a,20640
 460  009a a40c          	and	a,#12
 461  009c 44            	srl	a
 462  009d 44            	srl	a
 463                     ; 176       break;
 465  009e 2015          	jp	LC004
 466  00a0               L741:
 467                     ; 177     case EXTI_PORT_GPIOC:
 467                     ; 178       value = (u8)((EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 469  00a0 c650a0        	ld	a,20640
 470  00a3 4e            	swap	a
 471                     ; 179       break;
 473  00a4 200d          	jp	LC005
 474  00a6               L151:
 475                     ; 180     case EXTI_PORT_GPIOD:
 475                     ; 181       value = (u8)((EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 477  00a6 c650a0        	ld	a,20640
 478  00a9 4e            	swap	a
 479  00aa a40c          	and	a,#12
 480  00ac 44            	srl	a
 481  00ad 44            	srl	a
 482                     ; 182       break;
 484  00ae 2003          	jp	LC005
 485  00b0               L351:
 486                     ; 183     case EXTI_PORT_GPIOE:
 486                     ; 184       value = (u8)(EXTI->CR2 & EXTI_CR2_PEIS);
 488  00b0 c650a1        	ld	a,20641
 489  00b3               LC005:
 490  00b3 a403          	and	a,#3
 491  00b5               LC004:
 492                     ; 185       break;
 494                     ; 186     default:
 494                     ; 187       break;
 496                     ; 190   return((EXTI_Sensitivity_TypeDef)value);
 500  00b5 5b01          	addw	sp,#1
 501  00b7 81            	ret	
 537                     ; 210 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 537                     ; 211 {
 538                     	switch	.text
 539  00b8               _EXTI_GetTLISensitivity:
 541  00b8 88            	push	a
 542       00000001      OFST:	set	1
 545                     ; 216   value = (u8)(EXTI->CR2 & EXTI_CR2_TLIS);
 547  00b9 c650a1        	ld	a,20641
 548  00bc a404          	and	a,#4
 549                     ; 218   return((EXTI_TLISensitivity_TypeDef)value);
 553  00be 5b01          	addw	sp,#1
 554  00c0 81            	ret	
 567                     	xdef	_EXTI_GetTLISensitivity
 568                     	xdef	_EXTI_GetExtIntSensitivity
 569                     	xdef	_EXTI_SetTLISensitivity
 570                     	xdef	_EXTI_SetExtIntSensitivity
 571                     	xdef	_EXTI_DeInit
 590                     	end
