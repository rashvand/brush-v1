   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     	bsct
  20  0000               _DEV_Display:
  21  0000 0f            	dc.b	15
  22  0001 02            	dc.b	2
  23  0002 00            	dc.b	0
  24  0003 00            	dc.b	0
  25  0004               L3_bBlinkState:
  26  0004 00            	dc.b	0
  27  0005               L5_g_pUserInterface:
  28  0005 0000          	dc.w	0
  29  0007               L7_g_pdevice:
  30  0007 0000          	dc.w	0
  31  0009               L11_g_pSelTab:
  32  0009 0000          	dc.w	0
 652                     ; 57 void displayInit(pvdev_device_t pDevice,PUserInterface_t pUserInterface)
 652                     ; 58 {
 654                     	switch	.text
 655  0000               _displayInit:
 657  0000 89            	pushw	x
 658       00000000      OFST:	set	0
 661                     ; 59 	g_pUserInterface = pUserInterface;
 663  0001 1e05          	ldw	x,(OFST+5,sp)
 664  0003 bf05          	ldw	L5_g_pUserInterface,x
 665                     ; 60 	g_pdevice = pDevice;
 667  0005 1e01          	ldw	x,(OFST+1,sp)
 668  0007 bf07          	ldw	L7_g_pdevice,x
 669                     ; 62 	display_welcome_message();
 671  0009 cd04e0        	call	_display_welcome_message
 673                     ; 63 	vtimer_SetTimer(VTIM_DISPLAY_REFRESH,DISPLAY_REFRESH_TIME,0);
 675  000c 5f            	clrw	x
 676  000d 89            	pushw	x
 677  000e ae012c        	ldw	x,#300
 678  0011 89            	pushw	x
 679  0012 a602          	ld	a,#2
 680  0014 cd0000        	call	_vtimer_SetTimer
 682  0017 5b04          	addw	sp,#4
 683                     ; 64 }
 686  0019 85            	popw	x
 687  001a 81            	ret	
 742                     ; 66 void display_clsscr(pvdev_device_t pdevice)
 742                     ; 67 {
 743                     	switch	.text
 744  001b               _display_clsscr:
 746  001b 89            	pushw	x
 747  001c 89            	pushw	x
 748       00000002      OFST:	set	2
 751                     ; 69 	for (j = 0; j < DEV_Display_ROW; j++)
 753  001d 0f01          	clr	(OFST-1,sp)
 754  001f               L134:
 755                     ; 71 		for (i = 0; i < DEV_Display_COL; i++)
 757  001f 0f02          	clr	(OFST+0,sp)
 758  0021               L734:
 759                     ; 73 			pdevice->mems.m8[j*DEV_Display_COL + i] = 32; // Space ascii
 761  0021 7b01          	ld	a,(OFST-1,sp)
 762  0023 97            	ld	xl,a
 763  0024 a60f          	ld	a,#15
 764  0026 42            	mul	x,a
 765  0027 01            	rrwa	x,a
 766  0028 1b02          	add	a,(OFST+0,sp)
 767  002a 2401          	jrnc	L41
 768  002c 5c            	incw	x
 769  002d               L41:
 770  002d 1603          	ldw	y,(OFST+1,sp)
 771  002f 02            	rlwa	x,a
 772  0030 90ee09        	ldw	y,(9,y)
 773  0033 90bf00        	ldw	c_x,y
 774  0036 72bb0000      	addw	x,c_x
 775  003a a620          	ld	a,#32
 776  003c f7            	ld	(x),a
 777                     ; 71 		for (i = 0; i < DEV_Display_COL; i++)
 779  003d 0c02          	inc	(OFST+0,sp)
 782  003f 7b02          	ld	a,(OFST+0,sp)
 783  0041 a10f          	cp	a,#15
 784  0043 25dc          	jrult	L734
 785                     ; 69 	for (j = 0; j < DEV_Display_ROW; j++)
 787  0045 0c01          	inc	(OFST-1,sp)
 790  0047 7b01          	ld	a,(OFST-1,sp)
 791  0049 a102          	cp	a,#2
 792  004b 25d2          	jrult	L134
 793                     ; 76 }
 796  004d 5b04          	addw	sp,#4
 797  004f 81            	ret	
 841                     ; 78 void display_setcurrpos(display_index_t x, display_index_t y)
 841                     ; 79 {
 842                     	switch	.text
 843  0050               _display_setcurrpos:
 845  0050 89            	pushw	x
 846       00000000      OFST:	set	0
 849                     ; 80 	if (x > 0)
 851  0051 9e            	ld	a,xh
 852  0052 4d            	tnz	a
 853  0053 270a          	jreq	L764
 854                     ; 82 		x--;
 856  0055 0a01          	dec	(OFST+1,sp)
 857                     ; 83 		if (x < DEV_Display_COL)
 859  0057 7b01          	ld	a,(OFST+1,sp)
 860  0059 a10f          	cp	a,#15
 861  005b 2402          	jruge	L764
 862                     ; 85 			DEV_Display.Cur_x = x;
 864  005d b702          	ld	_DEV_Display+2,a
 865  005f               L764:
 866                     ; 88 	if (y > 0)
 868  005f 7b02          	ld	a,(OFST+2,sp)
 869  0061 270a          	jreq	L374
 870                     ; 90 		y--;
 872  0063 0a02          	dec	(OFST+2,sp)
 873                     ; 91 		if (y < DEV_Display_ROW)
 875  0065 7b02          	ld	a,(OFST+2,sp)
 876  0067 a102          	cp	a,#2
 877  0069 2402          	jruge	L374
 878                     ; 93 			DEV_Display.Cur_y = y;
 880  006b b703          	ld	_DEV_Display+3,a
 881  006d               L374:
 882                     ; 96 }
 885  006d 85            	popw	x
 886  006e 81            	ret	
 933                     ; 98 void display_printchar(pvdev_device_t pdevice,char ch)
 933                     ; 99 {
 934                     	switch	.text
 935  006f               _display_printchar:
 937  006f 89            	pushw	x
 938       00000000      OFST:	set	0
 941                     ; 100 	pdevice->mems.m8[DEV_Display.Cur_y * DEV_Display_COL + DEV_Display.Cur_x] = ch;
 943  0070 b603          	ld	a,_DEV_Display+3
 944  0072 97            	ld	xl,a
 945  0073 a60f          	ld	a,#15
 946  0075 42            	mul	x,a
 947  0076 01            	rrwa	x,a
 948  0077 bb02          	add	a,_DEV_Display+2
 949  0079 2401          	jrnc	L22
 950  007b 5c            	incw	x
 951  007c               L22:
 952  007c 1601          	ldw	y,(OFST+1,sp)
 953  007e 02            	rlwa	x,a
 954  007f 90ee09        	ldw	y,(9,y)
 955  0082 90bf00        	ldw	c_x,y
 956  0085 72bb0000      	addw	x,c_x
 957  0089 7b05          	ld	a,(OFST+5,sp)
 958  008b f7            	ld	(x),a
 959                     ; 101 }
 962  008c 85            	popw	x
 963  008d 81            	ret	
