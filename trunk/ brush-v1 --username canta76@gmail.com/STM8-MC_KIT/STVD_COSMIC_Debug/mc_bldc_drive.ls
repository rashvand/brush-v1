   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               L5_hArrPwmVal:
  21  0000 0378          	dc.w	888
  22  0002               L7_CurrentLimit:
  23  0002 2710          	dc.w	10000
  24                     	bsct
  25  0000               L71_DriveState:
  26  0000 00            	dc.b	0
  27  0001               L32_bValidatedMeasuredSpeed:
  28  0001 00            	dc.b	0
  87                     ; 84 u16 GetSpeed_01HZ(void)
  87                     ; 85 {
  89                     	switch	.text
  90  0000               _GetSpeed_01HZ:
  92       0000000c      OFST:	set	12
  95                     ; 89 	if (*pcounter_reg == 0) 
  97  0000 be03          	ldw	x,L31_pcounter_reg
  98  0002 520c          	subw	sp,#12
  99  0004 e601          	ld	a,(1,x)
 100  0006 fa            	or	a,(x)
 101  0007 2603          	jrne	L16
 102                     ; 90 		return 0;
 104  0009 5f            	clrw	x
 106  000a 202a          	jra	L6
 107  000c               L16:
 108                     ; 91 	hTemp = PWM_FREQUENCY;
 110                     ; 92 	wTemp = (u32)(hTemp) * 10;
 112  000c aebf20        	ldw	x,#48928
 113  000f 1f0b          	ldw	(OFST-1,sp),x
 114  0011 ae0002        	ldw	x,#2
 115  0014 1f09          	ldw	(OFST-3,sp),x
 116                     ; 93 	wTemp /= (*pcounter_reg);
 118  0016 be03          	ldw	x,L31_pcounter_reg
 119  0018 fe            	ldw	x,(x)
 120  0019 cd0000        	call	c_uitolx
 122  001c 96            	ldw	x,sp
 123  001d 5c            	incw	x
 124  001e cd0000        	call	c_rtol
 126  0021 96            	ldw	x,sp
 127  0022 1c0009        	addw	x,#OFST-3
 128  0025 cd0000        	call	c_ltor
 130  0028 96            	ldw	x,sp
 131  0029 5c            	incw	x
 132  002a cd0000        	call	c_ludv
 134  002d 96            	ldw	x,sp
 135  002e 1c0009        	addw	x,#OFST-3
 136  0031 cd0000        	call	c_rtol
 138                     ; 94 	speedHz10 = (u16)(wTemp);
 140  0034 1e0b          	ldw	x,(OFST-1,sp)
 141                     ; 95 	return speedHz10;
 144  0036               L6:
 146  0036 5b0c          	addw	sp,#12
 147  0038 81            	ret	
 853                     ; 98 void driveInit(pvdev_device_t pdevice)
 853                     ; 99 {
 854                     	switch	.text
 855  0039               _driveInit:
 857  0039 89            	pushw	x
 858  003a 89            	pushw	x
 859       00000002      OFST:	set	2
 862                     ; 102 	dev_driveInit(pdevice);
 864  003b cd0000        	call	_dev_driveInit
 866                     ; 104 	pBLDC_Struct = Get_BLDC_Struct();
 868  003e cd0000        	call	_Get_BLDC_Struct
 870  0041 1f01          	ldw	(OFST-1,sp),x
 871                     ; 105 	g_pMotorVar = pBLDC_Struct->pBLDC_Var;
 873  0043 fe            	ldw	x,(x)
 874  0044 bf0b          	ldw	L3_g_pMotorVar,x
 875                     ; 106 	bHztoRPM = (u8)(60 / pBLDC_Struct->pBLDC_Const->bMotor_Pole_Pairs);
 877  0046 1601          	ldw	y,(OFST-1,sp)
 878  0048 90ee02        	ldw	y,(2,y)
 879  004b ae003c        	ldw	x,#60
 880  004e 90f6          	ld	a,(y)
 881  0050 905f          	clrw	y
 882  0052 9097          	ld	yl,a
 883  0054 cd0000        	call	c_idiv
 885  0057 9f            	ld	a,xl
 886  0058 b70a          	ld	_bHztoRPM,a
 887                     ; 107 	g_pPID_Speed = pBLDC_Struct->pBLDC_Const->pPID_Speed;
 889  005a 1e01          	ldw	x,(OFST-1,sp)
 890  005c ee02          	ldw	x,(2,x)
 891  005e ee06          	ldw	x,(6,x)
 892  0060 bf08          	ldw	_g_pPID_Speed,x
 893                     ; 108 	bSpeed_PID_sampling_time = pBLDC_Struct->pBLDC_Const->bSpeed_PID_sampling_time;
 895  0062 1e01          	ldw	x,(OFST-1,sp)
 896  0064 ee02          	ldw	x,(2,x)
 897  0066 e605          	ld	a,(5,x)
 898  0068 b707          	ld	_bSpeed_PID_sampling_time,a
 899                     ; 110 	g_pdevice = pdevice;
 901  006a 1e03          	ldw	x,(OFST+1,sp)
 902  006c bf05          	ldw	L11_g_pdevice,x
 903                     ; 113 		pcounter_reg = &(pdevice->regs.r16[VDEV_REG16_BEMF_COUNTS]);
 905  006e ee02          	ldw	x,(2,x)
 906  0070 1c0004        	addw	x,#4
 907  0073 bf03          	ldw	L31_pcounter_reg,x
 908                     ; 119 	pDutyCycleCounts_reg = &(pdevice->regs.r16[VDEV_REG16_BLDC_DUTY_CYCLE_COUNTS]);
 910  0075 1e03          	ldw	x,(OFST+1,sp)
 911  0077 ee02          	ldw	x,(2,x)
 912  0079 1c0008        	addw	x,#8
 913  007c bf01          	ldw	L51_pDutyCycleCounts_reg,x
 914                     ; 121 	vtimer_SetTimer(BLDC_CONTROL_TIMER,bSpeed_PID_sampling_time,&BLDC_Drive);
 916  007e ae00d3        	ldw	x,#_BLDC_Drive
 917  0081 89            	pushw	x
 918  0082 5f            	clrw	x
 919  0083 97            	ld	xl,a
 920  0084 89            	pushw	x
 921  0085 a604          	ld	a,#4
 922  0087 cd0000        	call	_vtimer_SetTimer
 924  008a 5b08          	addw	sp,#8
 925                     ; 122 }
 928  008c 81            	ret	
 953                     ; 124 void driveIdle(void)
 953                     ; 125 {
 954                     	switch	.text
 955  008d               _driveIdle:
 959                     ; 126 	DriveState = DRIVE_IDLE;
 961  008d 35010000      	mov	L71_DriveState,#1
 962                     ; 127 	dev_driveIdle();
 965                     ; 128 }
 968  0091 cc0000        	jp	_dev_driveIdle
1024                     ; 130 MC_FuncRetVal_t driveStartUpInit(void)
1024                     ; 131 {
1025                     	switch	.text
1026  0094               _driveStartUpInit:
1030                     ; 132 	DriveState = DRIVE_STARTINIT;
1032  0094 35020000      	mov	L71_DriveState,#2
1033                     ; 133 	bValidatedMeasuredSpeed = 0;
1035  0098 3f01          	clr	L32_bValidatedMeasuredSpeed
1036                     ; 137 	DriveStatus = FUNCTION_RUNNING;
1038  009a 3f00          	clr	L12_DriveStatus
1039                     ; 140         g_pPID_Speed->pPID_Var->wIntegral = 0;
1041  009c 92ce08        	ldw	x,[_g_pPID_Speed.w]
1042  009f 4f            	clr	a
1043  00a0 e709          	ld	(9,x),a
1044  00a2 e708          	ld	(8,x),a
1045  00a4 e707          	ld	(7,x),a
1046  00a6 e706          	ld	(6,x),a
1047                     ; 143 	return dev_driveStartUpInit();
1052  00a8 cc0000        	jp	_dev_driveStartUpInit
1078                     ; 146 MC_FuncRetVal_t driveStartUp(void)
1078                     ; 147 {
1079                     	switch	.text
1080  00ab               _driveStartUp:
1084                     ; 148 	DriveState = DRIVE_START;
1086  00ab 35030000      	mov	L71_DriveState,#3
1087                     ; 149 	return dev_driveStartUp();
1092  00af cc0000        	jp	_dev_driveStartUp
1119                     ; 152 MC_FuncRetVal_t driveRun(void)
1119                     ; 153 {
1120                     	switch	.text
1121  00b2               _driveRun:
1125                     ; 154 	DriveState = DRIVE_RUN;
1127  00b2 35040000      	mov	L71_DriveState,#4
1128                     ; 156 	if (DriveStatus == FUNCTION_ERROR)
1130  00b6 b600          	ld	a,L12_DriveStatus
1131  00b8 a102          	cp	a,#2
1132  00ba 2603          	jrne	L145
1133                     ; 158 		return FUNCTION_ERROR;
1135  00bc a602          	ld	a,#2
1138  00be 81            	ret	
1139  00bf               L145:
1140                     ; 162 		return dev_driveRun();
1145  00bf cc0000        	jp	_dev_driveRun
1171                     ; 166 MC_FuncRetVal_t driveStop(void)
1171                     ; 167 {
1172                     	switch	.text
1173  00c2               _driveStop:
1177                     ; 168 	DriveState = DRIVE_STOP;
1179  00c2 35050000      	mov	L71_DriveState,#5
1180                     ; 169 	return dev_driveStop();
1185  00c6 cc0000        	jp	_dev_driveStop
1211                     ; 172 MC_FuncRetVal_t driveWait(void)
1211                     ; 173 {
1212                     	switch	.text
1213  00c9               _driveWait:
1217                     ; 174 	DriveState = DRIVE_WAIT;
1219  00c9 35060000      	mov	L71_DriveState,#6
1220                     ; 175 	return dev_driveWait();
1225  00cd cc0000        	jp	_dev_driveWait
1249                     ; 178 MC_FuncRetVal_t driveFault(void)
1249                     ; 179 {
1250                     	switch	.text
1251  00d0               _driveFault:
1255                     ; 180   return FUNCTION_ENDED;
1257  00d0 a601          	ld	a,#1
1260  00d2 81            	ret	
1332                     	switch	.const
1333  0004               L06:
1334  0004 0000000a      	dc.l	10
1335                     ; 183 void BLDC_Drive(void)
1335                     ; 184 {
1336                     	switch	.text
1337  00d3               _BLDC_Drive:
1339  00d3 5204          	subw	sp,#4
1340       00000004      OFST:	set	4
1343                     ; 192 	vtimer_SetTimer(BLDC_CONTROL_TIMER,bSpeed_PID_sampling_time,&BLDC_Drive);
1345  00d5 ae00d3        	ldw	x,#_BLDC_Drive
1346  00d8 89            	pushw	x
1347  00d9 b607          	ld	a,_bSpeed_PID_sampling_time
1348  00db 5f            	clrw	x
1349  00dc 97            	ld	xl,a
1350  00dd 89            	pushw	x
1351  00de a604          	ld	a,#4
1352  00e0 cd0000        	call	_vtimer_SetTimer
1354  00e3 5b04          	addw	sp,#4
1355                     ; 195 	hSpeed_01HZ = GetSpeed_01HZ();
1357  00e5 cd0000        	call	_GetSpeed_01HZ
1359  00e8 1f03          	ldw	(OFST-1,sp),x
1360                     ; 224 		if (hSpeed_01HZ > MIN_SPEED_01HZ)
1362  00ea a30065        	cpw	x,#101
1363  00ed 2504          	jrult	L726
1364                     ; 226 			bValidatedMeasuredSpeed = 1;
1366  00ef 35010001      	mov	L32_bValidatedMeasuredSpeed,#1
1367  00f3               L726:
1368                     ; 230 	hMeasuredSpeed = (u16)(((u32)bHztoRPM * hSpeed_01HZ)/10);
1370  00f3 b60a          	ld	a,_bHztoRPM
1371  00f5 5f            	clrw	x
1372  00f6 97            	ld	xl,a
1373  00f7 1603          	ldw	y,(OFST-1,sp)
1374  00f9 cd0000        	call	c_umul
1376  00fc ae0004        	ldw	x,#L06
1377  00ff cd0000        	call	c_ludv
1379  0102 be02          	ldw	x,c_lreg+2
1380  0104 1f01          	ldw	(OFST-3,sp),x
1381                     ; 231 	hTargetSpeed = g_pMotorVar->hTarget_rotor_speed;
1383  0106 be0b          	ldw	x,L3_g_pMotorVar
1384  0108 ee04          	ldw	x,(4,x)
1385  010a 1f03          	ldw	(OFST-1,sp),x
1386                     ; 233 	if (hTargetSpeed < 0)
1388  010c 2a0e          	jrpl	L136
1389                     ; 235 		hTargetSpeed = -hTargetSpeed; // hTargetSpeed is the absolute value
1391  010e 50            	negw	x
1392  010f 1f03          	ldw	(OFST-1,sp),x
1393                     ; 236 		g_pMotorVar->hMeasured_rotor_speed = -hMeasuredSpeed; // Visualize negative speed
1395  0111 1e01          	ldw	x,(OFST-3,sp)
1396  0113 90be0b        	ldw	y,L3_g_pMotorVar
1397  0116 50            	negw	x
1398  0117 90ef02        	ldw	(2,y),x
1400  011a 2006          	jra	L336
1401  011c               L136:
1402                     ; 240 		g_pMotorVar->hMeasured_rotor_speed = hMeasuredSpeed; // Visualize positive speed
1404  011c be0b          	ldw	x,L3_g_pMotorVar
1405  011e 1601          	ldw	y,(OFST-3,sp)
1406  0120 ef02          	ldw	(2,x),y
1407  0122               L336:
1408                     ; 243 	if (bValidatedMeasuredSpeed == 1)
1410  0122 b601          	ld	a,L32_bValidatedMeasuredSpeed
1411  0124 4a            	dec	a
1412  0125 2620          	jrne	L536
1413                     ; 246 		if (g_pMotorVar->bAutoDelay)
1415  0127 be0b          	ldw	x,L3_g_pMotorVar
1416  0129 e616          	ld	a,(22,x)
1417  012b 2704          	jreq	L736
1418                     ; 248 			BLDCDelayCoefComputation(hMeasuredSpeed);
1420  012d 1e01          	ldw	x,(OFST-3,sp)
1421  012f ad28          	call	_BLDCDelayCoefComputation
1423  0131               L736:
1424                     ; 253 					outPid = PID_REG(hTargetSpeed,hMeasuredSpeed,g_pPID_Speed);
1426  0131 be08          	ldw	x,_g_pPID_Speed
1427  0133 89            	pushw	x
1428  0134 1e03          	ldw	x,(OFST-1,sp)
1429  0136 89            	pushw	x
1430  0137 90be08        	ldw	y,_g_pPID_Speed
1431  013a 90ee02        	ldw	y,(2,y)
1432  013d 1e07          	ldw	x,(OFST+3,sp)
1433  013f 90fe          	ldw	y,(y)
1434  0141 90fd          	call	(y)
1436  0143 5b04          	addw	sp,#4
1438  0145 2004          	jra	L146
1439  0147               L536:
1440                     ; 269 				outPid = g_pMotorVar->hDuty_cycle;
1442  0147 be0b          	ldw	x,L3_g_pMotorVar
1443  0149 ee06          	ldw	x,(6,x)
1444  014b               L146:
1445  014b 1f03          	ldw	(OFST-1,sp),x
1446                     ; 277 	if (DriveState == DRIVE_RUN)
1448  014d b600          	ld	a,L71_DriveState
1449  014f a104          	cp	a,#4
1450  0151 2603          	jrne	L346
1451                     ; 289 				*pDutyCycleCounts_reg = outPid;
1453  0153 92cf01        	ldw	[L51_pDutyCycleCounts_reg.w],x
1454  0156               L346:
1455                     ; 304 }
1458  0156 5b04          	addw	sp,#4
1459  0158 81            	ret	
1514                     	switch	.const
1515  0008               L07:
1516  0008 ffffff23      	dc.l	-221
1517  000c               L27:
1518  000c 00000400      	dc.l	1024
1519                     ; 306 void BLDCDelayCoefComputation(u16 Motor_Frequency)
1519                     ; 307 {
1520                     	switch	.text
1521  0159               _BLDCDelayCoefComputation:
1523  0159 89            	pushw	x
1524  015a 89            	pushw	x
1525       00000002      OFST:	set	2
1528                     ; 309 	if (Motor_Frequency <= Freq_Min) 
1530  015b a30bb9        	cpw	x,#3001
1531  015e 2404          	jruge	L376
1532                     ; 311 		BEMF_Rising_Factor = Rising_Fmin;
1534  0160 a680          	ld	a,#128
1535                     ; 312 		BEMF_Falling_Factor = Falling_Fmin;
1537  0162 2041          	jp	L707
1538  0164               L376:
1539                     ; 314 	else if (Motor_Frequency <= F_1) 
1541  0164 1e03          	ldw	x,(OFST+1,sp)
1542  0166 a30dad        	cpw	x,#3501
1543  0169 2438          	jruge	L776
1544                     ; 316 		BEMF_Rising_Factor = (u8)(Rising_Fmin + (s32)(alpha_Rising_1*(Motor_Frequency-Freq_Min)/1024)); 
1546  016b 1d0bb8        	subw	x,#3000
1547  016e cd0000        	call	c_uitolx
1549  0171 ae0008        	ldw	x,#L07
1550  0174 cd0000        	call	c_lmul
1552  0177 ae000c        	ldw	x,#L27
1553  017a cd0000        	call	c_ldiv
1555  017d a680          	ld	a,#128
1556  017f cd0000        	call	c_ladc
1558  0182 b603          	ld	a,c_lreg+3
1559  0184 6b01          	ld	(OFST-1,sp),a
1560                     ; 317 		BEMF_Falling_Factor = (u8)(Falling_Fmin + (s32)(alpha_Falling_1*(Motor_Frequency-Freq_Min)/1024));
1562  0186 1e03          	ldw	x,(OFST+1,sp)
1563  0188 1d0bb8        	subw	x,#3000
1564  018b cd0000        	call	c_uitolx
1566  018e ae0008        	ldw	x,#L07
1567  0191 cd0000        	call	c_lmul
1569  0194 ae000c        	ldw	x,#L27
1570  0197 cd0000        	call	c_ldiv
1572  019a a680          	ld	a,#128
1573  019c cd0000        	call	c_ladc
1575  019f b603          	ld	a,c_lreg+3
1577  01a1 2004          	jra	L576
1578  01a3               L776:
1579                     ; 319 	else if (Motor_Frequency <= F_2) 
1581                     ; 321 		BEMF_Rising_Factor = (u8)(Rising_F_1 + (s16)(alpha_Rising_2*(Motor_Frequency-F_1)/1024)); 
1582                     ; 322 		BEMF_Falling_Factor = (u8)(Falling_F_1 + (s16)(alpha_Falling_2*(Motor_Frequency-F_1)/1024));
1584                     ; 324 	else if (Motor_Frequency <= Freq_Max) 
1587  01a3 a614          	ld	a,#20
1588                     ; 326 		BEMF_Rising_Factor = (u8)(Rising_F_2 + (u16)(alpha_Rising_3*(Motor_Frequency-F_2)/1024)); 
1589                     ; 327 		BEMF_Falling_Factor = (u8)(Falling_F_2 + (u16)(alpha_Falling_3*(Motor_Frequency-F_2)/1024));
1591  01a5               L707:
1592                     ; 331 		BEMF_Rising_Factor = Rising_Fmax ;
1595  01a5 6b01          	ld	(OFST-1,sp),a
1596                     ; 332 		BEMF_Falling_Factor = Falling_Fmax;
1598  01a7               L576:
1602  01a7 6b02          	ld	(OFST+0,sp),a
1603                     ; 335 	g_pMotorVar->bRising_Delay = BEMF_Rising_Factor;
1605  01a9 be0b          	ldw	x,L3_g_pMotorVar
1606  01ab 7b01          	ld	a,(OFST-1,sp)
1607  01ad e70d          	ld	(13,x),a
1608                     ; 336 	g_pMotorVar->bFalling_Delay = BEMF_Falling_Factor;
1610  01af 7b02          	ld	a,(OFST+0,sp)
1611  01b1 e70c          	ld	(12,x),a
1612                     ; 337 }
1615  01b3 5b04          	addw	sp,#4
1616  01b5 81            	ret	
1817                     	xdef	_BLDCDelayCoefComputation
1818                     	xdef	_GetSpeed_01HZ
1819                     	xdef	_BLDC_Drive
1820                     	switch	.ubsct
1821  0000               L12_DriveStatus:
1822  0000 00            	ds.b	1
1823  0001               L51_pDutyCycleCounts_reg:
1824  0001 0000          	ds.b	2
1825  0003               L31_pcounter_reg:
1826  0003 0000          	ds.b	2
1827  0005               L11_g_pdevice:
1828  0005 0000          	ds.b	2
1829  0007               _bSpeed_PID_sampling_time:
1830  0007 00            	ds.b	1
1831                     	xdef	_bSpeed_PID_sampling_time
1832  0008               _g_pPID_Speed:
1833  0008 0000          	ds.b	2
1834                     	xdef	_g_pPID_Speed
1835  000a               _bHztoRPM:
1836  000a 00            	ds.b	1
1837                     	xdef	_bHztoRPM
1838  000b               L3_g_pMotorVar:
1839  000b 0000          	ds.b	2
1840                     	xref	_vtimer_SetTimer
1841                     	xref	_Get_BLDC_Struct
1842                     	xref	_dev_driveWait
1843                     	xref	_dev_driveStop
1844                     	xref	_dev_driveRun
1845                     	xref	_dev_driveStartUp
1846                     	xref	_dev_driveStartUpInit
1847                     	xref	_dev_driveIdle
1848                     	xref	_dev_driveInit
1849                     	xdef	_driveFault
1850                     	xdef	_driveWait
1851                     	xdef	_driveStop
1852                     	xdef	_driveRun
1853                     	xdef	_driveStartUp
1854                     	xdef	_driveStartUpInit
1855                     	xdef	_driveIdle
1856                     	xdef	_driveInit
1857                     	xref.b	c_lreg
1858                     	xref.b	c_x
1859                     	xref.b	c_y
1879                     	xref	c_ladc
1880                     	xref	c_ldiv
1881                     	xref	c_lmul
1882                     	xref	c_umul
1883                     	xref	c_idiv
1884                     	xref	c_ludv
1885                     	xref	c_rtol
1886                     	xref	c_uitolx
1887                     	xref	c_ltor
1888                     	end
