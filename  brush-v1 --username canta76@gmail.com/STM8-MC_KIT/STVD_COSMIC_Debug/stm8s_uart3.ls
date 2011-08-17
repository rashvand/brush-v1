   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  58                     ; 66 void UART3_DeInit(void)
  58                     ; 67 {
  60                     	switch	.text
  61  0000               _UART3_DeInit:
  63       00000001      OFST:	set	1
  66                     ; 68   u8 dummy = 0;
  68                     ; 71   dummy = UART3->SR;
  70  0000 c65240        	ld	a,21056
  71                     ; 72   dummy = UART3->DR;
  73  0003 c65241        	ld	a,21057
  74                     ; 74   UART3->BRR2 = UART3_BRR2_RESET_VALUE;  /*< Set UART3_BRR2 to reset value 0x00 */
  76  0006 725f5243      	clr	21059
  77                     ; 75   UART3->BRR1 = UART3_BRR1_RESET_VALUE;  /*< Set UART3_BRR1 to reset value 0x00 */
  79  000a 725f5242      	clr	21058
  80                     ; 77   UART3->CR1 = UART3_CR1_RESET_VALUE; /*< Set UART3_CR1 to reset value 0x00  */
  82  000e 725f5244      	clr	21060
  83                     ; 78   UART3->CR2 = UART3_CR2_RESET_VALUE; /*< Set UART3_CR2 to reset value 0x00  */
  85  0012 725f5245      	clr	21061
  86                     ; 79   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*< Set UART3_CR3 to reset value 0x00  */
  88  0016 725f5246      	clr	21062
  89                     ; 80   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*< Set UART3_CR4 to reset value 0x00  */
  91  001a 725f5247      	clr	21063
  92                     ; 81   UART3->CR6 = UART3_CR6_RESET_VALUE; /*< Set UART3_CR6 to reset value 0x00  */
  94  001e 725f5249      	clr	21065
  95                     ; 83 }
  98  0022 81            	ret	
 325                     .const:	section	.text
 326  0000               L41:
 327  0000 00000064      	dc.l	100
 328                     ; 102 void UART3_Init(u32 BaudRate, UART3_WordLength_TypeDef WordLength, UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, UART3_Mode_TypeDef Mode)
 328                     ; 103 {
 329                     	switch	.text
 330  0023               _UART3_Init:
 332       0000000e      OFST:	set	14
 335                     ; 104   u8 BRR2_1, BRR2_2 = 0;
 337                     ; 105   u32 BaudRate_Mantissa, BaudRate_Mantissa100 = 0;
 339                     ; 107   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 341                     ; 109   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 343                     ; 111   assert_param(IS_UART3_PARITY_OK(Parity));
 345                     ; 114   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 347                     ; 117   assert_param(IS_UART3_MODE_OK((u8)Mode));
 349                     ; 122   UART3->CR1 &= (u8)(~UART3_CR1_M);     /**< Clear the word length bit */
 351  0023 72195244      	bres	21060,#4
 352  0027 520e          	subw	sp,#14
 353                     ; 123   UART3->CR1 |= (u8)WordLength; /**< Set the word length bit according to UART3_WordLength value */
 355  0029 c65244        	ld	a,21060
 356  002c 1a15          	or	a,(OFST+7,sp)
 357  002e c75244        	ld	21060,a
 358                     ; 125   UART3->CR3 &= (u8)(~UART3_CR3_STOP);  /**< Clear the STOP bits */
 360  0031 c65246        	ld	a,21062
 361  0034 a4cf          	and	a,#207
 362  0036 c75246        	ld	21062,a
 363                     ; 126   UART3->CR3 |= (u8)StopBits;  /**< Set the STOP bits number according to UART3_StopBits value  */
 365  0039 c65246        	ld	a,21062
 366  003c 1a16          	or	a,(OFST+8,sp)
 367  003e c75246        	ld	21062,a
 368                     ; 128   UART3->CR1 &= (u8)(~(UART3_CR1_PCEN | UART3_CR1_PS));  /**< Clear the Parity Control bit */
 370  0041 c65244        	ld	a,21060
 371  0044 a4f9          	and	a,#249
 372  0046 c75244        	ld	21060,a
 373                     ; 129   UART3->CR1 |= (u8)Parity;     /**< Set the Parity Control bit to UART3_Parity value */
 375  0049 c65244        	ld	a,21060
 376  004c 1a17          	or	a,(OFST+9,sp)
 377  004e c75244        	ld	21060,a
 378                     ; 131   UART3->BRR1 &= (u8)(~UART3_BRR1_DIVM);  /**< Clear the LSB mantissa of UART3DIV  */
 380  0051 725f5242      	clr	21058
 381                     ; 132   UART3->BRR2 &= (u8)(~UART3_BRR2_DIVM);  /**< Clear the MSB mantissa of UART3DIV  */
 383  0055 c65243        	ld	a,21059
 384  0058 a40f          	and	a,#15
 385  005a c75243        	ld	21059,a
 386                     ; 133   UART3->BRR2 &= (u8)(~UART3_BRR2_DIVF);  /**< Clear the Fraction bits of UART3DIV */
 388  005d c65243        	ld	a,21059
 389  0060 a4f0          	and	a,#240
 390  0062 c75243        	ld	21059,a
 391                     ; 136   BaudRate_Mantissa    = ((u32)CLK_GetClockFreq() / (BaudRate << 4));
 393  0065 96            	ldw	x,sp
 394  0066 1c0011        	addw	x,#OFST+3
 395  0069 cd0000        	call	c_ltor
 397  006c a604          	ld	a,#4
 398  006e cd0000        	call	c_llsh
 400  0071 96            	ldw	x,sp
 401  0072 5c            	incw	x
 402  0073 cd0000        	call	c_rtol
 404  0076 cd0000        	call	_CLK_GetClockFreq
 406  0079 96            	ldw	x,sp
 407  007a 5c            	incw	x
 408  007b cd0000        	call	c_ludv
 410  007e 96            	ldw	x,sp
 411  007f 1c000b        	addw	x,#OFST-3
 412  0082 cd0000        	call	c_rtol
 414                     ; 137   BaudRate_Mantissa100 = (((u32)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 416  0085 96            	ldw	x,sp
 417  0086 1c0011        	addw	x,#OFST+3
 418  0089 cd0000        	call	c_ltor
 420  008c a604          	ld	a,#4
 421  008e cd0000        	call	c_llsh
 423  0091 96            	ldw	x,sp
 424  0092 5c            	incw	x
 425  0093 cd0000        	call	c_rtol
 427  0096 cd0000        	call	_CLK_GetClockFreq
 429  0099 a664          	ld	a,#100
 430  009b cd0000        	call	c_smul
 432  009e 96            	ldw	x,sp
 433  009f 5c            	incw	x
 434  00a0 cd0000        	call	c_ludv
 436  00a3 96            	ldw	x,sp
 437  00a4 1c0007        	addw	x,#OFST-7
 438  00a7 cd0000        	call	c_rtol
 440                     ; 139   BRR2_1 = (u8)((u8)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 440                     ; 140                       << 4) / 100) & (u8)0x0F); /**< Set the fraction of UART3DIV  */
 442  00aa 96            	ldw	x,sp
 443  00ab 1c000b        	addw	x,#OFST-3
 444  00ae cd0000        	call	c_ltor
 446  00b1 a664          	ld	a,#100
 447  00b3 cd0000        	call	c_smul
 449  00b6 96            	ldw	x,sp
 450  00b7 5c            	incw	x
 451  00b8 cd0000        	call	c_rtol
 453  00bb 96            	ldw	x,sp
 454  00bc 1c0007        	addw	x,#OFST-7
 455  00bf cd0000        	call	c_ltor
 457  00c2 96            	ldw	x,sp
 458  00c3 5c            	incw	x
 459  00c4 cd0000        	call	c_lsub
 461  00c7 a604          	ld	a,#4
 462  00c9 cd0000        	call	c_llsh
 464  00cc ae0000        	ldw	x,#L41
 465  00cf cd0000        	call	c_ludv
 467  00d2 b603          	ld	a,c_lreg+3
 468  00d4 a40f          	and	a,#15
 469  00d6 6b05          	ld	(OFST-9,sp),a
 470                     ; 141   BRR2_2 = (u8)((BaudRate_Mantissa >> 4) & (u8)0xF0);
 472  00d8 96            	ldw	x,sp
 473  00d9 1c000b        	addw	x,#OFST-3
 474  00dc cd0000        	call	c_ltor
 476  00df a604          	ld	a,#4
 477  00e1 cd0000        	call	c_lursh
 479  00e4 b603          	ld	a,c_lreg+3
 480  00e6 a4f0          	and	a,#240
 481  00e8 b703          	ld	c_lreg+3,a
 482  00ea 3f02          	clr	c_lreg+2
 483  00ec 3f01          	clr	c_lreg+1
 484  00ee 3f00          	clr	c_lreg
 485  00f0 6b06          	ld	(OFST-8,sp),a
 486                     ; 143   UART3->BRR2 = (u8)(BRR2_1 | BRR2_2);
 488  00f2 1a05          	or	a,(OFST-9,sp)
 489  00f4 c75243        	ld	21059,a
 490                     ; 144   UART3->BRR1 = (u8)BaudRate_Mantissa;           /**< Set the LSB mantissa of UART3DIV  */
 492  00f7 7b0e          	ld	a,(OFST+0,sp)
 493  00f9 c75242        	ld	21058,a
 494                     ; 146   if ((u8)Mode&(u8)UART3_MODE_TX_ENABLE)
 496  00fc 7b18          	ld	a,(OFST+10,sp)
 497  00fe a504          	bcp	a,#4
 498  0100 2706          	jreq	L551
 499                     ; 148     UART3->CR2 |= UART3_CR2_TEN;  /**< Set the Transmitter Enable bit */
 501  0102 72165245      	bset	21061,#3
 503  0106 2004          	jra	L751
 504  0108               L551:
 505                     ; 152     UART3->CR2 &= (u8)(~UART3_CR2_TEN);  /**< Clear the Transmitter Disable bit */
 507  0108 72175245      	bres	21061,#3
 508  010c               L751:
 509                     ; 154   if ((u8)Mode & (u8)UART3_MODE_RX_ENABLE)
 511  010c a508          	bcp	a,#8
 512  010e 2706          	jreq	L161
 513                     ; 156     UART3->CR2 |= UART3_CR2_REN;  /**< Set the Receiver Enable bit */
 515  0110 72145245      	bset	21061,#2
 517  0114 2004          	jra	L361
 518  0116               L161:
 519                     ; 160     UART3->CR2 &= (u8)(~UART3_CR2_REN);  /**< Clear the Receiver Disable bit */
 521  0116 72155245      	bres	21061,#2
 522  011a               L361:
 523                     ; 162 }
 526  011a 5b0e          	addw	sp,#14
 527  011c 81            	ret	
 582                     ; 182 void UART3_Cmd(FunctionalState NewState)
 582                     ; 183 {
 583                     	switch	.text
 584  011d               _UART3_Cmd:
 588                     ; 185   if (NewState != DISABLE)
 590  011d 4d            	tnz	a
 591  011e 2705          	jreq	L312
 592                     ; 187     UART3->CR1 &= (u8)(~UART3_CR1_UARTD); /**< UART3 Enable */
 594  0120 721b5244      	bres	21060,#5
 597  0124 81            	ret	
 598  0125               L312:
 599                     ; 191     UART3->CR1 |= UART3_CR1_UARTD;  /**< UART3 Disable (for low power consumption) */
 601  0125 721a5244      	bset	21060,#5
 602                     ; 193 }
 605  0129 81            	ret	
 737                     ; 220 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 737                     ; 221 {
 738                     	switch	.text
 739  012a               _UART3_ITConfig:
 741  012a 89            	pushw	x
 742  012b 89            	pushw	x
 743       00000002      OFST:	set	2
 746                     ; 222   u8 uartreg, itpos = 0x00;
 748                     ; 223   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 750                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 752                     ; 227   uartreg = (u8)(UART3_IT >> 0x08);
 754  012c 9e            	ld	a,xh
 755  012d 6b01          	ld	(OFST-1,sp),a
 756                     ; 230   itpos = (u8)((u8)1 << (u8)((u8)UART3_IT & (u8)0x0F));
 758  012f 9f            	ld	a,xl
 759  0130 a40f          	and	a,#15
 760  0132 5f            	clrw	x
 761  0133 97            	ld	xl,a
 762  0134 a601          	ld	a,#1
 763  0136 5d            	tnzw	x
 764  0137 2704          	jreq	L22
 765  0139               L42:
 766  0139 48            	sll	a
 767  013a 5a            	decw	x
 768  013b 26fc          	jrne	L42
 769  013d               L22:
 770  013d 6b02          	ld	(OFST+0,sp),a
 771                     ; 232   if (NewState != DISABLE)
 773  013f 7b07          	ld	a,(OFST+5,sp)
 774  0141 272a          	jreq	L772
 775                     ; 235     if (uartreg == 0x01)
 777  0143 7b01          	ld	a,(OFST-1,sp)
 778  0145 a101          	cp	a,#1
 779  0147 2607          	jrne	L103
 780                     ; 237       UART3->CR1 |= itpos;
 782  0149 c65244        	ld	a,21060
 783  014c 1a02          	or	a,(OFST+0,sp)
 785  014e 2029          	jp	LC003
 786  0150               L103:
 787                     ; 239     else if (uartreg == 0x02)
 789  0150 a102          	cp	a,#2
 790  0152 2607          	jrne	L503
 791                     ; 241       UART3->CR2 |= itpos;
 793  0154 c65245        	ld	a,21061
 794  0157 1a02          	or	a,(OFST+0,sp)
 796  0159 202d          	jp	LC002
 797  015b               L503:
 798                     ; 243     else if (uartreg == 0x03)
 800  015b a103          	cp	a,#3
 801  015d 2607          	jrne	L113
 802                     ; 245       UART3->CR4 |= itpos;
 804  015f c65247        	ld	a,21063
 805  0162 1a02          	or	a,(OFST+0,sp)
 807  0164 2031          	jp	LC004
 808  0166               L113:
 809                     ; 249       UART3->CR6 |= itpos;
 811  0166 c65249        	ld	a,21065
 812  0169 1a02          	or	a,(OFST+0,sp)
 813  016b 2035          	jp	LC001
 814  016d               L772:
 815                     ; 255     if (uartreg == 0x01)
 817  016d 7b01          	ld	a,(OFST-1,sp)
 818  016f a101          	cp	a,#1
 819  0171 260b          	jrne	L713
 820                     ; 257       UART3->CR1 &= (u8)(~itpos);
 822  0173 7b02          	ld	a,(OFST+0,sp)
 823  0175 43            	cpl	a
 824  0176 c45244        	and	a,21060
 825  0179               LC003:
 826  0179 c75244        	ld	21060,a
 828  017c 2027          	jra	L513
 829  017e               L713:
 830                     ; 259     else if (uartreg == 0x02)
 832  017e a102          	cp	a,#2
 833  0180 260b          	jrne	L323
 834                     ; 261       UART3->CR2 &= (u8)(~itpos);
 836  0182 7b02          	ld	a,(OFST+0,sp)
 837  0184 43            	cpl	a
 838  0185 c45245        	and	a,21061
 839  0188               LC002:
 840  0188 c75245        	ld	21061,a
 842  018b 2018          	jra	L513
 843  018d               L323:
 844                     ; 263     else if (uartreg == 0x03)
 846  018d a103          	cp	a,#3
 847  018f 260b          	jrne	L723
 848                     ; 265       UART3->CR4 &= (u8)(~itpos);
 850  0191 7b02          	ld	a,(OFST+0,sp)
 851  0193 43            	cpl	a
 852  0194 c45247        	and	a,21063
 853  0197               LC004:
 854  0197 c75247        	ld	21063,a
 856  019a 2009          	jra	L513
 857  019c               L723:
 858                     ; 269       UART3->CR6 &= (u8)(~itpos);
 860  019c 7b02          	ld	a,(OFST+0,sp)
 861  019e 43            	cpl	a
 862  019f c45249        	and	a,21065
 863  01a2               LC001:
 864  01a2 c75249        	ld	21065,a
 865  01a5               L513:
 866                     ; 272 }
 869  01a5 5b04          	addw	sp,#4
 870  01a7 81            	ret	
 929                     ; 290 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
 929                     ; 291 {
 930                     	switch	.text
 931  01a8               _UART3_LINBreakDetectionConfig:
 935                     ; 292   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
 937                     ; 294   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
 939  01a8 4d            	tnz	a
 940  01a9 2705          	jreq	L163
 941                     ; 296     UART3->CR4 |= UART3_CR4_LBDL;
 943  01ab 721a5247      	bset	21063,#5
 946  01af 81            	ret	
 947  01b0               L163:
 948                     ; 300     UART3->CR4 &= ((u8)~UART3_CR4_LBDL);
 950  01b0 721b5247      	bres	21063,#5
 951                     ; 302 }
 954  01b4 81            	ret	