1011                     ; 103 void display_printstr(pvdev_device_t pdevice,char *pStr)
1011                     ; 104 {
1012                     	switch	.text
1013  008e               _display_printstr:
1015  008e 89            	pushw	x
1016       00000000      OFST:	set	0
1019  008f 1e05          	ldw	x,(OFST+5,sp)
1020  0091 2025          	jra	L155
1021  0093               L745:
1022                     ; 107 		pdevice->mems.m8[DEV_Display.Cur_y * DEV_Display_COL + DEV_Display.Cur_x] = *pStr;
1024  0093 b603          	ld	a,_DEV_Display+3
1025  0095 97            	ld	xl,a
1026  0096 a60f          	ld	a,#15
1027  0098 42            	mul	x,a
1028  0099 01            	rrwa	x,a
1029  009a bb02          	add	a,_DEV_Display+2
1030  009c 2401          	jrnc	L62
1031  009e 5c            	incw	x
1032  009f               L62:
1033  009f 1601          	ldw	y,(OFST+1,sp)
1034  00a1 02            	rlwa	x,a
1035  00a2 90ee09        	ldw	y,(9,y)
1036  00a5 90bf00        	ldw	c_x,y
1037  00a8 1605          	ldw	y,(OFST+5,sp)
1038  00aa 72bb0000      	addw	x,c_x
1039  00ae 90f6          	ld	a,(y)
1040  00b0 f7            	ld	(x),a
1041                     ; 108 		DEV_Display.Cur_x++;
1043  00b1 3c02          	inc	_DEV_Display+2
1044                     ; 109 		pStr++;
1046  00b3 1e05          	ldw	x,(OFST+5,sp)
1047  00b5 5c            	incw	x
1048  00b6 1f05          	ldw	(OFST+5,sp),x
1049  00b8               L155:
1050                     ; 105 	while ((*pStr != 0) && (DEV_Display.Cur_x < DEV_Display_COL))
1052  00b8 f6            	ld	a,(x)
1053  00b9 2706          	jreq	L555
1055  00bb b602          	ld	a,_DEV_Display+2
1056  00bd a10f          	cp	a,#15
1057  00bf 25d2          	jrult	L745
1058  00c1               L555:
1059                     ; 111 	if (DEV_Display.Cur_x >= DEV_Display_COL)
1061  00c1 b602          	ld	a,_DEV_Display+2
1062  00c3 a10f          	cp	a,#15
1063  00c5 2504          	jrult	L755
1064                     ; 112 		DEV_Display.Cur_x = DEV_Display_COL - 1; 
1066  00c7 350e0002      	mov	_DEV_Display+2,#14
1067  00cb               L755:
1068                     ; 113 }
1071  00cb 85            	popw	x
1072  00cc 81            	ret	
1099                     ; 115 void display_flush(void)
1099                     ; 116 {
1100                     	switch	.text
1101  00cd               _display_flush:
1105                     ; 117 	if (g_pUserInterface->bStatus == UI_UNLOCKED)
1107  00cd 92c605        	ld	a,[L5_g_pUserInterface.w]
1108  00d0 260b          	jrne	L175
1109                     ; 120 		display_create(g_pdevice, g_pUserInterface);
1111  00d2 be05          	ldw	x,L5_g_pUserInterface
1112  00d4 89            	pushw	x
1113  00d5 be07          	ldw	x,L7_g_pdevice
1114  00d7 cd0225        	call	_display_create
1116  00da 85            	popw	x
1118  00db 2003          	jra	L375
1119  00dd               L175:
1120                     ; 125 		display_create_locked_screen();
1122  00dd cd0517        	call	_display_create_locked_screen
1124  00e0               L375:
1125                     ; 128 	g_pdevice->ios.out8(VDEV_OUT8_DISPLAY_FLUSH,0);
1127  00e0 4b00          	push	#0
1128  00e2 ae0002        	ldw	x,#2
1129  00e5 89            	pushw	x
1130  00e6 5f            	clrw	x
1131  00e7 89            	pushw	x
1132  00e8 be07          	ldw	x,L7_g_pdevice
1133  00ea ee1b          	ldw	x,(27,x)
1134  00ec fd            	call	(x)
1136  00ed 5b05          	addw	sp,#5
1137                     ; 129 }
1140  00ef 81            	ret	
1211                     ; 133 void APP_sPrintDec(u8* pStr, u16 Number, u8 Digit)
1211                     ; 134 {
1212                     	switch	.text
1213  00f0               _APP_sPrintDec:
1215  00f0 89            	pushw	x
1216  00f1 5206          	subw	sp,#6
1217       00000006      OFST:	set	6
1220                     ; 141 		Nbre1Tmp = (u16)(Number / (u16)10000);
1222  00f3 1e0b          	ldw	x,(OFST+5,sp)
1223  00f5 90ae2710      	ldw	y,#10000
1224  00f9 65            	divw	x,y
1225  00fa 1f05          	ldw	(OFST-1,sp),x
1226                     ; 142 		if (Digit > 4)
1228  00fc 7b0d          	ld	a,(OFST+7,sp)
1229  00fe a105          	cp	a,#5
1230  0100 250c          	jrult	L336
1231                     ; 144 			*pStr = (u8)(Nbre1Tmp + (u8)0x30);
1233  0102 7b06          	ld	a,(OFST+0,sp)
1234  0104 1e07          	ldw	x,(OFST+1,sp)
1235  0106 ab30          	add	a,#48
1236  0108 f7            	ld	(x),a
1237                     ; 145 			pStr++;
1239  0109 5c            	incw	x
1240  010a 1f07          	ldw	(OFST+1,sp),x
1241  010c 1e05          	ldw	x,(OFST-1,sp)
1242  010e               L336:
1243                     ; 150 		Nbre1Tmp = (u16)(Number - ((u16)10000 * Nbre1Tmp));
1245  010e 90ae2710      	ldw	y,#10000
1246  0112 cd0000        	call	c_imul
1248  0115 1f01          	ldw	(OFST-5,sp),x
1249  0117 1e0b          	ldw	x,(OFST+5,sp)
1250  0119 72f001        	subw	x,(OFST-5,sp)
1251  011c 1f05          	ldw	(OFST-1,sp),x
1252                     ; 151 		Nbre2Tmp = (u16)(Nbre1Tmp / (u16)1000);
1254  011e 90ae03e8      	ldw	y,#1000
1255  0122 65            	divw	x,y
1256  0123 1f03          	ldw	(OFST-3,sp),x
1257                     ; 152 		if (Digit > 3)
1259  0125 7b0d          	ld	a,(OFST+7,sp)
1260  0127 a104          	cp	a,#4
1261  0129 250c          	jrult	L536
1262                     ; 154 			*pStr = (u8)(Nbre2Tmp + (u8)0x30);
1264  012b 7b04          	ld	a,(OFST-2,sp)
1265  012d 1e07          	ldw	x,(OFST+1,sp)
1266  012f ab30          	add	a,#48
1267  0131 f7            	ld	(x),a
1268                     ; 155 			pStr++;
1270  0132 5c            	incw	x
1271  0133 1f07          	ldw	(OFST+1,sp),x
1272  0135 1e03          	ldw	x,(OFST-3,sp)
1273  0137               L536:
1274                     ; 160 		Nbre1Tmp = (u16)(Nbre1Tmp - ((u16)1000 * Nbre2Tmp));
1276  0137 90ae03e8      	ldw	y,#1000
1277  013b cd0000        	call	c_imul
1279  013e 1f01          	ldw	(OFST-5,sp),x
1280  0140 1e05          	ldw	x,(OFST-1,sp)
1281  0142 72f001        	subw	x,(OFST-5,sp)
1282  0145 1f05          	ldw	(OFST-1,sp),x
1283                     ; 161 		Nbre2Tmp = (u16)(Nbre1Tmp / (u16)100);
1285  0147 90ae0064      	ldw	y,#100
1286  014b 65            	divw	x,y
1287  014c 1f03          	ldw	(OFST-3,sp),x
1288                     ; 162 		if (Digit > 2)
1290  014e 7b0d          	ld	a,(OFST+7,sp)
1291  0150 a103          	cp	a,#3
1292  0152 250c          	jrult	L736
1293                     ; 164 			*pStr = (u8)(Nbre2Tmp + (u8)0x30);
1295  0154 7b04          	ld	a,(OFST-2,sp)
1296  0156 1e07          	ldw	x,(OFST+1,sp)
1297  0158 ab30          	add	a,#48
1298  015a f7            	ld	(x),a
1299                     ; 165 			pStr ++;
1301  015b 5c            	incw	x
1302  015c 1f07          	ldw	(OFST+1,sp),x
1303  015e 1e03          	ldw	x,(OFST-3,sp)
1304  0160               L736:
1305                     ; 170 		Nbre1Tmp = (u16)(Nbre1Tmp - ((u16)100 * Nbre2Tmp));
1307  0160 90ae0064      	ldw	y,#100
1308  0164 cd0000        	call	c_imul
1310  0167 1f01          	ldw	(OFST-5,sp),x
1311  0169 1e05          	ldw	x,(OFST-1,sp)
1312  016b 72f001        	subw	x,(OFST-5,sp)
1313  016e 1f05          	ldw	(OFST-1,sp),x
1314                     ; 171 		Nbre2Tmp = (u16)(Nbre1Tmp / (u16)10);
1316  0170 90ae000a      	ldw	y,#10
1317  0174 65            	divw	x,y
1318  0175 1f03          	ldw	(OFST-3,sp),x
1319                     ; 172 		if (Digit > 1)
1321  0177 7b0d          	ld	a,(OFST+7,sp)
1322  0179 a102          	cp	a,#2
1323  017b 250c          	jrult	L146
1324                     ; 174 			*pStr = (u8)(Nbre2Tmp + (u8)0x30);
1326  017d 7b04          	ld	a,(OFST-2,sp)
1327  017f 1e07          	ldw	x,(OFST+1,sp)
1328  0181 ab30          	add	a,#48
1329  0183 f7            	ld	(x),a
1330                     ; 175 			pStr++;
1332  0184 5c            	incw	x
1333  0185 1f07          	ldw	(OFST+1,sp),x
1334  0187 1e03          	ldw	x,(OFST-3,sp)
1335  0189               L146:
1336                     ; 179     Nbre1Tmp = ((u16)(Nbre1Tmp - (u16)((u16)10 * Nbre2Tmp)));
1338  0189 90ae000a      	ldw	y,#10
1339  018d cd0000        	call	c_imul
1341  0190 1f01          	ldw	(OFST-5,sp),x
1342  0192 1e05          	ldw	x,(OFST-1,sp)
1343  0194 72f001        	subw	x,(OFST-5,sp)
1344  0197 1f05          	ldw	(OFST-1,sp),x
1345                     ; 180 		*pStr = (u8)(Nbre1Tmp + (u8)0x30);
1347  0199 7b06          	ld	a,(OFST+0,sp)
1348  019b 1e07          	ldw	x,(OFST+1,sp)
1349  019d ab30          	add	a,#48
1350  019f f7            	ld	(x),a
1351                     ; 182 		pStr++;
1353  01a0 5c            	incw	x
1354                     ; 183 		*pStr = 0; // End of string
1356                     ; 185 }
1359  01a1 5b08          	addw	sp,#8
1360  01a3 7f            	clr	(x)
1361  01a4 81            	ret	
1400                     ; 187 void display_setpoint_blink(void)
1400                     ; 188 {
1401                     	switch	.text
1402  01a5               _display_setpoint_blink:
1404  01a5 88            	push	a
1405       00000001      OFST:	set	1
1408                     ; 191 	if (g_pUserInterface == 0) return;
1410  01a6 be05          	ldw	x,L5_g_pUserInterface
1411  01a8 2602          	jrne	L166
1415  01aa 84            	pop	a
1416  01ab 81            	ret	
1417  01ac               L166:
1418                     ; 192 	if (g_pUserInterface->bStatus == UI_LOCKED) return;
1420  01ac f6            	ld	a,(x)
1421  01ad 4a            	dec	a
1422  01ae 2602          	jrne	L366
1426  01b0 84            	pop	a
1427  01b1 81            	ret	
1428  01b2               L366:
1429                     ; 193 	if (g_pdevice == 0) return;
1431  01b2 be07          	ldw	x,L7_g_pdevice
1432  01b4 2602          	jrne	L566
1436  01b6 84            	pop	a
1437  01b7 81            	ret	
1438  01b8               L566:
1439                     ; 194 	if (g_pSelTab == 0) return;
1441  01b8 be09          	ldw	x,L11_g_pSelTab
1442  01ba 2602          	jrne	L766
1446  01bc 84            	pop	a
1447  01bd 81            	ret	
1448  01be               L766:
1449                     ; 195 	for (i=0;i<g_pSelTab->bFieldsNumber;i++)
1451  01be 0f01          	clr	(OFST+0,sp)
1453  01c0 205a          	jra	L576
1454  01c2               L176:
1455                     ; 197 		if (g_pUserInterface->bField_Focus_Selection == i)
1457  01c2 be05          	ldw	x,L5_g_pUserInterface
1458  01c4 e604          	ld	a,(4,x)
1459  01c6 1101          	cp	a,(OFST+0,sp)
1460  01c8 2650          	jrne	L107
1461                     ; 199 			if (g_pUserInterface->bField_Edit != i)
1463  01ca e605          	ld	a,(5,x)
1464  01cc 1101          	cp	a,(OFST+0,sp)
1465  01ce 274a          	jreq	L107
1466                     ; 201 				if (bBlinkState == 0)
1468  01d0 b604          	ld	a,L3_bBlinkState
1469  01d2 261c          	jrne	L507
1470                     ; 203 					bBlinkState = 1;
1472  01d4 35010004      	mov	L3_bBlinkState,#1
1473                     ; 205 					g_pdevice->mems.m8[DISPLAYLINE_ADDR]=(u8)(i+1);
1475  01d8 7b01          	ld	a,(OFST+0,sp)
1476  01da be07          	ldw	x,L7_g_pdevice
1477  01dc ee09          	ldw	x,(9,x)
1478  01de 4c            	inc	a
1479  01df e71e          	ld	(30,x),a
1480                     ; 206 					g_pdevice->mems.m8[DISPLAYPOS_ADDR]=8;
1482  01e1 be07          	ldw	x,L7_g_pdevice
1483  01e3 ee09          	ldw	x,(9,x)
1484  01e5 a608          	ld	a,#8
1485  01e7 e71f          	ld	(31,x),a
1486                     ; 207 					g_pdevice->mems.m8[DISPLAYCH_ADDR]=16;
1488  01e9 be07          	ldw	x,L7_g_pdevice
1489  01eb 48            	sll	a
1490  01ec ee09          	ldw	x,(9,x)
1491                     ; 208 					g_pdevice->ios.out8(VDEV_OUT8_DISPLAY_PRINTCH,0);
1494  01ee 2019          	jp	LC001
1495  01f0               L507:
1496                     ; 213 					bBlinkState = 0;
1498  01f0 3f04          	clr	L3_bBlinkState
1499                     ; 215 					g_pdevice->mems.m8[DISPLAYLINE_ADDR]=(u8)(i+1);
1501  01f2 7b01          	ld	a,(OFST+0,sp)
1502  01f4 be07          	ldw	x,L7_g_pdevice
1503  01f6 ee09          	ldw	x,(9,x)
1504  01f8 4c            	inc	a
1505  01f9 e71e          	ld	(30,x),a
1506                     ; 216 					g_pdevice->mems.m8[DISPLAYPOS_ADDR]=8;
1508  01fb be07          	ldw	x,L7_g_pdevice
1509  01fd ee09          	ldw	x,(9,x)
1510  01ff a608          	ld	a,#8
1511  0201 e71f          	ld	(31,x),a
1512                     ; 217 					g_pdevice->mems.m8[DISPLAYCH_ADDR]=' ';
1514  0203 be07          	ldw	x,L7_g_pdevice
1515  0205 a620          	ld	a,#32
1516  0207 ee09          	ldw	x,(9,x)
1517                     ; 218 					g_pdevice->ios.out8(VDEV_OUT8_DISPLAY_PRINTCH,0);
1520  0209               LC001:
1521  0209 e720          	ld	(32,x),a
1523  020b 4b00          	push	#0
1524  020d ae0003        	ldw	x,#3
1525  0210 89            	pushw	x
1526  0211 5f            	clrw	x
1527  0212 89            	pushw	x
1528  0213 be07          	ldw	x,L7_g_pdevice
1529  0215 ee1b          	ldw	x,(27,x)
1530  0217 fd            	call	(x)
1531  0218 5b05          	addw	sp,#5
1532  021a               L107:
1533                     ; 195 	for (i=0;i<g_pSelTab->bFieldsNumber;i++)
1535  021a 0c01          	inc	(OFST+0,sp)
1536  021c               L576:
1539  021c 92c609        	ld	a,[L11_g_pSelTab.w]
1540  021f 1101          	cp	a,(OFST+0,sp)
1541  0221 229f          	jrugt	L176
1542                     ; 224 }
1545  0223 84            	pop	a
1546  0224 81            	ret	
1687                     ; 226 void display_create(pvdev_device_t pdevice, PUserInterface_t pUserInterface)
1687                     ; 227 {
1688                     	switch	.text
1689  0225               _display_create:
1691  0225 89            	pushw	x
1692  0226 520f          	subw	sp,#15
1693       0000000f      OFST:	set	15
1696                     ; 230 	u8 selTab = pUserInterface->bSelected_Tab;
1698  0228 1e14          	ldw	x,(OFST+5,sp)
1699  022a e601          	ld	a,(1,x)
1700  022c 6b06          	ld	(OFST-9,sp),a
1701                     ; 231 	PTab_t pSelTab = &(pUserInterface->pTab[selTab]);
1703  022e 97            	ld	xl,a
1704  022f a603          	ld	a,#3
1705  0231 1614          	ldw	y,(OFST+5,sp)
1706  0233 42            	mul	x,a
1707  0234 90ee07        	ldw	y,(7,y)
1708  0237 90bf00        	ldw	c_x,y
1709  023a 72bb0000      	addw	x,c_x
1710  023e 1f0d          	ldw	(OFST-2,sp),x
1711                     ; 232 	g_pSelTab = pSelTab;
1713  0240 bf09          	ldw	L11_g_pSelTab,x
1714                     ; 234 	display_clsscr(pdevice);
1716  0242 1e10          	ldw	x,(OFST+1,sp)
1717  0244 cd001b        	call	_display_clsscr
1719                     ; 236 	for (i=0;i<pSelTab->bFieldsNumber;i++)
1721  0247 0f0f          	clr	(OFST+0,sp)
1723  0249 cc04d3        	jra	L5201
1724  024c               L1201:
1725                     ; 238 		ValSize_t Size = pSelTab->pField[i].Size;
1727  024c 7b0f          	ld	a,(OFST+0,sp)
1728  024e 97            	ld	xl,a
1729  024f a609          	ld	a,#9
1730  0251 160d          	ldw	y,(OFST-2,sp)
1731  0253 42            	mul	x,a
1732  0254 90ee01        	ldw	y,(1,y)
1733  0257 90bf00        	ldw	c_x,y
1734  025a 72bb0000      	addw	x,c_x
1735  025e e604          	ld	a,(4,x)
1736  0260 6b05          	ld	(OFST-10,sp),a
1737                     ; 241 		display_setcurrpos((display_index_t)1,(display_index_t)(i+1));
1739  0262 7b0f          	ld	a,(OFST+0,sp)
1740  0264 4c            	inc	a
1741  0265 97            	ld	xl,a
1742  0266 a601          	ld	a,#1
1743  0268 95            	ld	xh,a
1744  0269 cd0050        	call	_display_setcurrpos
1746                     ; 242 		display_printstr(pdevice,pSelTab->pField[i].Label);
1748  026c 7b0f          	ld	a,(OFST+0,sp)
1749  026e 97            	ld	xl,a
1750  026f a609          	ld	a,#9
1751  0271 160d          	ldw	y,(OFST-2,sp)
1752  0273 42            	mul	x,a
1753  0274 90ee01        	ldw	y,(1,y)
1754  0277 90bf00        	ldw	c_x,y
1755  027a 72bb0000      	addw	x,c_x
1756  027e fe            	ldw	x,(x)
1757  027f 89            	pushw	x
1758  0280 1e12          	ldw	x,(OFST+3,sp)
1759  0282 cd008e        	call	_display_printstr
1761  0285 85            	popw	x
1762                     ; 244 		if (Size != TYPE_TXT)
1764  0286 7b05          	ld	a,(OFST-10,sp)
1765  0288 a105          	cp	a,#5
1766  028a 2738          	jreq	L1301
1767                     ; 247 			display_setcurrpos((display_index_t)9,(display_index_t)(i+1));
1769  028c 7b0f          	ld	a,(OFST+0,sp)
1770  028e 4c            	inc	a
1771  028f 97            	ld	xl,a
1772  0290 a609          	ld	a,#9
1773  0292 95            	ld	xh,a
1774  0293 cd0050        	call	_display_setcurrpos
1776                     ; 249 			if (pSelTab->pField[i].Type != EDIT)
1778  0296 7b0f          	ld	a,(OFST+0,sp)
1779  0298 97            	ld	xl,a
1780  0299 a609          	ld	a,#9
1781  029b 160d          	ldw	y,(OFST-2,sp)
1782  029d 42            	mul	x,a
1783  029e 90ee01        	ldw	y,(1,y)
1784  02a1 90bf00        	ldw	c_x,y
1785  02a4 72bb0000      	addw	x,c_x
1786  02a8 e603          	ld	a,(3,x)
1787  02aa 2704          	jreq	L3301
1788                     ; 251 				display_printchar(pdevice,' '); // Read Only
1790  02ac 4b20          	push	#32
1793  02ae 200e          	jp	LC002
1794  02b0               L3301:
1795                     ; 255 				if (pUserInterface->bField_Edit == i)
1797  02b0 1e14          	ldw	x,(OFST+5,sp)
1798  02b2 e605          	ld	a,(5,x)
1799  02b4 110f          	cp	a,(OFST+0,sp)
1800  02b6 2604          	jrne	L7301
1801                     ; 257 					display_printchar(pdevice,18); // Edit mode
1803  02b8 4b12          	push	#18
1806  02ba 2002          	jp	LC002
1807  02bc               L7301:
1808                     ; 261 					display_printchar(pdevice,16); // Field Editable
1810  02bc 4b10          	push	#16
1812  02be               LC002:
1813  02be 1e11          	ldw	x,(OFST+2,sp)
1814  02c0 cd006f        	call	_display_printchar
1815  02c3 84            	pop	a
1816  02c4               L1301:
1817                     ; 266 		switch (Size)
1819  02c4 7b05          	ld	a,(OFST-10,sp)
1821                     ; 342 					display_printstr(pdevice,"OFF");
1822  02c6 271a          	jreq	L117
1823  02c8 a002          	sub	a,#2
1824  02ca 275c          	jreq	L517
1825  02cc 4a            	dec	a
1826  02cd 2603cc0383    	jreq	L717
1827  02d2 4a            	dec	a
1828  02d3 2603cc03de    	jreq	L127
1829  02d8 a002          	sub	a,#2
1830  02da 2603cc045f    	jreq	L327
1831  02df cc04a2        	jra	L5401
1832  02e2               L117:
1833                     ; 268 			case TYPE_U8:
1833                     ; 269 				display_setcurrpos((display_index_t)11,(display_index_t)(i+1));
1835  02e2 7b0f          	ld	a,(OFST+0,sp)
1836  02e4 4c            	inc	a
1837  02e5 97            	ld	xl,a
1838  02e6 a60b          	ld	a,#11
1839  02e8 95            	ld	xh,a
1840  02e9 cd0050        	call	_display_setcurrpos
1842                     ; 270 				display_printchar(pdevice,' ');
1844  02ec 4b20          	push	#32
1845  02ee 1e11          	ldw	x,(OFST+2,sp)
1846  02f0 cd006f        	call	_display_printchar
1848  02f3 84            	pop	a
1849                     ; 271 				display_setcurrpos((display_index_t)12,(display_index_t)(i+1));
1851  02f4 7b0f          	ld	a,(OFST+0,sp)
1852  02f6 4c            	inc	a
1853  02f7 97            	ld	xl,a
1854  02f8 a60c          	ld	a,#12
1855  02fa 95            	ld	xh,a
1856  02fb cd0050        	call	_display_setcurrpos
1858                     ; 272 				APP_sPrintDec(Out,((PFN_getu8_t)pSelTab->pField[i].pGetValue)(),3);
1860  02fe 4b03          	push	#3
1861  0300 7b10          	ld	a,(OFST+1,sp)
1862  0302 97            	ld	xl,a
1863  0303 a609          	ld	a,#9
1864  0305 160e          	ldw	y,(OFST-1,sp)
1865  0307 42            	mul	x,a
1866  0308 90ee01        	ldw	y,(1,y)
1867  030b 90bf00        	ldw	c_x,y
1868  030e 72bb0000      	addw	x,c_x
1869  0312 ee05          	ldw	x,(5,x)
1870  0314 fd            	call	(x)
1872  0315 5f            	clrw	x
1873  0316 97            	ld	xl,a
1874  0317 89            	pushw	x
1875  0318 96            	ldw	x,sp
1876  0319 1c000a        	addw	x,#OFST-5
1877  031c cd00f0        	call	_APP_sPrintDec
1879  031f 5b03          	addw	sp,#3
1880                     ; 273 				display_printstr(pdevice,Out);
1882  0321 96            	ldw	x,sp
1883  0322 1c0007        	addw	x,#OFST-8
1885                     ; 274 			break;
1887  0325 cc049b        	jp	LC003
1888                     ; 275 			case TYPE_S8:
1888                     ; 276 			break;
1890  0328               L517:
1891                     ; 279 				s16 wVal=((PFN_gets16_t)pSelTab->pField[i].pGetValue)();
1893  0328 7b0f          	ld	a,(OFST+0,sp)
1894  032a 97            	ld	xl,a
1895  032b a609          	ld	a,#9
1896  032d 160d          	ldw	y,(OFST-2,sp)
1897  032f 42            	mul	x,a
1898  0330 90ee01        	ldw	y,(1,y)
1899  0333 90bf00        	ldw	c_x,y
1900  0336 72bb0000      	addw	x,c_x
1901  033a ee05          	ldw	x,(5,x)
1902  033c fd            	call	(x)
1904  033d 1f03          	ldw	(OFST-12,sp),x
1905                     ; 281 				display_setcurrpos((display_index_t)10,(display_index_t)(i+1));
1907  033f 7b0f          	ld	a,(OFST+0,sp)
1908  0341 4c            	inc	a
1909  0342 97            	ld	xl,a
1910  0343 a60a          	ld	a,#10
1911  0345 95            	ld	xh,a
1912  0346 cd0050        	call	_display_setcurrpos
1914                     ; 282 				if (wVal < 0)
1916  0349 1e03          	ldw	x,(OFST-12,sp)
1917  034b 2a0f          	jrpl	L7401
1918                     ; 284 					display_printchar(pdevice,'-');
1920  034d 4b2d          	push	#45
1921  034f 1e11          	ldw	x,(OFST+2,sp)
1922  0351 cd006f        	call	_display_printchar
1924  0354 84            	pop	a
1925                     ; 285 					wVal = -wVal;
1927  0355 1e03          	ldw	x,(OFST-12,sp)
1928  0357 50            	negw	x
1929  0358 1f03          	ldw	(OFST-12,sp),x
1931  035a 2008          	jra	L1501
1932  035c               L7401:
1933                     ; 289 					display_printchar(pdevice,' ');
1935  035c 4b20          	push	#32
1936  035e 1e11          	ldw	x,(OFST+2,sp)
1937  0360 cd006f        	call	_display_printchar
1939  0363 84            	pop	a
1940  0364               L1501:
1941                     ; 291 				display_setcurrpos((display_index_t)11,(display_index_t)(i+1));
1943  0364 7b0f          	ld	a,(OFST+0,sp)
1944  0366 4c            	inc	a
1945  0367 97            	ld	xl,a
1946  0368 a60b          	ld	a,#11
1947  036a 95            	ld	xh,a
1948  036b cd0050        	call	_display_setcurrpos
1950                     ; 292 				APP_sPrintDec(Out,wVal,4);
1952  036e 4b04          	push	#4
1953  0370 1e04          	ldw	x,(OFST-11,sp)
1954  0372 89            	pushw	x
1955  0373 96            	ldw	x,sp
1956  0374 1c000a        	addw	x,#OFST-5
1957  0377 cd00f0        	call	_APP_sPrintDec
1959  037a 5b03          	addw	sp,#3
1960                     ; 293 				display_printstr(pdevice,Out);
1962  037c 96            	ldw	x,sp
1963  037d 1c0007        	addw	x,#OFST-8
1965                     ; 295 			break;
1967  0380 cc049b        	jp	LC003
1968  0383               L717:
1969                     ; 298 				s16 wVal=((PFN_gets16_t)pSelTab->pField[i].pGetValue)();
1971  0383 7b0f          	ld	a,(OFST+0,sp)
1972  0385 97            	ld	xl,a
1973  0386 a609          	ld	a,#9
1974  0388 160d          	ldw	y,(OFST-2,sp)
1975  038a 42            	mul	x,a
1976  038b 90ee01        	ldw	y,(1,y)
1977  038e 90bf00        	ldw	c_x,y
1978  0391 72bb0000      	addw	x,c_x
1979  0395 ee05          	ldw	x,(5,x)
1980  0397 fd            	call	(x)
1982  0398 1f03          	ldw	(OFST-12,sp),x
1983                     ; 300 				display_setcurrpos((display_index_t)10,(display_index_t)(i+1));
1985  039a 7b0f          	ld	a,(OFST+0,sp)
1986  039c 4c            	inc	a
1987  039d 97            	ld	xl,a
1988  039e a60a          	ld	a,#10
1989  03a0 95            	ld	xh,a
1990  03a1 cd0050        	call	_display_setcurrpos
1992                     ; 301 				if (wVal < 0)
1994  03a4 1e03          	ldw	x,(OFST-12,sp)
1995  03a6 2a0f          	jrpl	L3501
1996                     ; 303 					display_printchar(pdevice,'-');
1998  03a8 4b2d          	push	#45
1999  03aa 1e11          	ldw	x,(OFST+2,sp)
2000  03ac cd006f        	call	_display_printchar
2002  03af 84            	pop	a
2003                     ; 304 					wVal = -wVal;
2005  03b0 1e03          	ldw	x,(OFST-12,sp)
2006  03b2 50            	negw	x
2007  03b3 1f03          	ldw	(OFST-12,sp),x
2009  03b5 2008          	jra	L5501
2010  03b7               L3501:
2011                     ; 308 					display_printchar(pdevice,' ');
2013  03b7 4b20          	push	#32
2014  03b9 1e11          	ldw	x,(OFST+2,sp)
2015  03bb cd006f        	call	_display_printchar
2017  03be 84            	pop	a
2018  03bf               L5501:
2019                     ; 310 				display_setcurrpos((display_index_t)11,(display_index_t)(i+1));
2021  03bf 7b0f          	ld	a,(OFST+0,sp)
2022  03c1 4c            	inc	a
2023  03c2 97            	ld	xl,a
2024  03c3 a60b          	ld	a,#11
2025  03c5 95            	ld	xh,a
2026  03c6 cd0050        	call	_display_setcurrpos
2028                     ; 311 				APP_sPrintDec(Out,wVal,5);
2030  03c9 4b05          	push	#5
2031  03cb 1e04          	ldw	x,(OFST-11,sp)
2032  03cd 89            	pushw	x
2033  03ce 96            	ldw	x,sp
2034  03cf 1c000a        	addw	x,#OFST-5
2035  03d2 cd00f0        	call	_APP_sPrintDec
2037  03d5 5b03          	addw	sp,#3
2038                     ; 312 				display_printstr(pdevice,Out);
2040  03d7 96            	ldw	x,sp
2041  03d8 1c0007        	addw	x,#OFST-8
2043                     ; 314 			break;
2045  03db cc049b        	jp	LC003
2046  03de               L127:
2047                     ; 317 				u16 wVal=((PFN_getu16_t)pSelTab->pField[i].pGetValue)();
2049  03de 7b0f          	ld	a,(OFST+0,sp)
2050  03e0 97            	ld	xl,a
2051  03e1 a609          	ld	a,#9
2052  03e3 160d          	ldw	y,(OFST-2,sp)
2053  03e5 42            	mul	x,a
2054  03e6 90ee01        	ldw	y,(1,y)
2055  03e9 90bf00        	ldw	c_x,y
2056  03ec 72bb0000      	addw	x,c_x
2057  03f0 ee05          	ldw	x,(5,x)
2058  03f2 fd            	call	(x)
2060  03f3 1f03          	ldw	(OFST-12,sp),x
2061                     ; 319 				display_setcurrpos((display_index_t)11,(display_index_t)(i+1));
2063  03f5 7b0f          	ld	a,(OFST+0,sp)
2064  03f7 4c            	inc	a
2065  03f8 97            	ld	xl,a
2066  03f9 a60b          	ld	a,#11
2067  03fb 95            	ld	xh,a
2068  03fc cd0050        	call	_display_setcurrpos
2070                     ; 320 				bTmp = (u8)(wVal/10);
2072  03ff 1e03          	ldw	x,(OFST-12,sp)
2073  0401 90ae000a      	ldw	y,#10
2074  0405 65            	divw	x,y
2075  0406 9f            	ld	a,xl
2076  0407 6b06          	ld	(OFST-9,sp),a
2077                     ; 321 				APP_sPrintDec(Out,bTmp,2);
2079  0409 4b02          	push	#2
2080  040b 7b07          	ld	a,(OFST-8,sp)
2081  040d 5f            	clrw	x
2082  040e 97            	ld	xl,a
2083  040f 89            	pushw	x
2084  0410 96            	ldw	x,sp
2085  0411 1c000a        	addw	x,#OFST-5
2086  0414 cd00f0        	call	_APP_sPrintDec
2088  0417 5b03          	addw	sp,#3
2089                     ; 323 				display_printstr(pdevice,Out);
2091  0419 96            	ldw	x,sp
2092  041a 1c0007        	addw	x,#OFST-8
2093  041d 89            	pushw	x
2094  041e 1e12          	ldw	x,(OFST+3,sp)
2095  0420 cd008e        	call	_display_printstr
2097  0423 85            	popw	x
2098                     ; 324 				display_setcurrpos((display_index_t)13,(display_index_t)(i+1));
2100  0424 7b0f          	ld	a,(OFST+0,sp)
2101  0426 4c            	inc	a
2102  0427 97            	ld	xl,a
2103  0428 a60d          	ld	a,#13
2104  042a 95            	ld	xh,a
2105  042b cd0050        	call	_display_setcurrpos
2107                     ; 325 				display_printchar(pdevice,'.');
2109  042e 4b2e          	push	#46
2110  0430 1e11          	ldw	x,(OFST+2,sp)
2111  0432 cd006f        	call	_display_printchar
2113  0435 84            	pop	a
2114                     ; 326 				display_setcurrpos((display_index_t)14,(display_index_t)(i+1));
2116  0436 7b0f          	ld	a,(OFST+0,sp)
2117  0438 4c            	inc	a
2118  0439 97            	ld	xl,a
2119  043a a60e          	ld	a,#14
2120  043c 95            	ld	xh,a
2121  043d cd0050        	call	_display_setcurrpos
2123                     ; 327 				APP_sPrintDec(Out,wVal-(bTmp*10),1);
2125  0440 4b01          	push	#1
2126  0442 7b07          	ld	a,(OFST-8,sp)
2127  0444 97            	ld	xl,a
2128  0445 a60a          	ld	a,#10
2129  0447 42            	mul	x,a
2130  0448 1f02          	ldw	(OFST-13,sp),x
2131  044a 1e04          	ldw	x,(OFST-11,sp)
2132  044c 72f002        	subw	x,(OFST-13,sp)
2133  044f 89            	pushw	x
2134  0450 96            	ldw	x,sp
2135  0451 1c000a        	addw	x,#OFST-5
2136  0454 cd00f0        	call	_APP_sPrintDec
2138  0457 5b03          	addw	sp,#3
2139                     ; 328 				display_printstr(pdevice,Out);
2141  0459 96            	ldw	x,sp
2142  045a 1c0007        	addw	x,#OFST-8
2144                     ; 330 			break;
2146  045d 203c          	jp	LC003
2147  045f               L327:
2148                     ; 333 				display_setcurrpos((display_index_t)11,(display_index_t)(i+1));
2150  045f 7b0f          	ld	a,(OFST+0,sp)
2151  0461 4c            	inc	a
2152  0462 97            	ld	xl,a
2153  0463 a60b          	ld	a,#11
2154  0465 95            	ld	xh,a
2155  0466 cd0050        	call	_display_setcurrpos
2157                     ; 334 				display_printchar(pdevice,' ');
2159  0469 4b20          	push	#32
2160  046b 1e11          	ldw	x,(OFST+2,sp)
2161  046d cd006f        	call	_display_printchar
2163  0470 84            	pop	a
2164                     ; 335 				display_setcurrpos((display_index_t)12,(display_index_t)(i+1));
2166  0471 7b0f          	ld	a,(OFST+0,sp)
2167  0473 4c            	inc	a
2168  0474 97            	ld	xl,a
2169  0475 a60c          	ld	a,#12
2170  0477 95            	ld	xh,a
2171  0478 cd0050        	call	_display_setcurrpos
2173                     ; 336 				if (((PFN_getu8_t)pSelTab->pField[i].pGetValue)())
2175  047b 7b0f          	ld	a,(OFST+0,sp)
2176  047d 97            	ld	xl,a
2177  047e a609          	ld	a,#9
2178  0480 160d          	ldw	y,(OFST-2,sp)
2179  0482 42            	mul	x,a
2180  0483 90ee01        	ldw	y,(1,y)
2181  0486 90bf00        	ldw	c_x,y
2182  0489 72bb0000      	addw	x,c_x
2183  048d ee05          	ldw	x,(5,x)
2184  048f fd            	call	(x)
2186  0490 4d            	tnz	a
2187  0491 2705          	jreq	L7501
2188                     ; 338 					display_printstr(pdevice,"ON");
2190  0493 ae0005        	ldw	x,#L1601
2193  0496 2003          	jp	LC003
2194  0498               L7501:
2195                     ; 342 					display_printstr(pdevice,"OFF");
2197  0498 ae0001        	ldw	x,#L5601
2199  049b               LC003:
2200  049b 89            	pushw	x
2201  049c 1e12          	ldw	x,(OFST+3,sp)
2202  049e cd008e        	call	_display_printstr
2203  04a1 85            	popw	x
2204  04a2               L5401:
2205                     ; 348 		if ((Size != TYPE_TXT) && (Size != TYPE_S16_NU))
2207  04a2 7b05          	ld	a,(OFST-10,sp)
2208  04a4 a105          	cp	a,#5
2209  04a6 2729          	jreq	L7601
2211  04a8 a103          	cp	a,#3
2212  04aa 2725          	jreq	L7601
2213                     ; 350 			display_setcurrpos((display_index_t)15,(display_index_t)(i+1));
2215  04ac 7b0f          	ld	a,(OFST+0,sp)
2216  04ae 4c            	inc	a
2217  04af 97            	ld	xl,a
2218  04b0 a60f          	ld	a,#15
2219  04b2 95            	ld	xh,a
2220  04b3 cd0050        	call	_display_setcurrpos
2222                     ; 351 			display_printchar(pdevice,pSelTab->pField[i].Unit);
2224  04b6 7b0f          	ld	a,(OFST+0,sp)
2225  04b8 97            	ld	xl,a
2226  04b9 a609          	ld	a,#9
2227  04bb 160d          	ldw	y,(OFST-2,sp)
2228  04bd 42            	mul	x,a
2229  04be 90ee01        	ldw	y,(1,y)
2230  04c1 90bf00        	ldw	c_x,y
2231  04c4 72bb0000      	addw	x,c_x
2232  04c8 e602          	ld	a,(2,x)
2233  04ca 88            	push	a
2234  04cb 1e11          	ldw	x,(OFST+2,sp)
2235  04cd cd006f        	call	_display_printchar
2237  04d0 84            	pop	a
2238  04d1               L7601:
2239                     ; 236 	for (i=0;i<pSelTab->bFieldsNumber;i++)
2241  04d1 0c0f          	inc	(OFST+0,sp)
2242  04d3               L5201:
2245  04d3 1e0d          	ldw	x,(OFST-2,sp)
2246  04d5 f6            	ld	a,(x)
2247  04d6 110f          	cp	a,(OFST+0,sp)
2248  04d8 2303cc024c    	jrugt	L1201
2249                     ; 355 }
2252  04dd 5b11          	addw	sp,#17
2253  04df 81            	ret	
2282                     ; 357 void display_welcome_message(void)
2282                     ; 358 {	
2283                     	switch	.text
2284  04e0               _display_welcome_message:
2288                     ; 359 	display_clsscr(g_pdevice);
2290  04e0 be07          	ldw	x,L7_g_pdevice
2291  04e2 cd001b        	call	_display_clsscr
2293                     ; 360 	display_setcurrpos(1,1);
2295  04e5 ae0101        	ldw	x,#257
2296  04e8 cd0050        	call	_display_setcurrpos
2298                     ; 361 	display_printstr(g_pdevice,g_pUserInterface->pWelcomeMSG_Line1);
2300  04eb be05          	ldw	x,L5_g_pUserInterface
2301  04ed ee0a          	ldw	x,(10,x)
2302  04ef 89            	pushw	x
2303  04f0 be07          	ldw	x,L7_g_pdevice
2304  04f2 cd008e        	call	_display_printstr
2306  04f5 85            	popw	x
2307                     ; 362 	display_setcurrpos(1,2);
2309  04f6 ae0102        	ldw	x,#258
2310  04f9 cd0050        	call	_display_setcurrpos
2312                     ; 363 	display_printstr(g_pdevice,g_pUserInterface->pWelcomeMSG_Line2);
2314  04fc be05          	ldw	x,L5_g_pUserInterface
2315  04fe ee0c          	ldw	x,(12,x)
2316  0500 89            	pushw	x
2317  0501 be07          	ldw	x,L7_g_pdevice
2318  0503 cd008e        	call	_display_printstr
2320  0506 85            	popw	x
2321                     ; 366 	g_pdevice->ios.out8(VDEV_OUT8_DISPLAY_FLUSH,0);
2323  0507 4b00          	push	#0
2324  0509 ae0002        	ldw	x,#2
2325  050c 89            	pushw	x
2326  050d 5f            	clrw	x
2327  050e 89            	pushw	x
2328  050f be07          	ldw	x,L7_g_pdevice
2329  0511 ee1b          	ldw	x,(27,x)
2330  0513 fd            	call	(x)
2332  0514 5b05          	addw	sp,#5
2333                     ; 367 }
2336  0516 81            	ret	
2366                     ; 371 void display_create_locked_screen(void)
2366                     ; 372 {
2367                     	switch	.text
2368  0517               _display_create_locked_screen:
2372                     ; 373         UIErrMsg.pErrorStatus = "";
2374  0517 ae0000        	ldw	x,#L3111
2375  051a bf00          	ldw	L1011_UIErrMsg,x
2376                     ; 374         UserInterface_GetErrorMsg(&UIErrMsg);
2378  051c ae0000        	ldw	x,#L1011_UIErrMsg
2379  051f cd0000        	call	_UserInterface_GetErrorMsg
2381                     ; 375         if (UIErrMsg.pErrorStatus != "")
2383  0522 be00          	ldw	x,L1011_UIErrMsg
2384  0524 a30000        	cpw	x,#L3111
2385  0527 2723          	jreq	L5111
2386                     ; 377           display_clsscr(g_pdevice);
2388  0529 be07          	ldw	x,L7_g_pdevice
2389  052b cd001b        	call	_display_clsscr
2391                     ; 378           display_setcurrpos(1,1);
2393  052e ae0101        	ldw	x,#257
2394  0531 cd0050        	call	_display_setcurrpos
2396                     ; 379           display_printstr(g_pdevice,(u8*)UIErrMsg.pErrorStatus);
2398  0534 be00          	ldw	x,L1011_UIErrMsg
2399  0536 89            	pushw	x
2400  0537 be07          	ldw	x,L7_g_pdevice
2401  0539 cd008e        	call	_display_printstr
2403  053c 85            	popw	x
2404                     ; 380           display_setcurrpos(1,2);
2406  053d ae0102        	ldw	x,#258
2407  0540 cd0050        	call	_display_setcurrpos
2409                     ; 381           display_printstr(g_pdevice,(u8*)UIErrMsg.pErrorMsg); //g_pUserInterface->pWelcomeMSG_Line2
2411  0543 be02          	ldw	x,L1011_UIErrMsg+2
2412  0545 89            	pushw	x
2413  0546 be07          	ldw	x,L7_g_pdevice
2414  0548 cd008e        	call	_display_printstr
2416  054b 85            	popw	x
2417  054c               L5111:
2418                     ; 383 }
2421  054c 81            	ret	
2563                     	switch	.ubsct
2564  0000               L1011_UIErrMsg:
2565  0000 00000000      	ds.b	4
2566                     	xdef	_display_create_locked_screen
2567                     	xdef	_display_create
2568                     	xdef	_APP_sPrintDec
2569                     	xdef	_display_printstr
2570                     	xdef	_display_printchar
2571                     	xdef	_display_setcurrpos
2572                     	xdef	_display_clsscr
2573                     	xdef	_DEV_Display
2574                     	xref	_vtimer_SetTimer
2575                     	xdef	_display_welcome_message
2576                     	xdef	_display_setpoint_blink
2577                     	xdef	_display_flush
2578                     	xdef	_displayInit
2579                     	xref	_UserInterface_GetErrorMsg
2580                     .const:	section	.text
2581  0000               L3111:
2582  0000 00            	dc.b	0
2583  0001               L5601:
2584  0001 4f464600      	dc.b	"OFF",0
2585  0005               L1601:
2586  0005 4f4e00        	dc.b	"ON",0
2587                     	xref.b	c_x
2607                     	xref	c_imul
2608                     	end
