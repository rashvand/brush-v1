   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  18                     .const:	section	.text
  19  0000               _HSIDivFactor:
  20  0000 01            	dc.b	1
  21  0001 02            	dc.b	2
  22  0002 04            	dc.b	4
  23  0003 08            	dc.b	8
  24  0004               _CLKPrescTable:
  25  0004 01            	dc.b	1
  26  0005 02            	dc.b	2
  27  0006 04            	dc.b	4
  28  0007 08            	dc.b	8
  29  0008 0a            	dc.b	10
  30  0009 10            	dc.b	16
  31  000a 14            	dc.b	20
  32  000b 28            	dc.b	40
  61                     ; 64 void CLK_DeInit(void)
  61                     ; 65 {
  63                     .text:	section	.text,new
  64  0000               _CLK_DeInit:
  68                     ; 67     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  70  0000 350150c0      	mov	20672,#1
  71                     ; 68     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  73  0004 725f50c1      	clr	20673
  74                     ; 69     CLK->SWR  = CLK_SWR_RESET_VALUE;
  76  0008 35e150c4      	mov	20676,#225
  77                     ; 70     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  79  000c 725f50c5      	clr	20677
  80                     ; 71     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  82  0010 351850c6      	mov	20678,#24
  83                     ; 72     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  85  0014 35ff50c7      	mov	20679,#255
  86                     ; 73     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  88  0018 35ff50ca      	mov	20682,#255
  89                     ; 74     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  91  001c 725f50c8      	clr	20680
  92                     ; 75     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  94  0020 725f50c9      	clr	20681
  96  0024               L52:
  97                     ; 76     while (CLK->CCOR & CLK_CCOR_CCOEN)
  99  0024 c650c9        	ld	a,20681
 100  0027 a501          	bcp	a,#1
 101  0029 26f9          	jrne	L52
 102                     ; 78     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 104  002b 725f50c9      	clr	20681
 105                     ; 79     CLK->CANCCR = CLK_CANCCR_RESET_VALUE;
 107  002f 725f50cb      	clr	20683
 108                     ; 80     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 110  0033 725f50cc      	clr	20684
 111                     ; 81     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 113  0037 725f50cd      	clr	20685
 114                     ; 83 }
 117  003b 81            	ret
 173                     ; 94 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 173                     ; 95 {
 174                     .text:	section	.text,new
 175  0000               _CLK_FastHaltWakeUpCmd:
 179                     ; 98     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 181                     ; 100     if (NewState != DISABLE)
 183  0000 4d            	tnz	a
 184  0001 2706          	jreq	L75
 185                     ; 103         CLK->ICKR |= CLK_ICKR_FHWU;
 187  0003 721450c0      	bset	20672,#2
 189  0007 2004          	jra	L16
 190  0009               L75:
 191                     ; 108         CLK->ICKR &= (u8)(~CLK_ICKR_FHWU);
 193  0009 721550c0      	bres	20672,#2
 194  000d               L16:
 195                     ; 111 }
 198  000d 81            	ret
 233                     ; 118 void CLK_HSECmd(FunctionalState NewState)
 233                     ; 119 {
 234                     .text:	section	.text,new
 235  0000               _CLK_HSECmd:
 239                     ; 122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 241                     ; 124     if (NewState != DISABLE)
 243  0000 4d            	tnz	a
 244  0001 2706          	jreq	L101
 245                     ; 127         CLK->ECKR |= CLK_ECKR_HSEEN;
 247  0003 721050c1      	bset	20673,#0
 249  0007 2004          	jra	L301
 250  0009               L101:
 251                     ; 132         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
 253  0009 721150c1      	bres	20673,#0
 254  000d               L301:
 255                     ; 135 }
 258  000d 81            	ret
 293                     ; 142 void CLK_HSICmd(FunctionalState NewState)
 293                     ; 143 {
 294                     .text:	section	.text,new
 295  0000               _CLK_HSICmd:
 299                     ; 146     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 301                     ; 148     if (NewState != DISABLE)
 303  0000 4d            	tnz	a
 304  0001 2706          	jreq	L321
 305                     ; 151         CLK->ICKR |= CLK_ICKR_HSIEN;
 307  0003 721050c0      	bset	20672,#0
 309  0007 2004          	jra	L521
 310  0009               L321:
 311                     ; 156         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
 313  0009 721150c0      	bres	20672,#0
 314  000d               L521:
 315                     ; 159 }
 318  000d 81            	ret
 353                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 353                     ; 167 {
 354                     .text:	section	.text,new
 355  0000               _CLK_LSICmd:
 359                     ; 170     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 361                     ; 172     if (NewState != DISABLE)
 363  0000 4d            	tnz	a
 364  0001 2706          	jreq	L541
 365                     ; 175         CLK->ICKR |= CLK_ICKR_LSIEN;
 367  0003 721650c0      	bset	20672,#3
 369  0007 2004          	jra	L741
 370  0009               L541:
 371                     ; 180         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
 373  0009 721750c0      	bres	20672,#3
 374  000d               L741:
 375                     ; 183 }
 378  000d 81            	ret
 413                     ; 191 void CLK_CCOCmd(FunctionalState NewState)
 413                     ; 192 {
 414                     .text:	section	.text,new
 415  0000               _CLK_CCOCmd:
 419                     ; 195     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 421                     ; 197     if (NewState != DISABLE)
 423  0000 4d            	tnz	a
 424  0001 2706          	jreq	L761
 425                     ; 200         CLK->CCOR |= CLK_CCOR_CCOEN;
 427  0003 721050c9      	bset	20681,#0
 429  0007 2004          	jra	L171
 430  0009               L761:
 431                     ; 205         CLK->CCOR &= (u8)(~CLK_CCOR_CCOEN);
 433  0009 721150c9      	bres	20681,#0
 434  000d               L171:
 435                     ; 208 }
 438  000d 81            	ret
 473                     ; 217 void CLK_ClockSwitchCmd(FunctionalState NewState)
 473                     ; 218 {
 474                     .text:	section	.text,new
 475  0000               _CLK_ClockSwitchCmd:
 479                     ; 221     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 481                     ; 223     if (NewState != DISABLE )
 483  0000 4d            	tnz	a
 484  0001 2706          	jreq	L112
 485                     ; 226         CLK->SWCR |= CLK_SWCR_SWEN;
 487  0003 721250c5      	bset	20677,#1
 489  0007 2004          	jra	L312
 490  0009               L112:
 491                     ; 231         CLK->SWCR &= (u8)(~CLK_SWCR_SWEN);
 493  0009 721350c5      	bres	20677,#1
 494  000d               L312:
 495                     ; 234 }
 498  000d 81            	ret
 534                     ; 244 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 534                     ; 245 {
 535                     .text:	section	.text,new
 536  0000               _CLK_SlowActiveHaltWakeUpCmd:
 540                     ; 248     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 542                     ; 250     if (NewState != DISABLE)
 544  0000 4d            	tnz	a
 545  0001 2706          	jreq	L332
 546                     ; 253         CLK->ICKR |= CLK_ICKR_SWUAH;
 548  0003 721a50c0      	bset	20672,#5
 550  0007 2004          	jra	L532
 551  0009               L332:
 552                     ; 258         CLK->ICKR &= (u8)(~CLK_ICKR_SWUAH);
 554  0009 721b50c0      	bres	20672,#5
 555  000d               L532:
 556                     ; 261 }
 559  000d 81            	ret
 718                     ; 271 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 718                     ; 272 {
 719                     .text:	section	.text,new
 720  0000               _CLK_PeripheralClockConfig:
 722  0000 89            	pushw	x
 723       00000000      OFST:	set	0
 726                     ; 275     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 728                     ; 276     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 730                     ; 278     if (((u8)CLK_Peripheral & (u8)0x10) == 0x00)
 732  0001 9e            	ld	a,xh
 733  0002 a510          	bcp	a,#16
 734  0004 2633          	jrne	L123
 735                     ; 280         if (NewState != DISABLE)
 737  0006 0d02          	tnz	(OFST+2,sp)
 738  0008 2717          	jreq	L323
 739                     ; 283             CLK->PCKENR1 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 741  000a 7b01          	ld	a,(OFST+1,sp)
 742  000c a40f          	and	a,#15
 743  000e 5f            	clrw	x
 744  000f 97            	ld	xl,a
 745  0010 a601          	ld	a,#1
 746  0012 5d            	tnzw	x
 747  0013 2704          	jreq	L62
 748  0015               L03:
 749  0015 48            	sll	a
 750  0016 5a            	decw	x
 751  0017 26fc          	jrne	L03
 752  0019               L62:
 753  0019 ca50c7        	or	a,20679
 754  001c c750c7        	ld	20679,a
 756  001f 2049          	jra	L723
 757  0021               L323:
 758                     ; 288             CLK->PCKENR1 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 760  0021 7b01          	ld	a,(OFST+1,sp)
 761  0023 a40f          	and	a,#15
 762  0025 5f            	clrw	x
 763  0026 97            	ld	xl,a
 764  0027 a601          	ld	a,#1
 765  0029 5d            	tnzw	x
 766  002a 2704          	jreq	L23
 767  002c               L43:
 768  002c 48            	sll	a
 769  002d 5a            	decw	x
 770  002e 26fc          	jrne	L43
 771  0030               L23:
 772  0030 43            	cpl	a
 773  0031 c450c7        	and	a,20679
 774  0034 c750c7        	ld	20679,a
 775  0037 2031          	jra	L723
 776  0039               L123:
 777                     ; 293         if (NewState != DISABLE)
 779  0039 0d02          	tnz	(OFST+2,sp)
 780  003b 2717          	jreq	L133
 781                     ; 296             CLK->PCKENR2 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 783  003d 7b01          	ld	a,(OFST+1,sp)
 784  003f a40f          	and	a,#15
 785  0041 5f            	clrw	x
 786  0042 97            	ld	xl,a
 787  0043 a601          	ld	a,#1
 788  0045 5d            	tnzw	x
 789  0046 2704          	jreq	L63
 790  0048               L04:
 791  0048 48            	sll	a
 792  0049 5a            	decw	x
 793  004a 26fc          	jrne	L04
 794  004c               L63:
 795  004c ca50ca        	or	a,20682
 796  004f c750ca        	ld	20682,a
 798  0052 2016          	jra	L723
 799  0054               L133:
 800                     ; 301             CLK->PCKENR2 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 802  0054 7b01          	ld	a,(OFST+1,sp)
 803  0056 a40f          	and	a,#15
 804  0058 5f            	clrw	x
 805  0059 97            	ld	xl,a
 806  005a a601          	ld	a,#1
 807  005c 5d            	tnzw	x
 808  005d 2704          	jreq	L24
 809  005f               L44:
 810  005f 48            	sll	a
 811  0060 5a            	decw	x
 812  0061 26fc          	jrne	L44
 813  0063               L24:
 814  0063 43            	cpl	a
 815  0064 c450ca        	and	a,20682
 816  0067 c750ca        	ld	20682,a
 817  006a               L723:
 818                     ; 305 }
 821  006a 85            	popw	x
 822  006b 81            	ret
