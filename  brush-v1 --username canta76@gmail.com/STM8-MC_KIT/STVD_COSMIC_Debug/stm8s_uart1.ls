   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  58                     ; 64 void UART1_DeInit(void)
  58                     ; 65 {
  60                     	switch	.text
  61  0000               _UART1_DeInit:
  63       00000001      OFST:	set	1
  66                     ; 66   u8 dummy = 0;
  68                     ; 70   dummy = UART1->SR;
  70  0000 c65230        	ld	a,21040
  71                     ; 71   dummy = UART1->DR;
  73  0003 c65231        	ld	a,21041
  74                     ; 73   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /*< Set UART1_BRR2 to reset value 0x00 */
  76  0006 725f5233      	clr	21043
  77                     ; 74   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /*< Set UART1_BRR1 to reset value 0x00 */
  79  000a 725f5232      	clr	21042
  80                     ; 76   UART1->CR1 = UART1_CR1_RESET_VALUE; /*< Set UART1_CR1 to reset value 0x00  */
  82  000e 725f5234      	clr	21044
  83                     ; 77   UART1->CR2 = UART1_CR2_RESET_VALUE; /*< Set UART1_CR2 to reset value 0x00  */
  85  0012 725f5235      	clr	21045
  86                     ; 78   UART1->CR3 = UART1_CR3_RESET_VALUE;  /*< Set UART1_CR3 to reset value 0x00  */
  88  0016 725f5236      	clr	21046
  89                     ; 79   UART1->CR4 = UART1_CR4_RESET_VALUE;  /*< Set UART1_CR4 to reset value 0x00  */
  91  001a 725f5237      	clr	21047
  92                     ; 80   UART1->CR5 = UART1_CR5_RESET_VALUE; /*< Set UART1_CR5 to reset value 0x00  */
  94  001e 725f5238      	clr	21048
  95                     ; 82   UART1->GTR = UART1_GTR_RESET_VALUE;
  97  0022 725f5239      	clr	21049
  98                     ; 83   UART1->PSCR = UART1_PSCR_RESET_VALUE;
 100  0026 725f523a      	clr	21050
 101                     ; 84 }
 104  002a 81            	ret	
 407                     .const:	section	.text
 408  0000               L41:
 409  0000 00000064      	dc.l	100
 410                     ; 104 void UART1_Init(u32 BaudRate, UART1_WordLength_TypeDef WordLength, UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 410                     ; 105 {
 411                     	switch	.text
 412  002b               _UART1_Init:
 414       0000000c      OFST:	set	12
 417                     ; 106   u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;
 419                     ; 109   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 421                     ; 111   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 423                     ; 113   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 425                     ; 115   assert_param(IS_UART1_PARITY_OK(Parity));
 427                     ; 118   assert_param(IS_UART1_MODE_OK((u8)Mode));
 429                     ; 122   assert_param(IS_UART1_SYNCMODE_OK((u8)SyncMode));
 431                     ; 124   UART1->CR1 &= (u8)(~UART1_CR1_M);  /**< Clear the word length bit */
 433  002b 72195234      	bres	21044,#4
 434  002f 520c          	subw	sp,#12
 435                     ; 125   UART1->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART1_WordLength value */
 437  0031 c65234        	ld	a,21044
 438  0034 1a13          	or	a,(OFST+7,sp)
 439  0036 c75234        	ld	21044,a
 440                     ; 127   UART1->CR3 &= (u8)(~UART1_CR3_STOP);  /**< Clear the STOP bits */
 442  0039 c65236        	ld	a,21046
 443  003c a4cf          	and	a,#207
 444  003e c75236        	ld	21046,a
 445                     ; 128   UART1->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART1_StopBits value  */
 447  0041 c65236        	ld	a,21046
 448  0044 1a14          	or	a,(OFST+8,sp)
 449  0046 c75236        	ld	21046,a
 450                     ; 130   UART1->CR1 &= (u8)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  /**< Clear the Parity Control bit */
 452  0049 c65234        	ld	a,21044
 453  004c a4f9          	and	a,#249
 454  004e c75234        	ld	21044,a
 455                     ; 131   UART1->CR1 |= (u8)Parity;  /**< Set the Parity Control bit to UART1_Parity value */
 457  0051 c65234        	ld	a,21044
 458  0054 1a15          	or	a,(OFST+9,sp)
 459  0056 c75234        	ld	21044,a
 460                     ; 133   UART1->BRR1 &= (u8)(~UART1_BRR1_DIVM);  /**< Clear the LSB mantissa of UART1DIV  */
 462  0059 725f5232      	clr	21042
 463                     ; 134   UART1->BRR2 &= (u8)(~UART1_BRR2_DIVM);  /**< Clear the MSB mantissa of UART1DIV  */
 465  005d c65233        	ld	a,21043
 466  0060 a40f          	and	a,#15
 467  0062 c75233        	ld	21043,a
 468                     ; 135   UART1->BRR2 &= (u8)(~UART1_BRR2_DIVF);  /**< Clear the Fraction bits of UART1DIV */
 470  0065 c65233        	ld	a,21043
 471  0068 a4f0          	and	a,#240
 472  006a c75233        	ld	21043,a
 473                     ; 138   BaudRate_Mantissa    = ((u32)CLK_GetClockFreq() / (BaudRate << 4));
 475  006d 96            	ldw	x,sp
 476  006e 1c000f        	addw	x,#OFST+3
 477  0071 cd0000        	call	c_ltor
 479  0074 a604          	ld	a,#4
 480  0076 cd0000        	call	c_llsh
 482  0079 96            	ldw	x,sp
 483  007a 5c            	incw	x
 484  007b cd0000        	call	c_rtol
 486  007e cd0000        	call	_CLK_GetClockFreq
 488  0081 96            	ldw	x,sp
 489  0082 5c            	incw	x
 490  0083 cd0000        	call	c_ludv
 492  0086 96            	ldw	x,sp
 493  0087 1c0009        	addw	x,#OFST-3
 494  008a cd0000        	call	c_rtol
 496                     ; 139   BaudRate_Mantissa100 = (((u32)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 498  008d 96            	ldw	x,sp
 499  008e 1c000f        	addw	x,#OFST+3
 500  0091 cd0000        	call	c_ltor
 502  0094 a604          	ld	a,#4
 503  0096 cd0000        	call	c_llsh
 505  0099 96            	ldw	x,sp
 506  009a 5c            	incw	x
 507  009b cd0000        	call	c_rtol
 509  009e cd0000        	call	_CLK_GetClockFreq
 511  00a1 a664          	ld	a,#100
 512  00a3 cd0000        	call	c_smul
 514  00a6 96            	ldw	x,sp
 515  00a7 5c            	incw	x
 516  00a8 cd0000        	call	c_ludv
 518  00ab 96            	ldw	x,sp
 519  00ac 1c0005        	addw	x,#OFST-7
 520  00af cd0000        	call	c_rtol
 522                     ; 140   UART1->BRR2 |= (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (u8)0x0F); /**< Set the fraction of UART1DIV  */
 524  00b2 96            	ldw	x,sp
 525  00b3 1c0009        	addw	x,#OFST-3
 526  00b6 cd0000        	call	c_ltor
 528  00b9 a664          	ld	a,#100
 529  00bb cd0000        	call	c_smul
 531  00be 96            	ldw	x,sp
 532  00bf 5c            	incw	x
 533  00c0 cd0000        	call	c_rtol
 535  00c3 96            	ldw	x,sp
 536  00c4 1c0005        	addw	x,#OFST-7
 537  00c7 cd0000        	call	c_ltor
 539  00ca 96            	ldw	x,sp
 540  00cb 5c            	incw	x
 541  00cc cd0000        	call	c_lsub
 543  00cf a604          	ld	a,#4
 544  00d1 cd0000        	call	c_llsh
 546  00d4 ae0000        	ldw	x,#L41
 547  00d7 cd0000        	call	c_ludv
 549  00da b603          	ld	a,c_lreg+3
 550  00dc a40f          	and	a,#15
 551  00de ca5233        	or	a,21043
 552  00e1 c75233        	ld	21043,a
 553                     ; 141   UART1->BRR2 |= (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0); /**< Set the MSB mantissa of UART1DIV  */
 555  00e4 96            	ldw	x,sp
 556  00e5 1c0009        	addw	x,#OFST-3
 557  00e8 cd0000        	call	c_ltor
 559  00eb a604          	ld	a,#4
 560  00ed cd0000        	call	c_lursh
 562  00f0 b603          	ld	a,c_lreg+3
 563  00f2 a4f0          	and	a,#240
 564  00f4 b703          	ld	c_lreg+3,a
 565  00f6 3f02          	clr	c_lreg+2
 566  00f8 3f01          	clr	c_lreg+1
 567  00fa 3f00          	clr	c_lreg
 568  00fc ca5233        	or	a,21043
 569  00ff c75233        	ld	21043,a
 570                     ; 142   UART1->BRR1 |= (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UART1DIV  */
 572  0102 c65232        	ld	a,21042
 573  0105 1a0c          	or	a,(OFST+0,sp)
 574  0107 c75232        	ld	21042,a
 575                     ; 144   UART1->CR2 &= (u8)~(UART1_CR2_TEN | UART1_CR2_REN); /**< Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits */
 577  010a c65235        	ld	a,21045
 578  010d a4f3          	and	a,#243
 579  010f c75235        	ld	21045,a
 580                     ; 145   UART1->CR3 &= (u8)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); /**< Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
 582  0112 c65236        	ld	a,21046
 583  0115 a4f8          	and	a,#248
 584  0117 c75236        	ld	21046,a
 585                     ; 146   UART1->CR3 |= (u8)((u8)SyncMode & (u8)(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL));  /**< Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
 587  011a 7b16          	ld	a,(OFST+10,sp)
 588  011c a407          	and	a,#7
 589  011e ca5236        	or	a,21046
 590  0121 c75236        	ld	21046,a
 591                     ; 148   if ((u8)Mode & (u8)UART1_MODE_TX_ENABLE)
 593  0124 7b17          	ld	a,(OFST+11,sp)
 594  0126 a504          	bcp	a,#4
 595  0128 2706          	jreq	L102
 596                     ; 150     UART1->CR2 |= (u8)UART1_CR2_TEN;  /**< Set the Transmitter Enable bit */
 598  012a 72165235      	bset	21045,#3
 600  012e 2004          	jra	L302
 601  0130               L102:
 602                     ; 154     UART1->CR2 &= (u8)(~UART1_CR2_TEN);  /**< Clear the Transmitter Disable bit */
 604  0130 72175235      	bres	21045,#3
 605  0134               L302:
 606                     ; 156   if ((u8)Mode & (u8)UART1_MODE_RX_ENABLE)
 608  0134 a508          	bcp	a,#8
 609  0136 2706          	jreq	L502
 610                     ; 158     UART1->CR2 |= (u8)UART1_CR2_REN;  /**< Set the Receiver Enable bit */
 612  0138 72145235      	bset	21045,#2
 614  013c 2004          	jra	L702
 615  013e               L502:
 616                     ; 162     UART1->CR2 &= (u8)(~UART1_CR2_REN);  /**< Clear the Receiver Disable bit */
 618  013e 72155235      	bres	21045,#2
 619  0142               L702:
 620                     ; 165   if ((u8)SyncMode&(u8)UART1_SYNCMODE_CLOCK_DISABLE)
 622  0142 7b16          	ld	a,(OFST+10,sp)
 623  0144 2a06          	jrpl	L112
 624                     ; 167     UART1->CR3 &= (u8)(~UART1_CR3_CKEN); /**< Clear the Clock Enable bit */
 626  0146 72175236      	bres	21046,#3
 628  014a 2008          	jra	L312
 629  014c               L112:
 630                     ; 172     UART1->CR3 |= (u8)((u8)SyncMode & UART1_CR3_CKEN);
 632  014c a408          	and	a,#8
 633  014e ca5236        	or	a,21046
 634  0151 c75236        	ld	21046,a
 635  0154               L312:
 636                     ; 174 }
 639  0154 5b0c          	addw	sp,#12
 640  0156 81            	ret	
 695                     ; 195 void UART1_Cmd(FunctionalState NewState)
 695                     ; 196 {
 696                     	switch	.text
 697  0157               _UART1_Cmd:
 701                     ; 197   if (NewState != DISABLE)
 703  0157 4d            	tnz	a
 704  0158 2705          	jreq	L342
 705                     ; 199     UART1->CR1 &= (u8)(~UART1_CR1_UARTD); /**< UART1 Enable */
 707  015a 721b5234      	bres	21044,#5
 710  015e 81            	ret	
 711  015f               L342:
 712                     ; 203     UART1->CR1 |= UART1_CR1_UARTD;  /**< UART1 Disable (for low power consumption) */
 714  015f 721a5234      	bset	21044,#5
 715                     ; 205 }
 718  0163 81            	ret	
 843                     ; 231 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 843                     ; 232 {
 844                     	switch	.text
 845  0164               _UART1_ITConfig:
 847  0164 89            	pushw	x
 848  0165 89            	pushw	x
 849       00000002      OFST:	set	2
 852                     ; 233   u8 uartreg, itpos = 0x00;
 854                     ; 234   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 856                     ; 235   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 858                     ; 238   uartreg = (u8)(UART1_IT >> (u8)0x08);
 860  0166 9e            	ld	a,xh
 861  0167 6b01          	ld	(OFST-1,sp),a
 862                     ; 240   itpos = (u8)((u8)1 << (u8)((u8)UART1_IT & (u8)0x0F));
 864  0169 9f            	ld	a,xl
 865  016a a40f          	and	a,#15
 866  016c 5f            	clrw	x
 867  016d 97            	ld	xl,a
 868  016e a601          	ld	a,#1
 869  0170 5d            	tnzw	x
 870  0171 2704          	jreq	L22
 871  0173               L42:
 872  0173 48            	sll	a
 873  0174 5a            	decw	x
 874  0175 26fc          	jrne	L42
 875  0177               L22:
 876  0177 6b02          	ld	(OFST+0,sp),a
 877                     ; 242   if (NewState != DISABLE)
 879  0179 7b07          	ld	a,(OFST+5,sp)
 880  017b 271f          	jreq	L523
 881                     ; 245     if (uartreg == 0x01)
 883  017d 7b01          	ld	a,(OFST-1,sp)
 884  017f a101          	cp	a,#1
 885  0181 2607          	jrne	L723
 886                     ; 247       UART1->CR1 |= itpos;
 888  0183 c65234        	ld	a,21044
 889  0186 1a02          	or	a,(OFST+0,sp)
 891  0188 201e          	jp	LC002
 892  018a               L723:
 893                     ; 249     else if (uartreg == 0x02)
 895  018a a102          	cp	a,#2
 896  018c 2607          	jrne	L333
 897                     ; 251       UART1->CR2 |= itpos;
 899  018e c65235        	ld	a,21045
 900  0191 1a02          	or	a,(OFST+0,sp)
 902  0193 2022          	jp	LC003
 903  0195               L333:
 904                     ; 255       UART1->CR4 |= itpos;
 906  0195 c65237        	ld	a,21047
 907  0198 1a02          	or	a,(OFST+0,sp)
 908  019a 2026          	jp	LC001
 909  019c               L523:
 910                     ; 261     if (uartreg == 0x01)
 912  019c 7b01          	ld	a,(OFST-1,sp)
 913  019e a101          	cp	a,#1
 914  01a0 260b          	jrne	L143
 915                     ; 263       UART1->CR1 &= (u8)(~itpos);
 917  01a2 7b02          	ld	a,(OFST+0,sp)
 918  01a4 43            	cpl	a
 919  01a5 c45234        	and	a,21044
 920  01a8               LC002:
 921  01a8 c75234        	ld	21044,a
 923  01ab 2018          	jra	L733
 924  01ad               L143:
 925                     ; 265     else if (uartreg == 0x02)
 927  01ad a102          	cp	a,#2
 928  01af 260b          	jrne	L543
 929                     ; 267       UART1->CR2 &= (u8)(~itpos);
 931  01b1 7b02          	ld	a,(OFST+0,sp)
 932  01b3 43            	cpl	a
 933  01b4 c45235        	and	a,21045
 934  01b7               LC003:
 935  01b7 c75235        	ld	21045,a
 937  01ba 2009          	jra	L733
 938  01bc               L543:
 939                     ; 271       UART1->CR4 &= (u8)(~itpos);
 941  01bc 7b02          	ld	a,(OFST+0,sp)
 942  01be 43            	cpl	a
 943  01bf c45237        	and	a,21047
 944  01c2               LC001:
 945  01c2 c75237        	ld	21047,a
 946  01c5               L733:
 947                     ; 275 }
 950  01c5 5b04          	addw	sp,#4
 951  01c7 81            	ret	
 987                     ; 292 void UART1_HalfDuplexCmd(FunctionalState NewState)
 987                     ; 293 {
 988                     	switch	.text
 989  01c8               _UART1_HalfDuplexCmd:
 993                     ; 294   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 995                     ; 296   if (NewState != DISABLE)
 997  01c8 4d            	tnz	a
 998  01c9 2705          	jreq	L763
 999                     ; 298     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1001  01cb 72165238      	bset	21048,#3
1004  01cf 81            	ret	
1005  01d0               L763:
1006                     ; 302     UART1->CR5 &= (u8)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1008  01d0 72175238      	bres	21048,#3
1009                     ; 304 }
1012  01d4 81            	ret	
1069                     ; 323 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1069                     ; 324 {
1070                     	switch	.text
1071  01d5               _UART1_IrDAConfig:
1075                     ; 325   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1077                     ; 327   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1079  01d5 4d            	tnz	a
1080  01d6 2705          	jreq	L124
1081                     ; 329     UART1->CR5 |= UART1_CR5_IRLP;
1083  01d8 72145238      	bset	21048,#2
1086  01dc 81            	ret	
1087  01dd               L124:
1088                     ; 333     UART1->CR5 &= ((u8)~UART1_CR5_IRLP);
1090  01dd 72155238      	bres	21048,#2
1091                     ; 335 }
1094  01e1 81            	ret	
1129                     ; 354 void UART1_IrDACmd(FunctionalState NewState)
1129                     ; 355 {
1130                     	switch	.text
1131  01e2               _UART1_IrDACmd:
1135                     ; 358   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1137                     ; 360   if (NewState != DISABLE)
1139  01e2 4d            	tnz	a
1140  01e3 2705          	jreq	L344
1141                     ; 363     UART1->CR5 |= UART1_CR5_IREN;
1143  01e5 72125238      	bset	21048,#1
1146  01e9 81            	ret	
1147  01ea               L344:
1148                     ; 368     UART1->CR5 &= ((u8)~UART1_CR5_IREN);
1150  01ea 72135238      	bres	21048,#1
1151                     ; 370 }
1154  01ee 81            	ret	
1213                     ; 388 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1213                     ; 389 {
1214                     	switch	.text
1215  01ef               _UART1_LINBreakDetectionConfig:
1219                     ; 390   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1221                     ; 392   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1223  01ef 4d            	tnz	a
1224  01f0 2705          	jreq	L574
1225                     ; 394     UART1->CR4 |= UART1_CR4_LBDL;
1227  01f2 721a5237      	bset	21047,#5
1230  01f6 81            	ret	
1231  01f7               L574:
1232                     ; 398     UART1->CR4 &= ((u8)~UART1_CR4_LBDL);
1234  01f7 721b5237      	bres	21047,#5
1235                     ; 400 }
1238  01fb 81            	ret	
1273                     ; 418 void UART1_LINCmd(FunctionalState NewState)
1273                     ; 419 {
1274                     	switch	.text
1275  01fc               _UART1_LINCmd:
1279                     ; 420   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1281                     ; 422   if (NewState != DISABLE)
1283  01fc 4d            	tnz	a
1284  01fd 2705          	jreq	L715
1285                     ; 425     UART1->CR3 |= UART1_CR3_LINEN;
1287  01ff 721c5236      	bset	21046,#6
1290  0203 81            	ret	
1291  0204               L715:
1292                     ; 430     UART1->CR3 &= ((u8)~UART1_CR3_LINEN);
1294  0204 721d5236      	bres	21046,#6
1295                     ; 432 }
1298  0208 81            	ret	
1333                     ; 451 void UART1_SmartCardCmd(FunctionalState NewState)
1333                     ; 452 {
1334                     	switch	.text
1335  0209               _UART1_SmartCardCmd:
1339                     ; 453   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1341                     ; 455   if (NewState != DISABLE)
1343  0209 4d            	tnz	a
1344  020a 2705          	jreq	L145
1345                     ; 458     UART1->CR5 |= UART1_CR5_SCEN;
1347  020c 721a5238      	bset	21048,#5
1350  0210 81            	ret	
1351  0211               L145:
1352                     ; 463     UART1->CR5 &= ((u8)(~UART1_CR5_SCEN));
1354  0211 721b5238      	bres	21048,#5
1355                     ; 465 }
1358  0215 81            	ret	
1394                     ; 485 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1394                     ; 486 {
1395                     	switch	.text
1396  0216               _UART1_SmartCardNACKCmd:
1400                     ; 487   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1402                     ; 489   if (NewState != DISABLE)
1404  0216 4d            	tnz	a
1405  0217 2705          	jreq	L365
1406                     ; 492     UART1->CR5 |= UART1_CR5_NACK;
1408  0219 72185238      	bset	21048,#4
1411  021d 81            	ret	
1412  021e               L365:
1413                     ; 497     UART1->CR5 &= ((u8)~(UART1_CR5_NACK));
1415  021e 72195238      	bres	21048,#4
1416                     ; 499 }
1419  0222 81            	ret	
1476                     ; 518 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1476                     ; 519 {
1477                     	switch	.text
1478  0223               _UART1_WakeUpConfig:
1482                     ; 520   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1484                     ; 522   UART1->CR1 &= ((u8)~UART1_CR1_WAKE);
1486  0223 72175234      	bres	21044,#3
1487                     ; 523   UART1->CR1 |= (u8)UART1_WakeUp;
1489  0227 ca5234        	or	a,21044
1490  022a c75234        	ld	21044,a
1491                     ; 524 }
1494  022d 81            	ret	
1530                     ; 541 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1530                     ; 542 {
1531                     	switch	.text
1532  022e               _UART1_ReceiverWakeUpCmd:
1536                     ; 543   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1538                     ; 545   if (NewState != DISABLE)
1540  022e 4d            	tnz	a
1541  022f 2705          	jreq	L336
1542                     ; 548     UART1->CR2 |= UART1_CR2_RWU;
1544  0231 72125235      	bset	21045,#1
1547  0235 81            	ret	
1548  0236               L336:
1549                     ; 553     UART1->CR2 &= ((u8)~UART1_CR2_RWU);
1551  0236 72135235      	bres	21045,#1
1552                     ; 555 }
1555  023a 81            	ret	
1578                     ; 572 u8 UART1_ReceiveData8(void)
1578                     ; 573 {
1579                     	switch	.text
1580  023b               _UART1_ReceiveData8:
1584                     ; 574   return ((u8)UART1->DR);
1586  023b c65231        	ld	a,21041
1589  023e 81            	ret	
1612                     ; 593 u16 UART1_ReceiveData9(void)
1612                     ; 594 {
1613                     	switch	.text
1614  023f               _UART1_ReceiveData9:
1616  023f 89            	pushw	x
1617       00000002      OFST:	set	2
1620                     ; 595   return (u16)( (((u16) UART1->DR) | ((u16)(((u16)( (u16)UART1->CR1 & (u16)UART1_CR1_R8)) << 1))) & ((u16)0x01FF));
1622  0240 c65234        	ld	a,21044
1623  0243 a480          	and	a,#128
1624  0245 5f            	clrw	x
1625  0246 02            	rlwa	x,a
1626  0247 58            	sllw	x
1627  0248 1f01          	ldw	(OFST-1,sp),x
1628  024a 5f            	clrw	x
1629  024b c65231        	ld	a,21041
1630  024e 97            	ld	xl,a
1631  024f 01            	rrwa	x,a
1632  0250 1a02          	or	a,(OFST+0,sp)
1633  0252 01            	rrwa	x,a
1634  0253 1a01          	or	a,(OFST-1,sp)
1635  0255 a401          	and	a,#1
1636  0257 01            	rrwa	x,a
1639  0258 5b02          	addw	sp,#2
1640  025a 81            	ret	
1674                     ; 615 void UART1_SendData8(u8 Data)
1674                     ; 616 {
1675                     	switch	.text
1676  025b               _UART1_SendData8:
1680                     ; 618   UART1->DR = Data;
1682  025b c75231        	ld	21041,a
1683                     ; 619 }
1686  025e 81            	ret	
1720                     ; 638 void UART1_SendData9(u16 Data)
1720                     ; 639 {
1721                     	switch	.text
1722  025f               _UART1_SendData9:
1724  025f 89            	pushw	x
1725       00000000      OFST:	set	0
1728                     ; 641   UART1->CR1 &= ((u8)~UART1_CR1_T8);
1730  0260 721d5234      	bres	21044,#6
1731                     ; 643   UART1->CR1 |= (u8)(((u8)(Data >> 2)) & UART1_CR1_T8);
1733  0264 54            	srlw	x
1734  0265 54            	srlw	x
1735  0266 9f            	ld	a,xl
1736  0267 a440          	and	a,#64
1737  0269 ca5234        	or	a,21044
1738  026c c75234        	ld	21044,a
1739                     ; 645   UART1->DR   = (u8)(Data);
1741  026f 7b02          	ld	a,(OFST+2,sp)
1742  0271 c75231        	ld	21041,a
1743                     ; 646 }
1746  0274 85            	popw	x
1747  0275 81            	ret	
1770                     ; 662 void UART1_SendBreak(void)
1770                     ; 663 {
1771                     	switch	.text
1772  0276               _UART1_SendBreak:
1776                     ; 664   UART1->CR2 |= UART1_CR2_SBK;
1778  0276 72105235      	bset	21045,#0
1779                     ; 665 }
1782  027a 81            	ret	
1816                     ; 685 void UART1_SetAddress(u8 UART1_Address)
1816                     ; 686 {
1817                     	switch	.text
1818  027b               _UART1_SetAddress:
1820  027b 88            	push	a
1821       00000000      OFST:	set	0
1824                     ; 688   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1826                     ; 691   UART1->CR4 &= ((u8)~UART1_CR4_ADD);
1828  027c c65237        	ld	a,21047
1829  027f a4f0          	and	a,#240
1830  0281 c75237        	ld	21047,a
1831                     ; 693   UART1->CR4 |= UART1_Address;
1833  0284 c65237        	ld	a,21047
1834  0287 1a01          	or	a,(OFST+1,sp)
1835  0289 c75237        	ld	21047,a
1836                     ; 694 }
1839  028c 84            	pop	a
1840  028d 81            	ret	
1874                     ; 713 void UART1_SetGuardTime(u8 UART1_GuardTime)
1874                     ; 714 {
1875                     	switch	.text
1876  028e               _UART1_SetGuardTime:
1880                     ; 716   UART1->GTR = UART1_GuardTime;
1882  028e c75239        	ld	21049,a
1883                     ; 717 }
1886  0291 81            	ret	
1920                     ; 751 void UART1_SetPrescaler(u8 UART1_Prescaler)
1920                     ; 752 {
1921                     	switch	.text
1922  0292               _UART1_SetPrescaler:
1926                     ; 754   UART1->PSCR = UART1_Prescaler;
1928  0292 c7523a        	ld	21050,a
1929                     ; 755 }
1932  0295 81            	ret	
2075                     ; 775 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2075                     ; 776 {
2076                     	switch	.text
2077  0296               _UART1_GetFlagStatus:
2079  0296 89            	pushw	x
2080  0297 88            	push	a
2081       00000001      OFST:	set	1
2084                     ; 777   FlagStatus status = RESET;
2086                     ; 780   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2088                     ; 784   if (UART1_FLAG == UART1_FLAG_LBDF)
2090  0298 a30210        	cpw	x,#528
2091  029b 2608          	jrne	L7501
2092                     ; 786     if ((UART1->CR4 & (u8)UART1_FLAG) != (u8)0x00)
2094  029d 9f            	ld	a,xl
2095  029e c45237        	and	a,21047
2096  02a1 271e          	jreq	L5601
2097                     ; 789       status = SET;
2099  02a3 2017          	jp	LC006
2100                     ; 794       status = RESET;
2101  02a5               L7501:
2102                     ; 797   else if (UART1_FLAG == UART1_FLAG_SBK)
2104  02a5 1e02          	ldw	x,(OFST+1,sp)
2105  02a7 a30101        	cpw	x,#257
2106  02aa 2609          	jrne	L7601
2107                     ; 799     if ((UART1->CR2 & (u8)UART1_FLAG) != (u8)0x00)
2109  02ac c65235        	ld	a,21045
2110  02af 1503          	bcp	a,(OFST+2,sp)
2111  02b1 270d          	jreq	L7701
2112                     ; 802       status = SET;
2114  02b3 2007          	jp	LC006
2115                     ; 807       status = RESET;
2116  02b5               L7601:
2117                     ; 812     if ((UART1->SR & (u8)UART1_FLAG) != (u8)0x00)
2119  02b5 c65230        	ld	a,21040
2120  02b8 1503          	bcp	a,(OFST+2,sp)
2121  02ba 2704          	jreq	L7701
2122                     ; 815       status = SET;
2124  02bc               LC006:
2127  02bc a601          	ld	a,#1
2130  02be 2001          	jra	L5601
2131  02c0               L7701:
2132                     ; 820       status = RESET;
2135  02c0 4f            	clr	a
2136  02c1               L5601:
2137                     ; 824   return status;
2141  02c1 5b03          	addw	sp,#3
2142  02c3 81            	ret	
2177                     ; 859 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2177                     ; 860 {
2178                     	switch	.text
2179  02c4               _UART1_ClearFlag:
2183                     ; 861   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2185                     ; 864   if (UART1_FLAG == UART1_FLAG_RXNE)
2187  02c4 a30020        	cpw	x,#32
2188  02c7 2605          	jrne	L1211
2189                     ; 866     UART1->SR = (u8)~(UART1_SR_RXNE);
2191  02c9 35df5230      	mov	21040,#223
2194  02cd 81            	ret	
2195  02ce               L1211:
2196                     ; 871     UART1->CR4 &= (u8)~(UART1_CR4_LBDF);
2198  02ce 72195237      	bres	21047,#4
2199                     ; 873 }
2202  02d2 81            	ret	
2284                     ; 900 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2284                     ; 901 {
2285                     	switch	.text
2286  02d3               _UART1_GetITStatus:
2288  02d3 89            	pushw	x
2289  02d4 89            	pushw	x
2290       00000002      OFST:	set	2
2293                     ; 902   ITStatus pendingbitstatus = RESET;
2295                     ; 903   u8 itpos = 0;
2297                     ; 904   u8 itmask1 = 0;
2299                     ; 905   u8 itmask2 = 0;
2301                     ; 906   u8 enablestatus = 0;
2303                     ; 909   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2305                     ; 912   itpos = (u8)((u8)1 << (u8)((u8)UART1_IT & (u8)0x0F));
2307  02d5 9f            	ld	a,xl
2308  02d6 a40f          	and	a,#15
2309  02d8 5f            	clrw	x
2310  02d9 97            	ld	xl,a
2311  02da a601          	ld	a,#1
2312  02dc 5d            	tnzw	x
2313  02dd 2704          	jreq	L67
2314  02df               L001:
2315  02df 48            	sll	a
2316  02e0 5a            	decw	x
2317  02e1 26fc          	jrne	L001
2318  02e3               L67:
2319  02e3 6b01          	ld	(OFST-1,sp),a
2320                     ; 914   itmask1 = (u8)((u8)UART1_IT >> (u8)4);
2322  02e5 7b04          	ld	a,(OFST+2,sp)
2323  02e7 4e            	swap	a
2324  02e8 a40f          	and	a,#15
2325  02ea 6b02          	ld	(OFST+0,sp),a
2326                     ; 916   itmask2 = (u8)((u8)1 << itmask1);
2328  02ec 5f            	clrw	x
2329  02ed 97            	ld	xl,a
2330  02ee a601          	ld	a,#1
2331  02f0 5d            	tnzw	x
2332  02f1 2704          	jreq	L201
2333  02f3               L401:
2334  02f3 48            	sll	a
2335  02f4 5a            	decw	x
2336  02f5 26fc          	jrne	L401
2337  02f7               L201:
2338  02f7 6b02          	ld	(OFST+0,sp),a
2339                     ; 920   if (UART1_IT == UART1_IT_PE)
2341  02f9 1e03          	ldw	x,(OFST+1,sp)
2342  02fb a30100        	cpw	x,#256
2343  02fe 260c          	jrne	L7611
2344                     ; 923     enablestatus = (u8)((u8)UART1->CR1 & itmask2);
2346  0300 c65234        	ld	a,21044
2347  0303 1402          	and	a,(OFST+0,sp)
2348  0305 6b02          	ld	(OFST+0,sp),a
2349                     ; 926     if (((UART1->SR & itpos) != (u8)0x00) && enablestatus)
2351  0307 c65230        	ld	a,21040
2353                     ; 929       pendingbitstatus = SET;
2355  030a 200f          	jp	LC009
2356                     ; 934       pendingbitstatus = RESET;
2357  030c               L7611:
2358                     ; 938   else if (UART1_IT == UART1_IT_LBDF)
2360  030c a30346        	cpw	x,#838
2361  030f 2616          	jrne	L7711
2362                     ; 941     enablestatus = (u8)((u8)UART1->CR4 & itmask2);
2364  0311 c65237        	ld	a,21047
2365  0314 1402          	and	a,(OFST+0,sp)
2366  0316 6b02          	ld	(OFST+0,sp),a
2367                     ; 943     if (((UART1->CR4 & itpos) != (u8)0x00) && enablestatus)
2369  0318 c65237        	ld	a,21047
2371  031b               LC009:
2372  031b 1501          	bcp	a,(OFST-1,sp)
2373  031d 271a          	jreq	L7021
2374  031f 7b02          	ld	a,(OFST+0,sp)
2375  0321 2716          	jreq	L7021
2376                     ; 946       pendingbitstatus = SET;
2378  0323               LC008:
2381  0323 a601          	ld	a,#1
2383  0325 2013          	jra	L5711
2384                     ; 951       pendingbitstatus = RESET;
2385  0327               L7711:
2386                     ; 957     enablestatus = (u8)((u8)UART1->CR2 & itmask2);
2388  0327 c65235        	ld	a,21045
2389  032a 1402          	and	a,(OFST+0,sp)
2390  032c 6b02          	ld	(OFST+0,sp),a
2391                     ; 959     if (((UART1->SR & itpos) != (u8)0x00) && enablestatus)
2393  032e c65230        	ld	a,21040
2394  0331 1501          	bcp	a,(OFST-1,sp)
2395  0333 2704          	jreq	L7021
2397  0335 7b02          	ld	a,(OFST+0,sp)
2398                     ; 962       pendingbitstatus = SET;
2400  0337 26ea          	jrne	LC008
2401  0339               L7021:
2402                     ; 967       pendingbitstatus = RESET;
2406  0339 4f            	clr	a
2407  033a               L5711:
2408                     ; 972   return  pendingbitstatus;
2412  033a 5b04          	addw	sp,#4
2413  033c 81            	ret	
2449                     ; 1006 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2449                     ; 1007 {
2450                     	switch	.text
2451  033d               _UART1_ClearITPendingBit:
2455                     ; 1008   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_IT));
2457                     ; 1011   if (UART1_IT == UART1_IT_RXNE)
2459  033d a30255        	cpw	x,#597
2460  0340 2605          	jrne	L1321
2461                     ; 1013     UART1->SR = (u8)~(UART1_SR_RXNE);
2463  0342 35df5230      	mov	21040,#223
2466  0346 81            	ret	
2467  0347               L1321:
2468                     ; 1018     UART1->CR4 &= (u8)~(UART1_CR4_LBDF);
2470  0347 72195237      	bres	21047,#4
2471                     ; 1020 }
2474  034b 81            	ret	
2487                     	xref	_CLK_GetClockFreq
2488                     	xdef	_UART1_ClearITPendingBit
2489                     	xdef	_UART1_GetITStatus
2490                     	xdef	_UART1_ClearFlag
2491                     	xdef	_UART1_GetFlagStatus
2492                     	xdef	_UART1_SetPrescaler
2493                     	xdef	_UART1_SetGuardTime
2494                     	xdef	_UART1_SetAddress
2495                     	xdef	_UART1_SendBreak
2496                     	xdef	_UART1_SendData9
2497                     	xdef	_UART1_SendData8
2498                     	xdef	_UART1_ReceiveData9
2499                     	xdef	_UART1_ReceiveData8
2500                     	xdef	_UART1_ReceiverWakeUpCmd
2501                     	xdef	_UART1_WakeUpConfig
2502                     	xdef	_UART1_SmartCardNACKCmd
2503                     	xdef	_UART1_SmartCardCmd
2504                     	xdef	_UART1_LINCmd
2505                     	xdef	_UART1_LINBreakDetectionConfig
2506                     	xdef	_UART1_IrDACmd
2507                     	xdef	_UART1_IrDAConfig
2508                     	xdef	_UART1_HalfDuplexCmd
2509                     	xdef	_UART1_ITConfig
2510                     	xdef	_UART1_Cmd
2511                     	xdef	_UART1_Init
2512                     	xdef	_UART1_DeInit
2513                     	xref.b	c_lreg
2514                     	xref.b	c_x
2533                     	xref	c_lursh
2534                     	xref	c_lsub
2535                     	xref	c_smul
2536                     	xref	c_ludv
2537                     	xref	c_rtol
2538                     	xref	c_llsh
2539                     	xref	c_ltor
2540                     	end
