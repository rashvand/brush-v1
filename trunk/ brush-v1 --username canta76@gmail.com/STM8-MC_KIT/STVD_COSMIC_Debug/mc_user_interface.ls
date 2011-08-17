   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               _HW_Error_Message:
  21  0000 20            	dc.b	32
  22  0001 4f            	dc.b	79
  23  0002 56            	dc.b	86
  24  0003 45            	dc.b	69
  25  0004 52            	dc.b	82
  26  0005 20            	dc.b	32
  27  0006 56            	dc.b	86
  28  0007 4f            	dc.b	79
  29  0008 4c            	dc.b	76
  30  0009 54            	dc.b	84
  31  000a 41            	dc.b	65
  32  000b 47            	dc.b	71
  33  000c 45            	dc.b	69
  34  000d 20            	dc.b	32
  35  000e 20            	dc.b	32
  36  000f 20            	dc.b	32
  37  0010 55            	dc.b	85
  38  0011 4e            	dc.b	78
  39  0012 44            	dc.b	68
  40  0013 45            	dc.b	69
  41  0014 52            	dc.b	82
  42  0015 20            	dc.b	32
  43  0016 56            	dc.b	86
  44  0017 4f            	dc.b	79
  45  0018 4c            	dc.b	76
  46  0019 54            	dc.b	84
  47  001a 41            	dc.b	65
  48  001b 47            	dc.b	71
  49  001c 45            	dc.b	69
  50  001d 20            	dc.b	32
  51  001e 20            	dc.b	32
  52  001f 4f            	dc.b	79
  53  0020 56            	dc.b	86
  54  0021 45            	dc.b	69
  55  0022 52            	dc.b	82
  56  0023 20            	dc.b	32
  57  0024 43            	dc.b	67
  58  0025 55            	dc.b	85
  59  0026 52            	dc.b	82
  60  0027 52            	dc.b	82
  61  0028 45            	dc.b	69
  62  0029 4e            	dc.b	78
  63  002a 54            	dc.b	84
  64  002b 20            	dc.b	32
  65  002c 20            	dc.b	32
  66  002d 4f            	dc.b	79
  67  002e 56            	dc.b	86
  68  002f 45            	dc.b	69
  69  0030 52            	dc.b	82
  70  0031 54            	dc.b	84
  71  0032 45            	dc.b	69
  72  0033 4d            	dc.b	77
  73  0034 50            	dc.b	80
  74  0035 45            	dc.b	69
  75  0036 52            	dc.b	82
  76  0037 41            	dc.b	65
  77  0038 54            	dc.b	84
  78  0039 55            	dc.b	85
  79  003a 52            	dc.b	82
  80  003b 45            	dc.b	69
  81  003c               _SW_Error_Message:
  82  003c 53            	dc.b	83
  83  003d 54            	dc.b	84
  84  003e 41            	dc.b	65
  85  003f 52            	dc.b	82
  86  0040 54            	dc.b	84
  87  0041 55            	dc.b	85
  88  0042 50            	dc.b	80
  89  0043 20            	dc.b	32
  90  0044 46            	dc.b	70
  91  0045 41            	dc.b	65
  92  0046 49            	dc.b	73
  93  0047 4c            	dc.b	76
  94  0048 45            	dc.b	69
  95  0049 44            	dc.b	68
  96  004a 21            	dc.b	33
  97  004b 53            	dc.b	83
  98  004c 50            	dc.b	80
  99  004d 45            	dc.b	69
 100  004e 45            	dc.b	69
 101  004f 44            	dc.b	68
 102  0050 46            	dc.b	70
 103  0051 44            	dc.b	68
 104  0052 42            	dc.b	66
 105  0053 4b            	dc.b	75
 106  0054 20            	dc.b	32
 107  0055 45            	dc.b	69
 108  0056 52            	dc.b	82
 109  0057 52            	dc.b	82
 110  0058 4f            	dc.b	79
 111  0059 52            	dc.b	82
 112  005a 20            	dc.b	32
 113  005b 20            	dc.b	32
 114  005c 20            	dc.b	32
 115  005d 54            	dc.b	84
 116  005e 49            	dc.b	73
 117  005f 4d            	dc.b	77
 118  0060 45            	dc.b	69
 119  0061 5f            	dc.b	95
 120  0062 4f            	dc.b	79
 121  0063 55            	dc.b	85
 122  0064 54            	dc.b	84
 123  0065 20            	dc.b	32
 124  0066 20            	dc.b	32
 125  0067 20            	dc.b	32
 126  0068 20            	dc.b	32
 127  0069 20            	dc.b	32
 128  006a 4d            	dc.b	77
 129  006b 4f            	dc.b	79
 130  006c 54            	dc.b	84
 131  006d 4f            	dc.b	79
 132  006e 52            	dc.b	82
 133  006f 20            	dc.b	32
 134  0070 52            	dc.b	82
 135  0071 55            	dc.b	85
 136  0072 4e            	dc.b	78
 137  0073 4e            	dc.b	78
 138  0074 49            	dc.b	73
 139  0075 4e            	dc.b	78
 140  0076 47            	dc.b	71
 141  0077 20            	dc.b	32
 142                     	bsct
 143  0000               L3_bErrorCode:
 144  0000 00            	dc.b	0
 145  0001               _hHWErrorMask:
 146  0001 0000          	dc.w	0
 386                     ; 55 PTab_t UserInterface_GetSelTab(void)
 386                     ; 56 {
 388                     	switch	.text
 389  0000               _UserInterface_GetSelTab:
 393                     ; 57 	return g_pUserInterface->pSelTab = &(g_pUserInterface->pTab[g_pUserInterface->bSelected_Tab]); // Get the Selectercd tab pointer
 395  0000 be05          	ldw	x,_g_pUserInterface
 396  0002 e601          	ld	a,(1,x)
 397  0004 97            	ld	xl,a
 398  0005 a603          	ld	a,#3
 399  0007 90be05        	ldw	y,_g_pUserInterface
 400  000a 42            	mul	x,a
 401  000b 90ee07        	ldw	y,(7,y)
 402  000e 90bf00        	ldw	c_x,y
 403  0011 90be05        	ldw	y,_g_pUserInterface
 404  0014 72bb0000      	addw	x,c_x
 405  0018 90ef02        	ldw	(2,y),x
 408  001b 81            	ret	
 482                     ; 72 void UserInterface_GetErrorMsg(PUserInterfaceErrorMsg_t pUIErrMsg)
 482                     ; 73 {
 483                     	switch	.text
 484  001c               _UserInterface_GetErrorMsg:
 486  001c 89            	pushw	x
 487       00000000      OFST:	set	0
 490                     ; 74   if (vtimer_TimerElapsed(VTIM_USER_INTERFACE_REFRESH))
 492  001d a603          	ld	a,#3
 493  001f cd0000        	call	_vtimer_TimerElapsed
 495  0022 4d            	tnz	a
 496  0023 2603cc00b0    	jreq	L502
 497                     ; 76     if (hHWErrorMask == 0)
 499  0028 be01          	ldw	x,_hHWErrorMask
 500  002a 2630          	jrne	L702
 501                     ; 79       if (bErrorCode != NO_FAULT)
 503  002c b600          	ld	a,L3_bErrorCode
 504  002e 2723          	jreq	L112
 505                     ; 81         pUIErrMsg->pErrorStatus = "FAULT OCCURRED";
 507  0030 1e01          	ldw	x,(OFST+1,sp)
 508  0032 90ae0088      	ldw	y,#L312
 509  0036 ff            	ldw	(x),y
 510                     ; 82         pUIErrMsg->pErrorMsg =  SW_Error_Message[bErrorCode - 1];
 512  0037 97            	ld	xl,a
 513  0038 a60f          	ld	a,#15
 514  003a 42            	mul	x,a
 515  003b 1d000f        	subw	x,#15
 516  003e 1601          	ldw	y,(OFST+1,sp)
 517  0040 1c003c        	addw	x,#_SW_Error_Message
 518  0043 90ef02        	ldw	(2,y),x
 519                     ; 83 				vtimer_SetTimer(VTIM_USER_INTERFACE_REFRESH,1000,0);
 521  0046 5f            	clrw	x
 522  0047 89            	pushw	x
 523  0048 ae03e8        	ldw	x,#1000
 524  004b 89            	pushw	x
 525  004c a603          	ld	a,#3
 526  004e cd0000        	call	_vtimer_SetTimer
 528  0051 5b04          	addw	sp,#4
 529  0053               L112:
 530                     ; 85       hHWErrorMask = 1;
 532  0053 ae0001        	ldw	x,#1
 533  0056 bf01          	ldw	_hHWErrorMask,x
 534                     ; 86 			bHWErrorIndex = 0;
 536  0058 3f00          	clr	_bHWErrorIndex
 538  005a 2054          	jra	L502
 539  005c               L702:
 540                     ; 91       if ((*pHWerrorOccurred_reg & hHWErrorMask) != 0)
 542  005c 92ce03        	ldw	x,[L5_pHWerrorOccurred_reg.w]
 543  005f 01            	rrwa	x,a
 544  0060 b402          	and	a,_hHWErrorMask+1
 545  0062 01            	rrwa	x,a
 546  0063 b401          	and	a,_hHWErrorMask
 547  0065 01            	rrwa	x,a
 548  0066 5d            	tnzw	x
 549  0067 2737          	jreq	L712
 550                     ; 93         if ((*pHWerrorActual_reg & hHWErrorMask) != 0)
 552  0069 92ce01        	ldw	x,[L7_pHWerrorActual_reg.w]
 553  006c 01            	rrwa	x,a
 554  006d b402          	and	a,_hHWErrorMask+1
 555  006f 01            	rrwa	x,a
 556  0070 b401          	and	a,_hHWErrorMask
 557  0072 01            	rrwa	x,a
 558  0073 5d            	tnzw	x
 559  0074 2708          	jreq	L122
 560                     ; 95           pUIErrMsg->pErrorStatus = "FAULT CONDITION";
 562  0076 1e01          	ldw	x,(OFST+1,sp)
 563  0078 90ae0078      	ldw	y,#L322
 565  007c 2006          	jra	L522
 566  007e               L122:
 567                     ; 99           pUIErrMsg->pErrorStatus = "FAULT OCCURRED";
 569  007e 1e01          	ldw	x,(OFST+1,sp)
 570  0080 90ae0088      	ldw	y,#L312
 571  0084               L522:
 572  0084 ff            	ldw	(x),y
 573                     ; 101         pUIErrMsg->pErrorMsg =  HW_Error_Message[bHWErrorIndex];
 575  0085 b600          	ld	a,_bHWErrorIndex
 576  0087 97            	ld	xl,a
 577  0088 a60f          	ld	a,#15
 578  008a 42            	mul	x,a
 579  008b 1601          	ldw	y,(OFST+1,sp)
 580  008d 1c0000        	addw	x,#_HW_Error_Message
 581  0090 90ef02        	ldw	(2,y),x
 582                     ; 102 				vtimer_SetTimer(VTIM_USER_INTERFACE_REFRESH,1000,0);
 584  0093 5f            	clrw	x
 585  0094 89            	pushw	x
 586  0095 ae03e8        	ldw	x,#1000
 587  0098 89            	pushw	x
 588  0099 a603          	ld	a,#3
 589  009b cd0000        	call	_vtimer_SetTimer
 591  009e 5b04          	addw	sp,#4
 592  00a0               L712:
 593                     ; 104       hHWErrorMask <<= 1;
 595  00a0 3802          	sll	_hHWErrorMask+1
 596  00a2 3901          	rlc	_hHWErrorMask
 597                     ; 105 			bHWErrorIndex++;
 599  00a4 3c00          	inc	_bHWErrorIndex
 600                     ; 106       if (hHWErrorMask == HW_ERROR_NUM_MASK)
 602  00a6 be01          	ldw	x,_hHWErrorMask
 603  00a8 a30010        	cpw	x,#16
 604  00ab 2603          	jrne	L502
 605                     ; 108         hHWErrorMask = 0;
 607  00ad 5f            	clrw	x
 608  00ae bf01          	ldw	_hHWErrorMask,x
 609  00b0               L502:
 610                     ; 113 }
 613  00b0 85            	popw	x
 614  00b1 81            	ret	
1023                     ; 115 void UserInterface_Init(pvdev_device_t pdevice,PUserInterface_t pUserInterface)
1023                     ; 116 {
1024                     	switch	.text
1025  00b2               _UserInterface_Init:
1027  00b2 89            	pushw	x
1028       00000000      OFST:	set	0
1031                     ; 117 	g_pUserInterface = pUserInterface;
1033  00b3 1e05          	ldw	x,(OFST+5,sp)
1034  00b5 bf05          	ldw	_g_pUserInterface,x
1035                     ; 118 	g_pUserInterface->bSelected_Tab = 0; //Reset Selected Tab
1037                     ; 119 	g_pUserInterface->pSelTab = &(g_pUserInterface->pTab[0]); // Set the Selectercd tab (0) pointer
1039  00b7 9093          	ldw	y,x
1040  00b9 6f01          	clr	(1,x)
1041  00bb 90ee07        	ldw	y,(7,y)
1042  00be ef02          	ldw	(2,x),y
1043                     ; 121 	g_pUserInterface->bField_Edit = g_pUserInterface->pSelTab->bFieldsNumber; // No field is in edit mode
1045  00c0 ee02          	ldw	x,(2,x)
1046  00c2 f6            	ld	a,(x)
1047  00c3 be05          	ldw	x,_g_pUserInterface
1048  00c5 e705          	ld	(5,x),a
1049                     ; 122 	UserInterface_ResetFocus();
1051  00c7 ad14          	call	_UserInterface_ResetFocus
1053                     ; 124         pHWerrorOccurred_reg = (pdevice->regs.r16+VDEV_REG16_HW_ERROR_OCCURRED);
1055  00c9 1e01          	ldw	x,(OFST+1,sp)
1056  00cb ee02          	ldw	x,(2,x)
1057  00cd 1c0010        	addw	x,#16
1058  00d0 bf03          	ldw	L5_pHWerrorOccurred_reg,x
1059                     ; 125         pHWerrorActual_reg = (pdevice->regs.r16+VDEV_REG16_HW_ERROR_ACTUAL);
1061  00d2 1e01          	ldw	x,(OFST+1,sp)
1062  00d4 ee02          	ldw	x,(2,x)
1063  00d6 1c0012        	addw	x,#18
1064  00d9 bf01          	ldw	L7_pHWerrorActual_reg,x
1065                     ; 126 }
1068  00db 85            	popw	x
1069  00dc 81            	ret	
1105                     ; 128 void UserInterface_ResetFocus(void)
1105                     ; 129 {
1106                     	switch	.text
1107  00dd               _UserInterface_ResetFocus:
1109  00dd 88            	push	a
1110       00000001      OFST:	set	1
1113                     ; 131 	for (i = 0; i < g_pUserInterface->pSelTab->bFieldsNumber; i++)
1115  00de 0f01          	clr	(OFST+0,sp)
1117  00e0 2024          	jra	L315
1118  00e2               L705:
1119                     ; 133 		if (g_pUserInterface->pSelTab->pField[i].Type == EDIT)
1121  00e2 7b01          	ld	a,(OFST+0,sp)
1122  00e4 97            	ld	xl,a
1123  00e5 a609          	ld	a,#9
1124  00e7 90be05        	ldw	y,_g_pUserInterface
1125  00ea 90ee02        	ldw	y,(2,y)
1126  00ed 42            	mul	x,a
1127  00ee 90ee01        	ldw	y,(1,y)
1128  00f1 90bf00        	ldw	c_x,y
1129  00f4 72bb0000      	addw	x,c_x
1130  00f8 e603          	ld	a,(3,x)
1131  00fa 2608          	jrne	L715
1132                     ; 135 			g_pUserInterface->bField_Focus_Selection = i;
1134  00fc be05          	ldw	x,_g_pUserInterface
1135  00fe 7b01          	ld	a,(OFST+0,sp)
1136  0100 e704          	ld	(4,x),a
1137                     ; 136 			return;
1140  0102 84            	pop	a
1141  0103 81            	ret	
1142  0104               L715:
1143                     ; 131 	for (i = 0; i < g_pUserInterface->pSelTab->bFieldsNumber; i++)
1145  0104 0c01          	inc	(OFST+0,sp)
1146  0106               L315:
1149  0106 be05          	ldw	x,_g_pUserInterface
1150  0108 ee02          	ldw	x,(2,x)
1151  010a f6            	ld	a,(x)
1152  010b 1101          	cp	a,(OFST+0,sp)
1153  010d 22d3          	jrugt	L705
1154                     ; 139 	g_pUserInterface->bField_Focus_Selection = g_pUserInterface->pSelTab->bFieldsNumber;
1156  010f be05          	ldw	x,_g_pUserInterface
1157  0111 ee02          	ldw	x,(2,x)
1158  0113 f6            	ld	a,(x)
1159  0114 be05          	ldw	x,_g_pUserInterface
1160  0116 e704          	ld	(4,x),a
1161                     ; 140 }
1164  0118 84            	pop	a
1165  0119 81            	ret	
1210                     ; 142 u8 UserInterface_UpField(u8 StartingSel)
1210                     ; 143 {
1211                     	switch	.text
1212  011a               _UserInterface_UpField:
1214  011a 88            	push	a
1215  011b 88            	push	a
1216       00000001      OFST:	set	1
1219                     ; 144 	u8 Sel = StartingSel;
1221  011c               L345:
1222                     ; 148 		Sel += g_pUserInterface->pSelTab->bFieldsNumber;
1224  011c be05          	ldw	x,_g_pUserInterface
1225  011e ee02          	ldw	x,(2,x)
1226  0120 fb            	add	a,(x)
1227  0121 4a            	dec	a
1228  0122 6b01          	ld	(OFST+0,sp),a
1229                     ; 149 		Sel --;
1231                     ; 150 		Sel %= g_pUserInterface->pSelTab->bFieldsNumber;
1233  0124 be05          	ldw	x,_g_pUserInterface
1234  0126 ee02          	ldw	x,(2,x)
1235  0128 f6            	ld	a,(x)
1236  0129 5f            	clrw	x
1237  012a 97            	ld	xl,a
1238  012b 7b01          	ld	a,(OFST+0,sp)
1239  012d 9093          	ldw	y,x
1240  012f 5f            	clrw	x
1241  0130 97            	ld	xl,a
1242  0131 65            	divw	x,y
1243  0132 909f          	ld	a,yl
1244  0134 6b01          	ld	(OFST+0,sp),a
1245                     ; 151 		if (g_pUserInterface->pSelTab->pField[Sel].Type == EDIT)
1247  0136 97            	ld	xl,a
1248  0137 a609          	ld	a,#9
1249  0139 90be05        	ldw	y,_g_pUserInterface
1250  013c 90ee02        	ldw	y,(2,y)
1251  013f 42            	mul	x,a
1252  0140 90ee01        	ldw	y,(1,y)
1253  0143 90bf00        	ldw	c_x,y
1254  0146 72bb0000      	addw	x,c_x
1255  014a e603          	ld	a,(3,x)
1256  014c 260a          	jrne	L545
1257                     ; 153 			g_pUserInterface->bField_Focus_Selection = Sel;
1259  014e be05          	ldw	x,_g_pUserInterface
1260  0150 7b01          	ld	a,(OFST+0,sp)
1261  0152 e704          	ld	(4,x),a
1262                     ; 154 			return TRUE;
1264  0154 a601          	ld	a,#1
1266  0156 2007          	jra	L62
1267  0158               L545:
1268                     ; 157 	while (Sel == StartingSel);
1270  0158 7b01          	ld	a,(OFST+0,sp)
1271  015a 1102          	cp	a,(OFST+1,sp)
1272  015c 27be          	jreq	L345
1273                     ; 158 	return FALSE;
1275  015e 4f            	clr	a
1277  015f               L62:
1279  015f 85            	popw	x
1280  0160 81            	ret	
1325                     ; 161 u8 UserInterface_DownField(u8 StartingSel)
1325                     ; 162 {
1326                     	switch	.text
1327  0161               _UserInterface_DownField:
1329  0161 88            	push	a
1330  0162 88            	push	a
1331       00000001      OFST:	set	1
1334                     ; 163 	u8 Sel = StartingSel;
1336  0163 6b01          	ld	(OFST+0,sp),a
1337  0165               L575:
1338                     ; 167 		Sel ++;
1340  0165 0c01          	inc	(OFST+0,sp)
1341                     ; 168 		Sel %= g_pUserInterface->pSelTab->bFieldsNumber;
1343  0167 be05          	ldw	x,_g_pUserInterface
1344  0169 ee02          	ldw	x,(2,x)
1345  016b f6            	ld	a,(x)
1346  016c 5f            	clrw	x
1347  016d 97            	ld	xl,a
1348  016e 7b01          	ld	a,(OFST+0,sp)
1349  0170 9093          	ldw	y,x
1350  0172 5f            	clrw	x
1351  0173 97            	ld	xl,a
1352  0174 65            	divw	x,y
1353  0175 909f          	ld	a,yl
1354  0177 6b01          	ld	(OFST+0,sp),a
1355                     ; 169 		if (g_pUserInterface->pSelTab->pField[Sel].Type == EDIT)
1357  0179 97            	ld	xl,a
1358  017a a609          	ld	a,#9
1359  017c 90be05        	ldw	y,_g_pUserInterface
1360  017f 90ee02        	ldw	y,(2,y)
1361  0182 42            	mul	x,a
1362  0183 90ee01        	ldw	y,(1,y)
1363  0186 90bf00        	ldw	c_x,y
1364  0189 72bb0000      	addw	x,c_x
1365  018d e603          	ld	a,(3,x)
1366  018f 260a          	jrne	L775
1367                     ; 171 			g_pUserInterface->bField_Focus_Selection = Sel;
1369  0191 be05          	ldw	x,_g_pUserInterface
1370  0193 7b01          	ld	a,(OFST+0,sp)
1371  0195 e704          	ld	(4,x),a
1372                     ; 172 			return TRUE;
1374  0197 a601          	ld	a,#1
1376  0199 2007          	jra	L23
1377  019b               L775:
1378                     ; 175 	while (Sel == StartingSel);
1380  019b 7b01          	ld	a,(OFST+0,sp)
1381  019d 1102          	cp	a,(OFST+1,sp)
1382  019f 27c4          	jreq	L575
1383                     ; 176 	return FALSE;
1385  01a1 4f            	clr	a
1387  01a2               L23:
1389  01a2 85            	popw	x
1390  01a3 81            	ret	
1459                     ; 179 u8 UserInterface_UpDownKey(u8 StartingSel,EditAction_t act)
1459                     ; 180 {
1460                     	switch	.text
1461  01a4               _UserInterface_UpDownKey:
1463  01a4 89            	pushw	x
1464       00000000      OFST:	set	0
1467                     ; 181 	if (g_pUserInterface->bStatus == UI_LOCKED)
1469  01a5 be05          	ldw	x,_g_pUserInterface
1470  01a7 f6            	ld	a,(x)
1471  01a8 4a            	dec	a
1472                     ; 182 		return FALSE;
1475  01a9 2710          	jreq	L44
1476                     ; 184 	if (g_pUserInterface->bField_Edit == g_pUserInterface->pSelTab->bFieldsNumber)
1478  01ab e605          	ld	a,(5,x)
1479  01ad ee02          	ldw	x,(2,x)
1480  01af f1            	cp	a,(x)
1481  01b0 2611          	jrne	L146
1482                     ; 186 		if (act == INC_SEL)
1484  01b2 7b02          	ld	a,(OFST+2,sp)
1485  01b4 2607          	jrne	L346
1486                     ; 188 			return UserInterface_UpField(StartingSel);
1488  01b6 7b01          	ld	a,(OFST+1,sp)
1489  01b8 cd011a        	call	_UserInterface_UpField
1492  01bb               L44:
1494  01bb 85            	popw	x
1495  01bc 81            	ret	
1496  01bd               L346:
1497                     ; 192 			return UserInterface_DownField(StartingSel);
1499  01bd 7b01          	ld	a,(OFST+1,sp)
1500  01bf ada0          	call	_UserInterface_DownField
1503  01c1 20f8          	jra	L44
1504  01c3               L146:
1505                     ; 197 		return UserInterface_IncField(act);
1507  01c3 7b02          	ld	a,(OFST+2,sp)
1508  01c5 cd029f        	call	_UserInterface_IncField
1511  01c8 20f1          	jra	L44
1548                     ; 201 u8 UserInterface_ChangeToTab(u8 bSel)
1548                     ; 202 {
1549                     	switch	.text
1550  01ca               _UserInterface_ChangeToTab:
1552  01ca 88            	push	a
1553       00000000      OFST:	set	0
1556                     ; 203 	if (g_pUserInterface->bStatus == UI_LOCKED)
1558  01cb 92c605        	ld	a,[_g_pUserInterface.w]
1559  01ce 4a            	dec	a
1560  01cf 2603          	jrne	L766
1561                     ; 204 		return FALSE;
1565  01d1 5b01          	addw	sp,#1
1566  01d3 81            	ret	
1567  01d4               L766:
1568                     ; 206 	g_pUserInterface->bSelected_Tab = bSel; 
1570  01d4 be05          	ldw	x,_g_pUserInterface
1571  01d6 7b01          	ld	a,(OFST+1,sp)
1572  01d8 e701          	ld	(1,x),a
1573                     ; 207 	g_pUserInterface->pSelTab = &(g_pUserInterface->pTab[bSel]); 
1575  01da 97            	ld	xl,a
1576  01db a603          	ld	a,#3
1577  01dd 90be05        	ldw	y,_g_pUserInterface
1578  01e0 42            	mul	x,a
1579  01e1 90ee07        	ldw	y,(7,y)
1580  01e4 90bf00        	ldw	c_x,y
1581  01e7 90be05        	ldw	y,_g_pUserInterface
1582  01ea 72bb0000      	addw	x,c_x
1583  01ee 90ef02        	ldw	(2,y),x
1584                     ; 209 	g_pUserInterface->bField_Edit = g_pUserInterface->pSelTab->bFieldsNumber; // No field is in edit mode
1586  01f1 be05          	ldw	x,_g_pUserInterface
1587  01f3 ee02          	ldw	x,(2,x)
1588  01f5 f6            	ld	a,(x)
1589  01f6 be05          	ldw	x,_g_pUserInterface
1590  01f8 e705          	ld	(5,x),a
1591                     ; 210 	UserInterface_ResetFocus();
1593  01fa cd00dd        	call	_UserInterface_ResetFocus
1595                     ; 212 	return TRUE;
1597  01fd a601          	ld	a,#1
1600  01ff 5b01          	addw	sp,#1
1601  0201 81            	ret	
1640                     ; 215 u8 UserInterface_ChangeTab(EditAction_t act)
1640                     ; 216 {
1641                     	switch	.text
1642  0202               _UserInterface_ChangeTab:
1644  0202 88            	push	a
1645       00000000      OFST:	set	0
1648                     ; 217 	if (g_pUserInterface->bStatus == UI_LOCKED)
1650  0203 92c605        	ld	a,[_g_pUserInterface.w]
1651  0206 4a            	dec	a
1652  0207 2603          	jrne	L707
1653                     ; 218 		return FALSE;
1657  0209 5b01          	addw	sp,#1
1658  020b 81            	ret	
1659  020c               L707:
1660                     ; 219 	if (g_pUserInterface->bField_Edit != g_pUserInterface->pSelTab->bFieldsNumber)
1662  020c be05          	ldw	x,_g_pUserInterface
1663  020e e605          	ld	a,(5,x)
1664  0210 ee02          	ldw	x,(2,x)
1665  0212 f1            	cp	a,(x)
1666  0213 2709          	jreq	L117
1667                     ; 221 		g_pUserInterface->bField_Edit = g_pUserInterface->pSelTab->bFieldsNumber;
1669  0215 be05          	ldw	x,_g_pUserInterface
1670  0217 ee02          	ldw	x,(2,x)
1671  0219 f6            	ld	a,(x)
1672  021a be05          	ldw	x,_g_pUserInterface
1673  021c e705          	ld	(5,x),a
1674  021e               L117:
1675                     ; 225 	if (act == INC_SEL)
1677  021e 7b01          	ld	a,(OFST+1,sp)
1678  0220 2629          	jrne	L317
1679                     ; 227 		g_pUserInterface->bSelected_Tab++;
1681  0222 be05          	ldw	x,_g_pUserInterface
1682                     ; 228 		g_pUserInterface->bSelected_Tab %= g_pUserInterface->bTabsNumber;
1684  0224 6c01          	inc	(1,x)
1685  0226 9093          	ldw	y,x
1686  0228 90e606        	ld	a,(6,y)
1687  022b 905f          	clrw	y
1688  022d 9097          	ld	yl,a
1689  022f e601          	ld	a,(1,x)
1690  0231 89            	pushw	x
1691  0232 5f            	clrw	x
1692  0233 97            	ld	xl,a
1693  0234 65            	divw	x,y
1694  0235 85            	popw	x
1695  0236 909f          	ld	a,yl
1696  0238 e701          	ld	(1,x),a
1697                     ; 229 		g_pUserInterface->pSelTab = UserInterface_GetSelTab();
1699  023a cd0000        	call	_UserInterface_GetSelTab
1701  023d 90be05        	ldw	y,_g_pUserInterface
1702  0240 90ef02        	ldw	(2,y),x
1703                     ; 230 		UserInterface_ResetFocus();
1705  0243 cd00dd        	call	_UserInterface_ResetFocus
1707                     ; 231 		return TRUE;
1709  0246 a601          	ld	a,#1
1712  0248 5b01          	addw	sp,#1
1713  024a 81            	ret	
1714  024b               L317:
1715                     ; 235 		g_pUserInterface->bSelected_Tab += g_pUserInterface->bTabsNumber;
1717  024b be05          	ldw	x,_g_pUserInterface
1718  024d 9093          	ldw	y,x
1719  024f e601          	ld	a,(1,x)
1720  0251 90eb06        	add	a,(6,y)
1721  0254 4a            	dec	a
1722  0255 e701          	ld	(1,x),a
1723                     ; 236 		g_pUserInterface->bSelected_Tab--;
1725                     ; 237 		g_pUserInterface->bSelected_Tab %= g_pUserInterface->bTabsNumber;
1727  0257 90e606        	ld	a,(6,y)
1728  025a 905f          	clrw	y
1729  025c 9097          	ld	yl,a
1730  025e e601          	ld	a,(1,x)
1731  0260 89            	pushw	x
1732  0261 5f            	clrw	x
1733  0262 97            	ld	xl,a
1734  0263 65            	divw	x,y
1735  0264 85            	popw	x
1736  0265 909f          	ld	a,yl
1737  0267 e701          	ld	(1,x),a
1738                     ; 238 		g_pUserInterface->pSelTab = UserInterface_GetSelTab();
1740  0269 cd0000        	call	_UserInterface_GetSelTab
1742  026c 90be05        	ldw	y,_g_pUserInterface
1743  026f 90ef02        	ldw	(2,y),x
1744                     ; 239 		UserInterface_ResetFocus();
1746  0272 cd00dd        	call	_UserInterface_ResetFocus
1748                     ; 240 		return TRUE;
1750  0275 a601          	ld	a,#1
1753  0277 5b01          	addw	sp,#1
1754  0279 81            	ret	
1779                     ; 244 u8 UserInterface_EditField(void)
1779                     ; 245 {
1780                     	switch	.text
1781  027a               _UserInterface_EditField:
1785                     ; 246 	if (g_pUserInterface->bStatus == UI_LOCKED)
1787  027a 92c605        	ld	a,[_g_pUserInterface.w]
1788  027d 4a            	dec	a
1789  027e 2601          	jrne	L727
1790                     ; 247 		return FALSE;
1794  0280 81            	ret	
1795  0281               L727:
1796                     ; 249 	if (g_pUserInterface->bField_Edit == g_pUserInterface->pSelTab->bFieldsNumber)
1798  0281 be05          	ldw	x,_g_pUserInterface
1799  0283 e605          	ld	a,(5,x)
1800  0285 ee02          	ldw	x,(2,x)
1801  0287 f1            	cp	a,(x)
1802  0288 2609          	jrne	L137
1803                     ; 251 		g_pUserInterface->bField_Edit = g_pUserInterface->bField_Focus_Selection;
1805  028a be05          	ldw	x,_g_pUserInterface
1806  028c e604          	ld	a,(4,x)
1807  028e e705          	ld	(5,x),a
1808                     ; 252 		return TRUE;
1810  0290 a601          	ld	a,#1
1813  0292 81            	ret	
1814  0293               L137:
1815                     ; 256 		g_pUserInterface->bField_Edit = g_pUserInterface->pSelTab->bFieldsNumber;
1817  0293 be05          	ldw	x,_g_pUserInterface
1818  0295 ee02          	ldw	x,(2,x)
1819  0297 f6            	ld	a,(x)
1820  0298 be05          	ldw	x,_g_pUserInterface
1821  029a e705          	ld	(5,x),a
1822                     ; 257 		return TRUE;
1824  029c a601          	ld	a,#1
1827  029e 81            	ret	
1913                     ; 261 u8 UserInterface_IncField(EditAction_t act)
1913                     ; 262 {
1914                     	switch	.text
1915  029f               _UserInterface_IncField:
1917  029f 88            	push	a
1918       00000005      OFST:	set	5
1921                     ; 263 	u8 selField = g_pUserInterface->bField_Focus_Selection;
1923  02a0 be05          	ldw	x,_g_pUserInterface
1924  02a2 5205          	subw	sp,#5
1925  02a4 e604          	ld	a,(4,x)
1926  02a6 6b03          	ld	(OFST-2,sp),a
1927                     ; 264 	PField_t pSelField = &(g_pUserInterface->pSelTab->pField[selField]);
1929  02a8 97            	ld	xl,a
1930  02a9 a609          	ld	a,#9
1931  02ab 90be05        	ldw	y,_g_pUserInterface
1932  02ae 90ee02        	ldw	y,(2,y)
1933  02b1 42            	mul	x,a
1934  02b2 90ee01        	ldw	y,(1,y)
1935  02b5 90bf00        	ldw	c_x,y
1936  02b8 72bb0000      	addw	x,c_x
1937  02bc 1f04          	ldw	(OFST-1,sp),x
1938                     ; 266 	switch (pSelField->Size)
1940  02be e604          	ld	a,(4,x)
1942                     ; 295 	default:
1942                     ; 296 		break;
1943  02c0 2710          	jreq	L537
1944  02c2 a002          	sub	a,#2
1945  02c4 2726          	jreq	L737
1946  02c6 4a            	dec	a
1947  02c7 2723          	jreq	L737
1948  02c9 4a            	dec	a
1949  02ca 2720          	jreq	L737
1950  02cc a002          	sub	a,#2
1951  02ce 273c          	jreq	L347
1952  02d0 204a          	jra	L5101
1953  02d2               L537:
1954                     ; 270 			u8 bVal=((PFN_getu8_t)pSelField->pGetValue)();
1956  02d2 ee05          	ldw	x,(5,x)
1957  02d4 fd            	call	(x)
1959  02d5 6b03          	ld	(OFST-2,sp),a
1960                     ; 271 			bVal = (u8)(UserInterface_UpdateField(pSelField->pExtra,(s16)(bVal),act));
1962  02d7 7b06          	ld	a,(OFST+1,sp)
1963  02d9 88            	push	a
1964  02da 7b04          	ld	a,(OFST-1,sp)
1965  02dc 5f            	clrw	x
1966  02dd 97            	ld	xl,a
1967  02de 89            	pushw	x
1968  02df 1e07          	ldw	x,(OFST+2,sp)
1969  02e1 ee07          	ldw	x,(7,x)
1970  02e3 ad3c          	call	_UserInterface_UpdateField
1972  02e5 5b03          	addw	sp,#3
1973  02e7 9f            	ld	a,xl
1974  02e8 6b03          	ld	(OFST-2,sp),a
1975                     ; 272 			((PFN_setu8_t)pSelField->pExtra->pSetValue)(bVal);
1977                     ; 273 			break;
1979  02ea 202a          	jp	L021
1980  02ec               L737:
1981                     ; 278 			s16 hVal=((PFN_gets16_t)pSelField->pGetValue)();
1984                     ; 279 			hVal = (s16)(UserInterface_UpdateField(pSelField->pExtra,hVal,act));
1987                     ; 280 			((PFN_sets16_t)pSelField->pExtra->pSetValue)(hVal);
1990  02ec ee05          	ldw	x,(5,x)
1991  02ee fd            	call	(x)
1992  02ef 1f01          	ldw	(OFST-4,sp),x
1994  02f1 7b06          	ld	a,(OFST+1,sp)
1995  02f3 88            	push	a
1996  02f4 1e02          	ldw	x,(OFST-3,sp)
1997  02f6 89            	pushw	x
1998  02f7 1e07          	ldw	x,(OFST+2,sp)
1999  02f9 ee07          	ldw	x,(7,x)
2000  02fb ad24          	call	_UserInterface_UpdateField
2001  02fd 5b03          	addw	sp,#3
2002  02ff 1f01          	ldw	(OFST-4,sp),x
2004  0301 1604          	ldw	y,(OFST-1,sp)
2005  0303 90ee07        	ldw	y,(7,y)
2006  0306 90fe          	ldw	y,(y)
2007  0308 90fd          	call	(y)
2009                     ; 281 			break;
2011  030a 2010          	jra	L5101
2012                     ; 285 			s16 hVal=((PFN_gets16_t)pSelField->pGetValue)();
2014                     ; 286 			hVal = (s16)(UserInterface_UpdateField(pSelField->pExtra,hVal,act));
2016                     ; 287 			((PFN_sets16_t)pSelField->pExtra->pSetValue)(hVal);
2018                     ; 288 			break;
2020  030c               L347:
2021                     ; 292 			((PFN_setu8_t)pSelField->pExtra->pSetValue)((u8)(!((PFN_getu8_t)pSelField->pGetValue)()));
2023  030c ee05          	ldw	x,(5,x)
2024  030e fd            	call	(x)
2026  030f 4d            	tnz	a
2027  0310 2603          	jrne	L411
2028  0312 4c            	inc	a
2029  0313 2001          	jra	L021
2030  0315               L411:
2031  0315 4f            	clr	a
2032  0316               L021:
2034  0316 1e04          	ldw	x,(OFST-1,sp)
2035  0318 ee07          	ldw	x,(7,x)
2036  031a fe            	ldw	x,(x)
2037  031b fd            	call	(x)
2039                     ; 293 			break;
2041                     ; 295 	default:
2041                     ; 296 		break;
2043  031c               L5101:
2044                     ; 298 	return TRUE;
2046  031c a601          	ld	a,#1
2049  031e 5b06          	addw	sp,#6
2050  0320 81            	ret	
2116                     ; 301 s16 UserInterface_UpdateField(PEditExtraField_t pExtra,s16 hVal,EditAction_t act)
2116                     ; 302 {
2117                     	switch	.text
2118  0321               _UserInterface_UpdateField:
2120  0321 89            	pushw	x
2121  0322 89            	pushw	x
2122       00000002      OFST:	set	2
2125                     ; 304 	if (act == INC_SEL)
2127  0323 7b09          	ld	a,(OFST+7,sp)
2128  0325 2625          	jrne	L3501
2129                     ; 306 		hDelta = pExtra->hMaxValue - pExtra->hInc_decValue;
2131  0327 1603          	ldw	y,(OFST+1,sp)
2132  0329 ee02          	ldw	x,(2,x)
2133  032b 90ee06        	ldw	y,(6,y)
2134  032e 90bf00        	ldw	c_x,y
2135  0331 72b00000      	subw	x,c_x
2136  0335 1f01          	ldw	(OFST-1,sp),x
2137                     ; 307 		if (hVal <= hDelta)
2139  0337 1e07          	ldw	x,(OFST+5,sp)
2140  0339 1301          	cpw	x,(OFST-1,sp)
2141  033b 2c09          	jrsgt	L5501
2142                     ; 309 			hVal += pExtra->hInc_decValue;
2144  033d 1e03          	ldw	x,(OFST+1,sp)
2145  033f ee06          	ldw	x,(6,x)
2146  0341 72fb07        	addw	x,(OFST+5,sp)
2148  0344 2030          	jra	L1601
2149  0346               L5501:
2150                     ; 313 			hVal = pExtra->hMaxValue;
2152  0346 1e03          	ldw	x,(OFST+1,sp)
2153  0348 ee02          	ldw	x,(2,x)
2154  034a 202a          	jra	L1601
2155  034c               L3501:
2156                     ; 318 		hDelta = (pExtra->hMinValue + pExtra->hInc_decValue);
2158  034c 1e03          	ldw	x,(OFST+1,sp)
2159  034e 1603          	ldw	y,(OFST+1,sp)
2160  0350 ee06          	ldw	x,(6,x)
2161  0352 90ee04        	ldw	y,(4,y)
2162  0355 90bf00        	ldw	c_x,y
2163  0358 72bb0000      	addw	x,c_x
2164  035c 1f01          	ldw	(OFST-1,sp),x
2165                     ; 319 		if (hVal >= hDelta)
2167  035e 1e07          	ldw	x,(OFST+5,sp)
2168  0360 1301          	cpw	x,(OFST-1,sp)
2169  0362 2f0e          	jrslt	L3601
2170                     ; 321 			hVal -= pExtra->hInc_decValue;
2172  0364 1603          	ldw	y,(OFST+1,sp)
2173  0366 90ee06        	ldw	y,(6,y)
2174  0369 90bf00        	ldw	c_x,y
2175  036c 72b00000      	subw	x,c_x
2177  0370 2004          	jra	L1601
2178  0372               L3601:
2179                     ; 325 			hVal = pExtra->hMinValue;
2181  0372 1e03          	ldw	x,(OFST+1,sp)
2182  0374 ee04          	ldw	x,(4,x)
2183  0376               L1601:
2184                     ; 328 	return hVal;
2188  0376 5b04          	addw	sp,#4
2189  0378 81            	ret	
2213                     ; 331 void UserInterface_Lock(void)
2213                     ; 332 {
2214                     	switch	.text
2215  0379               _UserInterface_Lock:
2219                     ; 333 	g_pUserInterface->bStatus = UI_LOCKED;
2221  0379 a601          	ld	a,#1
2222  037b 92c705        	ld	[_g_pUserInterface.w],a
2223                     ; 334 }
2226  037e 81            	ret	
2252                     ; 336 void UserInterface_Unlock(void)
2252                     ; 337 {
2253                     	switch	.text
2254  037f               _UserInterface_Unlock:
2258                     ; 338 	g_pUserInterface->bStatus = UI_UNLOCKED;
2260  037f 923f05        	clr	[_g_pUserInterface.w]
2261                     ; 339         bErrorCode = NO_FAULT;
2263  0382 3f00          	clr	L3_bErrorCode
2264                     ; 340 }
2267  0384 81            	ret	
2303                     ; 342 void UserInterface_Fault (u8 ErrorCode)
2303                     ; 343 {
2304                     	switch	.text
2305  0385               _UserInterface_Fault:
2309                     ; 344   bErrorCode = ErrorCode;
2311  0385 b700          	ld	L3_bErrorCode,a
2312                     ; 345 }
2315  0387 81            	ret	
2412                     	switch	.ubsct
2413  0000               _bHWErrorIndex:
2414  0000 00            	ds.b	1
2415                     	xdef	_bHWErrorIndex
2416                     	xdef	_hHWErrorMask
2417  0001               L7_pHWerrorActual_reg:
2418  0001 0000          	ds.b	2
2419  0003               L5_pHWerrorOccurred_reg:
2420  0003 0000          	ds.b	2
2421                     	xdef	_SW_Error_Message
2422                     	xdef	_HW_Error_Message
2423  0005               _g_pUserInterface:
2424  0005 0000          	ds.b	2
2425                     	xdef	_g_pUserInterface
2426                     	xdef	_UserInterface_UpdateField
2427                     	xdef	_UserInterface_GetSelTab
2428                     	xref	_vtimer_TimerElapsed
2429                     	xref	_vtimer_SetTimer
2430                     	xdef	_UserInterface_Fault
2431                     	xdef	_UserInterface_GetErrorMsg
2432                     	xdef	_UserInterface_Unlock
2433                     	xdef	_UserInterface_Lock
2434                     	xdef	_UserInterface_EditField
2435                     	xdef	_UserInterface_IncField
2436                     	xdef	_UserInterface_ChangeTab
2437                     	xdef	_UserInterface_ChangeToTab
2438                     	xdef	_UserInterface_UpDownKey
2439                     	xdef	_UserInterface_DownField
2440                     	xdef	_UserInterface_UpField
2441                     	xdef	_UserInterface_ResetFocus
2442                     	xdef	_UserInterface_Init
2443                     	switch	.const
2444  0078               L322:
2445  0078 4641554c5420  	dc.b	"FAULT CONDITION",0
2446  0088               L312:
2447  0088 4641554c5420  	dc.b	"FAULT OCCURRED",0
2448                     	xref.b	c_x
2468                     	end
