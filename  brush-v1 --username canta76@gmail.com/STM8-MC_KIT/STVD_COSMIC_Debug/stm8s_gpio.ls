   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
 113                     ; 65 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 113                     ; 66 {
 115                     	switch	.text
 116  0000               _GPIO_DeInit:
 120                     ; 67   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 122  0000 7f            	clr	(x)
 123                     ; 68   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 125  0001 6f02          	clr	(2,x)
 126                     ; 69   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 128  0003 6f03          	clr	(3,x)
 129                     ; 70   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 131  0005 6f04          	clr	(4,x)
 132                     ; 71 }
 135  0007 81            	ret	
 375                     ; 92 void GPIO_Init(GPIO_TypeDef* GPIOx,
 375                     ; 93                GPIO_Pin_TypeDef GPIO_Pin,
 375                     ; 94                GPIO_Mode_TypeDef GPIO_Mode)
 375                     ; 95 {
 376                     	switch	.text
 377  0008               _GPIO_Init:
 379  0008 89            	pushw	x
 380       00000000      OFST:	set	0
 383                     ; 100   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 385                     ; 101   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 387                     ; 107   if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
 389  0009 7b06          	ld	a,(OFST+6,sp)
 390  000b 2a18          	jrpl	L771
 391                     ; 109     if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
 393  000d a510          	bcp	a,#16
 394  000f 2705          	jreq	L102
 395                     ; 111       GPIOx->ODR |= GPIO_Pin;
 397  0011 f6            	ld	a,(x)
 398  0012 1a05          	or	a,(OFST+5,sp)
 400  0014 2006          	jra	L302
 401  0016               L102:
 402                     ; 114       GPIOx->ODR &= (u8)(~(GPIO_Pin));
 404  0016 1e01          	ldw	x,(OFST+1,sp)
 405  0018 7b05          	ld	a,(OFST+5,sp)
 406  001a 43            	cpl	a
 407  001b f4            	and	a,(x)
 408  001c               L302:
 409  001c f7            	ld	(x),a
 410                     ; 117     GPIOx->DDR |= GPIO_Pin;
 412  001d 1e01          	ldw	x,(OFST+1,sp)
 413  001f e602          	ld	a,(2,x)
 414  0021 1a05          	or	a,(OFST+5,sp)
 416  0023 2007          	jra	L502
 417  0025               L771:
 418                     ; 121     GPIOx->DDR &= (u8)(~(GPIO_Pin));
 420  0025 1e01          	ldw	x,(OFST+1,sp)
 421  0027 7b05          	ld	a,(OFST+5,sp)
 422  0029 43            	cpl	a
 423  002a e402          	and	a,(2,x)
 424  002c               L502:
 425  002c e702          	ld	(2,x),a
 426                     ; 128   if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
 428  002e 7b06          	ld	a,(OFST+6,sp)
 429  0030 a540          	bcp	a,#64
 430  0032 2706          	jreq	L702
 431                     ; 130     GPIOx->CR1 |= GPIO_Pin;
 433  0034 e603          	ld	a,(3,x)
 434  0036 1a05          	or	a,(OFST+5,sp)
 436  0038 2005          	jra	L112
 437  003a               L702:
 438                     ; 133     GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 440  003a 7b05          	ld	a,(OFST+5,sp)
 441  003c 43            	cpl	a
 442  003d e403          	and	a,(3,x)
 443  003f               L112:
 444  003f e703          	ld	(3,x),a
 445                     ; 140   if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
 447  0041 7b06          	ld	a,(OFST+6,sp)
 448  0043 a520          	bcp	a,#32
 449  0045 2706          	jreq	L312
 450                     ; 142     GPIOx->CR2 |= GPIO_Pin;
 452  0047 e604          	ld	a,(4,x)
 453  0049 1a05          	or	a,(OFST+5,sp)
 455  004b 2005          	jra	L512
 456  004d               L312:
 457                     ; 145     GPIOx->CR2 &= (u8)(~(GPIO_Pin));
 459  004d 7b05          	ld	a,(OFST+5,sp)
 460  004f 43            	cpl	a
 461  0050 e404          	and	a,(4,x)
 462  0052               L512:
 463  0052 e704          	ld	(4,x),a
 464                     ; 148 }
 467  0054 85            	popw	x
 468  0055 81            	ret	
 514                     ; 166 void GPIO_Write(GPIO_TypeDef* GPIOx, u8 PortVal)
 514                     ; 167 {
 515                     	switch	.text
 516  0056               _GPIO_Write:
 518  0056 89            	pushw	x
 519       00000000      OFST:	set	0
 522                     ; 168   GPIOx->ODR = PortVal;
 524  0057 1e01          	ldw	x,(OFST+1,sp)
 525  0059 7b05          	ld	a,(OFST+5,sp)
 526  005b f7            	ld	(x),a
 527                     ; 169 }
 530  005c 85            	popw	x
 531  005d 81            	ret	
 578                     ; 187 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 578                     ; 188 {
 579                     	switch	.text
 580  005e               _GPIO_WriteHigh:
 582  005e 89            	pushw	x
 583       00000000      OFST:	set	0
 586                     ; 189   GPIOx->ODR |= PortPins;
 588  005f f6            	ld	a,(x)
 589  0060 1a05          	or	a,(OFST+5,sp)
 590  0062 f7            	ld	(x),a
 591                     ; 190 }
 594  0063 85            	popw	x
 595  0064 81            	ret	
 642                     ; 208 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 642                     ; 209 {
 643                     	switch	.text
 644  0065               _GPIO_WriteLow:
 646  0065 89            	pushw	x
 647       00000000      OFST:	set	0
 650                     ; 210   GPIOx->ODR &= (u8)(~PortPins);
 652  0066 7b05          	ld	a,(OFST+5,sp)
 653  0068 43            	cpl	a
 654  0069 f4            	and	a,(x)
 655  006a f7            	ld	(x),a
 656                     ; 211 }
 659  006b 85            	popw	x
 660  006c 81            	ret	
 707                     ; 229 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 707                     ; 230 {
 708                     	switch	.text
 709  006d               _GPIO_WriteReverse:
 711  006d 89            	pushw	x
 712       00000000      OFST:	set	0
 715                     ; 231   GPIOx->ODR ^= PortPins;
 717  006e f6            	ld	a,(x)
 718  006f 1805          	xor	a,(OFST+5,sp)
 719  0071 f7            	ld	(x),a
 720                     ; 232 }
 723  0072 85            	popw	x
 724  0073 81            	ret	
 762                     ; 249 u8 GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 762                     ; 250 {
 763                     	switch	.text
 764  0074               _GPIO_ReadOutputData:
 768                     ; 251   return ((u8)GPIOx->ODR);
 770  0074 f6            	ld	a,(x)
 773  0075 81            	ret	
 810                     ; 269 u8 GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 810                     ; 270 {
 811                     	switch	.text
 812  0076               _GPIO_ReadInputData:
 816                     ; 271   return ((u8)GPIOx->IDR);
 818  0076 e601          	ld	a,(1,x)
 821  0078 81            	ret	
 889                     ; 292 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 889                     ; 293 {
 890                     	switch	.text
 891  0079               _GPIO_ReadInputPin:
 893  0079 89            	pushw	x
 894       00000000      OFST:	set	0
 897                     ; 294   return ((BitStatus)(GPIOx->IDR & (u8)GPIO_Pin));
 899  007a e601          	ld	a,(1,x)
 900  007c 1405          	and	a,(OFST+5,sp)
 903  007e 85            	popw	x
 904  007f 81            	ret	
 982                     ; 314 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 982                     ; 315 {
 983                     	switch	.text
 984  0080               _GPIO_ExternalPullUpConfig:
 986  0080 89            	pushw	x
 987       00000000      OFST:	set	0
 990                     ; 317   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 992                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 994                     ; 320   if (NewState != DISABLE) /* External Pull-Up Set*/
 996  0081 7b06          	ld	a,(OFST+6,sp)
 997  0083 2706          	jreq	L374
 998                     ; 322     GPIOx->CR1 |= GPIO_Pin;
1000  0085 e603          	ld	a,(3,x)
1001  0087 1a05          	or	a,(OFST+5,sp)
1003  0089 2007          	jra	L574
1004  008b               L374:
1005                     ; 325     GPIOx->CR1 &= (u8)(~(GPIO_Pin));
1007  008b 1e01          	ldw	x,(OFST+1,sp)
1008  008d 7b05          	ld	a,(OFST+5,sp)
1009  008f 43            	cpl	a
1010  0090 e403          	and	a,(3,x)
1011  0092               L574:
1012  0092 e703          	ld	(3,x),a
1013                     ; 327 }
1016  0094 85            	popw	x
1017  0095 81            	ret	
1030                     	xdef	_GPIO_ExternalPullUpConfig
1031                     	xdef	_GPIO_ReadInputPin
1032                     	xdef	_GPIO_ReadOutputData
1033                     	xdef	_GPIO_ReadInputData
1034                     	xdef	_GPIO_WriteReverse
1035                     	xdef	_GPIO_WriteLow
1036                     	xdef	_GPIO_WriteHigh
1037                     	xdef	_GPIO_Write
1038                     	xdef	_GPIO_Init
1039                     	xdef	_GPIO_DeInit
1058                     	end