1075                     ; 324 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode, UART3_LinAutosync_TypeDef UART3_Autosync, UART3_LinDivUp_TypeDef UART3_DivUp)
1075                     ; 325 {
1076                     	switch	.text
1077  01b5               _UART3_LINConfig:
1079  01b5 89            	pushw	x
1080       00000000      OFST:	set	0
1083                     ; 326   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1085                     ; 328   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1087                     ; 330   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1089                     ; 332   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1091  01b6 9e            	ld	a,xh
1092  01b7 4d            	tnz	a
1093  01b8 2706          	jreq	L344
1094                     ; 334     UART3->CR6 |=  UART3_CR6_LSLV;
1096  01ba 721a5249      	bset	21065,#5
1098  01be 2004          	jra	L544
1099  01c0               L344:
1100                     ; 338     UART3->CR6 &= ((u8)~UART3_CR6_LSLV);
1102  01c0 721b5249      	bres	21065,#5
1103  01c4               L544:
1104                     ; 341   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1106  01c4 7b02          	ld	a,(OFST+2,sp)
1107  01c6 2706          	jreq	L744
1108                     ; 343     UART3->CR6 |=  UART3_CR6_LASE ;
1110  01c8 72185249      	bset	21065,#4
1112  01cc 2004          	jra	L154
1113  01ce               L744:
1114                     ; 347     UART3->CR6 &= ((u8)~ UART3_CR6_LASE );
1116  01ce 72195249      	bres	21065,#4
1117  01d2               L154:
1118                     ; 350   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1120  01d2 7b05          	ld	a,(OFST+5,sp)
1121  01d4 2706          	jreq	L354
1122                     ; 352     UART3->CR6 |=  UART3_CR6_LDUM;
1124  01d6 721e5249      	bset	21065,#7
1126  01da 2004          	jra	L554
1127  01dc               L354:
1128                     ; 356     UART3->CR6 &= ((u8)~ UART3_CR6_LDUM);
1130  01dc 721f5249      	bres	21065,#7
1131  01e0               L554:
1132                     ; 359 }
1135  01e0 85            	popw	x
1136  01e1 81            	ret	
1171                     ; 379 void UART3_LINCmd(FunctionalState NewState)
1171                     ; 380 {
1172                     	switch	.text
1173  01e2               _UART3_LINCmd:
1177                     ; 381   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1179                     ; 383   if (NewState != DISABLE)
1181  01e2 4d            	tnz	a
1182  01e3 2705          	jreq	L574
1183                     ; 386     UART3->CR3 |= UART3_CR3_LINEN;
1185  01e5 721c5246      	bset	21062,#6
1188  01e9 81            	ret	
1189  01ea               L574:
1190                     ; 391     UART3->CR3 &= ((u8)~UART3_CR3_LINEN);
1192  01ea 721d5246      	bres	21062,#6
1193                     ; 393 }
1196  01ee 81            	ret	
1253                     ; 412 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1253                     ; 413 {
1254                     	switch	.text
1255  01ef               _UART3_WakeUpConfig:
1259                     ; 414   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1261                     ; 416   UART3->CR1 &= ((u8)~UART3_CR1_WAKE);
1263  01ef 72175244      	bres	21060,#3
1264                     ; 417   UART3->CR1 |= (u8)UART3_WakeUp;
1266  01f3 ca5244        	or	a,21060
1267  01f6 c75244        	ld	21060,a
1268                     ; 418 }
1271  01f9 81            	ret	
1307                     ; 438 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1307                     ; 439 {
1308                     	switch	.text
1309  01fa               _UART3_ReceiverWakeUpCmd:
1313                     ; 440   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1315                     ; 442   if (NewState != DISABLE)
1317  01fa 4d            	tnz	a
1318  01fb 2705          	jreq	L545
1319                     ; 445     UART3->CR2 |= UART3_CR2_RWU;
1321  01fd 72125245      	bset	21061,#1
1324  0201 81            	ret	
1325  0202               L545:
1326                     ; 450     UART3->CR2 &= ((u8)~UART3_CR2_RWU);
1328  0202 72135245      	bres	21061,#1
1329                     ; 452 }
1332  0206 81            	ret	
1355                     ; 470 u8 UART3_ReceiveData8(void)
1355                     ; 471 {
1356                     	switch	.text
1357  0207               _UART3_ReceiveData8:
1361                     ; 472   return ((u8)UART3->DR);
1363  0207 c65241        	ld	a,21057
1366  020a 81            	ret	
1389                     ; 490 u16 UART3_ReceiveData9(void)
1389                     ; 491 {
1390                     	switch	.text
1391  020b               _UART3_ReceiveData9:
1393  020b 89            	pushw	x
1394       00000002      OFST:	set	2
1397                     ; 492   return (u16)((((u16)UART3->DR) | ((u16)(((u16)((u16)UART3->CR1 & (u16)UART3_CR1_R8)) << 1))) & ((u16)0x01FF));
1399  020c c65244        	ld	a,21060
1400  020f a480          	and	a,#128
1401  0211 5f            	clrw	x
1402  0212 02            	rlwa	x,a
1403  0213 58            	sllw	x
1404  0214 1f01          	ldw	(OFST-1,sp),x
1405  0216 5f            	clrw	x
1406  0217 c65241        	ld	a,21057
1407  021a 97            	ld	xl,a
1408  021b 01            	rrwa	x,a
1409  021c 1a02          	or	a,(OFST+0,sp)
1410  021e 01            	rrwa	x,a
1411  021f 1a01          	or	a,(OFST-1,sp)
1412  0221 a401          	and	a,#1
1413  0223 01            	rrwa	x,a
1416  0224 5b02          	addw	sp,#2
1417  0226 81            	ret	
1451                     ; 514 void UART3_SendData8(u8 Data)
1451                     ; 515 {
1452                     	switch	.text
1453  0227               _UART3_SendData8:
1457                     ; 517   UART3->DR = Data;
1459  0227 c75241        	ld	21057,a
1460                     ; 518 }
1463  022a 81            	ret	
1497                     ; 537 void UART3_SendData9(u16 Data)
1497                     ; 538 {
1498                     	switch	.text
1499  022b               _UART3_SendData9:
1501  022b 89            	pushw	x
1502       00000000      OFST:	set	0
1505                     ; 539   UART3->CR1 &= ((u8)~UART3_CR1_T8);                  /**< Clear the transmit data bit 8     */
1507  022c 721d5244      	bres	21060,#6
1508                     ; 540   UART3->CR1 |= (u8)(((u8)(Data >> 2)) & UART3_CR1_T8); /**< Write the transmit data bit [8]   */
1510  0230 54            	srlw	x
1511  0231 54            	srlw	x
1512  0232 9f            	ld	a,xl
1513  0233 a440          	and	a,#64
1514  0235 ca5244        	or	a,21060
1515  0238 c75244        	ld	21060,a
1516                     ; 541   UART3->DR   = (u8)(Data);                    /**< Write the transmit data bit [0:7] */
1518  023b 7b02          	ld	a,(OFST+2,sp)
1519  023d c75241        	ld	21057,a
1520                     ; 543 }
1523  0240 85            	popw	x
1524  0241 81            	ret	
1547                     ; 558 void UART3_SendBreak(void)
1547                     ; 559 {
1548                     	switch	.text
1549  0242               _UART3_SendBreak:
1553                     ; 560   UART3->CR2 |= UART3_CR2_SBK;
1555  0242 72105245      	bset	21061,#0
1556                     ; 561 }
1559  0246 81            	ret	
1593                     ; 580 void UART3_SetAddress(u8 UART3_Address)
1593                     ; 581 {
1594                     	switch	.text
1595  0247               _UART3_SetAddress:
1597  0247 88            	push	a
1598       00000000      OFST:	set	0
1601                     ; 583   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1603                     ; 586   UART3->CR4 &= ((u8)~UART3_CR4_ADD);
1605  0248 c65247        	ld	a,21063
1606  024b a4f0          	and	a,#240
1607  024d c75247        	ld	21063,a
1608                     ; 588   UART3->CR4 |= UART3_Address;
1610  0250 c65247        	ld	a,21063
1611  0253 1a01          	or	a,(OFST+1,sp)
1612  0255 c75247        	ld	21063,a
1613                     ; 589 }
1616  0258 84            	pop	a
1617  0259 81            	ret	
1774                     ; 609 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
1774                     ; 610 {
1775                     	switch	.text
1776  025a               _UART3_GetFlagStatus:
1778  025a 89            	pushw	x
1779  025b 88            	push	a
1780       00000001      OFST:	set	1
1783                     ; 611   FlagStatus status = RESET;
1785                     ; 614   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
1787                     ; 617   if (UART3_FLAG == UART3_FLAG_LBDF)
1789  025c a30210        	cpw	x,#528
1790  025f 2608          	jrne	L147
1791                     ; 619     if ((UART3->CR4 & (u8)UART3_FLAG) != (u8)0x00)
1793  0261 9f            	ld	a,xl
1794  0262 c45247        	and	a,21063
1795  0265 2728          	jreq	L747
1796                     ; 622       status = SET;
1798  0267 2021          	jp	LC007
1799                     ; 627       status = RESET;
1800  0269               L147:
1801                     ; 630   else if (UART3_FLAG == UART3_FLAG_SBK)
1803  0269 1e02          	ldw	x,(OFST+1,sp)
1804  026b a30101        	cpw	x,#257
1805  026e 2609          	jrne	L157
1806                     ; 632     if ((UART3->CR2 & (u8)UART3_FLAG) != (u8)0x00)
1808  0270 c65245        	ld	a,21061
1809  0273 1503          	bcp	a,(OFST+2,sp)
1810  0275 2717          	jreq	L567
1811                     ; 635       status = SET;
1813  0277 2011          	jp	LC007
1814                     ; 640       status = RESET;
1815  0279               L157:
1816                     ; 643   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
1818  0279 a30302        	cpw	x,#770
1819  027c 2705          	jreq	L367
1821  027e a30301        	cpw	x,#769
1822  0281 260f          	jrne	L167
1823  0283               L367:
1824                     ; 645     if ((UART3->CR6 & (u8)UART3_FLAG) != (u8)0x00)
1826  0283 c65249        	ld	a,21065
1827  0286 1503          	bcp	a,(OFST+2,sp)
1828  0288 2704          	jreq	L567
1829                     ; 648       status = SET;
1831  028a               LC007:
1835  028a a601          	ld	a,#1
1838  028c 2001          	jra	L747
1839  028e               L567:
1840                     ; 653       status = RESET;
1844  028e 4f            	clr	a
1845  028f               L747:
1846                     ; 671   return  status;
1850  028f 5b03          	addw	sp,#3
1851  0291 81            	ret	
1852  0292               L167:
1853                     ; 658     if ((UART3->SR & (u8)UART3_FLAG) != (u8)0x00)
1855  0292 c65240        	ld	a,21056
1856  0295 1503          	bcp	a,(OFST+2,sp)
1857  0297 27f5          	jreq	L567
1858                     ; 661       status = SET;
1860  0299 20ef          	jp	LC007
1861                     ; 666       status = RESET;
1896                     ; 708 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
1896                     ; 709 {
1897                     	switch	.text
1898  029b               _UART3_ClearFlag:
1900  029b 89            	pushw	x
1901       00000000      OFST:	set	0
1904                     ; 710   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
1906                     ; 713   if (UART3_FLAG == UART3_FLAG_RXNE)
1908  029c a30020        	cpw	x,#32
1909  029f 2606          	jrne	L5101
1910                     ; 715     UART3->SR = (u8)~(UART3_SR_RXNE);
1912  02a1 35df5240      	mov	21056,#223
1914  02a5 201c          	jra	L7101
1915  02a7               L5101:
1916                     ; 718   else if (UART3_FLAG == UART3_FLAG_LBDF)
1918  02a7 1e01          	ldw	x,(OFST+1,sp)
1919  02a9 a30210        	cpw	x,#528
1920  02ac 2606          	jrne	L1201
1921                     ; 720     UART3->CR4 &= (u8)(~UART3_CR4_LBDF);
1923  02ae 72195247      	bres	21063,#4
1925  02b2 200f          	jra	L7101
1926  02b4               L1201:
1927                     ; 723   else if (UART3_FLAG == UART3_FLAG_LHDF)
1929  02b4 a30302        	cpw	x,#770
1930  02b7 2606          	jrne	L5201
1931                     ; 725     UART3->CR6 &= (u8)(~UART3_CR6_LHDF);
1933  02b9 72135249      	bres	21065,#1
1935  02bd 2004          	jra	L7101
1936  02bf               L5201:
1937                     ; 730     UART3->CR6 &= (u8)(~UART3_CR6_LSF);
1939  02bf 72115249      	bres	21065,#0
1940  02c3               L7101:
1941                     ; 733 }
1944  02c3 85            	popw	x
1945  02c4 81            	ret	
2027                     ; 760 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2027                     ; 761 {
2028                     	switch	.text
2029  02c5               _UART3_GetITStatus:
2031  02c5 89            	pushw	x
2032  02c6 89            	pushw	x
2033       00000002      OFST:	set	2
2036                     ; 762   ITStatus pendingbitstatus = RESET;
2038                     ; 763   u8 itpos = 0;
2040                     ; 764   u8 itmask1 = 0;
2042                     ; 765   u8 itmask2 = 0;
2044                     ; 766   u8 enablestatus = 0;
2046                     ; 769   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2048                     ; 772   itpos = (u8)((u8)1 << (u8)((u8)UART3_IT & (u8)0x0F));
2050  02c7 9f            	ld	a,xl
2051  02c8 a40f          	and	a,#15
2052  02ca 5f            	clrw	x
2053  02cb 97            	ld	xl,a
2054  02cc a601          	ld	a,#1
2055  02ce 5d            	tnzw	x
2056  02cf 2704          	jreq	L26
2057  02d1               L46:
2058  02d1 48            	sll	a
2059  02d2 5a            	decw	x
2060  02d3 26fc          	jrne	L46
2061  02d5               L26:
2062  02d5 6b01          	ld	(OFST-1,sp),a
2063                     ; 774   itmask1 = (u8)((u8)UART3_IT >> (u8)4);
2065  02d7 7b04          	ld	a,(OFST+2,sp)
2066  02d9 4e            	swap	a
2067  02da a40f          	and	a,#15
2068  02dc 6b02          	ld	(OFST+0,sp),a
2069                     ; 776   itmask2 = (u8)((u8)1 << itmask1);
2071  02de 5f            	clrw	x
2072  02df 97            	ld	xl,a
2073  02e0 a601          	ld	a,#1
2074  02e2 5d            	tnzw	x
2075  02e3 2704          	jreq	L66
2076  02e5               L07:
2077  02e5 48            	sll	a
2078  02e6 5a            	decw	x
2079  02e7 26fc          	jrne	L07
2080  02e9               L66:
2081  02e9 6b02          	ld	(OFST+0,sp),a
2082                     ; 781   if (UART3_IT == UART3_IT_PE)
2084  02eb 1e03          	ldw	x,(OFST+1,sp)
2085  02ed a30100        	cpw	x,#256
2086  02f0 260c          	jrne	L3701
2087                     ; 784     enablestatus = (u8)((u8)UART3->CR1 & itmask2);
2089  02f2 c65244        	ld	a,21060
2090  02f5 1402          	and	a,(OFST+0,sp)
2091  02f7 6b02          	ld	(OFST+0,sp),a
2092                     ; 787     if (((UART3->SR & itpos) != (u8)0x00) && enablestatus)
2094  02f9 c65240        	ld	a,21056
2096                     ; 790       pendingbitstatus = SET;
2098  02fc 2020          	jp	LC010
2099                     ; 795       pendingbitstatus = RESET;
2100  02fe               L3701:
2101                     ; 799   else if (UART3_IT == UART3_IT_LBDF)
2103  02fe a30346        	cpw	x,#838
2104  0301 260c          	jrne	L3011
2105                     ; 802     enablestatus = (u8)((u8)UART3->CR4 & itmask2);
2107  0303 c65247        	ld	a,21063
2108  0306 1402          	and	a,(OFST+0,sp)
2109  0308 6b02          	ld	(OFST+0,sp),a
2110                     ; 804     if (((UART3->CR4 & itpos) != (u8)0x00) && enablestatus)
2112  030a c65247        	ld	a,21063
2114                     ; 807       pendingbitstatus = SET;
2116  030d 200f          	jp	LC010
2117                     ; 812       pendingbitstatus = RESET;
2118  030f               L3011:
2119                     ; 815   else if (UART3_IT == UART3_IT_LHDF)
2121  030f a30412        	cpw	x,#1042
2122  0312 2616          	jrne	L3111
2123                     ; 818     enablestatus = (u8)((u8)UART3->CR6 & itmask2);
2125  0314 c65249        	ld	a,21065
2126  0317 1402          	and	a,(OFST+0,sp)
2127  0319 6b02          	ld	(OFST+0,sp),a
2128                     ; 820     if (((UART3->CR6 & itpos) != (u8)0x00) && enablestatus)
2130  031b c65249        	ld	a,21065
2132  031e               LC010:
2133  031e 1501          	bcp	a,(OFST-1,sp)
2134  0320 271a          	jreq	L3211
2135  0322 7b02          	ld	a,(OFST+0,sp)
2136  0324 2716          	jreq	L3211
2137                     ; 823       pendingbitstatus = SET;
2139  0326               LC009:
2143  0326 a601          	ld	a,#1
2145  0328 2013          	jra	L1011
2146                     ; 828       pendingbitstatus = RESET;
2147  032a               L3111:
2148                     ; 834     enablestatus = (u8)((u8)UART3->CR2 & itmask2);
2150  032a c65245        	ld	a,21061
2151  032d 1402          	and	a,(OFST+0,sp)
2152  032f 6b02          	ld	(OFST+0,sp),a
2153                     ; 836     if (((UART3->SR & itpos) != (u8)0x00) && enablestatus)
2155  0331 c65240        	ld	a,21056
2156  0334 1501          	bcp	a,(OFST-1,sp)
2157  0336 2704          	jreq	L3211
2159  0338 7b02          	ld	a,(OFST+0,sp)
2160                     ; 839       pendingbitstatus = SET;
2162  033a 26ea          	jrne	LC009
2163  033c               L3211:
2164                     ; 844       pendingbitstatus = RESET;
2169  033c 4f            	clr	a
2170  033d               L1011:
2171                     ; 848   return  pendingbitstatus;
2175  033d 5b04          	addw	sp,#4
2176  033f 81            	ret	
2221                     ; 884 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2221                     ; 885 {
2222                     	switch	.text
2223  0340               _UART3_ClearITPendingBit:
2225  0340 89            	pushw	x
2226  0341 88            	push	a
2227       00000001      OFST:	set	1
2230                     ; 886   u8 dummy = 0;
2232  0342 0f01          	clr	(OFST+0,sp)
2233                     ; 887   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2235                     ; 890   if (UART3_IT == UART3_IT_RXNE)
2237  0344 a30255        	cpw	x,#597
2238  0347 2606          	jrne	L1511
2239                     ; 892     UART3->SR = (u8)~(UART3_SR_RXNE);
2241  0349 35df5240      	mov	21056,#223
2243  034d 2011          	jra	L3511
2244  034f               L1511:
2245                     ; 895   else if (UART3_IT == UART3_IT_LBDF)
2247  034f 1e02          	ldw	x,(OFST+1,sp)
2248  0351 a30346        	cpw	x,#838
2249  0354 2606          	jrne	L5511
2250                     ; 897     UART3->CR4 &= (u8)~(UART3_CR4_LBDF);
2252  0356 72195247      	bres	21063,#4
2254  035a 2004          	jra	L3511
2255  035c               L5511:
2256                     ; 902     UART3->CR6 &= (u8)(~UART3_CR6_LHDF);
2258  035c 72135249      	bres	21065,#1
2259  0360               L3511:
2260                     ; 904 }
2263  0360 5b03          	addw	sp,#3
2264  0362 81            	ret	
2277                     	xref	_CLK_GetClockFreq
2278                     	xdef	_UART3_ClearITPendingBit
2279                     	xdef	_UART3_GetITStatus
2280                     	xdef	_UART3_ClearFlag
2281                     	xdef	_UART3_GetFlagStatus
2282                     	xdef	_UART3_SetAddress
2283                     	xdef	_UART3_SendBreak
2284                     	xdef	_UART3_SendData9
2285                     	xdef	_UART3_SendData8
2286                     	xdef	_UART3_ReceiveData9
2287                     	xdef	_UART3_ReceiveData8
2288                     	xdef	_UART3_WakeUpConfig
2289                     	xdef	_UART3_ReceiverWakeUpCmd
2290                     	xdef	_UART3_LINCmd
2291                     	xdef	_UART3_LINConfig
2292                     	xdef	_UART3_LINBreakDetectionConfig
2293                     	xdef	_UART3_ITConfig
2294                     	xdef	_UART3_Cmd
2295                     	xdef	_UART3_Init
2296                     	xdef	_UART3_DeInit
2297                     	xref.b	c_lreg
2298                     	xref.b	c_x
2317                     	xref	c_lursh
2318                     	xref	c_lsub
2319                     	xref	c_smul
2320                     	xref	c_ludv
2321                     	xref	c_rtol
2322                     	xref	c_llsh
2323                     	xref	c_ltor
2324                     	end
