   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  47                     ; 61 void SPI_DeInit(void)
  47                     ; 62 {
  49                     	switch	.text
  50  0000               _SPI_DeInit:
  54                     ; 63   SPI->CR1    = SPI_CR1_RESET_VALUE;
  56  0000 725f5200      	clr	20992
  57                     ; 64   SPI->CR2    = SPI_CR2_RESET_VALUE;
  59  0004 725f5201      	clr	20993
  60                     ; 65   SPI->ICR    = SPI_ICR_RESET_VALUE;
  62  0008 725f5202      	clr	20994
  63                     ; 66   SPI->SR     = SPI_SR_RESET_VALUE;
  65  000c 35025203      	mov	20995,#2
  66                     ; 67   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  68  0010 35075205      	mov	20997,#7
  69                     ; 68 }
  72  0014 81            	ret	
 388                     ; 90 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, u8 CRCPolynomial)
 388                     ; 91 {
 389                     	switch	.text
 390  0015               _SPI_Init:
 392  0015 89            	pushw	x
 393       00000000      OFST:	set	0
 396                     ; 93   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 398                     ; 94   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 400                     ; 95   assert_param(IS_SPI_MODE_OK(Mode));
 402                     ; 96   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 404                     ; 97   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 406                     ; 98   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 408                     ; 99   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 410                     ; 100   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 412                     ; 103   SPI->CR1 = (u8)((u8)(FirstBit) |
 412                     ; 104                   (u8)(BaudRatePrescaler) |
 412                     ; 105                   (u8)(ClockPolarity) |
 412                     ; 106                   (u8)(ClockPhase));
 414  0016 9f            	ld	a,xl
 415  0017 1a01          	or	a,(OFST+1,sp)
 416  0019 1a06          	or	a,(OFST+6,sp)
 417  001b 1a07          	or	a,(OFST+7,sp)
 418  001d c75200        	ld	20992,a
 419                     ; 109   SPI->CR2 = (u8)((u8)(Data_Direction) | (u8)(Slave_Management));
 421  0020 7b08          	ld	a,(OFST+8,sp)
 422  0022 1a09          	or	a,(OFST+9,sp)
 423  0024 c75201        	ld	20993,a
 424                     ; 111   if (Mode == SPI_MODE_MASTER)
 426  0027 7b05          	ld	a,(OFST+5,sp)
 427  0029 a104          	cp	a,#4
 428  002b 2606          	jrne	L302
 429                     ; 113     SPI->CR2 |= (u8)SPI_CR2_SSI;
 431  002d 72105201      	bset	20993,#0
 433  0031 2004          	jra	L502
 434  0033               L302:
 435                     ; 117     SPI->CR2 &= (u8)~(SPI_CR2_SSI);
 437  0033 72115201      	bres	20993,#0
 438  0037               L502:
 439                     ; 121   SPI->CR1 |= (u8)(Mode);
 441  0037 c65200        	ld	a,20992
 442  003a 1a05          	or	a,(OFST+5,sp)
 443  003c c75200        	ld	20992,a
 444                     ; 124   SPI->CRCPR = (u8)CRCPolynomial;
 446  003f 7b0a          	ld	a,(OFST+10,sp)
 447  0041 c75205        	ld	20997,a
 448                     ; 125 }
 451  0044 85            	popw	x
 452  0045 81            	ret	
 507                     ; 143 void SPI_Cmd(FunctionalState NewState)
 507                     ; 144 {
 508                     	switch	.text
 509  0046               _SPI_Cmd:
 513                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 515                     ; 148   if (NewState != DISABLE)
 517  0046 4d            	tnz	a
 518  0047 2705          	jreq	L532
 519                     ; 150     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 521  0049 721c5200      	bset	20992,#6
 524  004d 81            	ret	
 525  004e               L532:
 526                     ; 154     SPI->CR1 &= (u8)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 528  004e 721d5200      	bres	20992,#6
 529                     ; 156 }
 532  0052 81            	ret	
 641                     ; 174 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 641                     ; 175 {
 642                     	switch	.text
 643  0053               _SPI_ITConfig:
 645  0053 89            	pushw	x
 646  0054 88            	push	a
 647       00000001      OFST:	set	1
 650                     ; 176   u8 itpos = 0;
 652                     ; 178   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 654                     ; 179   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 656                     ; 182   itpos = (u8)((u8)1 << (u8)((u8)SPI_IT & (u8)0x0F));
 658  0055 9e            	ld	a,xh
 659  0056 a40f          	and	a,#15
 660  0058 5f            	clrw	x
 661  0059 97            	ld	xl,a
 662  005a a601          	ld	a,#1
 663  005c 5d            	tnzw	x
 664  005d 2704          	jreq	L41
 665  005f               L61:
 666  005f 48            	sll	a
 667  0060 5a            	decw	x
 668  0061 26fc          	jrne	L61
 669  0063               L41:
 670  0063 6b01          	ld	(OFST+0,sp),a
 671                     ; 184   if (NewState != DISABLE)
 673  0065 0d03          	tnz	(OFST+2,sp)
 674  0067 2707          	jreq	L113
 675                     ; 186     SPI->ICR |= itpos; /* Enable interrupt*/
 677  0069 c65202        	ld	a,20994
 678  006c 1a01          	or	a,(OFST+0,sp)
 680  006e 2004          	jra	L313
 681  0070               L113:
 682                     ; 190     SPI->ICR &= (u8)(~itpos); /* Disable interrupt*/
 684  0070 43            	cpl	a
 685  0071 c45202        	and	a,20994
 686  0074               L313:
 687  0074 c75202        	ld	20994,a
 688                     ; 192 }
 691  0077 5b03          	addw	sp,#3
 692  0079 81            	ret	
 726                     ; 206 void SPI_SendData(u8 Data)
 726                     ; 207 {
 727                     	switch	.text
 728  007a               _SPI_SendData:
 732                     ; 208   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 734  007a c75204        	ld	20996,a
 735                     ; 209 }
 738  007d 81            	ret	
 761                     ; 225 u8 SPI_ReceiveData(void)
 761                     ; 226 {
 762                     	switch	.text
 763  007e               _SPI_ReceiveData:
 767                     ; 227   return ((u8)SPI->DR); /* Return the data in the DR register*/
 769  007e c65204        	ld	a,20996
 772  0081 81            	ret	
 808                     ; 246 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 808                     ; 247 {
 809                     	switch	.text
 810  0082               _SPI_NSSInternalSoftwareCmd:
 814                     ; 249   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 816                     ; 251   if (NewState != DISABLE)
 818  0082 4d            	tnz	a
 819  0083 2705          	jreq	L163
 820                     ; 253     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 822  0085 72105201      	bset	20993,#0
 825  0089 81            	ret	
 826  008a               L163:
 827                     ; 257     SPI->CR2 &= (u8)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 829  008a 72115201      	bres	20993,#0
 830                     ; 259 }
 833  008e 81            	ret	
 856                     ; 275 void SPI_TransmitCRC(void)
 856                     ; 276 {
 857                     	switch	.text
 858  008f               _SPI_TransmitCRC:
 862                     ; 277   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 864  008f 72185201      	bset	20993,#4
 865                     ; 278 }
 868  0093 81            	ret	
 905                     ; 295 void SPI_CalculateCRCCmd(FunctionalState NewState)
 905                     ; 296 {
 906                     	switch	.text
 907  0094               _SPI_CalculateCRCCmd:
 909  0094 88            	push	a
 910       00000000      OFST:	set	0
 913                     ; 298   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 915                     ; 301   SPI_Cmd(DISABLE);
 917  0095 4f            	clr	a
 918  0096 adae          	call	_SPI_Cmd
 920                     ; 303   if (NewState != DISABLE)
 922  0098 7b01          	ld	a,(OFST+1,sp)
 923  009a 2706          	jreq	L314
 924                     ; 305     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 926  009c 721a5201      	bset	20993,#5
 928  00a0 2004          	jra	L514
 929  00a2               L314:
 930                     ; 309     SPI->CR2 &= (u8)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 932  00a2 721b5201      	bres	20993,#5
 933  00a6               L514:
 934                     ; 311 }
 937  00a6 84            	pop	a
 938  00a7 81            	ret	
1002                     ; 326 u8 SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1002                     ; 327 {
1003                     	switch	.text
1004  00a8               _SPI_GetCRC:
1006  00a8 88            	push	a
1007       00000001      OFST:	set	1
1010                     ; 328   u8 crcreg = 0;
1012                     ; 331   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1014                     ; 333   if (SPI_CRC != SPI_CRC_RX)
1016  00a9 4d            	tnz	a
1017  00aa 2705          	jreq	L154
1018                     ; 335     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1020  00ac c65207        	ld	a,20999
1022  00af 2003          	jra	L354
1023  00b1               L154:
1024                     ; 339     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1026  00b1 c65206        	ld	a,20998
1027  00b4               L354:
1028                     ; 343   return crcreg;
1032  00b4 5b01          	addw	sp,#1
1033  00b6 81            	ret	
1058                     ; 359 void SPI_ResetCRC(void)
1058                     ; 360 {
1059                     	switch	.text
1060  00b7               _SPI_ResetCRC:
1064                     ; 363   SPI_CalculateCRCCmd(ENABLE);
1066  00b7 a601          	ld	a,#1
1067  00b9 add9          	call	_SPI_CalculateCRCCmd
1069                     ; 366   SPI_Cmd(ENABLE);
1071  00bb a601          	ld	a,#1
1073                     ; 367 }
1076  00bd 2087          	jp	_SPI_Cmd
1100                     ; 384 u8 SPI_GetCRCPolynomial(void)
1100                     ; 385 {
1101                     	switch	.text
1102  00bf               _SPI_GetCRCPolynomial:
1106                     ; 386   return SPI->CRCPR; /* Return the CRC polynomial register */
1108  00bf c65205        	ld	a,20997
1111  00c2 81            	ret	
1167                     ; 402 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1167                     ; 403 {
1168                     	switch	.text
1169  00c3               _SPI_BiDirectionalLineConfig:
1173                     ; 405   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1175                     ; 407   if (SPI_Direction != SPI_DIRECTION_RX)
1177  00c3 4d            	tnz	a
1178  00c4 2705          	jreq	L325
1179                     ; 409     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1181  00c6 721c5201      	bset	20993,#6
1184  00ca 81            	ret	
1185  00cb               L325:
1186                     ; 413     SPI->CR2 &= (u8)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1188  00cb 721d5201      	bres	20993,#6
1189                     ; 415 }
1192  00cf 81            	ret	
1313                     ; 435 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1313                     ; 436 {
1314                     	switch	.text
1315  00d0               _SPI_GetFlagStatus:
1317  00d0 88            	push	a
1318       00000001      OFST:	set	1
1321                     ; 437   FlagStatus status = RESET;
1323                     ; 439   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1325                     ; 442   if ((SPI->SR & (u8)SPI_FLAG) != (u8)RESET)
1327  00d1 c45203        	and	a,20995
1328  00d4 2702          	jreq	L306
1329                     ; 444     status = SET; /* SPI_FLAG is set */
1331  00d6 a601          	ld	a,#1
1333  00d8               L306:
1334                     ; 448     status = RESET; /* SPI_FLAG is reset*/
1336                     ; 452   return status;
1340  00d8 5b01          	addw	sp,#1
1341  00da 81            	ret	
1376                     ; 479 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1376                     ; 480 {
1377                     	switch	.text
1378  00db               _SPI_ClearFlag:
1382                     ; 481   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1384                     ; 483   SPI->SR = (u8)(~SPI_FLAG);
1386  00db 43            	cpl	a
1387  00dc c75203        	ld	20995,a
1388                     ; 484 }
1391  00df 81            	ret	
1473                     ; 509 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1473                     ; 510 {
1474                     	switch	.text
1475  00e0               _SPI_GetITStatus:
1477  00e0 88            	push	a
1478  00e1 89            	pushw	x
1479       00000002      OFST:	set	2
1482                     ; 511   ITStatus pendingbitstatus = RESET;
1484                     ; 512   u8 itpos = 0;
1486                     ; 513   u8 itmask1 = 0;
1488                     ; 514   u8 itmask2 = 0;
1490                     ; 515   u8 enablestatus = 0;
1492                     ; 516   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1494                     ; 518   itpos = (u8)((u8)1 << ((u8)SPI_IT & (u8)0x0F));
1496  00e2 a40f          	and	a,#15
1497  00e4 5f            	clrw	x
1498  00e5 97            	ld	xl,a
1499  00e6 a601          	ld	a,#1
1500  00e8 5d            	tnzw	x
1501  00e9 2704          	jreq	L65
1502  00eb               L06:
1503  00eb 48            	sll	a
1504  00ec 5a            	decw	x
1505  00ed 26fc          	jrne	L06
1506  00ef               L65:
1507  00ef 6b01          	ld	(OFST-1,sp),a
1508                     ; 521   itmask1 = (u8)((u8)SPI_IT >> (u8)4);
1510  00f1 7b03          	ld	a,(OFST+1,sp)
1511  00f3 4e            	swap	a
1512  00f4 a40f          	and	a,#15
1513  00f6 6b02          	ld	(OFST+0,sp),a
1514                     ; 523   itmask2 = (u8)((u8)1 << itmask1);
1516  00f8 5f            	clrw	x
1517  00f9 97            	ld	xl,a
1518  00fa a601          	ld	a,#1
1519  00fc 5d            	tnzw	x
1520  00fd 2704          	jreq	L26
1521  00ff               L46:
1522  00ff 48            	sll	a
1523  0100 5a            	decw	x
1524  0101 26fc          	jrne	L46
1525  0103               L26:
1526                     ; 525   enablestatus = (u8)((u8)SPI->ICR & itmask2);
1528  0103 c45202        	and	a,20994
1529  0106 6b02          	ld	(OFST+0,sp),a
1530                     ; 527   if (((SPI->SR & itpos) != RESET) && enablestatus)
1532  0108 c65203        	ld	a,20995
1533  010b 1501          	bcp	a,(OFST-1,sp)
1534  010d 2708          	jreq	L766
1536  010f 7b02          	ld	a,(OFST+0,sp)
1537  0111 2704          	jreq	L766
1538                     ; 530     pendingbitstatus = SET;
1540  0113 a601          	ld	a,#1
1542  0115 2001          	jra	L176
1543  0117               L766:
1544                     ; 535     pendingbitstatus = RESET;
1546  0117 4f            	clr	a
1547  0118               L176:
1548                     ; 538   return  pendingbitstatus;
1552  0118 5b03          	addw	sp,#3
1553  011a 81            	ret	
1598                     ; 564 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1598                     ; 565 {
1599                     	switch	.text
1600  011b               _SPI_ClearITPendingBit:
1602  011b 88            	push	a
1603       00000001      OFST:	set	1
1606                     ; 566   u8 itpos = 0;
1608                     ; 567   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1610                     ; 572   itpos = (u8)((u8)1 << (((u8)SPI_IT & (u8)0xF0) >> 4));
1612  011c 4e            	swap	a
1613  011d a40f          	and	a,#15
1614  011f 5f            	clrw	x
1615  0120 97            	ld	xl,a
1616  0121 a601          	ld	a,#1
1617  0123 5d            	tnzw	x
1618  0124 2704          	jreq	L07
1619  0126               L27:
1620  0126 48            	sll	a
1621  0127 5a            	decw	x
1622  0128 26fc          	jrne	L27
1623  012a               L07:
1624                     ; 574   SPI->SR = (u8)(~itpos);
1626  012a 43            	cpl	a
1627  012b c75203        	ld	20995,a
1628                     ; 576 }
1631  012e 84            	pop	a
1632  012f 81            	ret	
1645                     	xdef	_SPI_ClearITPendingBit
1646                     	xdef	_SPI_GetITStatus
1647                     	xdef	_SPI_ClearFlag
1648                     	xdef	_SPI_GetFlagStatus
1649                     	xdef	_SPI_BiDirectionalLineConfig
1650                     	xdef	_SPI_GetCRCPolynomial
1651                     	xdef	_SPI_ResetCRC
1652                     	xdef	_SPI_GetCRC
1653                     	xdef	_SPI_CalculateCRCCmd
1654                     	xdef	_SPI_TransmitCRC
1655                     	xdef	_SPI_NSSInternalSoftwareCmd
1656                     	xdef	_SPI_ReceiveData
1657                     	xdef	_SPI_SendData
1658                     	xdef	_SPI_ITConfig
1659                     	xdef	_SPI_Cmd
1660                     	xdef	_SPI_Init
1661                     	xdef	_SPI_DeInit
1680                     	end
