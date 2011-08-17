   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               _S_CGRAM:
  21  0000 03            	dc.b	3
  22  0001 ff            	dc.b	255
  23  0002 02            	dc.b	2
  24  0003 00            	dc.b	0
  25  0004 04            	dc.b	4
  26  0005 00            	dc.b	0
  27  0006 04            	dc.b	4
  28  0007 00            	dc.b	0
  29  0008 0c            	dc.b	12
  30  0009 7f            	dc.b	127
  31  000a 0c            	dc.b	12
  32  000b 7f            	dc.b	127
  33  000c 1c            	dc.b	28
  34  000d 3f            	dc.b	63
  35  000e 1e            	dc.b	30
  36  000f 1f            	dc.b	31
  37  0010 3f            	dc.b	63
  38  0011 0f            	dc.b	15
  39  0012 3f            	dc.b	63
  40  0013 87            	dc.b	135
  41  0014 7f            	dc.b	127
  42  0015 c3            	dc.b	195
  43  0016 7f            	dc.b	127
  44  0017 e3            	dc.b	227
  45  0018 00            	dc.b	0
  46  0019 03            	dc.b	3
  47  001a 00            	dc.b	0
  48  001b 03            	dc.b	3
  49  001c 00            	dc.b	0
  50  001d 07            	dc.b	7
  51  001e ff            	dc.b	255
  52  001f fe            	dc.b	254
  53  0020               _T_CGRAM:
  54  0020 ff            	dc.b	255
  55  0021 ff            	dc.b	255
  56  0022 00            	dc.b	0
  57  0023 00            	dc.b	0
  58  0024 00            	dc.b	0
  59  0025 00            	dc.b	0
  60  0026 00            	dc.b	0
  61  0027 00            	dc.b	0
  62  0028 f8            	dc.b	248
  63  0029 f8            	dc.b	248
  64  002a f0            	dc.b	240
  65  002b f8            	dc.b	248
  66  002c f0            	dc.b	240
  67  002d f0            	dc.b	240
  68  002e f0            	dc.b	240
  69  002f f0            	dc.b	240
  70  0030 e1            	dc.b	225
  71  0031 e0            	dc.b	224
  72  0032 e3            	dc.b	227
  73  0033 e0            	dc.b	224
  74  0034 c3            	dc.b	195
  75  0035 c0            	dc.b	192
  76  0036 c7            	dc.b	199
  77  0037 c0            	dc.b	192
  78  0038 87            	dc.b	135
  79  0039 c0            	dc.b	192
  80  003a 8f            	dc.b	143
  81  003b 80            	dc.b	128
  82  003c 0f            	dc.b	15
  83  003d 80            	dc.b	128
  84  003e 1f            	dc.b	31
  85  003f 00            	dc.b	0
 125                     ; 81 void LCD_Delay(u16 nCount)
 125                     ; 82 {
 127                     	switch	.text
 128  0000               _LCD_Delay:
 130  0000 89            	pushw	x
 131       00000000      OFST:	set	0
 134  0001 2003          	jra	L13
 135  0003               L72:
 136                     ; 86     nCount--;
 138  0003 5a            	decw	x
 139  0004 1f01          	ldw	(OFST+1,sp),x
 140  0006               L13:
 141                     ; 84   while (nCount != 0)
 143  0006 1e01          	ldw	x,(OFST+1,sp)
 144  0008 26f9          	jrne	L72
 145                     ; 88 }
 148  000a 85            	popw	x
 149  000b 81            	ret	
 174                     ; 101 void LCD_ReadStatus(void)
 174                     ; 102 {
 175                     	switch	.text
 176  000c               _LCD_ReadStatus:
 180                     ; 103   LCD_SendByte(STATUS_TYPE, 0x00);
 182  000c aefc00        	ldw	x,#64512
 183  000f ad25          	call	_LCD_SendByte
 185                     ; 104   LCD_Delay(200);
 187  0011 ae00c8        	ldw	x,#200
 189                     ; 105   return;
 192  0014 20ea          	jp	_LCD_Delay
 226                     ; 117 static void LCD_SPISendByte(u8 DataToSend)
 226                     ; 118 {
 227                     	switch	.text
 228  0016               L54_LCD_SPISendByte:
 232                     ; 121   SPI->DR = DataToSend;
 234  0016 c75204        	ld	20996,a
 236  0019               L17:
 237                     ; 123   while ((SPI->SR & SPI_SR_TXE) == 0)
 239  0019 72035203fb    	btjf	20995,#1,L17
 240                     ; 127 }
 243  001e 81            	ret	
 300                     ; 151 void LCD_ChipSelect(FunctionalState NewState)
 300                     ; 152 {
 301                     	switch	.text
 302  001f               _LCD_ChipSelect:
 306                     ; 153   if (NewState == DISABLE)
 308  001f 4d            	tnz	a
 309  0020 260a          	jrne	L321
 310                     ; 155     GPIO_WriteLow(LCD_CS_PORT, LCD_CS_PIN); /* CS pin low: LCD disabled */
 312  0022 4b01          	push	#1
 313  0024 ae5019        	ldw	x,#20505
 314  0027 cd0000        	call	_GPIO_WriteLow
 317  002a 2008          	jra	L521
 318  002c               L321:
 319                     ; 159     GPIO_WriteHigh(LCD_CS_PORT, LCD_CS_PIN); /* CS pin high: LCD enabled */
 321  002c 4b01          	push	#1
 322  002e ae5019        	ldw	x,#20505
 323  0031 cd0000        	call	_GPIO_WriteHigh
 325  0034               L521:
 326  0034 84            	pop	a
 327                     ; 161 }
 330  0035 81            	ret	
 333                     	switch	.ubsct
 334  0000               L721_i:
 335  0000 00            	ds.b	1
 387                     ; 178 void LCD_SendByte(u8 DataType, u8 DataToSend)
 387                     ; 179 {
 388                     	switch	.text
 389  0036               _LCD_SendByte:
 391  0036 89            	pushw	x
 392       00000000      OFST:	set	0
 395                     ; 181   LCD_ChipSelect(ENABLE); /* Enable access to LCD */
 397  0037 a601          	ld	a,#1
 398  0039 ade4          	call	_LCD_ChipSelect
 400                     ; 183   LCD_SPISendByte(DataType); /* Send Synchro/Mode byte */
 402  003b 7b01          	ld	a,(OFST+1,sp)
 403  003d add7          	call	L54_LCD_SPISendByte
 405                     ; 184   LCD_SPISendByte((u8)(DataToSend & (u8)0xF0)); /* Send byte high nibble */
 407  003f 7b02          	ld	a,(OFST+2,sp)
 408  0041 a4f0          	and	a,#240
 409  0043 add1          	call	L54_LCD_SPISendByte
 411                     ; 185   LCD_SPISendByte((u8)((u8)(DataToSend << 4) & (u8)0xF0)); /* Send byte low nibble */
 413  0045 7b02          	ld	a,(OFST+2,sp)
 414  0047 97            	ld	xl,a
 415  0048 a610          	ld	a,#16
 416  004a 42            	mul	x,a
 417  004b 9f            	ld	a,xl
 418  004c a4f0          	and	a,#240
 419  004e adc6          	call	L54_LCD_SPISendByte
 421                     ; 187 	for (i = 0; i<128; i++)
 423  0050 3f00          	clr	L721_i
 424  0052               L751:
 427  0052 3c00          	inc	L721_i
 430  0054 b600          	ld	a,L721_i
 431  0056 a180          	cp	a,#128
 432  0058 25f8          	jrult	L751
 433                     ; 190   LCD_ChipSelect(DISABLE); /* Disable access to LCD */
 435  005a 4f            	clr	a
 436  005b adc2          	call	_LCD_ChipSelect
 438                     ; 192 }
 441  005d 85            	popw	x
 442  005e 81            	ret	
 488                     ; 210 void LCD_SendBuffer(u8 *pTxBuffer, u8 *pRxBuffer, u8 NumByte)
 488                     ; 211 {
 489                     	switch	.text
 490  005f               _LCD_SendBuffer:
 492  005f 89            	pushw	x
 493       00000000      OFST:	set	0
 496                     ; 212   LCD_ChipSelect(ENABLE);
 498  0060 a601          	ld	a,#1
 499  0062 adbb          	call	_LCD_ChipSelect
 502  0064 200a          	jra	L112
 503  0066               L702:
 504                     ; 215     LCD_SPISendByte(*pTxBuffer);
 506  0066 1e01          	ldw	x,(OFST+1,sp)
 507  0068 f6            	ld	a,(x)
 508  0069 adab          	call	L54_LCD_SPISendByte
 510                     ; 216     pTxBuffer++;
 512  006b 1e01          	ldw	x,(OFST+1,sp)
 513  006d 5c            	incw	x
 514  006e 1f01          	ldw	(OFST+1,sp),x
 515  0070               L112:
 516                     ; 213   while (NumByte--) /* while there is data to be read */
 518  0070 7b07          	ld	a,(OFST+7,sp)
 519  0072 0a07          	dec	(OFST+7,sp)
 520  0074 4d            	tnz	a
 521  0075 26ef          	jrne	L702
 522                     ; 218   LCD_ChipSelect(DISABLE);
 524  0077 ada6          	call	_LCD_ChipSelect
 526                     ; 219 }
 529  0079 85            	popw	x
 530  007a 81            	ret	
 556                     ; 238 void LCD_Init(void)
 556                     ; 239 {
 557                     	switch	.text
 558  007b               _LCD_Init:
 562                     ; 241   GPIO_Init(LCD_CS_PORT, LCD_CS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 564  007b 4bc0          	push	#192
 565  007d 4b01          	push	#1
 566  007f ae5019        	ldw	x,#20505
 567  0082 cd0000        	call	_GPIO_Init
 569  0085 85            	popw	x
 570                     ; 243   LCD_SendByte(COMMAND_TYPE, SET_TEXT_MODE); /* Set the LCD in TEXT mode */
 572  0086 aef830        	ldw	x,#63536
 573  0089 adab          	call	_LCD_SendByte
 575                     ; 244   LCD_SendByte(COMMAND_TYPE, DISPLAY_ON); /* Enable the display */
 577  008b aef80c        	ldw	x,#63500
 578  008e ada6          	call	_LCD_SendByte
 580                     ; 245   LCD_Clear(); /* Clear the LCD */
 582  0090 ad05          	call	_LCD_Clear
 584                     ; 246   LCD_SendByte(COMMAND_TYPE, ENTRY_MODE_SET_INC); /* Select the entry mode type */
 586  0092 aef806        	ldw	x,#63494
 588                     ; 248 }
 591  0095 209f          	jp	_LCD_SendByte
 626                     ; 264 void LCD_Clear(void)
 626                     ; 265 {
 627                     	switch	.text
 628  0097               _LCD_Clear:
 630  0097 89            	pushw	x
 631       00000002      OFST:	set	2
 634                     ; 269   LCD_SendByte(COMMAND_TYPE, DISPLAY_CLR); /* Clear the LCD */
 636  0098 aef801        	ldw	x,#63489
 637  009b ad99          	call	_LCD_SendByte
 639                     ; 272   for (i = 0; i < 5000; i++)
 641  009d 5f            	clrw	x
 642  009e               L342:
 645  009e 5c            	incw	x
 648  009f a31388        	cpw	x,#5000
 649  00a2 25fa          	jrult	L342
 650                     ; 277 }
 653  00a4 85            	popw	x
 654  00a5 81            	ret	
 679                     ; 294 void LCD_SetTextMode(void)
 679                     ; 295 {
 680                     	switch	.text
 681  00a6               _LCD_SetTextMode:
 685                     ; 296   LCD_SendByte(COMMAND_TYPE, SET_TEXT_MODE);
 687  00a6 aef830        	ldw	x,#63536
 688  00a9 ad8b          	call	_LCD_SendByte
 690                     ; 297   LCD_Clear();
 693                     ; 298 }
 696  00ab 20ea          	jp	_LCD_Clear
 721                     ; 315 void LCD_SetGraphicMode(void)
 721                     ; 316 {
 722                     	switch	.text
 723  00ad               _LCD_SetGraphicMode:
 727                     ; 317   LCD_Clear();
 729  00ad ade8          	call	_LCD_Clear
 731                     ; 318   LCD_SendByte(COMMAND_TYPE, SET_GRAPHIC_MODE);
 733  00af aef836        	ldw	x,#63542
 735                     ; 320 }
 738  00b2 2082          	jp	_LCD_SendByte
 782                     ; 335 void LCD_ClearLine(u8 Line)
 782                     ; 336 {
 783                     	switch	.text
 784  00b4               _LCD_ClearLine:
 786  00b4 88            	push	a
 787       00000001      OFST:	set	1
 790                     ; 341   LCD_SendByte(COMMAND_TYPE, Line);
 792  00b5 97            	ld	xl,a
 793  00b6 a6f8          	ld	a,#248
 794  00b8 95            	ld	xh,a
 795  00b9 cd0036        	call	_LCD_SendByte
 797                     ; 344   for (CharPos = 0; CharPos < LCD_LINE_MAX_CHAR; CharPos++)
 799  00bc 0f01          	clr	(OFST+0,sp)
 800  00be               L313:
 801                     ; 346     LCD_SendByte(DATA_TYPE, ' ');
 803  00be aefa20        	ldw	x,#64032
 804  00c1 cd0036        	call	_LCD_SendByte
 806                     ; 344   for (CharPos = 0; CharPos < LCD_LINE_MAX_CHAR; CharPos++)
 808  00c4 0c01          	inc	(OFST+0,sp)
 811  00c6 7b01          	ld	a,(OFST+0,sp)
 812  00c8 a10f          	cp	a,#15
 813  00ca 25f2          	jrult	L313
 814                     ; 349 }
 817  00cc 84            	pop	a
 818  00cd 81            	ret	
 862                     ; 365 void LCD_SetCursorPos(u8 Line, u8 Offset)
 862                     ; 366 {
 863                     	switch	.text
 864  00ce               _LCD_SetCursorPos:
 866  00ce 89            	pushw	x
 867       00000000      OFST:	set	0
 870                     ; 367   LCD_SendByte(COMMAND_TYPE, (u8)(Line + Offset));
 872  00cf 9e            	ld	a,xh
 873  00d0 1b02          	add	a,(OFST+2,sp)
 874  00d2 97            	ld	xl,a
 875  00d3 a6f8          	ld	a,#248
 876  00d5 95            	ld	xh,a
 877  00d6 cd0036        	call	_LCD_SendByte
 879                     ; 368 }
 882  00d9 85            	popw	x
 883  00da 81            	ret	
 918                     ; 384 void LCD_PrintChar(u8 Ascii)
 918                     ; 385 {
 919                     	switch	.text
 920  00db               _LCD_PrintChar:
 924                     ; 386   LCD_SendByte(DATA_TYPE, Ascii);
 926  00db 97            	ld	xl,a
 927  00dc a6fa          	ld	a,#250
 928  00de 95            	ld	xh,a
 930                     ; 387 }
 933  00df cc0036        	jp	_LCD_SendByte
1007                     ; 405 void LCD_PrintString(u8 Line, FunctionalState AutoComplete, FunctionalState Append, u8 *ptr)
1007                     ; 406 {
1008                     	switch	.text
1009  00e2               _LCD_PrintString:
1011  00e2 89            	pushw	x
1012  00e3 88            	push	a
1013       00000001      OFST:	set	1
1016                     ; 408   u8 CharPos = 0;
1018  00e4 0f01          	clr	(OFST+0,sp)
1019                     ; 411   if (Append == DISABLE)
1021  00e6 7b06          	ld	a,(OFST+5,sp)
1022  00e8 2619          	jrne	L324
1023                     ; 413     LCD_SendByte(COMMAND_TYPE, Line);
1025  00ea 9e            	ld	a,xh
1026  00eb 97            	ld	xl,a
1027  00ec a6f8          	ld	a,#248
1028  00ee 95            	ld	xh,a
1029  00ef cd0036        	call	_LCD_SendByte
1031  00f2 200f          	jra	L324
1032  00f4               L124:
1033                     ; 419     LCD_SendByte(DATA_TYPE, *ptr);
1035  00f4 f6            	ld	a,(x)
1036  00f5 97            	ld	xl,a
1037  00f6 a6fa          	ld	a,#250
1038  00f8 95            	ld	xh,a
1039  00f9 cd0036        	call	_LCD_SendByte
1041                     ; 420     CharPos++;
1043  00fc 0c01          	inc	(OFST+0,sp)
1044                     ; 421     ptr++;
1046  00fe 1e07          	ldw	x,(OFST+6,sp)
1047  0100 5c            	incw	x
1048  0101 1f07          	ldw	(OFST+6,sp),x
1049  0103               L324:
1050                     ; 417   while ((*ptr != 0) && (CharPos < LCD_LINE_MAX_CHAR))
1052  0103 1e07          	ldw	x,(OFST+6,sp)
1053  0105 f6            	ld	a,(x)
1054  0106 2706          	jreq	L724
1056  0108 7b01          	ld	a,(OFST+0,sp)
1057  010a a10f          	cp	a,#15
1058  010c 25e6          	jrult	L124
1059  010e               L724:
1060                     ; 425   if (AutoComplete == ENABLE)
1062  010e 7b03          	ld	a,(OFST+2,sp)
1063  0110 4a            	dec	a
1064  0111 2610          	jrne	L134
1066  0113 2008          	jra	L534
1067  0115               L334:
1068                     ; 429       LCD_SendByte(DATA_TYPE, ' ');
1070  0115 aefa20        	ldw	x,#64032
1071  0118 cd0036        	call	_LCD_SendByte
1073                     ; 430       CharPos++;
1075  011b 0c01          	inc	(OFST+0,sp)
1076  011d               L534:
1077                     ; 427     while (CharPos < LCD_LINE_MAX_CHAR)
1079  011d 7b01          	ld	a,(OFST+0,sp)
1080  011f a10f          	cp	a,#15
1081  0121 25f2          	jrult	L334
1082  0123               L134:
1083                     ; 434 }
1086  0123 5b03          	addw	sp,#3
1087  0125 81            	ret	
1142                     ; 451 void LCD_PrintMsg(u8 *ptr)
1142                     ; 452 {
1143                     	switch	.text
1144  0126               _LCD_PrintMsg:
1146  0126 89            	pushw	x
1147  0127 89            	pushw	x
1148       00000002      OFST:	set	2
1151                     ; 454   u8 Char = 0;
1153                     ; 455   u8 CharPos = 0;
1155  0128 0f02          	clr	(OFST+0,sp)
1156                     ; 457   LCD_Clear(); /* Clear the LCD display */
1158  012a cd0097        	call	_LCD_Clear
1160                     ; 460   LCD_SendByte(COMMAND_TYPE, LCD_LINE1);
1162  012d aef880        	ldw	x,#63616
1165  0130 2035          	jp	LC001
1166  0132               L574:
1167                     ; 467     if (CharPos == LCD_LINE_MAX_CHAR)
1169  0132 a10f          	cp	a,#15
1170  0134 2608          	jrne	L305
1171                     ; 469       LCD_SendByte(COMMAND_TYPE, LCD_LINE2); /* Select second line */
1173  0136 aef890        	ldw	x,#63632
1174  0139 cd0036        	call	_LCD_SendByte
1176  013c 1e03          	ldw	x,(OFST+1,sp)
1177  013e               L305:
1178                     ; 472     Char = *ptr;
1180  013e f6            	ld	a,(x)
1181  013f 6b01          	ld	(OFST-1,sp),a
1182                     ; 474     switch (Char)
1185                     ; 492       break;
1186  0141 a00a          	sub	a,#10
1187  0143 271a          	jreq	L344
1188  0145 a003          	sub	a,#3
1189  0147 2712          	jreq	L144
1190                     ; 487       default:
1190                     ; 488         /* Display characters different from (\r, \n) */
1190                     ; 489         LCD_SendByte(DATA_TYPE, Char);
1192  0149 7b01          	ld	a,(OFST-1,sp)
1193  014b 97            	ld	xl,a
1194  014c a6fa          	ld	a,#250
1195  014e 95            	ld	xh,a
1196  014f cd0036        	call	_LCD_SendByte
1198                     ; 490         CharPos++;
1200  0152 0c02          	inc	(OFST+0,sp)
1201                     ; 491         ptr++;
1203  0154 1e03          	ldw	x,(OFST+1,sp)
1204  0156               LC002:
1206  0156 5c            	incw	x
1207  0157 1f03          	ldw	(OFST+1,sp),x
1208                     ; 492       break;
1210  0159 2011          	jra	L774
1211  015b               L144:
1212                     ; 476       case ('\r'):
1212                     ; 477         /* Carriage return */
1212                     ; 478         CharPos++;
1214  015b 0c02          	inc	(OFST+0,sp)
1215                     ; 479         ptr++;
1216                     ; 480       break;
1218  015d 20f7          	jp	LC002
1219  015f               L344:
1220                     ; 481       case ('\n'):
1220                     ; 482         CharPos = 0;
1222  015f 6b02          	ld	(OFST+0,sp),a
1223                     ; 483         ptr++;
1225  0161 5c            	incw	x
1226  0162 1f03          	ldw	(OFST+1,sp),x
1227                     ; 485         LCD_SendByte(COMMAND_TYPE, LCD_LINE2);
1229  0164 aef890        	ldw	x,#63632
1230  0167               LC001:
1231  0167 cd0036        	call	_LCD_SendByte
1233                     ; 486       break;
1235  016a 1e03          	ldw	x,(OFST+1,sp)
1236  016c               L774:
1237                     ; 463   while ((*ptr != 0) && (CharPos < (LCD_LINE_MAX_CHAR * 2)))
1239  016c f6            	ld	a,(x)
1240  016d 2706          	jreq	L115
1242  016f 7b02          	ld	a,(OFST+0,sp)
1243  0171 a11e          	cp	a,#30
1244  0173 25bd          	jrult	L574
1245  0175               L115:
1246                     ; 496 }
1249  0175 5b04          	addw	sp,#4
1250  0177 81            	ret	
1294                     ; 513 void LCD_PrintDec1(u8 Number)
1294                     ; 514 {
1295                     	switch	.text
1296  0178               _LCD_PrintDec1:
1298  0178 88            	push	a
1299  0179 88            	push	a
1300       00000001      OFST:	set	1
1303                     ; 518   if (Number < (u8)10)
1305  017a a10a          	cp	a,#10
1306  017c 2416          	jruge	L535
1307                     ; 522     NbreTmp = (u8)(Number / (u8)10);
1309  017e ae000a        	ldw	x,#10
1310  0181 9093          	ldw	y,x
1311  0183 5f            	clrw	x
1312  0184 97            	ld	xl,a
1313  0185 65            	divw	x,y
1314                     ; 525     NbreTmp = (u8)(Number - (u8)((u8)10 * NbreTmp));
1316  0186 a60a          	ld	a,#10
1317  0188 42            	mul	x,a
1318  0189 9f            	ld	a,xl
1319  018a 1002          	sub	a,(OFST+1,sp)
1320  018c 40            	neg	a
1321  018d 6b01          	ld	(OFST+0,sp),a
1322                     ; 526     LCD_PrintChar((u8)(NbreTmp + (u8)0x30));
1324  018f ab30          	add	a,#48
1325  0191 cd00db        	call	_LCD_PrintChar
1327  0194               L535:
1328                     ; 530 }
1331  0194 85            	popw	x
1332  0195 81            	ret	
1376                     ; 547 void LCD_PrintDec2(u8 Number)
1376                     ; 548 {
1377                     	switch	.text
1378  0196               _LCD_PrintDec2:
1380  0196 88            	push	a
1381  0197 88            	push	a
1382       00000001      OFST:	set	1
1385                     ; 552   if (Number < (u8)100)
1387  0198 a164          	cp	a,#100
1388  019a 2421          	jruge	L165
1389                     ; 556     NbreTmp = (u8)(Number / (u8)10);
1391  019c ae000a        	ldw	x,#10
1392  019f 9093          	ldw	y,x
1393  01a1 5f            	clrw	x
1394  01a2 97            	ld	xl,a
1395  01a3 65            	divw	x,y
1396  01a4 9f            	ld	a,xl
1397  01a5 6b01          	ld	(OFST+0,sp),a
1398                     ; 557     LCD_PrintChar((u8)(NbreTmp + (u8)0x30));
1400  01a7 ab30          	add	a,#48
1401  01a9 cd00db        	call	_LCD_PrintChar
1403                     ; 560     NbreTmp = (u8)(Number - (u8)((u8)10 * NbreTmp));
1405  01ac 7b01          	ld	a,(OFST+0,sp)
1406  01ae 97            	ld	xl,a
1407  01af a60a          	ld	a,#10
1408  01b1 42            	mul	x,a
1409  01b2 9f            	ld	a,xl
1410  01b3 1002          	sub	a,(OFST+1,sp)
1411  01b5 40            	neg	a
1412  01b6 6b01          	ld	(OFST+0,sp),a
1413                     ; 561     LCD_PrintChar((u8)(NbreTmp + (u8)0x30));
1415  01b8 ab30          	add	a,#48
1416  01ba cd00db        	call	_LCD_PrintChar
1418  01bd               L165:
1419                     ; 565 }
1422  01bd 85            	popw	x
1423  01be 81            	ret	
1476                     ; 582 void LCD_PrintDec3(u16 Number)
1476                     ; 583 {
1477                     	switch	.text
1478  01bf               _LCD_PrintDec3:
1480  01bf 89            	pushw	x
1481  01c0 89            	pushw	x
1482       00000002      OFST:	set	2
1485                     ; 588   if (Number < (u16)1000)
1487  01c1 a303e8        	cpw	x,#1000
1488  01c4 243a          	jruge	L116
1489                     ; 592     Nbre1Tmp = (u8)(Number / (u8)100);
1491  01c6 90ae0064      	ldw	y,#100
1492  01ca 65            	divw	x,y
1493  01cb 9f            	ld	a,xl
1494  01cc 6b02          	ld	(OFST+0,sp),a
1495                     ; 593     LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));
1497  01ce ab30          	add	a,#48
1498  01d0 cd00db        	call	_LCD_PrintChar
1500                     ; 596     Nbre1Tmp = (u8)(Number - ((u8)100 * Nbre1Tmp));
1502  01d3 7b02          	ld	a,(OFST+0,sp)
1503  01d5 97            	ld	xl,a
1504  01d6 a664          	ld	a,#100
1505  01d8 42            	mul	x,a
1506  01d9 9f            	ld	a,xl
1507  01da 1004          	sub	a,(OFST+2,sp)
1508  01dc 40            	neg	a
1509  01dd 6b02          	ld	(OFST+0,sp),a
1510                     ; 597     Nbre2Tmp = (u8)(Nbre1Tmp / (u8)10);
1512  01df ae000a        	ldw	x,#10
1513  01e2 9093          	ldw	y,x
1514  01e4 5f            	clrw	x
1515  01e5 97            	ld	xl,a
1516  01e6 65            	divw	x,y
1517  01e7 9f            	ld	a,xl
1518  01e8 6b01          	ld	(OFST-1,sp),a
1519                     ; 598     LCD_PrintChar((u8)(Nbre2Tmp + (u8)0x30));
1521  01ea ab30          	add	a,#48
1522  01ec cd00db        	call	_LCD_PrintChar
1524                     ; 601     Nbre1Tmp = ((u8)(Nbre1Tmp - (u8)((u8)10 * Nbre2Tmp)));
1526  01ef 7b01          	ld	a,(OFST-1,sp)
1527  01f1 97            	ld	xl,a
1528  01f2 a60a          	ld	a,#10
1529  01f4 42            	mul	x,a
1530  01f5 9f            	ld	a,xl
1531  01f6 1002          	sub	a,(OFST+0,sp)
1532  01f8 40            	neg	a
1533  01f9 6b02          	ld	(OFST+0,sp),a
1534                     ; 602     LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));
1536  01fb ab30          	add	a,#48
1537  01fd cd00db        	call	_LCD_PrintChar
1539  0200               L116:
1540                     ; 605 }
1543  0200 5b04          	addw	sp,#4
1544  0202 81            	ret	
1597                     ; 622 void LCD_PrintDec4(u16 Number)
1597                     ; 623 {
1598                     	switch	.text
1599  0203               _LCD_PrintDec4:
1601  0203 89            	pushw	x
1602  0204 5206          	subw	sp,#6
1603       00000006      OFST:	set	6
1606                     ; 628   if (Number < (u16)10000)
1608  0206 a32710        	cpw	x,#10000
1609  0209 2467          	jruge	L146
1610                     ; 632     Nbre1Tmp = (u16)(Number / (u16)1000);
1612  020b 90ae03e8      	ldw	y,#1000
1613  020f 65            	divw	x,y
1614  0210 1f05          	ldw	(OFST-1,sp),x
1615                     ; 633     LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));
1617  0212 7b06          	ld	a,(OFST+0,sp)
1618  0214 ab30          	add	a,#48
1619  0216 cd00db        	call	_LCD_PrintChar
1621                     ; 636     Nbre1Tmp = (u16)(Number - ((u16)1000 * Nbre1Tmp));
1623  0219 1e05          	ldw	x,(OFST-1,sp)
1624  021b 90ae03e8      	ldw	y,#1000
1625  021f cd0000        	call	c_imul
1627  0222 1f01          	ldw	(OFST-5,sp),x
1628  0224 1e07          	ldw	x,(OFST+1,sp)
1629  0226 72f001        	subw	x,(OFST-5,sp)
1630  0229 1f05          	ldw	(OFST-1,sp),x
1631                     ; 637     Nbre2Tmp = (u16)(Nbre1Tmp / (u8)100);
1633  022b 90ae0064      	ldw	y,#100
1634  022f 65            	divw	x,y
1635  0230 1f03          	ldw	(OFST-3,sp),x
1636                     ; 638     LCD_PrintChar((u8)(Nbre2Tmp + (u8)0x30));
1638  0232 7b04          	ld	a,(OFST-2,sp)
1639  0234 ab30          	add	a,#48
1640  0236 cd00db        	call	_LCD_PrintChar
1642                     ; 641     Nbre1Tmp = (u16)(Nbre1Tmp - ((u16)100 * Nbre2Tmp));
1644  0239 1e03          	ldw	x,(OFST-3,sp)
1645  023b 90ae0064      	ldw	y,#100
1646  023f cd0000        	call	c_imul
1648  0242 1f01          	ldw	(OFST-5,sp),x
1649  0244 1e05          	ldw	x,(OFST-1,sp)
1650  0246 72f001        	subw	x,(OFST-5,sp)
1651  0249 1f05          	ldw	(OFST-1,sp),x
1652                     ; 642     Nbre2Tmp = (u16)(Nbre1Tmp / (u16)10);
1654  024b 90ae000a      	ldw	y,#10
1655  024f 65            	divw	x,y
1656  0250 1f03          	ldw	(OFST-3,sp),x
1657                     ; 643     LCD_PrintChar((u8)(Nbre2Tmp + (u8)0x30));
1659  0252 7b04          	ld	a,(OFST-2,sp)
1660  0254 ab30          	add	a,#48
1661  0256 cd00db        	call	_LCD_PrintChar
1663                     ; 646     Nbre1Tmp = ((u16)(Nbre1Tmp - (u16)((u16)10 * Nbre2Tmp)));
1665  0259 1e03          	ldw	x,(OFST-3,sp)
1666  025b 90ae000a      	ldw	y,#10
1667  025f cd0000        	call	c_imul
1669  0262 1f01          	ldw	(OFST-5,sp),x
1670  0264 1e05          	ldw	x,(OFST-1,sp)
1671  0266 72f001        	subw	x,(OFST-5,sp)
1672  0269 1f05          	ldw	(OFST-1,sp),x
1673                     ; 647     LCD_PrintChar((u8)(Nbre1Tmp + (u8)0x30));
1675  026b 7b06          	ld	a,(OFST+0,sp)
1676  026d ab30          	add	a,#48
1677  026f cd00db        	call	_LCD_PrintChar
1679  0272               L146:
1680                     ; 650 }
1683  0272 5b08          	addw	sp,#8
1684  0274 81            	ret	
1719                     ; 667 void LCD_PrintHex1(u8 Number)
1719                     ; 668 {
1720                     	switch	.text
1721  0275               _LCD_PrintHex1:
1723  0275 88            	push	a
1724       00000000      OFST:	set	0
1727                     ; 669   if (Number < (u8)0x0A)
1729  0276 a10a          	cp	a,#10
1730  0278 2404          	jruge	L166
1731                     ; 671     LCD_PrintChar((u8)(Number + (u8)0x30));
1733  027a ab30          	add	a,#48
1736  027c 200c          	jra	L366
1737  027e               L166:
1738                     ; 674     if (Number < (u8)0x10)
1740  027e 7b01          	ld	a,(OFST+1,sp)
1741  0280 a110          	cp	a,#16
1742  0282 2404          	jruge	L566
1743                     ; 676       LCD_PrintChar((u8)(Number + (u8)0x37));
1745  0284 ab37          	add	a,#55
1748  0286 2002          	jra	L366
1749  0288               L566:
1750                     ; 680       LCD_PrintChar('-');
1752  0288 a62d          	ld	a,#45
1754  028a               L366:
1755  028a cd00db        	call	_LCD_PrintChar
1756                     ; 682 }
1759  028d 84            	pop	a
1760  028e 81            	ret	
1795                     ; 699 void LCD_PrintHex2(u8 Number)
1795                     ; 700 {
1796                     	switch	.text
1797  028f               _LCD_PrintHex2:
1799  028f 88            	push	a
1800       00000000      OFST:	set	0
1803                     ; 701   LCD_PrintHex1((u8)(Number >> (u8)4));
1805  0290 4e            	swap	a
1806  0291 a40f          	and	a,#15
1807  0293 ade0          	call	_LCD_PrintHex1
1809                     ; 702   LCD_PrintHex1((u8)(Number & (u8)0x0F));
1811  0295 7b01          	ld	a,(OFST+1,sp)
1812  0297 a40f          	and	a,#15
1813  0299 adda          	call	_LCD_PrintHex1
1815                     ; 703 }
1818  029b 84            	pop	a
1819  029c 81            	ret	
1854                     ; 720 void LCD_PrintHex3(u16 Number)
1854                     ; 721 {
1855                     	switch	.text
1856  029d               _LCD_PrintHex3:
1858  029d 89            	pushw	x
1859       00000000      OFST:	set	0
1862                     ; 722   LCD_PrintHex1((u8)(Number >> (u8)8)); 
1864  029e 9e            	ld	a,xh
1865  029f add4          	call	_LCD_PrintHex1
1867                     ; 723   LCD_PrintHex1((u8)((u8)(Number) >> (u8)4));
1869  02a1 7b02          	ld	a,(OFST+2,sp)
1870  02a3 4e            	swap	a
1871  02a4 a40f          	and	a,#15
1872  02a6 adcd          	call	_LCD_PrintHex1
1874                     ; 724   LCD_PrintHex1((u8)((u8)(Number) & (u8)0x0F));
1876  02a8 7b02          	ld	a,(OFST+2,sp)
1877  02aa a40f          	and	a,#15
1878  02ac adc7          	call	_LCD_PrintHex1
1880                     ; 725 }
1883  02ae 85            	popw	x
1884  02af 81            	ret	
1919                     ; 742 void LCD_PrintBin2(u8 Number)
1919                     ; 743 {
1920                     	switch	.text
1921  02b0               _LCD_PrintBin2:
1923  02b0 88            	push	a
1924       00000000      OFST:	set	0
1927                     ; 744   LCD_PrintHex1((u8)((u8)(Number & (u8)0x02) >> (u8)1));
1929  02b1 a402          	and	a,#2
1930  02b3 44            	srl	a
1931  02b4 adbf          	call	_LCD_PrintHex1
1933                     ; 745   LCD_PrintHex1((u8)(Number & (u8)0x01));
1935  02b6 7b01          	ld	a,(OFST+1,sp)
1936  02b8 a401          	and	a,#1
1937  02ba adb9          	call	_LCD_PrintHex1
1939                     ; 746 }
1942  02bc 84            	pop	a
1943  02bd 81            	ret	
1978                     ; 763 void LCD_PrintBin4(u8 Number)
1978                     ; 764 {
1979                     	switch	.text
1980  02be               _LCD_PrintBin4:
1982  02be 88            	push	a
1983       00000000      OFST:	set	0
1986                     ; 765   LCD_PrintHex1((u8)((u8)(Number & (u8)0x08) >> (u8)3));
1988  02bf a408          	and	a,#8
1989  02c1 44            	srl	a
1990  02c2 44            	srl	a
1991  02c3 44            	srl	a
1992  02c4 adaf          	call	_LCD_PrintHex1
1994                     ; 766   LCD_PrintHex1((u8)((u8)(Number & (u8)0x04) >> (u8)2));
1996  02c6 7b01          	ld	a,(OFST+1,sp)
1997  02c8 a404          	and	a,#4
1998  02ca 44            	srl	a
1999  02cb 44            	srl	a
2000  02cc ada7          	call	_LCD_PrintHex1
2002                     ; 767   LCD_PrintHex1((u8)((u8)(Number & (u8)0x02) >> (u8)1));
2004  02ce 7b01          	ld	a,(OFST+1,sp)
2005  02d0 a402          	and	a,#2
2006  02d2 44            	srl	a
2007  02d3 ada0          	call	_LCD_PrintHex1
2009                     ; 768   LCD_PrintHex1((u8)(Number & (u8)0x01));
2011  02d5 7b01          	ld	a,(OFST+1,sp)
2012  02d7 a401          	and	a,#1
2013  02d9 ad9a          	call	_LCD_PrintHex1
2015                     ; 769 }
2018  02db 84            	pop	a
2019  02dc 81            	ret	
2073                     ; 785 void LCD_DisplayCGRAM0(u8 address, u8 *ptrTable)
2073                     ; 786 {
2074                     	switch	.text
2075  02dd               _LCD_DisplayCGRAM0:
2077  02dd 88            	push	a
2078  02de 88            	push	a
2079       00000001      OFST:	set	1
2082                     ; 791   LCD_SendByte(COMMAND_TYPE, (u8)0x40);
2084  02df aef840        	ldw	x,#63552
2085  02e2 cd0036        	call	_LCD_SendByte
2087                     ; 793   u = 32; /* Nb byte in the table */
2089  02e5 a620          	ld	a,#32
2090  02e7 6b01          	ld	(OFST+0,sp),a
2091  02e9               L7001:
2092                     ; 796     LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
2094  02e9 4f            	clr	a
2095  02ea 97            	ld	xl,a
2096  02eb a620          	ld	a,#32
2097  02ed 1001          	sub	a,(OFST+0,sp)
2098  02ef 2401          	jrnc	L652
2099  02f1 5a            	decw	x
2100  02f2               L652:
2101  02f2 02            	rlwa	x,a
2102  02f3 72fb05        	addw	x,(OFST+4,sp)
2103  02f6 f6            	ld	a,(x)
2104  02f7 97            	ld	xl,a
2105  02f8 a6fa          	ld	a,#250
2106  02fa 95            	ld	xh,a
2107  02fb cd0036        	call	_LCD_SendByte
2109                     ; 797     u--;
2109                     ; 798   }
2109                     ; 799 
2109                     ; 800   /* Setup Display Address */
2109                     ; 801   LCD_SendByte(COMMAND_TYPE, address);
2109                     ; 802   LCD_SendByte(DATA_TYPE, (u8)0x00);
2109                     ; 803   LCD_SendByte(DATA_TYPE, (u8)0x00);
2109                     ; 804 
2109                     ; 805 }
2109                     ; 806 
2109                     ; 807 /**
2109                     ; 808   * @brief Display CGRAM on odd address
2109                     ; 809   * @param[in] address Display address
2109                     ; 810   * @param[in] ptrTable Pointer a the CGRAM table to be displayed
2109                     ; 811   * @retval void None
2109                     ; 812   * @par Required preconditions:
2109                     ; 813   * - LCD must be enabled
2109                     ; 814   * @par Functions called:
2109                     ; 815   * - LCD_SendByte
2109                     ; 816   * @par Example:
2109                     ; 817   * @code
2109                     ; 818   * LCD_DisplayCGRAM1(0x80);
2109                     ; 819   * @endcode
2109                     ; 820   */
2109                     ; 821 void LCD_DisplayCGRAM1(u8 address, u8 *ptrTable)
2109                     ; 822 {
2109                     ; 823 
2109                     ; 824   u8 u;
2109                     ; 825 
2109                     ; 826  /* Set CGRAM Address */
2109                     ; 827   LCD_SendByte(COMMAND_TYPE, (u8)((u8)0x40 | (u8)0x10));
2109                     ; 828 
2109                     ; 829   u = 32; /* Nb byte in the table */
2109                     ; 830   while (u)
2109                     ; 831   {
2109                     ; 832     LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
2109                     ; 833     u--;
2109                     ; 834   }
2109                     ; 835 
2109                     ; 836   /* Setup Display Address */
2109                     ; 837   LCD_SendByte(COMMAND_TYPE, (u8)(address + 1));
2109                     ; 838   LCD_SendByte(DATA_TYPE, (u8)0x00);
2109                     ; 839   LCD_SendByte(DATA_TYPE, (u8)0x02);
2109                     ; 840 
2109                     ; 841 }
2109                     ; 842 
2109                     ; 843 /**
2109                     ; 844   * @brief Display ST logo
2109                     ; 845   * @param[in] address Display address (LINE1:0x80-0x87 and LINE2:0x90-0x97)
2109                     ; 846   * @retval void None
2109                     ; 847   * @par Required preconditions:
2109                     ; 848   * - LCD must be enabled
2109                     ; 849   * @par Functions called:
2109                     ; 850   * - LCD_SendByte
2109                     ; 851   * @par Example:
2109                     ; 852   * @code
2109                     ; 853   * LCD_DisplayLogo(0x80);
2109                     ; 854   * @endcode
2109                     ; 855   */
2109                     ; 856 void LCD_DisplayLogo(u8 address)
2109                     ; 857 {
2109                     ; 858   LCD_DisplayCGRAM0(address, S_CGRAM);
2109                     ; 859   LCD_DisplayCGRAM1(address, T_CGRAM);
2109                     ; 860 }
2109                     ; 861 
2109                     ; 862 /**
2109                     ; 863   * @brief Display a string in rolling mode
2109                     ; 864   * @param[in] Line Line used for displaying the text (LCD_LINE1 or LCD_LINE2)
2109                     ; 865   * @param[in] ptr Pointer to the text to display
2109                     ; 866   * @param[in] speed Rolling speed
2109                     ; 867   * @retval void None
2109                     ; 868   * @par Required preconditions:
2109                     ; 869   * - LCD must be enabled
2109                     ; 870   * @par Functions called:
2109                     ; 871   * - LCD_SendByte
2109                     ; 872   * - LCD_ClearLine
2109                     ; 873   * - LCD_Delay
2109                     ; 874   * @par Example:
2109                     ; 875   * @code
2109                     ; 876   * u8 *pText;
2109                     ; 877   * pText = "Welcome into the fabulous world of STM8...";
2109                     ; 878   * LCD_RollString(LCD_LINE2, pText, 0xC000);
2109                     ; 879   * @endcode
2109                     ; 880   */
2109                     ; 881 void LCD_RollString(u8 Line, u8 *ptr, u16 speed)
2109                     ; 882 {
2109                     ; 883 
2109                     ; 884   u8 CharPos = 0;
2109                     ; 885   u8 *ptr2;
2109                     ; 886   
2109                     ; 887   /* Set cursor position at beginning of line */
2109                     ; 888   LCD_SendByte(COMMAND_TYPE, Line);
2109                     ; 889   
2109                     ; 890   ptr2 = ptr;
2109                     ; 891   
2109                     ; 892   /* Display each character of the string */
2109                     ; 893   while (*ptr2 != 0)
2109                     ; 894   {
2109                     ; 895    
2109                     ; 896     if (*ptr != 0)
2109                     ; 897     {
2109                     ; 898       LCD_SendByte(DATA_TYPE, *ptr);
2109                     ; 899       ptr++;
2109                     ; 900     }
2109                     ; 901     else
2109                     ; 902     {
2109                     ; 903       LCD_SendByte(DATA_TYPE, ' ');
2109                     ; 904     }
2109                     ; 905     
2109                     ; 906     CharPos++;
2109                     ; 907    
2109                     ; 908     if (CharPos == LCD_LINE_MAX_CHAR)
2109                     ; 909     {
2109                     ; 910       LCD_Delay(speed);
2109                     ; 911       LCD_ClearLine(Line);
2109                     ; 912       LCD_SendByte(COMMAND_TYPE, Line);
2109                     ; 913       CharPos = 0;
2109                     ; 914       ptr2++;
2109                     ; 915       ptr = ptr2;
2109                     ; 916     }
2109                     ; 917     
2109                     ; 918   }
2109                     ; 919 
2109                     ; 920 }
2109                     ; 921 /**
2109                     ; 922   * @brief Display a string from current position of the LCD cursor
2109                     ; 923   * @param[in] ptr Pointer to the string to display
2109                     ; 924   * @retval void None
2109                     ; 925   * @par Required preconditions:
2109                     ; 926   * - LCD must be enabled
2109                     ; 927   * @par Functions called:
2109                     ; 928   * - LCD_SendByte
2109                     ; 929   * @par Example:
2109                     ; 930   * @code
2109                     ; 931   * LCD_Print("Hello");
2109                     ; 932   * @endcode
2109                     ; 933   */
2109                     ; 934 void LCD_Print(u8 *ptr) {
2109                     ; 935   while (*ptr) 					// Display the string */
2109                     ; 936   LCD_SendByte(DATA_TYPE, *ptr++);
2109                     ; 937 }
2109                     ; 938 /**
2109                     ; 939   * @}
2109                     ; 940   */
2109                     ; 941 
2109                     ; 942 /******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
2111  02fe 0a01          	dec	(OFST+0,sp)
2112                     ; 794   while (u)
2112                     ; 795   {
2112                     ; 796     LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
2112                     ; 797     u--;
2114  0300 26e7          	jrne	L7001
2115                     ; 801   LCD_SendByte(COMMAND_TYPE, address);
2117  0302 7b02          	ld	a,(OFST+1,sp)
2118  0304 97            	ld	xl,a
2119  0305 a6f8          	ld	a,#248
2120  0307 95            	ld	xh,a
2121  0308 cd0036        	call	_LCD_SendByte
2123                     ; 802   LCD_SendByte(DATA_TYPE, (u8)0x00);
2125  030b aefa00        	ldw	x,#64000
2126  030e cd0036        	call	_LCD_SendByte
2128                     ; 803   LCD_SendByte(DATA_TYPE, (u8)0x00);
2130  0311 aefa00        	ldw	x,#64000
2131  0314 cd0036        	call	_LCD_SendByte
2133                     ; 805 }
2136  0317 85            	popw	x
2137  0318 81            	ret	
2191                     ; 821 void LCD_DisplayCGRAM1(u8 address, u8 *ptrTable)
2191                     ; 822 {
2192                     	switch	.text
2193  0319               _LCD_DisplayCGRAM1:
2195  0319 88            	push	a
2196  031a 88            	push	a
2197       00000001      OFST:	set	1
2200                     ; 827   LCD_SendByte(COMMAND_TYPE, (u8)((u8)0x40 | (u8)0x10));
2202  031b aef850        	ldw	x,#63568
2203  031e cd0036        	call	_LCD_SendByte
2205                     ; 829   u = 32; /* Nb byte in the table */
2207  0321 a620          	ld	a,#32
2208  0323 6b01          	ld	(OFST+0,sp),a
2209  0325               L3401:
2210                     ; 832     LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
2212  0325 4f            	clr	a
2213  0326 97            	ld	xl,a
2214  0327 a620          	ld	a,#32
2215  0329 1001          	sub	a,(OFST+0,sp)
2216  032b 2401          	jrnc	L472
2217  032d 5a            	decw	x
2218  032e               L472:
2219  032e 02            	rlwa	x,a
2220  032f 72fb05        	addw	x,(OFST+4,sp)
2221  0332 f6            	ld	a,(x)
2222  0333 97            	ld	xl,a
2223  0334 a6fa          	ld	a,#250
2224  0336 95            	ld	xh,a
2225  0337 cd0036        	call	_LCD_SendByte
2227                     ; 833     u--;
2227                     ; 834   }
2227                     ; 835 
2227                     ; 836   /* Setup Display Address */
2227                     ; 837   LCD_SendByte(COMMAND_TYPE, (u8)(address + 1));
2227                     ; 838   LCD_SendByte(DATA_TYPE, (u8)0x00);
2227                     ; 839   LCD_SendByte(DATA_TYPE, (u8)0x02);
2227                     ; 840 
2227                     ; 841 }
2227                     ; 842 
2227                     ; 843 /**
2227                     ; 844   * @brief Display ST logo
2227                     ; 845   * @param[in] address Display address (LINE1:0x80-0x87 and LINE2:0x90-0x97)
2227                     ; 846   * @retval void None
2227                     ; 847   * @par Required preconditions:
2227                     ; 848   * - LCD must be enabled
2227                     ; 849   * @par Functions called:
2227                     ; 850   * - LCD_SendByte
2227                     ; 851   * @par Example:
2227                     ; 852   * @code
2227                     ; 853   * LCD_DisplayLogo(0x80);
2227                     ; 854   * @endcode
2227                     ; 855   */
2227                     ; 856 void LCD_DisplayLogo(u8 address)
2227                     ; 857 {
2227                     ; 858   LCD_DisplayCGRAM0(address, S_CGRAM);
2227                     ; 859   LCD_DisplayCGRAM1(address, T_CGRAM);
2227                     ; 860 }
2227                     ; 861 
2227                     ; 862 /**
2227                     ; 863   * @brief Display a string in rolling mode
2227                     ; 864   * @param[in] Line Line used for displaying the text (LCD_LINE1 or LCD_LINE2)
2227                     ; 865   * @param[in] ptr Pointer to the text to display
2227                     ; 866   * @param[in] speed Rolling speed
2227                     ; 867   * @retval void None
2227                     ; 868   * @par Required preconditions:
2227                     ; 869   * - LCD must be enabled
2227                     ; 870   * @par Functions called:
2227                     ; 871   * - LCD_SendByte
2227                     ; 872   * - LCD_ClearLine
2227                     ; 873   * - LCD_Delay
2227                     ; 874   * @par Example:
2227                     ; 875   * @code
2227                     ; 876   * u8 *pText;
2227                     ; 877   * pText = "Welcome into the fabulous world of STM8...";
2227                     ; 878   * LCD_RollString(LCD_LINE2, pText, 0xC000);
2227                     ; 879   * @endcode
2227                     ; 880   */
2227                     ; 881 void LCD_RollString(u8 Line, u8 *ptr, u16 speed)
2227                     ; 882 {
2227                     ; 883 
2227                     ; 884   u8 CharPos = 0;
2227                     ; 885   u8 *ptr2;
2227                     ; 886   
2227                     ; 887   /* Set cursor position at beginning of line */
2227                     ; 888   LCD_SendByte(COMMAND_TYPE, Line);
2227                     ; 889   
2227                     ; 890   ptr2 = ptr;
2227                     ; 891   
2227                     ; 892   /* Display each character of the string */
2227                     ; 893   while (*ptr2 != 0)
2227                     ; 894   {
2227                     ; 895    
2227                     ; 896     if (*ptr != 0)
2227                     ; 897     {
2227                     ; 898       LCD_SendByte(DATA_TYPE, *ptr);
2227                     ; 899       ptr++;
2227                     ; 900     }
2227                     ; 901     else
2227                     ; 902     {
2227                     ; 903       LCD_SendByte(DATA_TYPE, ' ');
2227                     ; 904     }
2227                     ; 905     
2227                     ; 906     CharPos++;
2227                     ; 907    
2227                     ; 908     if (CharPos == LCD_LINE_MAX_CHAR)
2227                     ; 909     {
2227                     ; 910       LCD_Delay(speed);
2227                     ; 911       LCD_ClearLine(Line);
2227                     ; 912       LCD_SendByte(COMMAND_TYPE, Line);
2227                     ; 913       CharPos = 0;
2227                     ; 914       ptr2++;
2227                     ; 915       ptr = ptr2;
2227                     ; 916     }
2227                     ; 917     
2227                     ; 918   }
2227                     ; 919 
2227                     ; 920 }
2227                     ; 921 /**
2227                     ; 922   * @brief Display a string from current position of the LCD cursor
2227                     ; 923   * @param[in] ptr Pointer to the string to display
2227                     ; 924   * @retval void None
2227                     ; 925   * @par Required preconditions:
2227                     ; 926   * - LCD must be enabled
2227                     ; 927   * @par Functions called:
2227                     ; 928   * - LCD_SendByte
2227                     ; 929   * @par Example:
2227                     ; 930   * @code
2227                     ; 931   * LCD_Print("Hello");
2227                     ; 932   * @endcode
2227                     ; 933   */
2227                     ; 934 void LCD_Print(u8 *ptr) {
2227                     ; 935   while (*ptr) 					// Display the string */
2227                     ; 936   LCD_SendByte(DATA_TYPE, *ptr++);
2227                     ; 937 }
2227                     ; 938 /**
2227                     ; 939   * @}
2227                     ; 940   */
2227                     ; 941 
2227                     ; 942 /******************* (C) COPYRIGHT 2008 STMicroelectronics *****END OF FILE****/
2229  033a 0a01          	dec	(OFST+0,sp)
2230                     ; 830   while (u)
2230                     ; 831   {
2230                     ; 832     LCD_SendByte(DATA_TYPE, ptrTable[32 - u]);
2230                     ; 833     u--;
2232  033c 26e7          	jrne	L3401
2233                     ; 837   LCD_SendByte(COMMAND_TYPE, (u8)(address + 1));
2235  033e 7b02          	ld	a,(OFST+1,sp)
2236  0340 4c            	inc	a
2237  0341 97            	ld	xl,a
2238  0342 a6f8          	ld	a,#248
2239  0344 95            	ld	xh,a
2240  0345 cd0036        	call	_LCD_SendByte
2242                     ; 838   LCD_SendByte(DATA_TYPE, (u8)0x00);
2244  0348 aefa00        	ldw	x,#64000
2245  034b cd0036        	call	_LCD_SendByte
2247                     ; 839   LCD_SendByte(DATA_TYPE, (u8)0x02);
2249  034e aefa02        	ldw	x,#64002
2250  0351 cd0036        	call	_LCD_SendByte
2252                     ; 841 }
2255  0354 85            	popw	x
2256  0355 81            	ret	
2294                     ; 856 void LCD_DisplayLogo(u8 address)
2294                     ; 857 {
2295                     	switch	.text
2296  0356               _LCD_DisplayLogo:
2298  0356 88            	push	a
2299       00000000      OFST:	set	0
2302                     ; 858   LCD_DisplayCGRAM0(address, S_CGRAM);
2304  0357 ae0000        	ldw	x,#_S_CGRAM
2305  035a 89            	pushw	x
2306  035b ad80          	call	_LCD_DisplayCGRAM0
2308  035d 85            	popw	x
2309                     ; 859   LCD_DisplayCGRAM1(address, T_CGRAM);
2311  035e ae0020        	ldw	x,#_T_CGRAM
2312  0361 89            	pushw	x
2313  0362 7b03          	ld	a,(OFST+3,sp)
2314  0364 adb3          	call	_LCD_DisplayCGRAM1
2316  0366 85            	popw	x
2317                     ; 860 }
2320  0367 84            	pop	a
2321  0368 81            	ret	
2396                     ; 881 void LCD_RollString(u8 Line, u8 *ptr, u16 speed)
2396                     ; 882 {
2397                     	switch	.text
2398  0369               _LCD_RollString:
2400  0369 88            	push	a
2401  036a 5203          	subw	sp,#3
2402       00000003      OFST:	set	3
2405                     ; 884   u8 CharPos = 0;
2407  036c 0f01          	clr	(OFST-2,sp)
2408                     ; 888   LCD_SendByte(COMMAND_TYPE, Line);
2410  036e 97            	ld	xl,a
2411  036f a6f8          	ld	a,#248
2412  0371 95            	ld	xh,a
2413  0372 cd0036        	call	_LCD_SendByte
2415                     ; 890   ptr2 = ptr;
2417  0375 1e07          	ldw	x,(OFST+4,sp)
2418  0377 1f02          	ldw	(OFST-1,sp),x
2420  0379 203d          	jra	L1311
2421  037b               L5211:
2422                     ; 896     if (*ptr != 0)
2424  037b 1e07          	ldw	x,(OFST+4,sp)
2425  037d f6            	ld	a,(x)
2426  037e 270e          	jreq	L5311
2427                     ; 898       LCD_SendByte(DATA_TYPE, *ptr);
2429  0380 97            	ld	xl,a
2430  0381 a6fa          	ld	a,#250
2431  0383 95            	ld	xh,a
2432  0384 cd0036        	call	_LCD_SendByte
2434                     ; 899       ptr++;
2436  0387 1e07          	ldw	x,(OFST+4,sp)
2437  0389 5c            	incw	x
2438  038a 1f07          	ldw	(OFST+4,sp),x
2440  038c 2006          	jra	L7311
2441  038e               L5311:
2442                     ; 903       LCD_SendByte(DATA_TYPE, ' ');
2444  038e aefa20        	ldw	x,#64032
2445  0391 cd0036        	call	_LCD_SendByte
2447  0394               L7311:
2448                     ; 906     CharPos++;
2450  0394 0c01          	inc	(OFST-2,sp)
2451                     ; 908     if (CharPos == LCD_LINE_MAX_CHAR)
2453  0396 7b01          	ld	a,(OFST-2,sp)
2454  0398 a10f          	cp	a,#15
2455  039a 261c          	jrne	L1311
2456                     ; 910       LCD_Delay(speed);
2458  039c 1e09          	ldw	x,(OFST+6,sp)
2459  039e cd0000        	call	_LCD_Delay
2461                     ; 911       LCD_ClearLine(Line);
2463  03a1 7b04          	ld	a,(OFST+1,sp)
2464  03a3 cd00b4        	call	_LCD_ClearLine
2466                     ; 912       LCD_SendByte(COMMAND_TYPE, Line);
2468  03a6 7b04          	ld	a,(OFST+1,sp)
2469  03a8 97            	ld	xl,a
2470  03a9 a6f8          	ld	a,#248
2471  03ab 95            	ld	xh,a
2472  03ac cd0036        	call	_LCD_SendByte
2474                     ; 913       CharPos = 0;
2476  03af 0f01          	clr	(OFST-2,sp)
2477                     ; 914       ptr2++;
2479  03b1 1e02          	ldw	x,(OFST-1,sp)
2480  03b3 5c            	incw	x
2481  03b4 1f02          	ldw	(OFST-1,sp),x
2482                     ; 915       ptr = ptr2;
2484  03b6 1f07          	ldw	(OFST+4,sp),x
2485  03b8               L1311:
2486                     ; 893   while (*ptr2 != 0)
2488  03b8 1e02          	ldw	x,(OFST-1,sp)
2489  03ba f6            	ld	a,(x)
2490  03bb 26be          	jrne	L5211
2491                     ; 920 }
2494  03bd 5b04          	addw	sp,#4
2495  03bf 81            	ret	
2531                     ; 934 void LCD_Print(u8 *ptr) {
2532                     	switch	.text
2533  03c0               _LCD_Print:
2535  03c0 89            	pushw	x
2536       00000000      OFST:	set	0
2539  03c1 200a          	jra	L3611
2540  03c3               L1611:
2541                     ; 936   LCD_SendByte(DATA_TYPE, *ptr++);
2543  03c3 5c            	incw	x
2544  03c4 1f01          	ldw	(OFST+1,sp),x
2545  03c6 97            	ld	xl,a
2546  03c7 a6fa          	ld	a,#250
2547  03c9 95            	ld	xh,a
2548  03ca cd0036        	call	_LCD_SendByte
2550  03cd               L3611:
2551                     ; 935   while (*ptr) 					// Display the string */
2553  03cd 1e01          	ldw	x,(OFST+1,sp)
2554  03cf f6            	ld	a,(x)
2555  03d0 26f1          	jrne	L1611
2556                     ; 937 }
2559  03d2 85            	popw	x
2560  03d3 81            	ret	
2595                     	xdef	_LCD_Delay
2596                     	xdef	_T_CGRAM
2597                     	xdef	_S_CGRAM
2598                     	xdef	_LCD_RollString
2599                     	xdef	_LCD_DisplayLogo
2600                     	xdef	_LCD_DisplayCGRAM1
2601                     	xdef	_LCD_DisplayCGRAM0
2602                     	xdef	_LCD_PrintBin4
2603                     	xdef	_LCD_PrintBin2
2604                     	xdef	_LCD_PrintHex3
2605                     	xdef	_LCD_PrintHex2
2606                     	xdef	_LCD_PrintHex1
2607                     	xdef	_LCD_PrintDec4
2608                     	xdef	_LCD_PrintDec3
2609                     	xdef	_LCD_PrintDec2
2610                     	xdef	_LCD_PrintDec1
2611                     	xdef	_LCD_Print
2612                     	xdef	_LCD_PrintMsg
2613                     	xdef	_LCD_PrintString
2614                     	xdef	_LCD_PrintChar
2615                     	xdef	_LCD_SetCursorPos
2616                     	xdef	_LCD_ClearLine
2617                     	xdef	_LCD_SetGraphicMode
2618                     	xdef	_LCD_SetTextMode
2619                     	xdef	_LCD_Clear
2620                     	xdef	_LCD_Init
2621                     	xdef	_LCD_SendBuffer
2622                     	xdef	_LCD_SendByte
2623                     	xdef	_LCD_ChipSelect
2624                     	xdef	_LCD_ReadStatus
2625                     	xref	_GPIO_WriteLow
2626                     	xref	_GPIO_WriteHigh
2627                     	xref	_GPIO_Init
2628                     	xref.b	c_x
2647                     	xref	c_imul
2648                     	end
