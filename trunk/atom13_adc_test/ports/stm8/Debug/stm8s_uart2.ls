   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  55                     ; 54 void UART2_DeInit(void)
  55                     ; 55 {
  57                     .text:	section	.text,new
  58  0000               _UART2_DeInit:
  60  0000 88            	push	a
  61       00000001      OFST:	set	1
  64                     ; 56     u8 dummy = 0;
  66                     ; 59     dummy = UART2->SR;
  68  0001 c65240        	ld	a,21056
  69                     ; 60     dummy = UART2->DR;
  71  0004 c65241        	ld	a,21057
  72                     ; 62     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*< Set UART2_BRR2 to reset value 0x00 */
  74  0007 725f5243      	clr	21059
  75                     ; 63     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*< Set UART2_BRR1 to reset value 0x00 */
  77  000b 725f5242      	clr	21058
  78                     ; 65     UART2->CR1 = UART2_CR1_RESET_VALUE; /*< Set UART2_CR1 to reset value 0x00  */
  80  000f 725f5244      	clr	21060
  81                     ; 66     UART2->CR2 = UART2_CR2_RESET_VALUE; /*< Set UART2_CR2 to reset value 0x00  */
  83  0013 725f5245      	clr	21061
  84                     ; 67     UART2->CR3 = UART2_CR3_RESET_VALUE;  /*< Set UART2_CR3 to reset value 0x00  */
  86  0017 725f5246      	clr	21062
  87                     ; 68     UART2->CR4 = UART2_CR4_RESET_VALUE;  /*< Set UART2_CR4 to reset value 0x00  */
  89  001b 725f5247      	clr	21063
  90                     ; 69     UART2->CR5 = UART2_CR5_RESET_VALUE; /*< Set UART2_CR5 to reset value 0x00  */
  92  001f 725f5248      	clr	21064
  93                     ; 70     UART2->CR6 = UART2_CR6_RESET_VALUE; /*< Set UART2_CR6 to reset value 0x00  */
  95  0023 725f5249      	clr	21065
  96                     ; 72 }
  99  0027 84            	pop	a
 100  0028 81            	ret
 411                     .const:	section	.text
 412  0000               L01:
 413  0000 00000064      	dc.l	100
 414                     ; 84 void UART2_Init(u32 BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 414                     ; 85 {
 415                     .text:	section	.text,new
 416  0000               _UART2_Init:
 418  0000 520e          	subw	sp,#14
 419       0000000e      OFST:	set	14
 422                     ; 86     u8 BRR2_1, BRR2_2 = 0;
 424                     ; 87     u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;
 426                     ; 90     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 428                     ; 92     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 430                     ; 94     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 432                     ; 96     assert_param(IS_UART2_PARITY_OK(Parity));
 434                     ; 99     assert_param(IS_UART2_MODE_OK((u8)Mode));
 436                     ; 103     assert_param(IS_UART2_SYNCMODE_OK((u8)SyncMode));
 438                     ; 105     UART2->CR1 &= (u8)(~UART2_CR1_M);  /**< Clear the word length bit */
 440  0002 72195244      	bres	21060,#4
 441                     ; 106     UART2->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART2_WordLength value */
 443  0006 c65244        	ld	a,21060
 444  0009 1a15          	or	a,(OFST+7,sp)
 445  000b c75244        	ld	21060,a
 446                     ; 108     UART2->CR3 &= (u8)(~UART2_CR3_STOP);  /**< Clear the STOP bits */
 448  000e c65246        	ld	a,21062
 449  0011 a4cf          	and	a,#207
 450  0013 c75246        	ld	21062,a
 451                     ; 109     UART2->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART2_StopBits value  */
 453  0016 c65246        	ld	a,21062
 454  0019 1a16          	or	a,(OFST+8,sp)
 455  001b c75246        	ld	21062,a
 456                     ; 111     UART2->CR1 &= (u8)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));  /**< Clear the Parity Control bit */
 458  001e c65244        	ld	a,21060
 459  0021 a4f9          	and	a,#249
 460  0023 c75244        	ld	21060,a
 461                     ; 112     UART2->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART2_Parity value */
 463  0026 c65244        	ld	a,21060
 464  0029 1a17          	or	a,(OFST+9,sp)
 465  002b c75244        	ld	21060,a
 466                     ; 114     UART2->BRR1 &= (u8)(~UART2_BRR1_DIVM);  /**< Clear the LSB mantissa of UARTDIV  */
 468  002e 725f5242      	clr	21058
 469                     ; 115     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVM);  /**< Clear the MSB mantissa of UARTDIV  */
 471  0032 c65243        	ld	a,21059
 472  0035 a40f          	and	a,#15
 473  0037 c75243        	ld	21059,a
 474                     ; 116     UART2->BRR2 &= (u8)(~UART2_BRR2_DIVF);  /**< Clear the Fraction bits of UARTDIV */
 476  003a c65243        	ld	a,21059
 477  003d a4f0          	and	a,#240
 478  003f c75243        	ld	21059,a
 479                     ; 119     BaudRate_Mantissa    = ((u32)CLK_GetClockFreq() / (BaudRate << 4));
 481  0042 96            	ldw	x,sp
 482  0043 1c0011        	addw	x,#OFST+3
 483  0046 cd0000        	call	c_ltor
 485  0049 a604          	ld	a,#4
 486  004b cd0000        	call	c_llsh
 488  004e 96            	ldw	x,sp
 489  004f 1c0001        	addw	x,#OFST-13
 490  0052 cd0000        	call	c_rtol
 492  0055 cd0000        	call	_CLK_GetClockFreq
 494  0058 96            	ldw	x,sp
 495  0059 1c0001        	addw	x,#OFST-13
 496  005c cd0000        	call	c_ludv
 498  005f 96            	ldw	x,sp
 499  0060 1c000b        	addw	x,#OFST-3
 500  0063 cd0000        	call	c_rtol
 502                     ; 120     BaudRate_Mantissa100 = (((u32)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 504  0066 96            	ldw	x,sp
 505  0067 1c0011        	addw	x,#OFST+3
 506  006a cd0000        	call	c_ltor
 508  006d a604          	ld	a,#4
 509  006f cd0000        	call	c_llsh
 511  0072 96            	ldw	x,sp
 512  0073 1c0001        	addw	x,#OFST-13
 513  0076 cd0000        	call	c_rtol
 515  0079 cd0000        	call	_CLK_GetClockFreq
 517  007c a664          	ld	a,#100
 518  007e cd0000        	call	c_smul
 520  0081 96            	ldw	x,sp
 521  0082 1c0001        	addw	x,#OFST-13
 522  0085 cd0000        	call	c_ludv
 524  0088 96            	ldw	x,sp
 525  0089 1c0007        	addw	x,#OFST-7
 526  008c cd0000        	call	c_rtol
 528                     ; 122     BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 528                     ; 123                         << 4) / 100) & (u8)0x0F); /**< Set the fraction of UARTDIV  */
 530  008f 96            	ldw	x,sp
 531  0090 1c000b        	addw	x,#OFST-3
 532  0093 cd0000        	call	c_ltor
 534  0096 a664          	ld	a,#100
 535  0098 cd0000        	call	c_smul
 537  009b 96            	ldw	x,sp
 538  009c 1c0001        	addw	x,#OFST-13
 539  009f cd0000        	call	c_rtol
 541  00a2 96            	ldw	x,sp
 542  00a3 1c0007        	addw	x,#OFST-7
 543  00a6 cd0000        	call	c_ltor
 545  00a9 96            	ldw	x,sp
 546  00aa 1c0001        	addw	x,#OFST-13
 547  00ad cd0000        	call	c_lsub
 549  00b0 a604          	ld	a,#4
 550  00b2 cd0000        	call	c_llsh
 552  00b5 ae0000        	ldw	x,#L01
 553  00b8 cd0000        	call	c_ludv
 555  00bb b603          	ld	a,c_lreg+3
 556  00bd a40f          	and	a,#15
 557  00bf 6b05          	ld	(OFST-9,sp),a
 558                     ; 124     BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);
 560  00c1 96            	ldw	x,sp
 561  00c2 1c000b        	addw	x,#OFST-3
 562  00c5 cd0000        	call	c_ltor
 564  00c8 a604          	ld	a,#4
 565  00ca cd0000        	call	c_lursh
 567  00cd b603          	ld	a,c_lreg+3
 568  00cf a4f0          	and	a,#240
 569  00d1 b703          	ld	c_lreg+3,a
 570  00d3 3f02          	clr	c_lreg+2
 571  00d5 3f01          	clr	c_lreg+1
 572  00d7 3f00          	clr	c_lreg
 573  00d9 b603          	ld	a,c_lreg+3
 574  00db 6b06          	ld	(OFST-8,sp),a
 575                     ; 126     UART2->BRR2 = (u8)(BRR2_1 | BRR2_2);
 577  00dd 7b05          	ld	a,(OFST-9,sp)
 578  00df 1a06          	or	a,(OFST-8,sp)
 579  00e1 c75243        	ld	21059,a
 580                     ; 127     UART2->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UARTDIV  */
 582  00e4 7b0e          	ld	a,(OFST+0,sp)
 583  00e6 c75242        	ld	21058,a
 584                     ; 129     UART2->CR2 &= (u8)~(UART2_CR2_TEN | UART2_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
 586  00e9 c65245        	ld	a,21061
 587  00ec a4f3          	and	a,#243
 588  00ee c75245        	ld	21061,a
 589                     ; 130     UART2->CR3 &= (u8)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
 591  00f1 c65246        	ld	a,21062
 592  00f4 a4f8          	and	a,#248
 593  00f6 c75246        	ld	21062,a
 594                     ; 131     UART2->CR3 |= (u8)((u8)SyncMode & (u8)(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
 596  00f9 7b18          	ld	a,(OFST+10,sp)
 597  00fb a407          	and	a,#7
 598  00fd ca5246        	or	a,21062
 599  0100 c75246        	ld	21062,a
 600                     ; 133     if ((u8)Mode & (u8)UART2_MODE_TX_ENABLE)
 602  0103 7b19          	ld	a,(OFST+11,sp)
 603  0105 a504          	bcp	a,#4
 604  0107 2706          	jreq	L571
 605                     ; 135         UART2->CR2 |= (u8)UART2_CR2_TEN;  /**< Set the Transmitter Enable bit */
 607  0109 72165245      	bset	21061,#3
 609  010d 2004          	jra	L771
 610  010f               L571:
 611                     ; 139         UART2->CR2 &= (u8)(~UART2_CR2_TEN);  /**< Clear the Transmitter Disable bit */
 613  010f 72175245      	bres	21061,#3
 614  0113               L771:
 615                     ; 141     if ((u8)Mode & (u8)UART2_MODE_RX_ENABLE)
 617  0113 7b19          	ld	a,(OFST+11,sp)
 618  0115 a508          	bcp	a,#8
 619  0117 2706          	jreq	L102
 620                     ; 143         UART2->CR2 |= (u8)UART2_CR2_REN;  /**< Set the Receiver Enable bit */
 622  0119 72145245      	bset	21061,#2
 624  011d 2004          	jra	L302
 625  011f               L102:
 626                     ; 147         UART2->CR2 &= (u8)(~UART2_CR2_REN);  /**< Clear the Receiver Disable bit */
 628  011f 72155245      	bres	21061,#2
 629  0123               L302:
 630                     ; 150     if ((u8)SyncMode&(u8)UART2_SYNCMODE_CLOCK_DISABLE)
 632  0123 7b18          	ld	a,(OFST+10,sp)
 633  0125 a580          	bcp	a,#128
 634  0127 2706          	jreq	L502
 635                     ; 152         UART2->CR3 &= (u8)(~UART2_CR3_CKEN); /**< Clear the Clock Enable bit */
 637  0129 72175246      	bres	21062,#3
 639  012d 200a          	jra	L702
 640  012f               L502:
 641                     ; 157         UART2->CR3 |= (u8)((u8)SyncMode & UART2_CR3_CKEN);
 643  012f 7b18          	ld	a,(OFST+10,sp)
 644  0131 a408          	and	a,#8
 645  0133 ca5246        	or	a,21062
 646  0136 c75246        	ld	21062,a
 647  0139               L702:
 648                     ; 159 }
 651  0139 5b0e          	addw	sp,#14
 652  013b 81            	ret
 675                     ; 170 u8 UART2_ReceiveData8(void)
 675                     ; 171 {
 676                     .text:	section	.text,new
 677  0000               _UART2_ReceiveData8:
 681                     ; 172     return ((u8)UART2->DR);
 683  0000 c65241        	ld	a,21057
 686  0003 81            	ret
 718                     ; 185 void UART2_SendData8(u8 Data)
 718                     ; 186 {
 719                     .text:	section	.text,new
 720  0000               _UART2_SendData8:
 724                     ; 188     UART2->DR = Data;
 726  0000 c75241        	ld	21057,a
 727                     ; 189 }
 730  0003 81            	ret
 887                     ; 201 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
 887                     ; 202 {
 888                     .text:	section	.text,new
 889  0000               _UART2_GetFlagStatus:
 891  0000 89            	pushw	x
 892  0001 88            	push	a
 893       00000001      OFST:	set	1
 896                     ; 203     FlagStatus status = RESET;
 898                     ; 206     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
 900                     ; 209     if (UART2_FLAG == UART2_FLAG_LBDF)
 902  0002 a30210        	cpw	x,#528
 903  0005 2610          	jrne	L323
 904                     ; 211         if ((UART2->CR4 & (u8)UART2_FLAG) != (u8)0x00)
 906  0007 9f            	ld	a,xl
 907  0008 c45247        	and	a,21063
 908  000b 2706          	jreq	L523
 909                     ; 214             status = SET;
 911  000d a601          	ld	a,#1
 912  000f 6b01          	ld	(OFST+0,sp),a
 914  0011 2039          	jra	L133
 915  0013               L523:
 916                     ; 219             status = RESET;
 918  0013 0f01          	clr	(OFST+0,sp)
 919  0015 2035          	jra	L133
 920  0017               L323:
 921                     ; 222     else if (UART2_FLAG == UART2_FLAG_SBK)
 923  0017 1e02          	ldw	x,(OFST+1,sp)
 924  0019 a30101        	cpw	x,#257
 925  001c 2611          	jrne	L333
 926                     ; 224         if ((UART2->CR2 & (u8)UART2_FLAG) != (u8)0x00)
 928  001e c65245        	ld	a,21061
 929  0021 1503          	bcp	a,(OFST+2,sp)
 930  0023 2706          	jreq	L533
 931                     ; 227             status = SET;
 933  0025 a601          	ld	a,#1
 934  0027 6b01          	ld	(OFST+0,sp),a
 936  0029 2021          	jra	L133
 937  002b               L533:
 938                     ; 232             status = RESET;
 940  002b 0f01          	clr	(OFST+0,sp)
 941  002d 201d          	jra	L133
 942  002f               L333:
 943                     ; 235     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
 945  002f 1e02          	ldw	x,(OFST+1,sp)
 946  0031 a30302        	cpw	x,#770
 947  0034 2707          	jreq	L543
 949  0036 1e02          	ldw	x,(OFST+1,sp)
 950  0038 a30301        	cpw	x,#769
 951  003b 2614          	jrne	L343
 952  003d               L543:
 953                     ; 237         if ((UART2->CR6 & (u8)UART2_FLAG) != (u8)0x00)
 955  003d c65249        	ld	a,21065
 956  0040 1503          	bcp	a,(OFST+2,sp)
 957  0042 2706          	jreq	L743
 958                     ; 240             status = SET;
 960  0044 a601          	ld	a,#1
 961  0046 6b01          	ld	(OFST+0,sp),a
 963  0048 2002          	jra	L133
 964  004a               L743:
 965                     ; 245             status = RESET;
 967  004a 0f01          	clr	(OFST+0,sp)
 968  004c               L133:
 969                     ; 263     return  status;
 971  004c 7b01          	ld	a,(OFST+0,sp)
 974  004e 5b03          	addw	sp,#3
 975  0050 81            	ret
 976  0051               L343:
 977                     ; 250         if ((UART2->SR & (u8)UART2_FLAG) != (u8)0x00)
 979  0051 c65240        	ld	a,21056
 980  0054 1503          	bcp	a,(OFST+2,sp)
 981  0056 2706          	jreq	L553
 982                     ; 253             status = SET;
 984  0058 a601          	ld	a,#1
 985  005a 6b01          	ld	(OFST+0,sp),a
 987  005c 20ee          	jra	L133
 988  005e               L553:
 989                     ; 258             status = RESET;
 991  005e 0f01          	clr	(OFST+0,sp)
 992  0060 20ea          	jra	L133
1005                     	xdef	_UART2_GetFlagStatus
1006                     	xdef	_UART2_SendData8
1007                     	xdef	_UART2_ReceiveData8
1008                     	xdef	_UART2_Init
1009                     	xdef	_UART2_DeInit
1010                     	xref	_CLK_GetClockFreq
1011                     	xref.b	c_lreg
1012                     	xref.b	c_x
1031                     	xref	c_lursh
1032                     	xref	c_lsub
1033                     	xref	c_smul
1034                     	xref	c_ludv
1035                     	xref	c_rtol
1036                     	xref	c_llsh
1037                     	xref	c_ltor
1038                     	end
