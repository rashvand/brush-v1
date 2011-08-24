   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
 112                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 112                     ; 46 {
 114                     .text:	section	.text,new
 115  0000               _GPIO_DeInit:
 119                     ; 47     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0000 7f            	clr	(x)
 122                     ; 48     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0001 6f02          	clr	(2,x)
 125                     ; 49     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0003 6f03          	clr	(3,x)
 128                     ; 50     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 130  0005 6f04          	clr	(4,x)
 131                     ; 51 }
 134  0007 81            	ret
 374                     ; 62 void GPIO_Init(GPIO_TypeDef* GPIOx,
 374                     ; 63                GPIO_Pin_TypeDef GPIO_Pin,
 374                     ; 64                GPIO_Mode_TypeDef GPIO_Mode)
 374                     ; 65 {
 375                     .text:	section	.text,new
 376  0000               _GPIO_Init:
 378  0000 89            	pushw	x
 379       00000000      OFST:	set	0
 382                     ; 70     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 384                     ; 71     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 386                     ; 77     if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
 388  0001 7b06          	ld	a,(OFST+6,sp)
 389  0003 a580          	bcp	a,#128
 390  0005 271d          	jreq	L771
 391                     ; 79         if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
 393  0007 7b06          	ld	a,(OFST+6,sp)
 394  0009 a510          	bcp	a,#16
 395  000b 2706          	jreq	L102
 396                     ; 81             GPIOx->ODR |= (u8)GPIO_Pin;
 398  000d f6            	ld	a,(x)
 399  000e 1a05          	or	a,(OFST+5,sp)
 400  0010 f7            	ld	(x),a
 402  0011 2007          	jra	L302
 403  0013               L102:
 404                     ; 84             GPIOx->ODR &= (u8)(~(GPIO_Pin));
 406  0013 1e01          	ldw	x,(OFST+1,sp)
 407  0015 7b05          	ld	a,(OFST+5,sp)
 408  0017 43            	cpl	a
 409  0018 f4            	and	a,(x)
 410  0019 f7            	ld	(x),a
 411  001a               L302:
 412                     ; 87         GPIOx->DDR |= (u8)GPIO_Pin;
 414  001a 1e01          	ldw	x,(OFST+1,sp)
 415  001c e602          	ld	a,(2,x)
 416  001e 1a05          	or	a,(OFST+5,sp)
 417  0020 e702          	ld	(2,x),a
 419  0022 2009          	jra	L502
 420  0024               L771:
 421                     ; 91         GPIOx->DDR &= (u8)(~(GPIO_Pin));
 423  0024 1e01          	ldw	x,(OFST+1,sp)
 424  0026 7b05          	ld	a,(OFST+5,sp)
 425  0028 43            	cpl	a
 426  0029 e402          	and	a,(2,x)
 427  002b e702          	ld	(2,x),a
 428  002d               L502:
 429                     ; 98     if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
 431  002d 7b06          	ld	a,(OFST+6,sp)
 432  002f a540          	bcp	a,#64
 433  0031 270a          	jreq	L702
 434                     ; 100         GPIOx->CR1 |= (u8)GPIO_Pin;
 436  0033 1e01          	ldw	x,(OFST+1,sp)
 437  0035 e603          	ld	a,(3,x)
 438  0037 1a05          	or	a,(OFST+5,sp)
 439  0039 e703          	ld	(3,x),a
 441  003b 2009          	jra	L112
 442  003d               L702:
 443                     ; 103         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 445  003d 1e01          	ldw	x,(OFST+1,sp)
 446  003f 7b05          	ld	a,(OFST+5,sp)
 447  0041 43            	cpl	a
 448  0042 e403          	and	a,(3,x)
 449  0044 e703          	ld	(3,x),a
 450  0046               L112:
 451                     ; 110     if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
 453  0046 7b06          	ld	a,(OFST+6,sp)
 454  0048 a520          	bcp	a,#32
 455  004a 270a          	jreq	L312
 456                     ; 112         GPIOx->CR2 |= (u8)GPIO_Pin;
 458  004c 1e01          	ldw	x,(OFST+1,sp)
 459  004e e604          	ld	a,(4,x)
 460  0050 1a05          	or	a,(OFST+5,sp)
 461  0052 e704          	ld	(4,x),a
 463  0054 2009          	jra	L512
 464  0056               L312:
 465                     ; 115         GPIOx->CR2 &= (u8)(~(GPIO_Pin));
 467  0056 1e01          	ldw	x,(OFST+1,sp)
 468  0058 7b05          	ld	a,(OFST+5,sp)
 469  005a 43            	cpl	a
 470  005b e404          	and	a,(4,x)
 471  005d e704          	ld	(4,x),a
 472  005f               L512:
 473                     ; 118 }
 476  005f 85            	popw	x
 477  0060 81            	ret
 521                     ; 129 void GPIO_Write(GPIO_TypeDef* GPIOx, u8 PortVal)
 521                     ; 130 {
 522                     .text:	section	.text,new
 523  0000               _GPIO_Write:
 525  0000 89            	pushw	x
 526       00000000      OFST:	set	0
 529                     ; 131     GPIOx->ODR = PortVal;
 531  0001 7b05          	ld	a,(OFST+5,sp)
 532  0003 1e01          	ldw	x,(OFST+1,sp)
 533  0005 f7            	ld	(x),a
 534                     ; 132 }
 537  0006 85            	popw	x
 538  0007 81            	ret
 585                     ; 143 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 585                     ; 144 {
 586                     .text:	section	.text,new
 587  0000               _GPIO_WriteHigh:
 589  0000 89            	pushw	x
 590       00000000      OFST:	set	0
 593                     ; 145     GPIOx->ODR |= (u8)PortPins;
 595  0001 f6            	ld	a,(x)
 596  0002 1a05          	or	a,(OFST+5,sp)
 597  0004 f7            	ld	(x),a
 598                     ; 146 }
 601  0005 85            	popw	x
 602  0006 81            	ret
 649                     ; 157 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 649                     ; 158 {
 650                     .text:	section	.text,new
 651  0000               _GPIO_WriteLow:
 653  0000 89            	pushw	x
 654       00000000      OFST:	set	0
 657                     ; 159     GPIOx->ODR &= (u8)(~PortPins);
 659  0001 7b05          	ld	a,(OFST+5,sp)
 660  0003 43            	cpl	a
 661  0004 f4            	and	a,(x)
 662  0005 f7            	ld	(x),a
 663                     ; 160 }
 666  0006 85            	popw	x
 667  0007 81            	ret
 714                     ; 170 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 714                     ; 171 {
 715                     .text:	section	.text,new
 716  0000               _GPIO_WriteReverse:
 718  0000 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 172     GPIOx->ODR ^= (u8)PortPins;
 724  0001 f6            	ld	a,(x)
 725  0002 1805          	xor	a,	(OFST+5,sp)
 726  0004 f7            	ld	(x),a
 727                     ; 173 }
 730  0005 85            	popw	x
 731  0006 81            	ret
 744                     	xdef	_GPIO_WriteReverse
 745                     	xdef	_GPIO_WriteLow
 746                     	xdef	_GPIO_WriteHigh
 747                     	xdef	_GPIO_Write
 748                     	xdef	_GPIO_Init
 749                     	xdef	_GPIO_DeInit
 768                     	end