1008                     ; 318 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1008                     ; 319 {
1009                     .text:	section	.text,new
1010  0000               _CLK_ClockSwitchConfig:
1012  0000 89            	pushw	x
1013  0001 5204          	subw	sp,#4
1014       00000004      OFST:	set	4
1017                     ; 322     u16 DownCounter = CLK_TIMEOUT;
1019  0003 ae0491        	ldw	x,#1169
1020  0006 1f03          	ldw	(OFST-1,sp),x
1021                     ; 323     ErrorStatus Swif = ERROR;
1023                     ; 326     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1025                     ; 327     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1027                     ; 328     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1029                     ; 329     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1031                     ; 332     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1033  0008 c650c3        	ld	a,20675
1034  000b 6b01          	ld	(OFST-3,sp),a
1035                     ; 335     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1037  000d 7b05          	ld	a,(OFST+1,sp)
1038  000f a101          	cp	a,#1
1039  0011 2639          	jrne	L344
1040                     ; 339         CLK->SWCR |= CLK_SWCR_SWEN;
1042  0013 721250c5      	bset	20677,#1
1043                     ; 342         if (ITState != DISABLE)
1045  0017 0d09          	tnz	(OFST+5,sp)
1046  0019 2706          	jreq	L544
1047                     ; 344             CLK->SWCR |= CLK_SWCR_SWIEN;
1049  001b 721450c5      	bset	20677,#2
1051  001f 2004          	jra	L744
1052  0021               L544:
1053                     ; 348             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1055  0021 721550c5      	bres	20677,#2
1056  0025               L744:
1057                     ; 352         CLK->SWR = (u8)CLK_NewClock;
1059  0025 7b06          	ld	a,(OFST+2,sp)
1060  0027 c750c4        	ld	20676,a
1062  002a 2007          	jra	L554
1063  002c               L154:
1064                     ; 356             DownCounter--;
1066  002c 1e03          	ldw	x,(OFST-1,sp)
1067  002e 1d0001        	subw	x,#1
1068  0031 1f03          	ldw	(OFST-1,sp),x
1069  0033               L554:
1070                     ; 354         while (((CLK->SWCR & CLK_SWCR_SWBSY) && (DownCounter != 0)))
1072  0033 c650c5        	ld	a,20677
1073  0036 a501          	bcp	a,#1
1074  0038 2704          	jreq	L164
1076  003a 1e03          	ldw	x,(OFST-1,sp)
1077  003c 26ee          	jrne	L154
1078  003e               L164:
1079                     ; 359         if (DownCounter != 0)
1081  003e 1e03          	ldw	x,(OFST-1,sp)
1082  0040 2706          	jreq	L364
1083                     ; 361             Swif = SUCCESS;
1085  0042 a601          	ld	a,#1
1086  0044 6b02          	ld	(OFST-2,sp),a
1088  0046 201b          	jra	L764
1089  0048               L364:
1090                     ; 365             Swif = ERROR;
1092  0048 0f02          	clr	(OFST-2,sp)
1093  004a 2017          	jra	L764
1094  004c               L344:
1095                     ; 373         if (ITState != DISABLE)
1097  004c 0d09          	tnz	(OFST+5,sp)
1098  004e 2706          	jreq	L174
1099                     ; 375             CLK->SWCR |= CLK_SWCR_SWIEN;
1101  0050 721450c5      	bset	20677,#2
1103  0054 2004          	jra	L374
1104  0056               L174:
1105                     ; 379             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1107  0056 721550c5      	bres	20677,#2
1108  005a               L374:
1109                     ; 383         CLK->SWR = (u8)CLK_NewClock;
1111  005a 7b06          	ld	a,(OFST+2,sp)
1112  005c c750c4        	ld	20676,a
1113                     ; 387         Swif = SUCCESS;
1115  005f a601          	ld	a,#1
1116  0061 6b02          	ld	(OFST-2,sp),a
1117  0063               L764:
1118                     ; 392     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1120  0063 0d0a          	tnz	(OFST+6,sp)
1121  0065 260c          	jrne	L574
1123  0067 7b01          	ld	a,(OFST-3,sp)
1124  0069 a1e1          	cp	a,#225
1125  006b 2606          	jrne	L574
1126                     ; 394         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
1128  006d 721150c0      	bres	20672,#0
1130  0071 201e          	jra	L774
1131  0073               L574:
1132                     ; 396     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1134  0073 0d0a          	tnz	(OFST+6,sp)
1135  0075 260c          	jrne	L105
1137  0077 7b01          	ld	a,(OFST-3,sp)
1138  0079 a1d2          	cp	a,#210
1139  007b 2606          	jrne	L105
1140                     ; 398         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
1142  007d 721750c0      	bres	20672,#3
1144  0081 200e          	jra	L774
1145  0083               L105:
1146                     ; 400     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1148  0083 0d0a          	tnz	(OFST+6,sp)
1149  0085 260a          	jrne	L774
1151  0087 7b01          	ld	a,(OFST-3,sp)
1152  0089 a1b4          	cp	a,#180
1153  008b 2604          	jrne	L774
1154                     ; 402         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
1156  008d 721150c1      	bres	20673,#0
1157  0091               L774:
1158                     ; 405     return(Swif);
1160  0091 7b02          	ld	a,(OFST-2,sp)
1163  0093 5b06          	addw	sp,#6
1164  0095 81            	ret
1302                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1302                     ; 416 {
1303                     .text:	section	.text,new
1304  0000               _CLK_HSIPrescalerConfig:
1306  0000 88            	push	a
1307       00000000      OFST:	set	0
1310                     ; 419     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1312                     ; 422     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1314  0001 c650c6        	ld	a,20678
1315  0004 a4e7          	and	a,#231
1316  0006 c750c6        	ld	20678,a
1317                     ; 425     CLK->CKDIVR |= (u8)HSIPrescaler;
1319  0009 c650c6        	ld	a,20678
1320  000c 1a01          	or	a,(OFST+1,sp)
1321  000e c750c6        	ld	20678,a
1322                     ; 427 }
1325  0011 84            	pop	a
1326  0012 81            	ret
1461                     ; 438 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1461                     ; 439 {
1462                     .text:	section	.text,new
1463  0000               _CLK_CCOConfig:
1465  0000 88            	push	a
1466       00000000      OFST:	set	0
1469                     ; 442     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1471                     ; 445     CLK->CCOR &= (u8)(~CLK_CCOR_CCOSEL);
1473  0001 c650c9        	ld	a,20681
1474  0004 a4e1          	and	a,#225
1475  0006 c750c9        	ld	20681,a
1476                     ; 448     CLK->CCOR |= (u8)CLK_CCO;
1478  0009 c650c9        	ld	a,20681
1479  000c 1a01          	or	a,(OFST+1,sp)
1480  000e c750c9        	ld	20681,a
1481                     ; 451     CLK->CCOR |= CLK_CCOR_CCOEN;
1483  0011 721050c9      	bset	20681,#0
1484                     ; 453 }
1487  0015 84            	pop	a
1488  0016 81            	ret
1553                     ; 463 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1553                     ; 464 {
1554                     .text:	section	.text,new
1555  0000               _CLK_ITConfig:
1557  0000 89            	pushw	x
1558       00000000      OFST:	set	0
1561                     ; 467     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1563                     ; 468     assert_param(IS_CLK_IT_OK(CLK_IT));
1565                     ; 470     if (NewState != DISABLE)
1567  0001 9f            	ld	a,xl
1568  0002 4d            	tnz	a
1569  0003 2719          	jreq	L307
1570                     ; 472         switch (CLK_IT)
1572  0005 9e            	ld	a,xh
1574                     ; 480         default:
1574                     ; 481             break;
1575  0006 a00c          	sub	a,#12
1576  0008 270a          	jreq	L736
1577  000a a010          	sub	a,#16
1578  000c 2624          	jrne	L117
1579                     ; 474         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1579                     ; 475             CLK->SWCR |= CLK_SWCR_SWIEN;
1581  000e 721450c5      	bset	20677,#2
1582                     ; 476             break;
1584  0012 201e          	jra	L117
1585  0014               L736:
1586                     ; 477         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1586                     ; 478             CLK->CSSR |= CLK_CSSR_CSSDIE;
1588  0014 721450c8      	bset	20680,#2
1589                     ; 479             break;
1591  0018 2018          	jra	L117
1592  001a               L146:
1593                     ; 480         default:
1593                     ; 481             break;
1595  001a 2016          	jra	L117
1596  001c               L707:
1598  001c 2014          	jra	L117
1599  001e               L307:
1600                     ; 486         switch (CLK_IT)
1602  001e 7b01          	ld	a,(OFST+1,sp)
1604                     ; 494         default:
1604                     ; 495             break;
1605  0020 a00c          	sub	a,#12
1606  0022 270a          	jreq	L546
1607  0024 a010          	sub	a,#16
1608  0026 260a          	jrne	L117
1609                     ; 488         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1609                     ; 489             CLK->SWCR  &= (u8)(~CLK_SWCR_SWIEN);
1611  0028 721550c5      	bres	20677,#2
1612                     ; 490             break;
1614  002c 2004          	jra	L117
1615  002e               L546:
1616                     ; 491         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1616                     ; 492             CLK->CSSR &= (u8)(~CLK_CSSR_CSSDIE);
1618  002e 721550c8      	bres	20680,#2
1619                     ; 493             break;
1620  0032               L117:
1621                     ; 499 }
1624  0032 85            	popw	x
1625  0033 81            	ret
1626  0034               L746:
1627                     ; 494         default:
1627                     ; 495             break;
1629  0034 20fc          	jra	L117
1630  0036               L517:
1631  0036 20fa          	jra	L117
1666                     ; 506 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef ClockPrescaler)
1666                     ; 507 {
1667                     .text:	section	.text,new
1668  0000               _CLK_SYSCLKConfig:
1670  0000 88            	push	a
1671       00000000      OFST:	set	0
1674                     ; 510     assert_param(IS_CLK_PRESCALER_OK(ClockPrescaler));
1676                     ; 512     if (((u8)ClockPrescaler & (u8)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1678  0001 a580          	bcp	a,#128
1679  0003 2614          	jrne	L537
1680                     ; 514         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1682  0005 c650c6        	ld	a,20678
1683  0008 a4e7          	and	a,#231
1684  000a c750c6        	ld	20678,a
1685                     ; 515         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_HSIDIV);
1687  000d 7b01          	ld	a,(OFST+1,sp)
1688  000f a418          	and	a,#24
1689  0011 ca50c6        	or	a,20678
1690  0014 c750c6        	ld	20678,a
1692  0017 2012          	jra	L737
1693  0019               L537:
1694                     ; 519         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
1696  0019 c650c6        	ld	a,20678
1697  001c a4f8          	and	a,#248
1698  001e c750c6        	ld	20678,a
1699                     ; 520         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_CPUDIV);
1701  0021 7b01          	ld	a,(OFST+1,sp)
1702  0023 a407          	and	a,#7
1703  0025 ca50c6        	or	a,20678
1704  0028 c750c6        	ld	20678,a
1705  002b               L737:
1706                     ; 523 }
1709  002b 84            	pop	a
1710  002c 81            	ret
1766                     ; 530 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1766                     ; 531 {
1767                     .text:	section	.text,new
1768  0000               _CLK_SWIMConfig:
1772                     ; 534     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1774                     ; 536     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1776  0000 4d            	tnz	a
1777  0001 2706          	jreq	L767
1778                     ; 539         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1780  0003 721050cd      	bset	20685,#0
1782  0007 2004          	jra	L177
1783  0009               L767:
1784                     ; 544         CLK->SWIMCCR &= (u8)(~CLK_SWIMCCR_SWIMDIV);
1786  0009 721150cd      	bres	20685,#0
1787  000d               L177:
1788                     ; 547 }
1791  000d 81            	ret
1888                     ; 555 void CLK_CANConfig(CLK_CANDivider_TypeDef CLK_CANDivider)
1888                     ; 556 {
1889                     .text:	section	.text,new
1890  0000               _CLK_CANConfig:
1892  0000 88            	push	a
1893       00000000      OFST:	set	0
1896                     ; 559     assert_param(IS_CLK_CANDIVIDER_OK(CLK_CANDivider));
1898                     ; 562     CLK->CANCCR &= (u8)(~CLK_CANCCR_CANDIV);
1900  0001 c650cb        	ld	a,20683
1901  0004 a4f8          	and	a,#248
1902  0006 c750cb        	ld	20683,a
1903                     ; 565     CLK->CANCCR |= (u8)CLK_CANDivider;
1905  0009 c650cb        	ld	a,20683
1906  000c 1a01          	or	a,(OFST+1,sp)
1907  000e c750cb        	ld	20683,a
1908                     ; 567 }
1911  0011 84            	pop	a
1912  0012 81            	ret
1936                     ; 577 void CLK_ClockSecuritySystemEnable(void)
1936                     ; 578 {
1937                     .text:	section	.text,new
1938  0000               _CLK_ClockSecuritySystemEnable:
1942                     ; 580     CLK->CSSR |= CLK_CSSR_CSSEN;
1944  0000 721050c8      	bset	20680,#0
1945                     ; 581 }
1948  0004 81            	ret
1973                     ; 590 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1973                     ; 591 {
1974                     .text:	section	.text,new
1975  0000               _CLK_GetSYSCLKSource:
1979                     ; 592     return((CLK_Source_TypeDef)CLK->CMSR);
1981  0000 c650c3        	ld	a,20675
1984  0003 81            	ret
2041                     ; 602 u32 CLK_GetClockFreq(void)
2041                     ; 603 {
2042                     .text:	section	.text,new
2043  0000               _CLK_GetClockFreq:
2045  0000 5209          	subw	sp,#9
2046       00000009      OFST:	set	9
2049                     ; 605     u32 clockfrequency = 0;
2051                     ; 606     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2053                     ; 607     u8 tmp = 0, presc = 0;
2057                     ; 610     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2059  0002 c650c3        	ld	a,20675
2060  0005 6b09          	ld	(OFST+0,sp),a
2061                     ; 612     if (clocksource == CLK_SOURCE_HSI)
2063  0007 7b09          	ld	a,(OFST+0,sp)
2064  0009 a1e1          	cp	a,#225
2065  000b 2641          	jrne	L1011
2066                     ; 614         tmp = (u8)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2068  000d c650c6        	ld	a,20678
2069  0010 a418          	and	a,#24
2070  0012 6b09          	ld	(OFST+0,sp),a
2071                     ; 615         tmp = (u8)(tmp >> 3);
2073  0014 0409          	srl	(OFST+0,sp)
2074  0016 0409          	srl	(OFST+0,sp)
2075  0018 0409          	srl	(OFST+0,sp)
2076                     ; 616         presc = HSIDivFactor[tmp];
2078  001a 7b09          	ld	a,(OFST+0,sp)
2079  001c 5f            	clrw	x
2080  001d 97            	ld	xl,a
2081  001e d60000        	ld	a,(_HSIDivFactor,x)
2082  0021 6b09          	ld	(OFST+0,sp),a
2083                     ; 617         clockfrequency = HSI_VALUE / presc;
2085  0023 7b09          	ld	a,(OFST+0,sp)
2086  0025 b703          	ld	c_lreg+3,a
2087  0027 3f02          	clr	c_lreg+2
2088  0029 3f01          	clr	c_lreg+1
2089  002b 3f00          	clr	c_lreg
2090  002d 96            	ldw	x,sp
2091  002e 1c0001        	addw	x,#OFST-8
2092  0031 cd0000        	call	c_rtol
2094  0034 ae2400        	ldw	x,#9216
2095  0037 bf02          	ldw	c_lreg+2,x
2096  0039 ae00f4        	ldw	x,#244
2097  003c bf00          	ldw	c_lreg,x
2098  003e 96            	ldw	x,sp
2099  003f 1c0001        	addw	x,#OFST-8
2100  0042 cd0000        	call	c_ludv
2102  0045 96            	ldw	x,sp
2103  0046 1c0005        	addw	x,#OFST-4
2104  0049 cd0000        	call	c_rtol
2107  004c 201c          	jra	L3011
2108  004e               L1011:
2109                     ; 619     else if ( clocksource == CLK_SOURCE_LSI)
2111  004e 7b09          	ld	a,(OFST+0,sp)
2112  0050 a1d2          	cp	a,#210
2113  0052 260c          	jrne	L5011
2114                     ; 621         clockfrequency = LSI_VALUE;
2116  0054 aef400        	ldw	x,#62464
2117  0057 1f07          	ldw	(OFST-2,sp),x
2118  0059 ae0001        	ldw	x,#1
2119  005c 1f05          	ldw	(OFST-4,sp),x
2121  005e 200a          	jra	L3011
2122  0060               L5011:
2123                     ; 625         clockfrequency = HSE_VALUE;
2125  0060 ae2400        	ldw	x,#9216
2126  0063 1f07          	ldw	(OFST-2,sp),x
2127  0065 ae00f4        	ldw	x,#244
2128  0068 1f05          	ldw	(OFST-4,sp),x
2129  006a               L3011:
2130                     ; 628     return((u32)clockfrequency);
2132  006a 96            	ldw	x,sp
2133  006b 1c0005        	addw	x,#OFST-4
2134  006e cd0000        	call	c_ltor
2138  0071 5b09          	addw	sp,#9
2139  0073 81            	ret
2238                     ; 639 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2238                     ; 640 {
2239                     .text:	section	.text,new
2240  0000               _CLK_AdjustHSICalibrationValue:
2242  0000 88            	push	a
2243       00000000      OFST:	set	0
2246                     ; 643     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2248                     ; 646     CLK->HSITRIMR = (u8)((CLK->HSITRIMR & (u8)(~CLK_HSITRIMR_HSITRIM))|((u8)CLK_HSICalibrationValue));
2250  0001 c650cc        	ld	a,20684
2251  0004 a4f8          	and	a,#248
2252  0006 1a01          	or	a,(OFST+1,sp)
2253  0008 c750cc        	ld	20684,a
2254                     ; 648 }
2257  000b 84            	pop	a
2258  000c 81            	ret
2282                     ; 660 void CLK_SYSCLKEmergencyClear(void)
2282                     ; 661 {
2283                     .text:	section	.text,new
2284  0000               _CLK_SYSCLKEmergencyClear:
2288                     ; 662     CLK->SWCR &= (u8)(~CLK_SWCR_SWBSY);
2290  0000 721150c5      	bres	20677,#0
2291                     ; 663 }
2294  0004 81            	ret
2443                     ; 672 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2443                     ; 673 {
2444                     .text:	section	.text,new
2445  0000               _CLK_GetFlagStatus:
2447  0000 89            	pushw	x
2448  0001 5203          	subw	sp,#3
2449       00000003      OFST:	set	3
2452                     ; 675     u16 statusreg = 0;
2454                     ; 676     u8 tmpreg = 0;
2456                     ; 677     FlagStatus bitstatus = RESET;
2458                     ; 680     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2460                     ; 683     statusreg = (u16)((u16)CLK_FLAG & (u16)0xFF00);
2462  0003 01            	rrwa	x,a
2463  0004 9f            	ld	a,xl
2464  0005 a4ff          	and	a,#255
2465  0007 97            	ld	xl,a
2466  0008 4f            	clr	a
2467  0009 02            	rlwa	x,a
2468  000a 1f01          	ldw	(OFST-2,sp),x
2469  000c 01            	rrwa	x,a
2470                     ; 686     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2472  000d 1e01          	ldw	x,(OFST-2,sp)
2473  000f a30100        	cpw	x,#256
2474  0012 2607          	jrne	L7421
2475                     ; 688         tmpreg = CLK->ICKR;
2477  0014 c650c0        	ld	a,20672
2478  0017 6b03          	ld	(OFST+0,sp),a
2480  0019 202f          	jra	L1521
2481  001b               L7421:
2482                     ; 690     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2484  001b 1e01          	ldw	x,(OFST-2,sp)
2485  001d a30200        	cpw	x,#512
2486  0020 2607          	jrne	L3521
2487                     ; 692         tmpreg = CLK->ECKR;
2489  0022 c650c1        	ld	a,20673
2490  0025 6b03          	ld	(OFST+0,sp),a
2492  0027 2021          	jra	L1521
2493  0029               L3521:
2494                     ; 694     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2496  0029 1e01          	ldw	x,(OFST-2,sp)
2497  002b a30300        	cpw	x,#768
2498  002e 2607          	jrne	L7521
2499                     ; 696         tmpreg = CLK->SWCR;
2501  0030 c650c5        	ld	a,20677
2502  0033 6b03          	ld	(OFST+0,sp),a
2504  0035 2013          	jra	L1521
2505  0037               L7521:
2506                     ; 698     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2508  0037 1e01          	ldw	x,(OFST-2,sp)
2509  0039 a30400        	cpw	x,#1024
2510  003c 2607          	jrne	L3621
2511                     ; 700         tmpreg = CLK->CSSR;
2513  003e c650c8        	ld	a,20680
2514  0041 6b03          	ld	(OFST+0,sp),a
2516  0043 2005          	jra	L1521
2517  0045               L3621:
2518                     ; 704         tmpreg = CLK->CCOR;
2520  0045 c650c9        	ld	a,20681
2521  0048 6b03          	ld	(OFST+0,sp),a
2522  004a               L1521:
2523                     ; 707     if ((tmpreg & (u8)CLK_FLAG) != (u8)RESET)
2525  004a 7b05          	ld	a,(OFST+2,sp)
2526  004c 1503          	bcp	a,(OFST+0,sp)
2527  004e 2706          	jreq	L7621
2528                     ; 709         bitstatus = SET;
2530  0050 a601          	ld	a,#1
2531  0052 6b03          	ld	(OFST+0,sp),a
2533  0054 2002          	jra	L1721
2534  0056               L7621:
2535                     ; 713         bitstatus = RESET;
2537  0056 0f03          	clr	(OFST+0,sp)
2538  0058               L1721:
2539                     ; 717     return((FlagStatus)bitstatus);
2541  0058 7b03          	ld	a,(OFST+0,sp)
2544  005a 5b05          	addw	sp,#5
2545  005c 81            	ret
2591                     ; 727 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2591                     ; 728 {
2592                     .text:	section	.text,new
2593  0000               _CLK_GetITStatus:
2595  0000 88            	push	a
2596  0001 88            	push	a
2597       00000001      OFST:	set	1
2600                     ; 730     ITStatus bitstatus = RESET;
2602                     ; 733     assert_param(IS_CLK_IT_OK(CLK_IT));
2604                     ; 735     if (CLK_IT == CLK_IT_SWIF)
2606  0002 a11c          	cp	a,#28
2607  0004 2611          	jrne	L5131
2608                     ; 738         if ((CLK->SWCR & (u8)CLK_IT) == (u8)0x0C)
2610  0006 c450c5        	and	a,20677
2611  0009 a10c          	cp	a,#12
2612  000b 2606          	jrne	L7131
2613                     ; 740             bitstatus = SET;
2615  000d a601          	ld	a,#1
2616  000f 6b01          	ld	(OFST+0,sp),a
2618  0011 2015          	jra	L3231
2619  0013               L7131:
2620                     ; 744             bitstatus = RESET;
2622  0013 0f01          	clr	(OFST+0,sp)
2623  0015 2011          	jra	L3231
2624  0017               L5131:
2625                     ; 750         if ((CLK->CSSR & (u8)CLK_IT) == (u8)0x0C)
2627  0017 c650c8        	ld	a,20680
2628  001a 1402          	and	a,(OFST+1,sp)
2629  001c a10c          	cp	a,#12
2630  001e 2606          	jrne	L5231
2631                     ; 752             bitstatus = SET;
2633  0020 a601          	ld	a,#1
2634  0022 6b01          	ld	(OFST+0,sp),a
2636  0024 2002          	jra	L3231
2637  0026               L5231:
2638                     ; 756             bitstatus = RESET;
2640  0026 0f01          	clr	(OFST+0,sp)
2641  0028               L3231:
2642                     ; 761     return bitstatus;
2644  0028 7b01          	ld	a,(OFST+0,sp)
2647  002a 85            	popw	x
2648  002b 81            	ret
2684                     ; 771 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2684                     ; 772 {
2685                     .text:	section	.text,new
2686  0000               _CLK_ClearITPendingBit:
2690                     ; 775     assert_param(IS_CLK_IT_OK(CLK_IT));
2692                     ; 777     if (CLK_IT == (u8)CLK_IT_CSSD)
2694  0000 a10c          	cp	a,#12
2695  0002 2606          	jrne	L7431
2696                     ; 780         CLK->CSSR &= (u8)(~CLK_CSSR_CSSD);
2698  0004 721750c8      	bres	20680,#3
2700  0008 2004          	jra	L1531
2701  000a               L7431:
2702                     ; 785         CLK->SWCR &= (u8)(~CLK_SWCR_SWIF);
2704  000a 721750c5      	bres	20677,#3
2705  000e               L1531:
2706                     ; 788 }
2709  000e 81            	ret
2744                     	xdef	_CLKPrescTable
2745                     	xdef	_HSIDivFactor
2746                     	xdef	_CLK_ClearITPendingBit
2747                     	xdef	_CLK_GetITStatus
2748                     	xdef	_CLK_GetFlagStatus
2749                     	xdef	_CLK_GetSYSCLKSource
2750                     	xdef	_CLK_GetClockFreq
2751                     	xdef	_CLK_AdjustHSICalibrationValue
2752                     	xdef	_CLK_SYSCLKEmergencyClear
2753                     	xdef	_CLK_ClockSecuritySystemEnable
2754                     	xdef	_CLK_CANConfig
2755                     	xdef	_CLK_SWIMConfig
2756                     	xdef	_CLK_SYSCLKConfig
2757                     	xdef	_CLK_ITConfig
2758                     	xdef	_CLK_CCOConfig
2759                     	xdef	_CLK_HSIPrescalerConfig
2760                     	xdef	_CLK_ClockSwitchConfig
2761                     	xdef	_CLK_PeripheralClockConfig
2762                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2763                     	xdef	_CLK_FastHaltWakeUpCmd
2764                     	xdef	_CLK_ClockSwitchCmd
2765                     	xdef	_CLK_CCOCmd
2766                     	xdef	_CLK_LSICmd
2767                     	xdef	_CLK_HSICmd
2768                     	xdef	_CLK_HSECmd
2769                     	xdef	_CLK_DeInit
2770                     	xref.b	c_lreg
2771                     	xref.b	c_x
2790                     	xref	c_ltor
2791                     	xref	c_ludv
2792                     	xref	c_rtol
2793                     	end
