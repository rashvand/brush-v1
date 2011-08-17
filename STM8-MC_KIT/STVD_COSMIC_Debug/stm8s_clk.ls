   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               _HSIDivFactor:
  21  0000 01            	dc.b	1
  22  0001 02            	dc.b	2
  23  0002 04            	dc.b	4
  24  0003 08            	dc.b	8
  25  0004               _CLKPrescTable:
  26  0004 01            	dc.b	1
  27  0005 02            	dc.b	2
  28  0006 04            	dc.b	4
  29  0007 08            	dc.b	8
  30  0008 0a            	dc.b	10
  31  0009 10            	dc.b	16
  32  000a 14            	dc.b	20
  33  000b 28            	dc.b	40
  62                     ; 83 void CLK_DeInit(void)
  62                     ; 84 {
  64                     	switch	.text
  65  0000               _CLK_DeInit:
  69                     ; 86   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  71  0000 350150c0      	mov	20672,#1
  72                     ; 87   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  74  0004 725f50c1      	clr	20673
  75                     ; 88   CLK->SWR  = CLK_SWR_RESET_VALUE;
  77  0008 35e150c4      	mov	20676,#225
  78                     ; 89   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  80  000c 725f50c5      	clr	20677
  81                     ; 90   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  83  0010 351850c6      	mov	20678,#24
  84                     ; 91   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  86  0014 35ff50c7      	mov	20679,#255
  87                     ; 92   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  89  0018 35ff50ca      	mov	20682,#255
  90                     ; 93   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  92  001c 725f50c8      	clr	20680
  93                     ; 95   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  95  0020 725f50c9      	clr	20681
  97  0024               L52:
  98                     ; 96   while (CLK->CCOR & CLK_CCOR_CCOEN)
 100  0024 720050c9fb    	btjt	20681,#0,L52
 101                     ; 98   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  0029 725f50c9      	clr	20681
 104                     ; 100   CLK->CANCCR = CLK_CANCCR_RESET_VALUE;
 106  002d 725f50cb      	clr	20683
 107                     ; 101   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 109  0031 725f50cc      	clr	20684
 110                     ; 102   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 112  0035 725f50cd      	clr	20685
 113                     ; 104 }
 116  0039 81            	ret	
 172                     ; 123 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 172                     ; 124 {
 173                     	switch	.text
 174  003a               _CLK_FastHaltWakeUpCmd:
 178                     ; 127   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 180                     ; 129   if (NewState != DISABLE)
 182  003a 4d            	tnz	a
 183  003b 2705          	jreq	L75
 184                     ; 132     CLK->ICKR |= CLK_ICKR_FHWU;
 186  003d 721450c0      	bset	20672,#2
 189  0041 81            	ret	
 190  0042               L75:
 191                     ; 137     CLK->ICKR &= (u8)(~CLK_ICKR_FHWU);
 193  0042 721550c0      	bres	20672,#2
 194                     ; 140 }
 197  0046 81            	ret	
 232                     ; 154 void CLK_HSECmd(FunctionalState CLK_NewState)
 232                     ; 155 {
 233                     	switch	.text
 234  0047               _CLK_HSECmd:
 238                     ; 158   assert_param(IS_FUNCTIONALSTATE_OK(CLK_NewState));
 240                     ; 160   if (CLK_NewState != DISABLE)
 242  0047 4d            	tnz	a
 243  0048 2705          	jreq	L101
 244                     ; 163     CLK->ECKR |= CLK_ECKR_HSEEN;
 246  004a 721050c1      	bset	20673,#0
 249  004e 81            	ret	
 250  004f               L101:
 251                     ; 168     CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
 253  004f 721150c1      	bres	20673,#0
 254                     ; 171 }
 257  0053 81            	ret	
 292                     ; 185 void CLK_HSICmd(FunctionalState CLK_NewState)
 292                     ; 186 {
 293                     	switch	.text
 294  0054               _CLK_HSICmd:
 298                     ; 189   assert_param(IS_FUNCTIONALSTATE_OK(CLK_NewState));
 300                     ; 191   if (CLK_NewState != DISABLE)
 302  0054 4d            	tnz	a
 303  0055 2705          	jreq	L321
 304                     ; 194     CLK->ICKR |= CLK_ICKR_HSIEN;
 306  0057 721050c0      	bset	20672,#0
 309  005b 81            	ret	
 310  005c               L321:
 311                     ; 199     CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
 313  005c 721150c0      	bres	20672,#0
 314                     ; 202 }
 317  0060 81            	ret	
 352                     ; 216 void CLK_LSICmd(FunctionalState CLK_NewState)
 352                     ; 217 {
 353                     	switch	.text
 354  0061               _CLK_LSICmd:
 358                     ; 220   assert_param(IS_FUNCTIONALSTATE_OK(CLK_NewState));
 360                     ; 222   if (CLK_NewState != DISABLE)
 362  0061 4d            	tnz	a
 363  0062 2705          	jreq	L541
 364                     ; 225     CLK->ICKR |= CLK_ICKR_LSIEN;
 366  0064 721650c0      	bset	20672,#3
 369  0068 81            	ret	
 370  0069               L541:
 371                     ; 230     CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
 373  0069 721750c0      	bres	20672,#3
 374                     ; 233 }
 377  006d 81            	ret	
 412                     ; 248 void CLK_CCOCmd(FunctionalState CLK_NewState)
 412                     ; 249 {
 413                     	switch	.text
 414  006e               _CLK_CCOCmd:
 418                     ; 252   assert_param(IS_FUNCTIONALSTATE_OK(CLK_NewState));
 420                     ; 254   if (CLK_NewState != DISABLE)
 422  006e 4d            	tnz	a
 423  006f 2705          	jreq	L761
 424                     ; 257     CLK->CCOR |= CLK_CCOR_CCOEN;
 426  0071 721050c9      	bset	20681,#0
 429  0075 81            	ret	
 430  0076               L761:
 431                     ; 262     CLK->CCOR &= (u8)(~CLK_CCOR_CCOEN);
 433  0076 721150c9      	bres	20681,#0
 434                     ; 265 }
 437  007a 81            	ret	
 472                     ; 281 void CLK_ClockSwitchCmd(FunctionalState CLK_NewState)
 472                     ; 282 {
 473                     	switch	.text
 474  007b               _CLK_ClockSwitchCmd:
 478                     ; 285   assert_param(IS_FUNCTIONALSTATE_OK(CLK_NewState));
 480                     ; 287   if (CLK_NewState != DISABLE )
 482  007b 4d            	tnz	a
 483  007c 2705          	jreq	L112
 484                     ; 290     CLK->SWCR |= CLK_SWCR_SWEN;
 486  007e 721250c5      	bset	20677,#1
 489  0082 81            	ret	
 490  0083               L112:
 491                     ; 295     CLK->SWCR &= (u8)(~CLK_SWCR_SWEN);
 493  0083 721350c5      	bres	20677,#1
 494                     ; 298 }
 497  0087 81            	ret	
 533                     ; 315 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 533                     ; 316 {
 534                     	switch	.text
 535  0088               _CLK_SlowActiveHaltWakeUpCmd:
 539                     ; 319   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 541                     ; 321   if (NewState != DISABLE)
 543  0088 4d            	tnz	a
 544  0089 2705          	jreq	L332
 545                     ; 324     CLK->ICKR |= CLK_ICKR_SWUAH;
 547  008b 721a50c0      	bset	20672,#5
 550  008f 81            	ret	
 551  0090               L332:
 552                     ; 329     CLK->ICKR &= (u8)(~CLK_ICKR_SWUAH);
 554  0090 721b50c0      	bres	20672,#5
 555                     ; 332 }
 558  0094 81            	ret	
 693                     ; 349 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState CLK_NewState)
 693                     ; 350 {
 694                     	switch	.text
 695  0095               _CLK_PeripheralClockConfig:
 697  0095 89            	pushw	x
 698       00000000      OFST:	set	0
 701                     ; 353   assert_param(IS_FUNCTIONALSTATE_OK(CLK_NewState));
 703                     ; 354   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 705                     ; 356   if (((u8)CLK_Peripheral & (u8)0x10) == 0x00)
 707  0096 9e            	ld	a,xh
 708  0097 a510          	bcp	a,#16
 709  0099 2630          	jrne	L313
 710                     ; 358     if (CLK_NewState != DISABLE)
 712  009b 7b02          	ld	a,(OFST+2,sp)
 713  009d 2714          	jreq	L513
 714                     ; 361       CLK->PCKENR1 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 716  009f 7b01          	ld	a,(OFST+1,sp)
 717  00a1 a40f          	and	a,#15
 718  00a3 5f            	clrw	x
 719  00a4 97            	ld	xl,a
 720  00a5 a601          	ld	a,#1
 721  00a7 5d            	tnzw	x
 722  00a8 2704          	jreq	L62
 723  00aa               L03:
 724  00aa 48            	sll	a
 725  00ab 5a            	decw	x
 726  00ac 26fc          	jrne	L03
 727  00ae               L62:
 728  00ae ca50c7        	or	a,20679
 730  00b1 2013          	jp	LC002
 731  00b3               L513:
 732                     ; 366       CLK->PCKENR1 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 734  00b3 7b01          	ld	a,(OFST+1,sp)
 735  00b5 a40f          	and	a,#15
 736  00b7 5f            	clrw	x
 737  00b8 97            	ld	xl,a
 738  00b9 a601          	ld	a,#1
 739  00bb 5d            	tnzw	x
 740  00bc 2704          	jreq	L23
 741  00be               L43:
 742  00be 48            	sll	a
 743  00bf 5a            	decw	x
 744  00c0 26fc          	jrne	L43
 745  00c2               L23:
 746  00c2 43            	cpl	a
 747  00c3 c450c7        	and	a,20679
 748  00c6               LC002:
 749  00c6 c750c7        	ld	20679,a
 750  00c9 202e          	jra	L123
 751  00cb               L313:
 752                     ; 371     if (CLK_NewState != DISABLE)
 754  00cb 7b02          	ld	a,(OFST+2,sp)
 755  00cd 2714          	jreq	L323
 756                     ; 374       CLK->PCKENR2 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 758  00cf 7b01          	ld	a,(OFST+1,sp)
 759  00d1 a40f          	and	a,#15
 760  00d3 5f            	clrw	x
 761  00d4 97            	ld	xl,a
 762  00d5 a601          	ld	a,#1
 763  00d7 5d            	tnzw	x
 764  00d8 2704          	jreq	L63
 765  00da               L04:
 766  00da 48            	sll	a
 767  00db 5a            	decw	x
 768  00dc 26fc          	jrne	L04
 769  00de               L63:
 770  00de ca50ca        	or	a,20682
 772  00e1 2013          	jp	LC001
 773  00e3               L323:
 774                     ; 379       CLK->PCKENR2 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 776  00e3 7b01          	ld	a,(OFST+1,sp)
 777  00e5 a40f          	and	a,#15
 778  00e7 5f            	clrw	x
 779  00e8 97            	ld	xl,a
 780  00e9 a601          	ld	a,#1
 781  00eb 5d            	tnzw	x
 782  00ec 2704          	jreq	L24
 783  00ee               L44:
 784  00ee 48            	sll	a
 785  00ef 5a            	decw	x
 786  00f0 26fc          	jrne	L44
 787  00f2               L24:
 788  00f2 43            	cpl	a
 789  00f3 c450ca        	and	a,20682
 790  00f6               LC001:
 791  00f6 c750ca        	ld	20682,a
 792  00f9               L123:
 793                     ; 383 }
 796  00f9 85            	popw	x
 797  00fa 81            	ret	
 985                     ; 405 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState CLK_SwitchIT, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 985                     ; 406 {
 986                     	switch	.text
 987  00fb               _CLK_ClockSwitchConfig:
 989  00fb 89            	pushw	x
 990  00fc 5204          	subw	sp,#4
 991       00000004      OFST:	set	4
 994                     ; 409   u16 DownCounter = CLK_TIMEOUT;
 996  00fe ae0491        	ldw	x,#1169
 997  0101 1f03          	ldw	(OFST-1,sp),x
 998                     ; 410   ErrorStatus Swif = ERROR;
1000                     ; 413   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1002                     ; 414   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1004                     ; 415   assert_param(IS_FUNCTIONALSTATE_OK(CLK_SwitchIT));
1006                     ; 416   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1008                     ; 419   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1010  0103 c650c3        	ld	a,20675
1011  0106 6b01          	ld	(OFST-3,sp),a
1012                     ; 422   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1014  0108 7b05          	ld	a,(OFST+1,sp)
1015  010a 4a            	dec	a
1016  010b 262d          	jrne	L734
1017                     ; 426     CLK->SWCR |= CLK_SWCR_SWEN;
1019  010d 721250c5      	bset	20677,#1
1020                     ; 429     if (CLK_SwitchIT != DISABLE)
1022  0111 7b09          	ld	a,(OFST+5,sp)
1023  0113 2706          	jreq	L144
1024                     ; 431       CLK->SWCR |= CLK_SWCR_SWIEN;
1026  0115 721450c5      	bset	20677,#2
1028  0119 2004          	jra	L344
1029  011b               L144:
1030                     ; 435       CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1032  011b 721550c5      	bres	20677,#2
1033  011f               L344:
1034                     ; 439     CLK->SWR = (u8)CLK_NewClock;
1036  011f 7b06          	ld	a,(OFST+2,sp)
1037  0121 c750c4        	ld	20676,a
1039  0124 2003          	jra	L154
1040  0126               L544:
1041                     ; 443       DownCounter--;
1043  0126 5a            	decw	x
1044  0127 1f03          	ldw	(OFST-1,sp),x
1045  0129               L154:
1046                     ; 441     while (((CLK->SWCR & CLK_SWCR_SWBSY) && (DownCounter != 0)))
1048  0129 720150c504    	btjf	20677,#0,L554
1050  012e 1e03          	ldw	x,(OFST-1,sp)
1051  0130 26f4          	jrne	L544
1052  0132               L554:
1053                     ; 446     if (DownCounter != 0)
1055  0132 1e03          	ldw	x,(OFST-1,sp)
1056                     ; 448       Swif = SUCCESS;
1058  0134 2617          	jrne	LC003
1059                     ; 452       Swif = ERROR;
1061  0136 0f02          	clr	(OFST-2,sp)
1062  0138 2017          	jra	L364
1063  013a               L734:
1064                     ; 460     if (CLK_SwitchIT != DISABLE)
1066  013a 7b09          	ld	a,(OFST+5,sp)
1067  013c 2706          	jreq	L564
1068                     ; 462       CLK->SWCR |= CLK_SWCR_SWIEN;
1070  013e 721450c5      	bset	20677,#2
1072  0142 2004          	jra	L764
1073  0144               L564:
1074                     ; 466       CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1076  0144 721550c5      	bres	20677,#2
1077  0148               L764:
1078                     ; 470     CLK->SWR = (u8)CLK_NewClock;
1080  0148 7b06          	ld	a,(OFST+2,sp)
1081  014a c750c4        	ld	20676,a
1082                     ; 474     Swif = SUCCESS;
1084  014d               LC003:
1086  014d a601          	ld	a,#1
1087  014f 6b02          	ld	(OFST-2,sp),a
1088  0151               L364:
1089                     ; 479   if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1091  0151 7b0a          	ld	a,(OFST+6,sp)
1092  0153 260c          	jrne	L174
1094  0155 7b01          	ld	a,(OFST-3,sp)
1095  0157 a1e1          	cp	a,#225
1096  0159 2606          	jrne	L174
1097                     ; 481     CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
1099  015b 721150c0      	bres	20672,#0
1101  015f 201e          	jra	L374
1102  0161               L174:
1103                     ; 483   else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1105  0161 7b0a          	ld	a,(OFST+6,sp)
1106  0163 260c          	jrne	L574
1108  0165 7b01          	ld	a,(OFST-3,sp)
1109  0167 a1d2          	cp	a,#210
1110  0169 2606          	jrne	L574
1111                     ; 485     CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
1113  016b 721750c0      	bres	20672,#3
1115  016f 200e          	jra	L374
1116  0171               L574:
1117                     ; 487   else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1119  0171 7b0a          	ld	a,(OFST+6,sp)
1120  0173 260a          	jrne	L374
1122  0175 7b01          	ld	a,(OFST-3,sp)
1123  0177 a1b4          	cp	a,#180
1124  0179 2604          	jrne	L374
1125                     ; 489     CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
1127  017b 721150c1      	bres	20673,#0
1128  017f               L374:
1129                     ; 492   return(Swif);
1131  017f 7b02          	ld	a,(OFST-2,sp)
1134  0181 5b06          	addw	sp,#6
1135  0183 81            	ret	
1273                     ; 509 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1273                     ; 510 {
1274                     	switch	.text
1275  0184               _CLK_HSIPrescalerConfig:
1277  0184 88            	push	a
1278       00000000      OFST:	set	0
1281                     ; 513   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1283                     ; 516   CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1285  0185 c650c6        	ld	a,20678
1286  0188 a4e7          	and	a,#231
1287  018a c750c6        	ld	20678,a
1288                     ; 519   CLK->CKDIVR |= (u8)HSIPrescaler;
1290  018d c650c6        	ld	a,20678
1291  0190 1a01          	or	a,(OFST+1,sp)
1292  0192 c750c6        	ld	20678,a
1293                     ; 521 }
1296  0195 84            	pop	a
1297  0196 81            	ret	
1432                     ; 539 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1432                     ; 540 {
1433                     	switch	.text
1434  0197               _CLK_CCOConfig:
1436  0197 88            	push	a
1437       00000000      OFST:	set	0
1440                     ; 543   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1442                     ; 546   CLK->CCOR &= (u8)(~CLK_CCOR_CCOSEL);
1444  0198 c650c9        	ld	a,20681
1445  019b a4e1          	and	a,#225
1446  019d c750c9        	ld	20681,a
1447                     ; 549   CLK->CCOR |= (u8)CLK_CCO;
1449  01a0 c650c9        	ld	a,20681
1450  01a3 1a01          	or	a,(OFST+1,sp)
1451  01a5 c750c9        	ld	20681,a
1452                     ; 552   CLK->CCOR |= CLK_CCOR_CCOEN;
1454                     ; 554 }
1457  01a8 84            	pop	a
1458  01a9 721050c9      	bset	20681,#0
1459  01ad 81            	ret	
1524                     ; 571 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState IT_NewState)
1524                     ; 572 {
1525                     	switch	.text
1526  01ae               _CLK_ITConfig:
1528  01ae 89            	pushw	x
1529       00000000      OFST:	set	0
1532                     ; 575   assert_param(IS_FUNCTIONALSTATE_OK(IT_NewState));
1534                     ; 576   assert_param(IS_CLK_IT_OK(CLK_IT));
1536                     ; 578   if (IT_NewState != DISABLE)
1538  01af 9f            	ld	a,xl
1539  01b0 4d            	tnz	a
1540  01b1 2715          	jreq	L776
1541                     ; 580     switch (CLK_IT)
1543  01b3 9e            	ld	a,xh
1545                     ; 588       default:
1545                     ; 589         break;
1546  01b4 a00c          	sub	a,#12
1547  01b6 270a          	jreq	L336
1548  01b8 a010          	sub	a,#16
1549  01ba 2620          	jrne	L507
1550                     ; 582       case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1550                     ; 583         CLK->SWCR |= CLK_SWCR_SWIEN;
1552  01bc 721450c5      	bset	20677,#2
1553                     ; 584         break;
1555  01c0 201a          	jra	L507
1556  01c2               L336:
1557                     ; 585       case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1557                     ; 586         CLK->CSSR |= CLK_CSSR_CSSDIE;
1559  01c2 721450c8      	bset	20680,#2
1560                     ; 587         break;
1562  01c6 2014          	jra	L507
1563                     ; 588       default:
1563                     ; 589         break;
1566  01c8               L776:
1567                     ; 594     switch (CLK_IT)
1569  01c8 7b01          	ld	a,(OFST+1,sp)
1571                     ; 602       default:
1571                     ; 603         break;
1572  01ca a00c          	sub	a,#12
1573  01cc 270a          	jreq	L146
1574  01ce a010          	sub	a,#16
1575  01d0 260a          	jrne	L507
1576                     ; 596       case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1576                     ; 597         CLK->SWCR  &= (u8)(~CLK_SWCR_SWIEN);
1578  01d2 721550c5      	bres	20677,#2
1579                     ; 598         break;
1581  01d6 2004          	jra	L507
1582  01d8               L146:
1583                     ; 599       case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1583                     ; 600         CLK->CSSR &= (u8)(~CLK_CSSR_CSSDIE);
1585  01d8 721550c8      	bres	20680,#2
1586                     ; 601         break;
1587  01dc               L507:
1588                     ; 607 }
1591  01dc 85            	popw	x
1592  01dd 81            	ret	
1593                     ; 602       default:
1593                     ; 603         break;
1629                     ; 623 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef ClockPrescaler)
1629                     ; 624 {
1630                     	switch	.text
1631  01de               _CLK_SYSCLKConfig:
1633  01de 88            	push	a
1634       00000000      OFST:	set	0
1637                     ; 627   assert_param(IS_CLK_PRESCALER_OK(ClockPrescaler));
1639                     ; 629   if (((u8)ClockPrescaler & (u8)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1641  01df a580          	bcp	a,#128
1642  01e1 260e          	jrne	L137
1643                     ; 631     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1645  01e3 c650c6        	ld	a,20678
1646  01e6 a4e7          	and	a,#231
1647  01e8 c750c6        	ld	20678,a
1648                     ; 632     CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_HSIDIV);
1650  01eb 7b01          	ld	a,(OFST+1,sp)
1651  01ed a418          	and	a,#24
1653  01ef 200c          	jra	L337
1654  01f1               L137:
1655                     ; 636     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
1657  01f1 c650c6        	ld	a,20678
1658  01f4 a4f8          	and	a,#248
1659  01f6 c750c6        	ld	20678,a
1660                     ; 637     CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_CPUDIV);
1662  01f9 7b01          	ld	a,(OFST+1,sp)
1663  01fb a407          	and	a,#7
1664  01fd               L337:
1665  01fd ca50c6        	or	a,20678
1666  0200 c750c6        	ld	20678,a
1667                     ; 640 }
1670  0203 84            	pop	a
1671  0204 81            	ret	
1727                     ; 654 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1727                     ; 655 {
1728                     	switch	.text
1729  0205               _CLK_SWIMConfig:
1733                     ; 658   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1735                     ; 660   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1737  0205 4d            	tnz	a
1738  0206 2705          	jreq	L367
1739                     ; 663     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1741  0208 721050cd      	bset	20685,#0
1744  020c 81            	ret	
1745  020d               L367:
1746                     ; 668     CLK->SWIMCCR &= (u8)(~CLK_SWIMCCR_SWIMDIV);
1748  020d 721150cd      	bres	20685,#0
1749                     ; 671 }
1752  0211 81            	ret	
1849                     ; 686 void CLK_CANConfig(CLK_CANDivider_TypeDef CLK_CANDivider)
1849                     ; 687 {
1850                     	switch	.text
1851  0212               _CLK_CANConfig:
1853  0212 88            	push	a
1854       00000000      OFST:	set	0
1857                     ; 690   assert_param(IS_CLK_CANDIVIDER_OK(CLK_CANDivider));
1859                     ; 693   CLK->CANCCR &= (u8)(~CLK_CANCCR_CANDIV);
1861  0213 c650cb        	ld	a,20683
1862  0216 a4f8          	and	a,#248
1863  0218 c750cb        	ld	20683,a
1864                     ; 696   CLK->CANCCR |= (u8)CLK_CANDivider;
1866  021b c650cb        	ld	a,20683
1867  021e 1a01          	or	a,(OFST+1,sp)
1868  0220 c750cb        	ld	20683,a
1869                     ; 698 }
1872  0223 84            	pop	a
1873  0224 81            	ret	
1897                     ; 715 void CLK_ClockSecuritySystemEnable(void)
1897                     ; 716 {
1898                     	switch	.text
1899  0225               _CLK_ClockSecuritySystemEnable:
1903                     ; 718   CLK->CSSR |= CLK_CSSR_CSSEN;
1905  0225 721050c8      	bset	20680,#0
1906                     ; 719 }
1909  0229 81            	ret	
1934                     ; 736 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1934                     ; 737 {
1935                     	switch	.text
1936  022a               _CLK_GetSYSCLKSource:
1940                     ; 738   return((CLK_Source_TypeDef)CLK->CMSR);
1942  022a c650c3        	ld	a,20675
1945  022d 81            	ret	
2008                     ; 756 u32 CLK_GetClockFreq(void)
2008                     ; 757 {
2009                     	switch	.text
2010  022e               _CLK_GetClockFreq:
2012  022e 5209          	subw	sp,#9
2013       00000009      OFST:	set	9
2016                     ; 759   u32 clockfrequency = 0;
2018                     ; 760   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2020                     ; 761   u8 tmp = 0, presc = 0;
2024                     ; 764   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2026  0230 c650c3        	ld	a,20675
2027  0233 6b09          	ld	(OFST+0,sp),a
2028                     ; 766   if (clocksource == CLK_SOURCE_HSI)
2030  0235 a1e1          	cp	a,#225
2031  0237 2634          	jrne	L3011
2032                     ; 768     tmp = (u8)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2034  0239 c650c6        	ld	a,20678
2035  023c a418          	and	a,#24
2036  023e 44            	srl	a
2037  023f 44            	srl	a
2038  0240 44            	srl	a
2039                     ; 769     tmp = (u8)(tmp >> 3);
2041                     ; 770     presc = HSIDivFactor[tmp];
2043  0241 5f            	clrw	x
2044  0242 97            	ld	xl,a
2045  0243 d60000        	ld	a,(_HSIDivFactor,x)
2046  0246 6b09          	ld	(OFST+0,sp),a
2047                     ; 771     clockfrequency = HSI_VALUE / presc;
2049  0248 b703          	ld	c_lreg+3,a
2050  024a 3f02          	clr	c_lreg+2
2051  024c 3f01          	clr	c_lreg+1
2052  024e 3f00          	clr	c_lreg
2053  0250 96            	ldw	x,sp
2054  0251 5c            	incw	x
2055  0252 cd0000        	call	c_rtol
2057  0255 ae2400        	ldw	x,#9216
2058  0258 bf02          	ldw	c_lreg+2,x
2059  025a ae00f4        	ldw	x,#244
2060  025d bf00          	ldw	c_lreg,x
2061  025f 96            	ldw	x,sp
2062  0260 5c            	incw	x
2063  0261 cd0000        	call	c_ludv
2065  0264 96            	ldw	x,sp
2066  0265 1c0005        	addw	x,#OFST-4
2067  0268 cd0000        	call	c_rtol
2070  026b 2018          	jra	L5011
2071  026d               L3011:
2072                     ; 773   else if ( clocksource == CLK_SOURCE_LSI)
2074  026d a1d2          	cp	a,#210
2075  026f 260a          	jrne	L7011
2076                     ; 775     clockfrequency = LSI_VALUE;
2078  0271 aef400        	ldw	x,#62464
2079  0274 1f07          	ldw	(OFST-2,sp),x
2080  0276 ae0001        	ldw	x,#1
2082  0279 2008          	jp	LC004
2083  027b               L7011:
2084                     ; 779     clockfrequency = HSE_VALUE;
2086  027b ae2400        	ldw	x,#9216
2087  027e 1f07          	ldw	(OFST-2,sp),x
2088  0280 ae00f4        	ldw	x,#244
2089  0283               LC004:
2090  0283 1f05          	ldw	(OFST-4,sp),x
2091  0285               L5011:
2092                     ; 782   return((u32)clockfrequency);
2094  0285 96            	ldw	x,sp
2095  0286 1c0005        	addw	x,#OFST-4
2096  0289 cd0000        	call	c_ltor
2100  028c 5b09          	addw	sp,#9
2101  028e 81            	ret	
2200                     ; 800 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2200                     ; 801 {
2201                     	switch	.text
2202  028f               _CLK_AdjustHSICalibrationValue:
2204  028f 88            	push	a
2205       00000000      OFST:	set	0
2208                     ; 804   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2210                     ; 807   CLK->HSITRIMR = (u8)((CLK->HSITRIMR & (u8)(~CLK_HSITRIMR_HSITRIM))|((u8)CLK_HSICalibrationValue));
2212  0290 c650cc        	ld	a,20684
2213  0293 a4f8          	and	a,#248
2214  0295 1a01          	or	a,(OFST+1,sp)
2215  0297 c750cc        	ld	20684,a
2216                     ; 809 }
2219  029a 84            	pop	a
2220  029b 81            	ret	
2244                     ; 828 void CLK_SYSCLKEmergencyClear(void)
2244                     ; 829 {
2245                     	switch	.text
2246  029c               _CLK_SYSCLKEmergencyClear:
2250                     ; 830   CLK->SWCR &= (u8)(~CLK_SWCR_SWBSY);
2252  029c 721150c5      	bres	20677,#0
2253                     ; 831 }
2256  02a0 81            	ret	
2409                     ; 847 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2409                     ; 848 {
2410                     	switch	.text
2411  02a1               _CLK_GetFlagStatus:
2413  02a1 89            	pushw	x
2414  02a2 5203          	subw	sp,#3
2415       00000003      OFST:	set	3
2418                     ; 850   u16 statusreg = 0;
2420                     ; 851   u8 tmpreg = 0;
2422                     ; 852   FlagStatus bitstatus = RESET;
2424                     ; 855   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2426                     ; 858   statusreg = (u16)((u16)CLK_FLAG & (u16)0xFF00);
2428  02a4 01            	rrwa	x,a
2429  02a5 4f            	clr	a
2430  02a6 02            	rlwa	x,a
2431  02a7 1f01          	ldw	(OFST-2,sp),x
2432                     ; 861   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2434  02a9 a30100        	cpw	x,#256
2435  02ac 2605          	jrne	L5521
2436                     ; 863     tmpreg = CLK->ICKR;
2438  02ae c650c0        	ld	a,20672
2440  02b1 2021          	jra	L7521
2441  02b3               L5521:
2442                     ; 865   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2444  02b3 a30200        	cpw	x,#512
2445  02b6 2605          	jrne	L1621
2446                     ; 867     tmpreg = CLK->ECKR;
2448  02b8 c650c1        	ld	a,20673
2450  02bb 2017          	jra	L7521
2451  02bd               L1621:
2452                     ; 869   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2454  02bd a30300        	cpw	x,#768
2455  02c0 2605          	jrne	L5621
2456                     ; 871     tmpreg = CLK->SWCR;
2458  02c2 c650c5        	ld	a,20677
2460  02c5 200d          	jra	L7521
2461  02c7               L5621:
2462                     ; 873   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2464  02c7 a30400        	cpw	x,#1024
2465  02ca 2605          	jrne	L1721
2466                     ; 875     tmpreg = CLK->CSSR;
2468  02cc c650c8        	ld	a,20680
2470  02cf 2003          	jra	L7521
2471  02d1               L1721:
2472                     ; 879     tmpreg = CLK->CCOR;
2474  02d1 c650c9        	ld	a,20681
2475  02d4               L7521:
2476  02d4 6b03          	ld	(OFST+0,sp),a
2477                     ; 882   if ((tmpreg & (u8)CLK_FLAG) != (u8)RESET)
2479  02d6 7b05          	ld	a,(OFST+2,sp)
2480  02d8 1503          	bcp	a,(OFST+0,sp)
2481  02da 2704          	jreq	L5721
2482                     ; 884     bitstatus = SET;
2484  02dc a601          	ld	a,#1
2486  02de 2001          	jra	L7721
2487  02e0               L5721:
2488                     ; 888     bitstatus = RESET;
2490  02e0 4f            	clr	a
2491  02e1               L7721:
2492                     ; 892   return((FlagStatus)bitstatus);
2496  02e1 5b05          	addw	sp,#5
2497  02e3 81            	ret	
2543                     ; 913 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2543                     ; 914 {
2544                     	switch	.text
2545  02e4               _CLK_GetITStatus:
2547  02e4 88            	push	a
2548  02e5 88            	push	a
2549       00000001      OFST:	set	1
2552                     ; 916   ITStatus bitstatus = RESET;
2554                     ; 919   assert_param(IS_CLK_IT_OK(CLK_IT));
2556                     ; 921   if (CLK_IT == CLK_IT_SWIF)
2558  02e6 a11c          	cp	a,#28
2559  02e8 2609          	jrne	L3231
2560                     ; 924     if ((CLK->SWCR & (u8)CLK_IT) == (u8)0x0C)
2562  02ea c450c5        	and	a,20677
2563  02ed a10c          	cp	a,#12
2564  02ef 260f          	jrne	L3331
2565                     ; 926       bitstatus = SET;
2567  02f1 2009          	jp	LC006
2568                     ; 930       bitstatus = RESET;
2569  02f3               L3231:
2570                     ; 936     if ((CLK->CSSR & (u8)CLK_IT) == (u8)0x0C)
2572  02f3 c650c8        	ld	a,20680
2573  02f6 1402          	and	a,(OFST+1,sp)
2574  02f8 a10c          	cp	a,#12
2575  02fa 2604          	jrne	L3331
2576                     ; 938       bitstatus = SET;
2578  02fc               LC006:
2580  02fc a601          	ld	a,#1
2582  02fe 2001          	jra	L1331
2583  0300               L3331:
2584                     ; 942       bitstatus = RESET;
2587  0300 4f            	clr	a
2588  0301               L1331:
2589                     ; 947   return bitstatus;
2593  0301 85            	popw	x
2594  0302 81            	ret	
2630                     ; 966 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2630                     ; 967 {
2631                     	switch	.text
2632  0303               _CLK_ClearITPendingBit:
2636                     ; 970   assert_param(IS_CLK_IT_OK(CLK_IT));
2638                     ; 972   if (CLK_IT == (u8)CLK_IT_CSSD)
2640  0303 a10c          	cp	a,#12
2641  0305 2605          	jrne	L5531
2642                     ; 975     CLK->CSSR &= (u8)(~CLK_CSSR_CSSD);
2644  0307 721750c8      	bres	20680,#3
2647  030b 81            	ret	
2648  030c               L5531:
2649                     ; 980     CLK->SWCR &= (u8)(~CLK_SWCR_SWIF);
2651  030c 721750c5      	bres	20677,#3
2652                     ; 983 }
2655  0310 81            	ret	
2690                     	xdef	_CLKPrescTable
2691                     	xdef	_HSIDivFactor
2692                     	xdef	_CLK_ClearITPendingBit
2693                     	xdef	_CLK_GetITStatus
2694                     	xdef	_CLK_GetFlagStatus
2695                     	xdef	_CLK_GetSYSCLKSource
2696                     	xdef	_CLK_GetClockFreq
2697                     	xdef	_CLK_AdjustHSICalibrationValue
2698                     	xdef	_CLK_SYSCLKEmergencyClear
2699                     	xdef	_CLK_ClockSecuritySystemEnable
2700                     	xdef	_CLK_CANConfig
2701                     	xdef	_CLK_SWIMConfig
2702                     	xdef	_CLK_SYSCLKConfig
2703                     	xdef	_CLK_ITConfig
2704                     	xdef	_CLK_CCOConfig
2705                     	xdef	_CLK_HSIPrescalerConfig
2706                     	xdef	_CLK_ClockSwitchConfig
2707                     	xdef	_CLK_PeripheralClockConfig
2708                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2709                     	xdef	_CLK_FastHaltWakeUpCmd
2710                     	xdef	_CLK_ClockSwitchCmd
2711                     	xdef	_CLK_CCOCmd
2712                     	xdef	_CLK_LSICmd
2713                     	xdef	_CLK_HSICmd
2714                     	xdef	_CLK_HSECmd
2715                     	xdef	_CLK_DeInit
2716                     	xref.b	c_lreg
2717                     	xref.b	c_x
2736                     	xref	c_ltor
2737                     	xref	c_ludv
2738                     	xref	c_rtol
2739                     	end
