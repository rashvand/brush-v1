   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     	bsct
  20  0000               L3_StartUpStatus:
  21  0000 00            	dc.b	0
  22  0001               _g_pDevice:
  23  0001 0000          	dc.w	0
  24  0003               _g_pBLDC_Struct:
  25  0003 0000          	dc.w	0
  26  0005               L5_g_pMotorVar:
  27  0005 0000          	dc.w	0
  28  0007               _ADC_Sync_State:
  29  0007 04            	dc.b	4
  30  0008               _ADC_Async_State:
  31  0008 00            	dc.b	0
  32                     .const:	section	.text
  33  0000               L11_hArrPwmVal:
  34  0000 0378          	dc.w	888
  35  0002               L31_hMaxDutyCnt:
  36  0002 02e0          	dc.w	736
  37  0004               _PhaseSteps_CW:
  38  0004 68            	dc.b	104
  39  0005 48            	dc.b	72
  40  0006 68            	dc.b	104
  41  0007 51            	dc.b	81
  42  0008 10            	dc.b	16
  43  0009 68            	dc.b	104
  44  000a 68            	dc.b	104
  45  000b 48            	dc.b	72
  46  000c 01            	dc.b	1
  47  000d 15            	dc.b	21
  48  000e 68            	dc.b	104
  49  000f 68            	dc.b	104
  50  0010 48            	dc.b	72
  51  0011 10            	dc.b	16
  52  0012 15            	dc.b	21
  53  0013 48            	dc.b	72
  54  0014 68            	dc.b	104
  55  0015 68            	dc.b	104
  56  0016 15            	dc.b	21
  57  0017 10            	dc.b	16
  58  0018 48            	dc.b	72
  59  0019 68            	dc.b	104
  60  001a 68            	dc.b	104
  61  001b 05            	dc.b	5
  62  001c 11            	dc.b	17
  63  001d 68            	dc.b	104
  64  001e 48            	dc.b	72
  65  001f 68            	dc.b	104
  66  0020 50            	dc.b	80
  67  0021 11            	dc.b	17
  68  0022               _Fast_Demag_Steps_CW:
  69  0022 58            	dc.b	88
  70  0023 68            	dc.b	104
  71  0024 68            	dc.b	104
  72  0025 45            	dc.b	69
  73  0026 10            	dc.b	16
  74  0027 68            	dc.b	104
  75  0028 68            	dc.b	104
  76  0029 48            	dc.b	72
  77  002a 01            	dc.b	1
  78  002b 15            	dc.b	21
  79  002c 68            	dc.b	104
  80  002d 58            	dc.b	88
  81  002e 68            	dc.b	104
  82  002f 50            	dc.b	80
  83  0030 14            	dc.b	20
  84  0031 48            	dc.b	72
  85  0032 68            	dc.b	104
  86  0033 68            	dc.b	104
  87  0034 15            	dc.b	21
  88  0035 10            	dc.b	16
  89  0036 68            	dc.b	104
  90  0037 68            	dc.b	104
  91  0038 58            	dc.b	88
  92  0039 04            	dc.b	4
  93  003a 15            	dc.b	21
  94  003b 68            	dc.b	104
  95  003c 48            	dc.b	72
  96  003d 68            	dc.b	104
  97  003e 50            	dc.b	80
  98  003f 11            	dc.b	17
  99                     	bsct
 100  0009               _PhaseSteps:
 101  0009 0004          	dc.w	_PhaseSteps_CW
 102  000b               _Fast_Demag_Steps:
 103  000b 0022          	dc.w	_Fast_Demag_Steps_CW
 104                     	switch	.const
 105  0040               _PhaseSteps_CCW:
 106  0040 68            	dc.b	104
 107  0041 48            	dc.b	72
 108  0042 68            	dc.b	104
 109  0043 51            	dc.b	81
 110  0044 10            	dc.b	16
 111  0045 68            	dc.b	104
 112  0046 48            	dc.b	72
 113  0047 68            	dc.b	104
 114  0048 50            	dc.b	80
 115  0049 11            	dc.b	17
 116  004a 48            	dc.b	72
 117  004b 68            	dc.b	104
 118  004c 68            	dc.b	104
 119  004d 05            	dc.b	5
 120  004e 11            	dc.b	17
 121  004f 48            	dc.b	72
 122  0050 68            	dc.b	104
 123  0051 68            	dc.b	104
 124  0052 15            	dc.b	21
 125  0053 10            	dc.b	16
 126  0054 68            	dc.b	104
 127  0055 68            	dc.b	104
 128  0056 48            	dc.b	72
 129  0057 10            	dc.b	16
 130  0058 15            	dc.b	21
 131  0059 68            	dc.b	104
 132  005a 68            	dc.b	104
 133  005b 48            	dc.b	72
 134  005c 01            	dc.b	1
 135  005d 15            	dc.b	21
 136  005e               _Fast_Demag_Steps_CCW:
 137  005e 58            	dc.b	88
 138  005f 68            	dc.b	104
 139  0060 68            	dc.b	104
 140  0061 45            	dc.b	69
 141  0062 10            	dc.b	16
 142  0063 68            	dc.b	104
 143  0064 48            	dc.b	72
 144  0065 68            	dc.b	104
 145  0066 50            	dc.b	80
 146  0067 11            	dc.b	17
 147  0068 68            	dc.b	104
 148  0069 68            	dc.b	104
 149  006a 58            	dc.b	88
 150  006b 04            	dc.b	4
 151  006c 15            	dc.b	21
 152  006d 48            	dc.b	72
 153  006e 68            	dc.b	104
 154  006f 68            	dc.b	104
 155  0070 15            	dc.b	21
 156  0071 10            	dc.b	16
 157  0072 68            	dc.b	104
 158  0073 58            	dc.b	88
 159  0074 68            	dc.b	104
 160  0075 50            	dc.b	80
 161  0076 14            	dc.b	20
 162  0077 68            	dc.b	104
 163  0078 68            	dc.b	104
 164  0079 48            	dc.b	72
 165  007a 01            	dc.b	1
 166  007b 15            	dc.b	21
 167  007c               _BEMFSteps_CW:
 168  007c 00            	dc.b	0
 169  007d 06            	dc.b	6
 170  007e 01            	dc.b	1
 171  007f 05            	dc.b	5
 172  0080 00            	dc.b	0
 173  0081 04            	dc.b	4
 174  0082 01            	dc.b	1
 175  0083 06            	dc.b	6
 176  0084 00            	dc.b	0
 177  0085 05            	dc.b	5
 178  0086 01            	dc.b	1
 179  0087 04            	dc.b	4
 180                     	bsct
 181  000d               _BEMFSteps:
 182  000d 007c          	dc.w	_BEMFSteps_CW
 183                     	switch	.const
 184  0088               _BEMFSteps_CCW:
 185  0088 01            	dc.b	1
 186  0089 06            	dc.b	6
 187  008a 00            	dc.b	0
 188  008b 04            	dc.b	4
 189  008c 01            	dc.b	1
 190  008d 05            	dc.b	5
 191  008e 00            	dc.b	0
 192  008f 06            	dc.b	6
 193  0090 01            	dc.b	1
 194  0091 04            	dc.b	4
 195  0092 00            	dc.b	0
 196  0093 05            	dc.b	5
 197  0094               _RAMP_TABLE:
 198  0094 05be          	dc.w	1470
 199  0096 0261          	dc.w	609
 200  0098 01d3          	dc.w	467
 201  009a 018a          	dc.w	394
 202  009c 015b          	dc.w	347
 203  009e 013a          	dc.w	314
 204  00a0 0120          	dc.w	288
 205  00a2 010c          	dc.w	268
 206  00a4 00fc          	dc.w	252
 207  00a6 00ee          	dc.w	238
 208  00a8 00e3          	dc.w	227
 209  00aa 00d9          	dc.w	217
 210  00ac 00d0          	dc.w	208
 211  00ae 00c8          	dc.w	200
 212  00b0 00c1          	dc.w	193
 213  00b2 00bb          	dc.w	187
 214  00b4 00b5          	dc.w	181
 215  00b6 00b0          	dc.w	176
 216  00b8 00ab          	dc.w	171
 217  00ba 00a6          	dc.w	166
 218  00bc 00a2          	dc.w	162
 219  00be 009e          	dc.w	158
 220  00c0 009b          	dc.w	155
 221  00c2 0098          	dc.w	152
 222  00c4 0094          	dc.w	148
 223  00c6 0092          	dc.w	146
 224  00c8 008f          	dc.w	143
 225  00ca 008c          	dc.w	140
 226  00cc 008a          	dc.w	138
 227  00ce 0087          	dc.w	135
 228  00d0 0085          	dc.w	133
 229  00d2 0083          	dc.w	131
 230  00d4 0081          	dc.w	129
 231  00d6 007f          	dc.w	127
 232  00d8 007d          	dc.w	125
 233  00da 007b          	dc.w	123
 234  00dc 007a          	dc.w	122
 235  00de 0078          	dc.w	120
 236  00e0 0076          	dc.w	118
 237  00e2 0075          	dc.w	117
 238  00e4 0073          	dc.w	115
 239  00e6 0072          	dc.w	114
 240  00e8 0071          	dc.w	113
 241  00ea 006f          	dc.w	111
 242  00ec 006e          	dc.w	110
 243  00ee 006d          	dc.w	109
 244  00f0 006c          	dc.w	108
 245  00f2 006b          	dc.w	107
 246  00f4 006a          	dc.w	106
 247  00f6 0068          	dc.w	104
 248  00f8 0067          	dc.w	103
 249  00fa 0066          	dc.w	102
 250  00fc 0065          	dc.w	101
 251  00fe 0064          	dc.w	100
 252  0100 0064          	dc.w	100
 253  0102 0063          	dc.w	99
 254  0104 0062          	dc.w	98
 255  0106 0061          	dc.w	97
 256  0108 0060          	dc.w	96
 257  010a 005f          	dc.w	95
 258  010c 005e          	dc.w	94
 259  010e 005e          	dc.w	94
 260  0110 005d          	dc.w	93
 261  0112 005c          	dc.w	92
 262                     	bsct
 263  000f               _cap_val:
 264  000f 0000          	dc.w	0
 265  0011               _cap_index:
 266  0011 00            	dc.b	0
 267  0012               _first_cap:
 268  0012 00            	dc.b	0
 269  0013               _bComHanderEnable:
 270  0013 00            	dc.b	0
 271  0014               _hTim3Cnt:
 272  0014 0000          	dc.w	0
 273  0016               _hTim3Th:
 274  0016 0000          	dc.w	0
 992                     	switch	.const
 993  0114               L01:
 994  0114 000003e8      	dc.l	1000
 995  0118               L21:
 996  0118 0000157c      	dc.l	5500
 997  011c               L41:
 998  011c 00001388      	dc.l	5000
 999                     ; 618 void dev_driveInit(pvdev_device_t pdevice)
 999                     ; 619 {
1000                     	scross	off
1001                     	switch	.text
1002  0000               _dev_driveInit:
1004  0000 89            	pushw	x
1005  0001 89            	pushw	x
1006       00000002      OFST:	set	2
1009                     ; 620 	PBLDC_Struct_t pBLDC_Struct = Get_BLDC_Struct();
1011  0002 cd0000        	call	_Get_BLDC_Struct
1013  0005 1f01          	ldw	(OFST-1,sp),x
1014                     ; 621 	g_pBLDC_Struct = pBLDC_Struct;
1016  0007 bf03          	ldw	_g_pBLDC_Struct,x
1017                     ; 622 	g_pMotorVar = pBLDC_Struct->pBLDC_Var;
1019  0009 fe            	ldw	x,(x)
1020  000a bf05          	ldw	L5_g_pMotorVar,x
1021                     ; 623 	g_pDevice = pdevice;
1023  000c 1e03          	ldw	x,(OFST+1,sp)
1024  000e bf01          	ldw	_g_pDevice,x
1025                     ; 626 	hDutyCntTh = (u16)(((u32)hArrPwmVal*DUTY_CYCLE_TH_TON)/100);
1027  0010 ae02cf        	ldw	x,#719
1028  0013 bf30          	ldw	_hDutyCntTh,x
1029                     ; 629 	hCntDeadDtime = (u16)(((u32)g_pBLDC_Struct->pBLDC_Const->hDeadTime * STM8_FREQ_MHZ )/1000);
1031  0015 be03          	ldw	x,_g_pBLDC_Struct
1032  0017 ee02          	ldw	x,(2,x)
1033  0019 a610          	ld	a,#16
1034  001b ee0a          	ldw	x,(10,x)
1035  001d cd0000        	call	c_cmulx
1037  0020 ae0114        	ldw	x,#L01
1038  0023 cd0000        	call	c_ludv
1040  0026 be02          	ldw	x,c_lreg+2
1041  0028 bf2e          	ldw	_hCntDeadDtime,x
1042                     ; 632 	CurrentLimitCnt = (u16)(MILLIAMP_TOCNT (g_pBLDC_Struct->pBLDC_Const->hCurrent_Limitation));
1044  002a be03          	ldw	x,_g_pBLDC_Struct
1045  002c ee02          	ldw	x,(2,x)
1046  002e a60a          	ld	a,#10
1047  0030 ee08          	ldw	x,(8,x)
1048  0032 cd0000        	call	c_cmulx
1050  0035 ae0114        	ldw	x,#L01
1051  0038 cd0000        	call	c_ludv
1053  003b ae0118        	ldw	x,#L21
1054  003e cd0000        	call	c_lmul
1056  0041 ae011c        	ldw	x,#L41
1057  0044 cd0000        	call	c_ludv
1059  0047 be02          	ldw	x,c_lreg+2
1060  0049 bf1b          	ldw	_CurrentLimitCnt,x
1061                     ; 635 	pcounter_reg = &(pdevice->regs.r16[VDEV_REG16_BEMF_COUNTS]);
1063  004b 1e03          	ldw	x,(OFST+1,sp)
1064  004d ee02          	ldw	x,(2,x)
1065  004f 1c0004        	addw	x,#4
1066  0052 bf0a          	ldw	L51_pcounter_reg,x
1067                     ; 641 	pDutyCycleCounts_reg = &(pdevice->regs.r16[VDEV_REG16_BLDC_DUTY_CYCLE_COUNTS]);
1069  0054 1e03          	ldw	x,(OFST+1,sp)
1070  0056 ee02          	ldw	x,(2,x)
1071  0058 1c0008        	addw	x,#8
1072  005b bf08          	ldw	L71_pDutyCycleCounts_reg,x
1073                     ; 643 	Init_TIM1();
1075  005d cd0500        	call	_Init_TIM1
1077                     ; 644 	Init_TIM2();
1079  0060 cd057e        	call	_Init_TIM2
1081                     ; 645 	Init_ADC();  
1083  0063 cd025d        	call	_Init_ADC
1085                     ; 647 		DebugPinsOff();
1087  0066 cd04df        	call	_DebugPinsOff
1089                     ; 680 	vtimer_SetTimer(ADC_SAMPLE_TIMER,ADC_SAMPLE_TIMEOUT,&Application_ADC_Manager);
1091  0069 ae0202        	ldw	x,#_Application_ADC_Manager
1092  006c 89            	pushw	x
1093  006d ae000a        	ldw	x,#10
1094  0070 89            	pushw	x
1095  0071 a608          	ld	a,#8
1096  0073 cd0000        	call	_vtimer_SetTimer
1098  0076 5b08          	addw	sp,#8
1099                     ; 681 }
1102  0078 81            	ret	
1125                     ; 683 void dev_driveIdle(void)
1125                     ; 684 {
1126                     	switch	.text
1127  0079               _dev_driveIdle:
1131                     ; 685 }
1134  0079 81            	ret	
1198                     ; 687 MC_FuncRetVal_t dev_driveStartUpInit(void)
1198                     ; 688 {
1199                     	switch	.text
1200  007a               _dev_driveStartUpInit:
1202  007a 89            	pushw	x
1203       00000002      OFST:	set	2
1206                     ; 690 	if (g_pBLDC_Struct->pBLDC_Var->hTarget_rotor_speed > 0)
1208  007b 5f            	clrw	x
1209  007c 1f01          	ldw	(OFST-1,sp),x
1210  007e 92ce03        	ldw	x,[_g_pBLDC_Struct.w]
1211  0081 ee04          	ldw	x,(4,x)
1212  0083 1301          	cpw	x,(OFST-1,sp)
1213  0085 2d0f          	jrsle	L564
1214                     ; 692 		BEMFSteps = BEMFSteps_CW;
1216  0087 ae007c        	ldw	x,#_BEMFSteps_CW
1217  008a bf0d          	ldw	_BEMFSteps,x
1218                     ; 693 		PhaseSteps = PhaseSteps_CW;
1220  008c ae0004        	ldw	x,#_PhaseSteps_CW
1221  008f bf09          	ldw	_PhaseSteps,x
1222                     ; 694 		Fast_Demag_Steps = Fast_Demag_Steps_CW;
1224  0091 ae0022        	ldw	x,#_Fast_Demag_Steps_CW
1226  0094 200d          	jra	L764
1227  0096               L564:
1228                     ; 707 		BEMFSteps = BEMFSteps_CCW;
1230  0096 ae0088        	ldw	x,#_BEMFSteps_CCW
1231  0099 bf0d          	ldw	_BEMFSteps,x
1232                     ; 708 		PhaseSteps = PhaseSteps_CCW;
1234  009b ae0040        	ldw	x,#_PhaseSteps_CCW
1235  009e bf09          	ldw	_PhaseSteps,x
1236                     ; 709 		Fast_Demag_Steps = Fast_Demag_Steps_CCW;
1238  00a0 ae005e        	ldw	x,#_Fast_Demag_Steps_CCW
1239  00a3               L764:
1240  00a3 bf0b          	ldw	_Fast_Demag_Steps,x
1241                     ; 721 	StartUpStatus = STARTUP_BOOTSTRAP;
1243  00a5 35010000      	mov	L3_StartUpStatus,#1
1244                     ; 722 	vtimer_SetTimer(MTC_ALIGN_RAMP_TIMER,5,0);
1246  00a9 5f            	clrw	x
1247  00aa 89            	pushw	x
1248  00ab ae0005        	ldw	x,#5
1249  00ae 89            	pushw	x
1250  00af a606          	ld	a,#6
1251  00b1 cd0000        	call	_vtimer_SetTimer
1253  00b4 5b04          	addw	sp,#4
1254                     ; 724 	return FUNCTION_ENDED;
1256  00b6 a601          	ld	a,#1
1259  00b8 85            	popw	x
1260  00b9 81            	ret	
1296                     ; 727 MC_FuncRetVal_t dev_driveStartUp(void)
1296                     ; 728 {
1297                     	switch	.text
1298  00ba               _dev_driveStartUp:
1302                     ; 729 	switch (StartUpStatus)
1304  00ba b600          	ld	a,L3_StartUpStatus
1306                     ; 817 		break;
1307  00bc 4a            	dec	a
1308  00bd 270b          	jreq	L374
1309  00bf 4a            	dec	a
1310  00c0 271c          	jreq	L574
1311  00c2 4a            	dec	a
1312  00c3 2725          	jreq	L774
1313  00c5 4a            	dec	a
1314  00c6 273f          	jreq	L105
1315  00c8 2063          	jra	L515
1316                     ; 731 	case STARTUP_IDLE:
1316                     ; 732 		break;
1318  00ca               L374:
1319                     ; 734 	case STARTUP_BOOTSTRAP:
1319                     ; 735 		if (BootStrap() == TRUE)
1321  00ca cd08f6        	call	_BootStrap
1323  00cd 4a            	dec	a
1324  00ce 265d          	jrne	L515
1325                     ; 737 			Align_State = ALIGN_IDLE;
1327  00d0 b715          	ld	_Align_State,a
1328                     ; 739 				AUTO_SWITCH_PORT &= (u8)(~AUTO_SWITCH_PIN);
1330  00d2 7211500f      	bres	20495,#0
1331                     ; 742 				StartUpStatus = STARTUP_ALIGN;
1333  00d6 35020000      	mov	L3_StartUpStatus,#2
1334                     ; 760 			first_cap = 0;
1336  00da b712          	ld	_first_cap,a
1337  00dc 204f          	jra	L515
1338  00de               L574:
1339                     ; 764 	case STARTUP_ALIGN:
1339                     ; 765 		if( AlignRotor() )
1341  00de cd0917        	call	_AlignRotor
1343  00e1 4d            	tnz	a
1344  00e2 2749          	jreq	L515
1345                     ; 767 			StartUpStatus = STARTUP_START;
1347  00e4 35030000      	mov	L3_StartUpStatus,#3
1348  00e8 2043          	jra	L515
1349  00ea               L774:
1350                     ; 771 	case STARTUP_START:
1350                     ; 772 		#ifdef SENSORLESS
1350                     ; 773 			MTC_Status |= MTC_STEP_MODE;
1352  00ea 7210002a      	bset	_MTC_Status,#0
1353                     ; 778 		MTC_Status &= (u8)(~(MTC_STARTUP_FAILED|MTC_OVER_CURRENT_FAIL|MTC_LAST_FORCED_STEP|MTC_MOTOR_STALLED));
1355  00ee b62a          	ld	a,_MTC_Status
1356  00f0 a4e1          	and	a,#225
1357  00f2 b72a          	ld	_MTC_Status,a
1358                     ; 781 		hTim3Th = 0;
1360  00f4 5f            	clrw	x
1361  00f5 bf16          	ldw	_hTim3Th,x
1362                     ; 783 		StartMotor();
1364  00f7 cd0a27        	call	_StartMotor
1366                     ; 786 		hTim3Cnt = 0;
1368  00fa 5f            	clrw	x
1369  00fb bf14          	ldw	_hTim3Cnt,x
1370                     ; 789 		TIM1->IER |= BIT0;
1372  00fd 72105254      	bset	21076,#0
1373                     ; 792 			StartUpStatus = STARTUP_RAMPING;
1375  0101 35040000      	mov	L3_StartUpStatus,#4
1376                     ; 799 		break;
1378  0105 2026          	jra	L515
1379  0107               L105:
1380                     ; 801 	case STARTUP_RAMPING:
1380                     ; 802 		if( (MTC_Status & MTC_STEP_MODE) == 0 )
1382  0107 7200002a14    	btjt	_MTC_Status,#0,L325
1383                     ; 804 			vtimer_SetTimer(DEV_DUTY_UPDATE_TIMER,SPEED_PID_SAMPLING_TIME,&dev_BLDC_driveUpdate);
1385  010c ae0165        	ldw	x,#_dev_BLDC_driveUpdate
1386  010f 89            	pushw	x
1387  0110 ae0005        	ldw	x,#5
1388  0113 89            	pushw	x
1389  0114 a605          	ld	a,#5
1390  0116 cd0000        	call	_vtimer_SetTimer
1392  0119 5b04          	addw	sp,#4
1393                     ; 805 			StartUpStatus = STARTUP_IDLE;
1395  011b 3f00          	clr	L3_StartUpStatus
1396                     ; 806 			return FUNCTION_ENDED;
1398  011d a601          	ld	a,#1
1401  011f 81            	ret	
1402  0120               L325:
1403                     ; 810 			if( MTC_Status & (MTC_STARTUP_FAILED|MTC_OVER_CURRENT_FAIL) )
1405  0120 b62a          	ld	a,_MTC_Status
1406  0122 a506          	bcp	a,#6
1407  0124 2707          	jreq	L515
1408                     ; 812 				StartUpStatus = STARTUP_IDLE;
1410  0126 3f00          	clr	L3_StartUpStatus
1411                     ; 813 				dev_driveStop();
1413  0128 ad16          	call	_dev_driveStop
1415                     ; 814 				return FUNCTION_ERROR;
1417  012a a602          	ld	a,#2
1420  012c 81            	ret	
1421  012d               L515:
1422                     ; 819 	return FUNCTION_RUNNING;
1424  012d 4f            	clr	a
1427  012e 81            	ret	
1453                     ; 822 MC_FuncRetVal_t dev_driveRun(void)
1453                     ; 823 {
1454                     	switch	.text
1455  012f               _dev_driveRun:
1459                     ; 824 	if( ((MTC_Status & MTC_OVER_CURRENT_FAIL) == MTC_OVER_CURRENT_FAIL) ||
1459                     ; 825 		((MTC_Status & MTC_MOTOR_STALLED) == MTC_MOTOR_STALLED) )
1461  012f 7204002a05    	btjt	_MTC_Status,#2,L345
1463  0134 7209002a05    	btjf	_MTC_Status,#4,L145
1464  0139               L345:
1465                     ; 827 		dev_driveStop();
1467  0139 ad05          	call	_dev_driveStop
1469                     ; 828 		return FUNCTION_ERROR;
1471  013b a602          	ld	a,#2
1474  013d 81            	ret	
1475  013e               L145:
1476                     ; 830 	return FUNCTION_RUNNING;
1478  013e 4f            	clr	a
1481  013f 81            	ret	
1510                     ; 833 MC_FuncRetVal_t dev_driveStop(void)
1510                     ; 834 {
1511                     	switch	.text
1512  0140               _dev_driveStop:
1516                     ; 835 	vtimer_KillTimer(DEV_DUTY_UPDATE_TIMER);
1518  0140 a605          	ld	a,#5
1519  0142 cd0000        	call	_vtimer_KillTimer
1521                     ; 836 	StopMotor();
1523  0145 cd089e        	call	_StopMotor
1525                     ; 838 		DebugPinsOff();
1527  0148 cd04df        	call	_DebugPinsOff
1529                     ; 840 	*pcounter_reg = 0;
1531  014b 5f            	clrw	x
1532  014c 92cf0a        	ldw	[L51_pcounter_reg.w],x
1533                     ; 843 	if (g_pBLDC_Struct->pBLDC_Var->bToggleMode)
1535  014f 92ce03        	ldw	x,[_g_pBLDC_Struct.w]
1536  0152 e615          	ld	a,(21,x)
1537  0154 2709          	jreq	L555
1538                     ; 845 		g_pBLDC_Struct->pBLDC_Var->hTarget_rotor_speed = -g_pBLDC_Struct->pBLDC_Var->hTarget_rotor_speed;
1540  0156 9093          	ldw	y,x
1541  0158 90ee04        	ldw	y,(4,y)
1542  015b 9050          	negw	y
1543  015d ef04          	ldw	(4,x),y
1544  015f               L555:
1545                     ; 847 	return FUNCTION_ENDED;
1547  015f a601          	ld	a,#1
1550  0161 81            	ret	
1574                     ; 850 MC_FuncRetVal_t dev_driveWait(void)
1574                     ; 851 {
1575                     	switch	.text
1576  0162               _dev_driveWait:
1580                     ; 871 		return FUNCTION_ENDED;
1582  0162 a601          	ld	a,#1
1585  0164 81            	ret	
1614                     ; 875 void dev_BLDC_driveUpdate(void)
1614                     ; 876 {
1615                     	switch	.text
1616  0165               _dev_BLDC_driveUpdate:
1620                     ; 877 	vtimer_SetTimer(DEV_DUTY_UPDATE_TIMER,SPEED_PID_SAMPLING_TIME,&dev_BLDC_driveUpdate);
1622  0165 ae0165        	ldw	x,#_dev_BLDC_driveUpdate
1623  0168 89            	pushw	x
1624  0169 ae0005        	ldw	x,#5
1625  016c 89            	pushw	x
1626  016d a605          	ld	a,#5
1627  016f cd0000        	call	_vtimer_SetTimer
1629  0172 5b04          	addw	sp,#4
1630                     ; 880 			g_pBLDC_Struct->pBLDC_Var->hDuty_cycle = Set_Duty(*pDutyCycleCounts_reg);
1632  0174 92ce08        	ldw	x,[L71_pDutyCycleCounts_reg.w]
1633  0177 cd0ad3        	call	_Set_Duty
1635  017a 91ce03        	ldw	y,[_g_pBLDC_Struct.w]
1636  017d 90ef06        	ldw	(6,y),x
1637                     ; 892 }
1640  0180 81            	ret	
1643                     	bsct
1644  0018               L775_bkin_blink_cnt:
1645  0018 0000          	dc.w	0
1684                     	switch	.const
1685  0120               L201:
1686  0120 00008001      	dc.l	32769
1687                     ; 894 @near @interrupt @svlreg void TIM1_UPD_OVF_TRG_BRK_IRQHandler (void)
1687                     ; 895 {
1688                     	switch	.text
1689  0181               _TIM1_UPD_OVF_TRG_BRK_IRQHandler:
1691  0181 8a            	push	cc
1692  0182 84            	pop	a
1693  0183 a4bf          	and	a,#191
1694  0185 88            	push	a
1695  0186 86            	pop	cc
1696  0187 3b0002        	push	c_x+2
1697  018a be00          	ldw	x,c_x
1698  018c 89            	pushw	x
1699  018d 3b0002        	push	c_y+2
1700  0190 be00          	ldw	x,c_y
1701  0192 89            	pushw	x
1702  0193 be02          	ldw	x,c_lreg+2
1703  0195 89            	pushw	x
1704  0196 be00          	ldw	x,c_lreg
1705  0198 89            	pushw	x
1708                     ; 899 	if( (TIM1->SR1 & BIT7) == BIT7 )
1710  0199 720f52553c    	btjf	21077,#7,L716
1711                     ; 901 		TIM1->SR1 &= (u8)(~BIT7);
1713  019e 721f5255      	bres	21077,#7
1714                     ; 926 		StartUpStatus = STARTUP_IDLE;
1716  01a2 3f00          	clr	L3_StartUpStatus
1717                     ; 928 		g_pDevice->regs.r16[VDEV_REG16_HW_ERROR_OCCURRED] |= OVER_CURRENT;
1719  01a4 be01          	ldw	x,_g_pDevice
1720  01a6 ee02          	ldw	x,(2,x)
1721  01a8 e611          	ld	a,(17,x)
1722  01aa aa04          	or	a,#4
1723  01ac e711          	ld	(17,x),a
1724                     ; 930 			DebugPinsOff();
1726  01ae cd04df        	call	_DebugPinsOff
1728                     ; 933 			if (((TIM1->SR1 & BIT7) == BIT7 ) && (bkin_blink_cnt <= 32768))
1730  01b1 720f52551d    	btjf	21077,#7,L126
1732  01b6 be18          	ldw	x,L775_bkin_blink_cnt
1733  01b8 cd0000        	call	c_uitolx
1735  01bb ae0120        	ldw	x,#L201
1736  01be cd0000        	call	c_lcmp
1738  01c1 2e10          	jrsge	L126
1739                     ; 935 				Z_DEBUG_PORT |= Z_DEBUG_PIN;
1741  01c3 721e500f      	bset	20495,#7
1742                     ; 936 				C_D_DEBUG_PORT |= C_D_DEBUG_PIN;
1744  01c7 7214500f      	bset	20495,#2
1745                     ; 937 				AUTO_SWITCH_PORT |= AUTO_SWITCH_PIN;
1747  01cb 7210500f      	bset	20495,#0
1748                     ; 938 				PWM_ON_SW_PORT |= PWM_ON_SW_PIN;
1750  01cf 72105014      	bset	20500,#0
1751  01d3               L126:
1752                     ; 940 			bkin_blink_cnt++;
1754  01d3 be18          	ldw	x,L775_bkin_blink_cnt
1755  01d5 5c            	incw	x
1756  01d6 bf18          	ldw	L775_bkin_blink_cnt,x
1758  01d8 2015          	jra	L326
1759  01da               L716:
1760                     ; 948 		if ((TIM1->SR1 & BIT0) == BIT0)
1762  01da 7201525510    	btjf	21077,#0,L326
1763                     ; 950 			hTim3Cnt++;
1765  01df be14          	ldw	x,_hTim3Cnt
1766  01e1 5c            	incw	x
1767  01e2 bf14          	ldw	_hTim3Cnt,x
1768                     ; 953 			if (hTim3Cnt >= hTim3Th)
1770  01e4 b316          	cpw	x,_hTim3Th
1771  01e6 2503          	jrult	L726
1772                     ; 955 				ComHandler();
1774  01e8 cd05b3        	call	_ComHandler
1776  01eb               L726:
1777                     ; 959 			TIM1->SR1 &= (u8)(~BIT0);
1779  01eb 72115255      	bres	21077,#0
1780  01ef               L326:
1781                     ; 962 }
1784  01ef 85            	popw	x
1785  01f0 bf00          	ldw	c_lreg,x
1786  01f2 85            	popw	x
1787  01f3 bf02          	ldw	c_lreg+2,x
1788  01f5 85            	popw	x
1789  01f6 bf00          	ldw	c_y,x
1790  01f8 320002        	pop	c_y+2
1791  01fb 85            	popw	x
1792  01fc bf00          	ldw	c_x,x
1793  01fe 320002        	pop	c_x+2
1794  0201 80            	iret	
1826                     ; 964 void Application_ADC_Manager( void )
1826                     ; 965 {
1827                     	switch	.text
1828  0202               _Application_ADC_Manager:
1832                     ; 966 	vtimer_SetTimer(ADC_SAMPLE_TIMER,ADC_SAMPLE_TIMEOUT,&Application_ADC_Manager);
1834  0202 ae0202        	ldw	x,#_Application_ADC_Manager
1835  0205 89            	pushw	x
1836  0206 ae000a        	ldw	x,#10
1837  0209 89            	pushw	x
1838  020a a608          	ld	a,#8
1839  020c cd0000        	call	_vtimer_SetTimer
1841  020f 5b04          	addw	sp,#4
1842                     ; 968 	GetCurrent();
1844  0211 ad0a          	call	_GetCurrent
1846                     ; 969 	GetSyncUserAdc();
1848  0213 ad30          	call	_GetSyncUserAdc
1850                     ; 970 	GetBusVoltage();
1852  0215 ad31          	call	_GetBusVoltage
1854                     ; 971 	GetTemperature();
1856  0217 ad35          	call	_GetTemperature
1858                     ; 972 	GetNeutralPoint();
1860  0219 ad38          	call	_GetNeutralPoint
1862                     ; 973 	GetAsyncUserAdc();
1865                     ; 974 }
1868  021b 203d          	jp	_GetAsyncUserAdc
1906                     	switch	.const
1907  0124               L231:
1908  0124 000f4240      	dc.l	1000000
1909  0128               L431:
1910  0128 0001b800      	dc.l	112640
1911  012c               L631:
1912  012c 00000064      	dc.l	100
1913                     ; 976 void GetCurrent(void)
1913                     ; 977 {
1914                     	switch	.text
1915  021d               _GetCurrent:
1917  021d 89            	pushw	x
1918       00000002      OFST:	set	2
1921                     ; 979 	disableInterrupts();
1924  021e 9b            	sim	
1926                     ; 980 	hVal = ADC_Buffer[ADC_CURRENT_INDEX];
1929  021f be35          	ldw	x,_ADC_Buffer
1930  0221 1f01          	ldw	(OFST-1,sp),x
1931                     ; 981 	enableInterrupts();
1934  0223 9a            	rim	
1936                     ; 983 	BLDC_Set_Current_measured((u16)(ADC_TOMILLIAMP(hVal)/100));
1939  0224 cd0000        	call	c_uitolx
1941  0227 ae0124        	ldw	x,#L231
1942  022a cd0000        	call	c_lmul
1944  022d ae0128        	ldw	x,#L431
1945  0230 cd0000        	call	c_ludv
1947  0233 a605          	ld	a,#5
1948  0235 cd0000        	call	c_smul
1950  0238 ae012c        	ldw	x,#L631
1951  023b cd0000        	call	c_ludv
1953  023e be02          	ldw	x,c_lreg+2
1954  0240 cd0000        	call	_BLDC_Set_Current_measured
1956                     ; 984 }
1959  0243 85            	popw	x
1960  0244 81            	ret	
1997                     ; 986 void GetSyncUserAdc(void)
1997                     ; 987 {
1998                     	switch	.text
1999  0245               _GetSyncUserAdc:
2001       00000002      OFST:	set	2
2004                     ; 990 	disableInterrupts();
2007  0245 9b            	sim	
2009                     ; 991 	hSyncUserAdc = ADC_Buffer[ADC_USER_SYNC_INDEX];
2012                     ; 992 	enableInterrupts();
2015  0246 9a            	rim	
2017                     ; 995 }
2021  0247 81            	ret	
2045                     ; 1049 	void GetBusVoltage( void )
2045                     ; 1050 	{
2046                     	switch	.text
2047  0248               _GetBusVoltage:
2051                     ; 1051 		BLDC_Set_Bus_Voltage((u16)(BUS_VOLTAGE_VALUE));
2053  0248 ae014a        	ldw	x,#330
2055                     ; 1052 	}
2058  024b cc0000        	jp	_BLDC_Set_Bus_Voltage
2082                     ; 1082 	void GetTemperature(void)
2082                     ; 1083 	{
2083                     	switch	.text
2084  024e               _GetTemperature:
2088                     ; 1084 		BLDC_Set_Heatsink_Temperature((u8)(HEAT_SINK_TEMPERATURE_VALUE));
2090  024e a619          	ld	a,#25
2092                     ; 1085 	}
2095  0250 cc0000        	jp	_BLDC_Set_Heatsink_Temperature
2133                     ; 1088 void GetNeutralPoint(void)
2133                     ; 1089 {
2134                     	switch	.text
2135  0253               _GetNeutralPoint:
2137       00000002      OFST:	set	2
2140                     ; 1091 	disableInterrupts();
2143  0253 9b            	sim	
2145                     ; 1092 	data = ADC_Buffer[ ADC_NEUTRAL_POINT_INDEX ];
2148  0254 be3d          	ldw	x,_ADC_Buffer+8
2149                     ; 1093 	enableInterrupts();
2152  0256 9a            	rim	
2154                     ; 1095 	hNeutralPoint = data;
2157  0257 bf32          	ldw	_hNeutralPoint,x
2158                     ; 1096 }
2161  0259 81            	ret	
2198                     ; 1098 void GetAsyncUserAdc(void)
2198                     ; 1099 {
2199                     	switch	.text
2200  025a               _GetAsyncUserAdc:
2202       00000002      OFST:	set	2
2205                     ; 1102 	disableInterrupts();
2208  025a 9b            	sim	
2210                     ; 1103 	hAsyncUserAdc = ADC_Buffer[ADC_USER_ASYNC_INDEX];
2213                     ; 1104 	enableInterrupts();
2216  025b 9a            	rim	
2218                     ; 1112 }
2222  025c 81            	ret	
2267                     ; 1114 void Init_ADC( void )
2267                     ; 1115 {
2268                     	switch	.text
2269  025d               _Init_ADC:
2271  025d 5203          	subw	sp,#3
2272       00000003      OFST:	set	3
2275                     ; 1119 	ADC_Sync_State = ADC_USER_SYNC_INIT;
2277  025f 35040007      	mov	_ADC_Sync_State,#4
2278                     ; 1120 	ADC_State = ADC_SYNC;
2280  0263 3f41          	clr	_ADC_State
2281                     ; 1122 	ADC1->CSR = 0; 
2283  0265 725f5400      	clr	21504
2284                     ; 1126 	ADC1->CR1 = BIT5;
2286  0269 35205401      	mov	21505,#32
2287                     ; 1129 	ADC1->CR2 = 0;
2289  026d 725f5402      	clr	21506
2290                     ; 1132 	ADC1->CSR = PHASE_C_BEMF_ADC_CHAN;
2292  0271 35065400      	mov	21504,#6
2293                     ; 1134 	ADC_TDR_tmp = 0;
2295  0275 5f            	clrw	x
2296  0276 1f02          	ldw	(OFST-1,sp),x
2297                     ; 1135 	ADC_TDR_tmp |= (u16)(1) << PHASE_A_BEMF_ADC_CHAN;
2299  0278 7b03          	ld	a,(OFST+0,sp)
2300                     ; 1136 	ADC_TDR_tmp |= (u16)(1) << PHASE_B_BEMF_ADC_CHAN;
2302                     ; 1137 	ADC_TDR_tmp |= (u16)(1) << PHASE_C_BEMF_ADC_CHAN;
2304                     ; 1139 	ADC_TDR_tmp |= (u16)(1) << ADC_CURRENT_CHANNEL;
2306                     ; 1140 	ADC_TDR_tmp |= (u16)(1) << ADC_USER_SYNC_CHANNEL;
2308                     ; 1142 	ADC_TDR_tmp |= (u16)(1) << ADC_BUS_CHANNEL;
2310                     ; 1143 	ADC_TDR_tmp |= (u16)(1) << ADC_NEUTRAL_POINT_CHANNEL;
2312  027a aaf8          	or	a,#248
2313  027c 6b03          	ld	(OFST+0,sp),a
2314                     ; 1144 	ADC_TDR_tmp |= (u16)(1) << ADC_TEMP_CHANNEL;
2316  027e 7b02          	ld	a,(OFST-1,sp)
2317  0280 aa01          	or	a,#1
2318  0282 6b02          	ld	(OFST-1,sp),a
2319                     ; 1145 	ADC_TDR_tmp |= (u16)(1) << ADC_USER_ASYNC_CHANNEL;
2321  0284 7b03          	ld	a,(OFST+0,sp)
2322  0286 aa08          	or	a,#8
2323  0288 6b03          	ld	(OFST+0,sp),a
2324                     ; 1147 	ToCMPxH( ADC1->TDRH, ADC_TDR_tmp);
2326  028a 35015406      	mov	21510,#1
2327                     ; 1148 	ToCMPxL( ADC1->TDRL, ADC_TDR_tmp);
2329  028e 35f85407      	mov	21511,#248
2330                     ; 1151 	ADC1->CR2 |= BIT6;
2332  0292 721c5402      	bset	21506,#6
2333                     ; 1154 	ADC1->CR1 |= BIT0;
2335                     ; 1156 	value=30;
2337  0296 a61e          	ld	a,#30
2338  0298 72105401      	bset	21505,#0
2339  029c 6b01          	ld	(OFST-2,sp),a
2341  029e               L777:
2342                     ; 1157 	while(value--);                    
2344  029e 7b01          	ld	a,(OFST-2,sp)
2345  02a0 0a01          	dec	(OFST-2,sp)
2346  02a2 4d            	tnz	a
2347  02a3 26f9          	jrne	L777
2348                     ; 1159 	ADC1->CSR &= (u8)(~BIT7);
2350  02a5 721f5400      	bres	21504,#7
2351                     ; 1160 	ADC1->CSR |= BIT5;
2353                     ; 1161 }
2356  02a9 5b03          	addw	sp,#3
2357  02ab 721a5400      	bset	21504,#5
2358  02af 81            	ret	
2383                     ; 1164 void Enable_ADC_BEMF_Sampling( void )
2383                     ; 1165 {
2384                     	switch	.text
2385  02b0               _Enable_ADC_BEMF_Sampling:
2389                     ; 1167 	ADC_Sync_State = ADC_BEMF_INIT;
2391  02b0 3f07          	clr	_ADC_Sync_State
2392                     ; 1168 }
2395  02b2 81            	ret	
2420                     ; 1170 void Enable_ADC_Current_Sampling( void )
2420                     ; 1171 {
2421                     	switch	.text
2422  02b3               _Enable_ADC_Current_Sampling:
2426                     ; 1173 	ADC_Sync_State = ADC_CURRENT_INIT;
2428  02b3 35020007      	mov	_ADC_Sync_State,#2
2429                     ; 1174 }
2432  02b7 81            	ret	
2457                     ; 1176 void Enable_ADC_User_Sync_Sampling( void )
2457                     ; 1177 {
2458                     	switch	.text
2459  02b8               _Enable_ADC_User_Sync_Sampling:
2463                     ; 1179 	ADC_Sync_State = ADC_USER_SYNC_INIT;
2465  02b8 35040007      	mov	_ADC_Sync_State,#4
2466                     ; 1180 }
2469  02bc 81            	ret	
2506                     ; 1184 void GetStepTime(void)
2506                     ; 1185 {
2507                     	switch	.text
2508  02bd               _GetStepTime:
2510  02bd 89            	pushw	x
2511       00000002      OFST:	set	2
2514                     ; 1188 	cur_time = hTim3Cnt;
2516  02be be14          	ldw	x,_hTim3Cnt
2517  02c0 1f01          	ldw	(OFST-1,sp),x
2518                     ; 1190 	hTim3Cnt = 0;
2520  02c2 5f            	clrw	x
2521  02c3 bf14          	ldw	_hTim3Cnt,x
2522                     ; 1192 	Zero_Cross_Time = cur_time;
2524  02c5 1e01          	ldw	x,(OFST-1,sp)
2525  02c7 bf23          	ldw	_Zero_Cross_Time,x
2526                     ; 1193 	Zero_Cross_Count++;
2528                     ; 1194 }
2531  02c9 85            	popw	x
2532  02ca 3c19          	inc	_Zero_Cross_Count
2533  02cc 81            	ret	
2561                     ; 1197 void SpeedMeasurement(void)
2561                     ; 1198 {
2562                     	switch	.text
2563  02cd               _SpeedMeasurement:
2567                     ; 1199 	if (first_cap == 0)
2569  02cd b612          	ld	a,_first_cap
2570  02cf 2606          	jrne	L1601
2571                     ; 1201 		first_cap = 1;
2573  02d1 35010012      	mov	_first_cap,#1
2574                     ; 1202 		cap_val = 0;
2575                     ; 1203 		cap_index = 0;
2577  02d5 2013          	jp	LC001
2578  02d7               L1601:
2579                     ; 1207 		cap_val += Zero_Cross_Time;
2581  02d7 be0f          	ldw	x,_cap_val
2582  02d9 72bb0023      	addw	x,_Zero_Cross_Time
2583  02dd bf0f          	ldw	_cap_val,x
2584                     ; 1208 		cap_index++;
2586  02df 3c11          	inc	_cap_index
2587                     ; 1210 		if (cap_index == CAP_STEP_NUM)
2589  02e1 b611          	ld	a,_cap_index
2590  02e3 a106          	cp	a,#6
2591  02e5 2608          	jrne	L3601
2592                     ; 1212 			*pcounter_reg = cap_val;
2594  02e7 92cf0a        	ldw	[L51_pcounter_reg.w],x
2595                     ; 1213 			cap_val = 0;
2597                     ; 1214 			cap_index = 0;
2599  02ea               LC001:
2601  02ea 5f            	clrw	x
2602  02eb bf0f          	ldw	_cap_val,x
2604  02ed 3f11          	clr	_cap_index
2605  02ef               L3601:
2606                     ; 1217 }
2609  02ef 81            	ret	
2682                     ; 1220 	@near @interrupt @svlreg void ADC2_IRQHandler (void)
2682                     ; 1221 	{
2683                     	switch	.text
2684  02f0               _ADC2_IRQHandler:
2686  02f0 8a            	push	cc
2687  02f1 84            	pop	a
2688  02f2 a4bf          	and	a,#191
2689  02f4 88            	push	a
2690  02f5 86            	pop	cc
2691       00000004      OFST:	set	4
2692  02f6 3b0002        	push	c_x+2
2693  02f9 be00          	ldw	x,c_x
2694  02fb 89            	pushw	x
2695  02fc 3b0002        	push	c_y+2
2696  02ff be00          	ldw	x,c_y
2697  0301 89            	pushw	x
2698  0302 be02          	ldw	x,c_lreg+2
2699  0304 89            	pushw	x
2700  0305 be00          	ldw	x,c_lreg
2701  0307 89            	pushw	x
2702  0308 5204          	subw	sp,#4
2705                     ; 1222 		if (ADC_State == ADC_SYNC)
2707  030a b641          	ld	a,_ADC_State
2708  030c 2703cc046f    	jrne	L1511
2709                     ; 1231 			bComHanderEnable = 0;
2711  0311 b713          	ld	_bComHanderEnable,a
2712                     ; 1234 			ADC1->CSR &= (u8)(~BIT7);
2714  0313 721f5400      	bres	21504,#7
2715                     ; 1237 			data = ADC1->DRH;
2717  0317 5f            	clrw	x
2718  0318 c65404        	ld	a,21508
2719  031b 97            	ld	xl,a
2720  031c 1f03          	ldw	(OFST-1,sp),x
2721                     ; 1238 			data <<= 2;
2723  031e 0804          	sll	(OFST+0,sp)
2724  0320 0903          	rlc	(OFST-1,sp)
2725  0322 0804          	sll	(OFST+0,sp)
2726  0324 0903          	rlc	(OFST-1,sp)
2727                     ; 1239 			data |= (ADC1->DRL & 0x03);   
2729  0326 c65405        	ld	a,21509
2730  0329 a403          	and	a,#3
2731  032b 5f            	clrw	x
2732  032c 97            	ld	xl,a
2733  032d 01            	rrwa	x,a
2734  032e 1a04          	or	a,(OFST+0,sp)
2735  0330 01            	rrwa	x,a
2736  0331 1a03          	or	a,(OFST-1,sp)
2737  0333 01            	rrwa	x,a
2738  0334 1f03          	ldw	(OFST-1,sp),x
2739                     ; 1241 			switch( ADC_Sync_State )
2741  0336 b607          	ld	a,_ADC_Sync_State
2743                     ; 1353 					break;
2744  0338 271e          	jreq	L7601
2745  033a 4a            	dec	a
2746  033b 2731          	jreq	L1701
2747  033d 4a            	dec	a
2748  033e 2603cc03fe    	jreq	L3701
2749  0343 4a            	dec	a
2750  0344 2603cc0418    	jreq	L7701
2751  0349 4a            	dec	a
2752  034a 2603cc040b    	jreq	L5701
2753  034f 4a            	dec	a
2754  0350 2603cc041c    	jreq	L1011
2755  0355 cc040b        	jra	L5701
2756  0358               L7601:
2757                     ; 1243 				case ADC_BEMF_INIT:
2757                     ; 1244 					ADC1->CSR = (u8)((Current_BEMF_Channel|BIT5)); 
2759  0358 b62b          	ld	a,_Current_BEMF_Channel
2760  035a aa20          	or	a,#32
2761  035c c75400        	ld	21504,a
2762                     ; 1245 					BEMF_Sample_Debounce = 0;
2764  035f 3f17          	clr	_BEMF_Sample_Debounce
2765                     ; 1246 					Zero_Sample_Count = 0;
2767  0361 5f            	clrw	x
2768  0362 bf0f          	ldw	_Zero_Sample_Count,x
2769                     ; 1247 					ADC_Sync_State = ADC_BEMF_SAMPLE;
2771  0364 35010007      	mov	_ADC_Sync_State,#1
2772                     ; 1248 					SetSamplingPoint_BEMF();
2774  0368 cd0bc3        	call	_SetSamplingPoint_BEMF
2776                     ; 1249 				break;
2778  036b cc041e        	jra	L5511
2779  036e               L1701:
2780                     ; 1251 				case ADC_BEMF_SAMPLE: 
2780                     ; 1252 					//detect zero crossing 
2780                     ; 1253 					if( Current_BEMF == BEMF_FALLING )
2782  036e b62c          	ld	a,_Current_BEMF
2783  0370 2646          	jrne	L7511
2784                     ; 1255 						if( Z_Detection_Type == Z_DETECT_PWM_OFF )
2786  0372 b616          	ld	a,_Z_Detection_Type
2787  0374 2605          	jrne	L1611
2788                     ; 1257 							bemf_threshold = BEMF_FALLING_THRESHOLD;
2790  0376 ae003c        	ldw	x,#60
2792  0379 2002          	jra	L3611
2793  037b               L1611:
2794                     ; 1261 							bemf_threshold = hNeutralPoint;
2796  037b be32          	ldw	x,_hNeutralPoint
2797  037d               L3611:
2798  037d 1f01          	ldw	(OFST-3,sp),x
2799                     ; 1264 						if (Ramp_Step > FORCED_STATUP_STEPS)
2801  037f b61a          	ld	a,_Ramp_Step
2802  0381 27e8          	jreq	L5511
2803                     ; 1266 							if( data <  bemf_threshold  )
2805  0383 1e03          	ldw	x,(OFST-1,sp)
2806  0385 1301          	cpw	x,(OFST-3,sp)
2807  0387 242b          	jruge	L7611
2808                     ; 1268 								Zero_Sample_Count++;
2810  0389 be0f          	ldw	x,_Zero_Sample_Count
2811  038b 5c            	incw	x
2812  038c bf0f          	ldw	_Zero_Sample_Count,x
2813                     ; 1269 								BEMF_Sample_Debounce++;
2815  038e 3c17          	inc	_BEMF_Sample_Debounce
2816                     ; 1270 								if( BEMF_Sample_Debounce >= BEMF_SAMPLE_COUNT )
2818  0390 b617          	ld	a,_BEMF_Sample_Debounce
2819  0392 a102          	cp	a,#2
2820  0394 25d5          	jrult	L5511
2821                     ; 1272 									hTim3Th -= hTim3Cnt;
2823  0396 be16          	ldw	x,_hTim3Th
2824  0398 72b00014      	subw	x,_hTim3Cnt
2825  039c bf16          	ldw	_hTim3Th,x
2826                     ; 1273 									GetStepTime();
2828  039e cd02bd        	call	_GetStepTime
2830                     ; 1276 										Z_DEBUG_PORT ^= Z_DEBUG_PIN;
2832  03a1 c6500f        	ld	a,20495
2833  03a4 a880          	xor	a,#128
2834  03a6 c7500f        	ld	20495,a
2835                     ; 1279 									SpeedMeasurement();
2837  03a9 cd02cd        	call	_SpeedMeasurement
2839                     ; 1281 									bComHanderEnable = 1;
2841  03ac 35010013      	mov	_bComHanderEnable,#1
2842                     ; 1283 									BEMF_Sample_Debounce = 0;
2844  03b0 3f17          	clr	_BEMF_Sample_Debounce
2845  03b2 206a          	jra	L5511
2846  03b4               L7611:
2847                     ; 1288 								BEMF_Sample_Debounce = 0;
2849  03b4 3f17          	clr	_BEMF_Sample_Debounce
2850  03b6 2066          	jra	L5511
2851  03b8               L7511:
2852                     ; 1294 						if( Z_Detection_Type == Z_DETECT_PWM_OFF )
2854  03b8 b616          	ld	a,_Z_Detection_Type
2855  03ba 2605          	jrne	L7711
2856                     ; 1296 							bemf_threshold = BEMF_RISING_THRESHOLD;
2858  03bc ae003c        	ldw	x,#60
2860  03bf 2002          	jra	L1021
2861  03c1               L7711:
2862                     ; 1300 							bemf_threshold = hNeutralPoint;
2864  03c1 be32          	ldw	x,_hNeutralPoint
2865  03c3               L1021:
2866  03c3 1f01          	ldw	(OFST-3,sp),x
2867                     ; 1303 						if (Ramp_Step > FORCED_STATUP_STEPS)
2869  03c5 b61a          	ld	a,_Ramp_Step
2870  03c7 2755          	jreq	L5511
2871                     ; 1305 							if( data > bemf_threshold )
2873  03c9 1e03          	ldw	x,(OFST-1,sp)
2874  03cb 1301          	cpw	x,(OFST-3,sp)
2875  03cd 232b          	jrule	L5021
2876                     ; 1307 								Zero_Sample_Count++;
2878  03cf be0f          	ldw	x,_Zero_Sample_Count
2879  03d1 5c            	incw	x
2880  03d2 bf0f          	ldw	_Zero_Sample_Count,x
2881                     ; 1308 								BEMF_Sample_Debounce++;
2883  03d4 3c17          	inc	_BEMF_Sample_Debounce
2884                     ; 1309 								if( BEMF_Sample_Debounce >= BEMF_SAMPLE_COUNT )
2886  03d6 b617          	ld	a,_BEMF_Sample_Debounce
2887  03d8 a102          	cp	a,#2
2888  03da 2542          	jrult	L5511
2889                     ; 1311 									hTim3Th -= hTim3Cnt;
2891  03dc be16          	ldw	x,_hTim3Th
2892  03de 72b00014      	subw	x,_hTim3Cnt
2893  03e2 bf16          	ldw	_hTim3Th,x
2894                     ; 1312 									GetStepTime();
2896  03e4 cd02bd        	call	_GetStepTime
2898                     ; 1315 										Z_DEBUG_PORT ^= Z_DEBUG_PIN;
2900  03e7 c6500f        	ld	a,20495
2901  03ea a880          	xor	a,#128
2902  03ec c7500f        	ld	20495,a
2903                     ; 1318 									SpeedMeasurement();
2905  03ef cd02cd        	call	_SpeedMeasurement
2907                     ; 1320 									bComHanderEnable = 1;
2909  03f2 35010013      	mov	_bComHanderEnable,#1
2910                     ; 1322 									BEMF_Sample_Debounce = 0;
2912  03f6 3f17          	clr	_BEMF_Sample_Debounce
2913  03f8 2024          	jra	L5511
2914  03fa               L5021:
2915                     ; 1327 								BEMF_Sample_Debounce = 0;
2917  03fa 3f17          	clr	_BEMF_Sample_Debounce
2918  03fc 2020          	jra	L5511
2919  03fe               L3701:
2920                     ; 1333 				case ADC_CURRENT_INIT:
2920                     ; 1334 					ADC1->CSR = (ADC_CURRENT_CHANNEL|BIT5); 
2922  03fe 35275400      	mov	21504,#39
2923                     ; 1335 					ADC_Sync_State = ADC_CURRENT_SAMPLE;
2925  0402 35030007      	mov	_ADC_Sync_State,#3
2926                     ; 1336 					SetSamplingPoint_Current();
2928  0406 cd0c0f        	call	_SetSamplingPoint_Current
2930                     ; 1337 				break;
2932  0409 2013          	jra	L5511
2933  040b               L5701:
2934                     ; 1339 				default:
2934                     ; 1340 				case ADC_USER_SYNC_INIT:
2934                     ; 1341 					ADC1->CSR = (ADC_USER_SYNC_CHANNEL|BIT5); 
2936  040b 35235400      	mov	21504,#35
2937                     ; 1342 					ADC_Sync_State = ADC_USER_SYNC_SAMPLE;
2939  040f 35050007      	mov	_ADC_Sync_State,#5
2940                     ; 1343 					SetSamplingPoint_User_Sync();
2942  0413 cd0c22        	call	_SetSamplingPoint_User_Sync
2944                     ; 1344 				break;
2946  0416 2006          	jra	L5511
2947  0418               L7701:
2948                     ; 1347 				case ADC_CURRENT_SAMPLE: 
2948                     ; 1348 					ADC_Buffer[ ADC_CURRENT_INDEX ] = data;
2950  0418 bf35          	ldw	_ADC_Buffer,x
2951                     ; 1349 					break;
2953  041a 2002          	jra	L5511
2954  041c               L1011:
2955                     ; 1351 				case ADC_USER_SYNC_SAMPLE: 
2955                     ; 1352 					ADC_Buffer[ ADC_USER_SYNC_INDEX] = data;
2957  041c bf37          	ldw	_ADC_Buffer+2,x
2958                     ; 1353 					break;
2960  041e               L5511:
2961                     ; 1357 			bCSR_Tmp = ADC1->CSR;
2963  041e 5554000034    	mov	L7_bCSR_Tmp,21504
2964                     ; 1360 			switch (ADC_Async_State)
2966  0423 b608          	ld	a,_ADC_Async_State
2968                     ; 1381 				break;
2969  0425 270c          	jreq	L3011
2970  0427 a002          	sub	a,#2
2971  0429 2712          	jreq	L5011
2972  042b a002          	sub	a,#2
2973  042d 2718          	jreq	L7011
2974  042f a002          	sub	a,#2
2975  0431 271e          	jreq	L1111
2976  0433               L3011:
2977                     ; 1362 				default:
2977                     ; 1363 				case ADC_BUS_INIT:
2977                     ; 1364 					ADC1->CSR = (ADC_BUS_CHANNEL|BIT5); 
2979  0433 35235400      	mov	21504,#35
2980                     ; 1365 					ADC_Async_State = ADC_BUS_SAMPLE;
2982  0437 35010008      	mov	_ADC_Async_State,#1
2983                     ; 1366 				break;
2985  043b 201c          	jra	L5121
2986  043d               L5011:
2987                     ; 1368 				case ADC_TEMP_INIT:
2987                     ; 1369 					ADC1->CSR = (ADC_TEMP_CHANNEL|BIT5); 
2989  043d 35285400      	mov	21504,#40
2990                     ; 1370 					ADC_Async_State = ADC_TEMP_SAMPLE;
2992  0441 35030008      	mov	_ADC_Async_State,#3
2993                     ; 1371 				break;
2995  0445 2012          	jra	L5121
2996  0447               L7011:
2997                     ; 1373 				case ADC_NEUTRAL_POINT_INIT:
2997                     ; 1374 					ADC1->CSR = (ADC_NEUTRAL_POINT_CHANNEL|BIT5); 
2999  0447 35235400      	mov	21504,#35
3000                     ; 1375 					ADC_Async_State = ADC_NEUTRAL_POINT_SAMPLE;
3002  044b 35050008      	mov	_ADC_Async_State,#5
3003                     ; 1376 				break;
3005  044f 2008          	jra	L5121
3006  0451               L1111:
3007                     ; 1378 				case ADC_USER_ASYNC_INIT:
3007                     ; 1379 					ADC1->CSR = (ADC_USER_ASYNC_CHANNEL|BIT5); 
3009  0451 35235400      	mov	21504,#35
3010                     ; 1380 					ADC_Async_State = ADC_USER_ASYNC_SAMPLE;
3012  0455 35070008      	mov	_ADC_Async_State,#7
3013                     ; 1381 				break;
3015  0459               L5121:
3016                     ; 1394 				ADC1->CR2 &= (u8)(~BIT6);
3018  0459 721d5402      	bres	21506,#6
3019                     ; 1396 				ADC1->CR1 |= BIT0;
3021  045d 72105401      	bset	21505,#0
3022                     ; 1399 			ADC_State = ADC_ASYNC;
3024  0461 35010041      	mov	_ADC_State,#1
3025                     ; 1401 			if (bComHanderEnable == 1)
3027  0465 b613          	ld	a,_bComHanderEnable
3028  0467 4a            	dec	a
3029  0468 2660          	jrne	L1221
3030                     ; 1403 				ComHandler();
3032  046a cd05b3        	call	_ComHandler
3034  046d 205b          	jra	L1221
3035  046f               L1511:
3036                     ; 1411 			data = ADC1->DRH;
3038  046f c65404        	ld	a,21508
3039  0472 5f            	clrw	x
3040  0473 97            	ld	xl,a
3041  0474 1f03          	ldw	(OFST-1,sp),x
3042                     ; 1412 			data <<= 2;
3044  0476 0804          	sll	(OFST+0,sp)
3045  0478 0903          	rlc	(OFST-1,sp)
3046  047a 0804          	sll	(OFST+0,sp)
3047  047c 0903          	rlc	(OFST-1,sp)
3048                     ; 1413 			data |= (ADC1->DRL & 0x03);
3050  047e c65405        	ld	a,21509
3051  0481 a403          	and	a,#3
3052  0483 5f            	clrw	x
3053  0484 97            	ld	xl,a
3054  0485 01            	rrwa	x,a
3055  0486 1a04          	or	a,(OFST+0,sp)
3056  0488 01            	rrwa	x,a
3057  0489 1a03          	or	a,(OFST-1,sp)
3058  048b 01            	rrwa	x,a
3059  048c 1f03          	ldw	(OFST-1,sp),x
3060                     ; 1416 			ADC1->CSR &= (u8)(~BIT7);
3062  048e 721f5400      	bres	21504,#7
3063                     ; 1419 			ADC1->CSR = bCSR_Tmp;
3065  0492 5500345400    	mov	21504,L7_bCSR_Tmp
3066                     ; 1430 				ADC1->CR2 |= BIT6;
3068  0497 721c5402      	bset	21506,#6
3069                     ; 1434 			switch (ADC_Async_State)
3071  049b b608          	ld	a,_ADC_Async_State
3073                     ; 1455 				break;
3074  049d 4a            	dec	a
3075  049e 270c          	jreq	L3111
3076  04a0 a002          	sub	a,#2
3077  04a2 2710          	jreq	L5111
3078  04a4 a002          	sub	a,#2
3079  04a6 2714          	jreq	L7111
3080  04a8 a002          	sub	a,#2
3081  04aa 2718          	jreq	L1211
3082  04ac               L3111:
3083                     ; 1436 				default:
3083                     ; 1437 				case ADC_BUS_SAMPLE:
3083                     ; 1438 					ADC_Buffer[ ADC_BUS_INDEX ] = data;
3085  04ac bf39          	ldw	_ADC_Buffer+4,x
3086                     ; 1439 					ADC_Async_State = ADC_TEMP_INIT;
3088  04ae 35020008      	mov	_ADC_Async_State,#2
3089                     ; 1440 				break;
3091  04b2 2014          	jra	L5221
3092  04b4               L5111:
3093                     ; 1442 				case ADC_TEMP_SAMPLE:
3093                     ; 1443 					ADC_Buffer[ ADC_TEMP_INDEX ] = data;
3095  04b4 bf3b          	ldw	_ADC_Buffer+6,x
3096                     ; 1444 					ADC_Async_State = ADC_NEUTRAL_POINT_INIT;
3098  04b6 35040008      	mov	_ADC_Async_State,#4
3099                     ; 1445 				break;
3101  04ba 200c          	jra	L5221
3102  04bc               L7111:
3103                     ; 1447 				case ADC_NEUTRAL_POINT_SAMPLE:
3103                     ; 1448 					ADC_Buffer[ ADC_NEUTRAL_POINT_INDEX ] = data;
3105  04bc bf3d          	ldw	_ADC_Buffer+8,x
3106                     ; 1449 					ADC_Async_State = ADC_USER_ASYNC_INIT;
3108  04be 35060008      	mov	_ADC_Async_State,#6
3109                     ; 1450 				break;
3111  04c2 2004          	jra	L5221
3112  04c4               L1211:
3113                     ; 1452 				case ADC_USER_ASYNC_SAMPLE:
3113                     ; 1453 					ADC_Buffer[ ADC_USER_ASYNC_INDEX ] = data;
3115  04c4 bf3f          	ldw	_ADC_Buffer+10,x
3116                     ; 1454 					ADC_Async_State = ADC_BUS_INIT;
3118  04c6 b708          	ld	_ADC_Async_State,a
3119                     ; 1455 				break;
3121  04c8               L5221:
3122                     ; 1458 			ADC_State = ADC_SYNC;
3124  04c8 3f41          	clr	_ADC_State
3125  04ca               L1221:
3126                     ; 1461 	}
3129  04ca 5b04          	addw	sp,#4
3130  04cc 85            	popw	x
3131  04cd bf00          	ldw	c_lreg,x
3132  04cf 85            	popw	x
3133  04d0 bf02          	ldw	c_lreg+2,x
3134  04d2 85            	popw	x
3135  04d3 bf00          	ldw	c_y,x
3136  04d5 320002        	pop	c_y+2
3137  04d8 85            	popw	x
3138  04d9 bf00          	ldw	c_x,x
3139  04db 320002        	pop	c_x+2
3140  04de 80            	iret	
3163                     ; 1539 void DebugPinsOff(void)
3163                     ; 1540 {
3164                     	switch	.text
3165  04df               _DebugPinsOff:
3169                     ; 1543 	Z_DEBUG_PORT 			|= (u8)(Z_DEBUG_PIN);
3171  04df 721e500f      	bset	20495,#7
3172                     ; 1544 	C_D_DEBUG_PORT 		|= (u8)(C_D_DEBUG_PIN);
3174  04e3 7214500f      	bset	20495,#2
3175                     ; 1545 	AUTO_SWITCH_PORT 	|= (u8)(AUTO_SWITCH_PIN);
3177  04e7 7210500f      	bset	20495,#0
3178                     ; 1546 	PWM_ON_SW_PORT 		|= (u8)(PWM_ON_SW_PIN);
3180  04eb 72105014      	bset	20500,#0
3181                     ; 1549 	Z_DEBUG_PORT 			&= (u8)(~Z_DEBUG_PIN);
3183  04ef 721f500f      	bres	20495,#7
3184                     ; 1550 	C_D_DEBUG_PORT 		&= (u8)(~C_D_DEBUG_PIN);
3186  04f3 7215500f      	bres	20495,#2
3187                     ; 1551 	AUTO_SWITCH_PORT 	&= (u8)(~AUTO_SWITCH_PIN);
3189  04f7 7211500f      	bres	20495,#0
3190                     ; 1552 	PWM_ON_SW_PORT 		&= (u8)(~PWM_ON_SW_PIN);
3192  04fb 72115014      	bres	20500,#0
3193                     ; 1554 }
3196  04ff 81            	ret	
3221                     ; 1558 void Init_TIM1(void)
3221                     ; 1559 {
3222                     	switch	.text
3223  0500               _Init_TIM1:
3227                     ; 1561 	TIM1->CR1 = BIT2;
3229  0500 35045250      	mov	21072,#4
3230                     ; 1564 	TIM1->CR2 = (BIT6|BIT5|BIT4|BIT0);
3232  0504 35715251      	mov	21073,#113
3233                     ; 1567 	TIM1->SMCR = 0;
3235  0508 725f5252      	clr	21074
3236                     ; 1575 	TIM1->IER = 0;
3238  050c 725f5254      	clr	21076
3239                     ; 1577 	TIM1->CCER1 = 0;
3241  0510 725f525c      	clr	21084
3242                     ; 1578 	TIM1->CCER2 = 0;
3244  0514 725f525d      	clr	21085
3245                     ; 1581 	TIM1->CCMR1 = CCMR_PWM;
3247  0518 35685258      	mov	21080,#104
3248                     ; 1583 	TIM1->CCMR2 = CCMR_PWM;
3250  051c 35685259      	mov	21081,#104
3251                     ; 1585 	TIM1->CCMR3 = CCMR_PWM;
3253  0520 3568525a      	mov	21082,#104
3254                     ; 1588 	TIM1->CCMR4 = BIT6|BIT5|BIT4|BIT3;
3256  0524 3578525b      	mov	21083,#120
3257                     ; 1591 	TIM1->PSCRH = 0; 
3259  0528 725f5260      	clr	21088
3260                     ; 1592 	TIM1->PSCRL = 0;
3262  052c 725f5261      	clr	21089
3263                     ; 1594 	ToCMPxH( TIM1->ARRH, hArrPwmVal );
3265  0530 35035262      	mov	21090,#3
3266                     ; 1595 	ToCMPxL( TIM1->ARRL, hArrPwmVal );
3268  0534 35785263      	mov	21091,#120
3269                     ; 1598 	TIM1->RCR = 0;
3271  0538 725f5264      	clr	21092
3272                     ; 1601 	ToCMPxH( TIM1->CCR1H, 0 );
3274  053c 725f5265      	clr	21093
3275                     ; 1602 	ToCMPxL( TIM1->CCR1L, 0 );
3277  0540 725f5266      	clr	21094
3278                     ; 1604 	ToCMPxH( TIM1->CCR2H, 0 );
3280  0544 725f5267      	clr	21095
3281                     ; 1605 	ToCMPxL( TIM1->CCR2L, 0 );
3283  0548 725f5268      	clr	21096
3284                     ; 1607 	ToCMPxH( TIM1->CCR3H, 0 );
3286  054c 725f5269      	clr	21097
3287                     ; 1608 	ToCMPxL( TIM1->CCR3L, 0 );
3289  0550 725f526a      	clr	21098
3290                     ; 1611 		ToCMPxH( TIM1->CCR4H, (hArrPwmVal-SAMPLING_POINT_DURING_TOFF_CNT) );
3292  0554 3503526b      	mov	21099,#3
3293                     ; 1612 		ToCMPxL( TIM1->CCR4L, (hArrPwmVal-SAMPLING_POINT_DURING_TOFF_CNT) );
3295  0558 3560526c      	mov	21100,#96
3296                     ; 1620 	TIM1->DTR = (u8)(hCntDeadDtime); 
3298  055c 55002f526e    	mov	21102,_hCntDeadDtime+1
3299                     ; 1623 	TIM1->OISR  = 0; // Default inactive 
3301  0561 725f526f      	clr	21103
3302                     ; 1646 	TIM1->CCER1 = (A_OFF|B_OFF);
3304  0565 725f525c      	clr	21084
3305                     ; 1648 	TIM1->CCER2 = C_OFF;
3307  0569 3510525d      	mov	21085,#16
3308                     ; 1653 		TIM1->BKR = (DEV_BKIN_POLARITY|DEV_BKIN|TIM1_OSSRSTATE_ENABLE|TIM1_OSSISTATE_ENABLE|TIM1_LOCKLEVEL_2); 
3310  056d 350e526d      	mov	21101,#14
3311                     ; 1661 	TIM1->CR1 |= BIT0;
3313  0571 72105250      	bset	21072,#0
3314                     ; 1664 	TIM1->EGR = (BIT5|BIT0);
3316  0575 35215257      	mov	21079,#33
3317                     ; 1667 	TIM1->IER = BIT7;
3319  0579 35805254      	mov	21076,#128
3320                     ; 1673 }
3323  057d 81            	ret	
3346                     ; 1675 void Init_TIM2(void)
3346                     ; 1676 {
3347                     	switch	.text
3348  057e               _Init_TIM2:
3352                     ; 1679 	TIM2->CR1 = BIT2;
3354  057e 35045300      	mov	21248,#4
3355                     ; 1682 	TIM2->IER = 0;
3357  0582 725f5301      	clr	21249
3358                     ; 1684 	TIM2->CCER1 = 0;
3360  0586 725f5308      	clr	21256
3361                     ; 1685 	TIM2->CCER2 = 0;
3363  058a 725f5309      	clr	21257
3364                     ; 1688 	TIM2->CCMR2 = BIT6|BIT5|BIT3;
3366  058e 35685306      	mov	21254,#104
3367                     ; 1691 	TIM2->PSCR = 0; 
3369  0592 725f530c      	clr	21260
3370                     ; 1693 	ToCMPxH( TIM2->ARRH, ARRTIM2 );
3372  0596 3501530d      	mov	21261,#1
3373                     ; 1694 	ToCMPxL( TIM2->ARRL, ARRTIM2 );
3375  059a 35f4530e      	mov	21262,#244
3376                     ; 1697 	ToCMPxH( TIM2->CCR2H, MILLIAMP_TOCNT (STARTUP_CURRENT_LIMITATION) );
3378  059e 725f5311      	clr	21265
3379                     ; 1698 	ToCMPxL( TIM2->CCR2L, MILLIAMP_TOCNT (STARTUP_CURRENT_LIMITATION) );		 
3381  05a2 356e5312      	mov	21266,#110
3382                     ; 1701 	TIM2->CCER1 |= BIT4;
3384  05a6 72185308      	bset	21256,#4
3385                     ; 1704 	TIM2->CR1 |= BIT0;
3387  05aa 72105300      	bset	21248,#0
3388                     ; 1707 	TIM2->EGR = (BIT5|BIT0);
3390  05ae 35215304      	mov	21252,#33
3391                     ; 1747 }
3394  05b2 81            	ret	
3457                     ; 1899 void ComHandler(void)
3457                     ; 1900 {
3458                     	switch	.text
3459  05b3               _ComHandler:
3461  05b3 89            	pushw	x
3462       00000002      OFST:	set	2
3465                     ; 1905 	switch( Phase_State )
3467  05b4 b629          	ld	a,_Phase_State
3469                     ; 2130 		break;
3470  05b6 270e          	jreq	L7521
3471  05b8 4a            	dec	a
3472  05b9 271c          	jreq	L1621
3473  05bb 4a            	dec	a
3474  05bc 2603cc06e1    	jreq	L3621
3475                     ; 2128 	default:
3475                     ; 2129 		Phase_State = PHASE_COMM; 
3477  05c1 3f29          	clr	_Phase_State
3478                     ; 2130 		break;
3480  05c3 cc0776        	jra	L7031
3481  05c6               L7521:
3482                     ; 1907 	case PHASE_COMM:
3482                     ; 1908 		#ifdef DEBUG_PINS
3482                     ; 1909 			C_D_DEBUG_PORT |= C_D_DEBUG_PIN;
3484  05c6 7214500f      	bset	20495,#2
3485                     ; 1911 		Commutate_Motor();
3487  05ca cd0778        	call	_Commutate_Motor
3489                     ; 1913 			Phase_State = PHASE_DEMAG; 
3491  05cd 35010029      	mov	_Phase_State,#1
3492                     ; 1918 		Enable_ADC_User_Sync_Sampling();
3494  05d1 cd02b8        	call	_Enable_ADC_User_Sync_Sampling
3496                     ; 1919 	break;
3498  05d4 cc0776        	jra	L7031
3499  05d7               L1621:
3500                     ; 1921 	case PHASE_DEMAG:
3500                     ; 1922 		#ifdef DEBUG_PINS
3500                     ; 1923 			C_D_DEBUG_PORT &= (u8)(~C_D_DEBUG_PIN);
3502  05d7 7215500f      	bres	20495,#2
3503                     ; 1925 		if( (MTC_Status & MTC_STEP_MODE) == MTC_STEP_MODE )
3505  05db 7201002a1e    	btjf	_MTC_Status,#0,L1131
3506                     ; 1928 			Commutation_Time = RAMP_TABLE[ Ramp_Step ];
3508  05e0 b61a          	ld	a,_Ramp_Step
3509  05e2 5f            	clrw	x
3510  05e3 97            	ld	xl,a
3511  05e4 58            	sllw	x
3512  05e5 de0094        	ldw	x,(_RAMP_TABLE,x)
3513  05e8 bf27          	ldw	_Commutation_Time,x
3514                     ; 1929 			if( Ramp_Step < STEP_RAMP_SIZE )
3516  05ea a140          	cp	a,#64
3517  05ec 2404          	jruge	L3131
3518                     ; 1931 				Ramp_Step++;
3520  05ee 3c1a          	inc	_Ramp_Step
3522  05f0 2004          	jra	L5131
3523  05f2               L3131:
3524                     ; 1935 				MTC_Status |= MTC_STARTUP_FAILED;                  
3526  05f2 7212002a      	bset	_MTC_Status,#1
3527  05f6               L5131:
3528                     ; 1939 			hTim3Th = LastSwitchedCom + Commutation_Time;
3530  05f6 be1d          	ldw	x,_LastSwitchedCom
3531  05f8 72bb0027      	addw	x,_Commutation_Time
3533  05fc 200a          	jra	L7131
3534  05fe               L1131:
3535                     ; 1944 			temp_time = Previous_Zero_Cross_Time * 2;
3537  05fe be21          	ldw	x,_Previous_Zero_Cross_Time
3538  0600 58            	sllw	x
3539  0601 1f01          	ldw	(OFST-1,sp),x
3540                     ; 1945 			hTim3Th = hTim3Cnt + temp_time;
3542  0603 be14          	ldw	x,_hTim3Cnt
3543  0605 72fb01        	addw	x,(OFST-1,sp)
3544  0608               L7131:
3545  0608 bf16          	ldw	_hTim3Th,x
3546                     ; 1949 		TIM1->EGR |= BIT5;
3548  060a 721a5257      	bset	21079,#5
3549                     ; 1952 		TIM1->CCMR1 = (u8)(PhaseSteps[Current_Step].CCMR_1 & 0x80);
3551  060e b62d          	ld	a,_Current_Step
3552  0610 97            	ld	xl,a
3553  0611 a605          	ld	a,#5
3554  0613 42            	mul	x,a
3555  0614 92d609        	ld	a,([_PhaseSteps.w],x)
3556  0617 a480          	and	a,#128
3557  0619 c75258        	ld	21080,a
3558                     ; 1953 		TIM1->CCMR2 = (u8)(PhaseSteps[Current_Step].CCMR_2 & 0x80);
3560  061c 72bb0009      	addw	x,_PhaseSteps
3561  0620 e601          	ld	a,(1,x)
3562  0622 a480          	and	a,#128
3563  0624 c75259        	ld	21081,a
3564                     ; 1954 		TIM1->CCMR3 = (u8)(PhaseSteps[Current_Step].CCMR_3 & 0x80);
3566  0627 b62d          	ld	a,_Current_Step
3567  0629 97            	ld	xl,a
3568  062a a605          	ld	a,#5
3569  062c 42            	mul	x,a
3570  062d 72bb0009      	addw	x,_PhaseSteps
3571  0631 e602          	ld	a,(2,x)
3572  0633 a480          	and	a,#128
3573  0635 c7525a        	ld	21082,a
3574                     ; 1957 		Current_Step++;
3576  0638 3c2d          	inc	_Current_Step
3577                     ; 1958 		if( Current_Step >= NUMBER_PHASE_STEPS )
3579  063a b62d          	ld	a,_Current_Step
3580  063c a106          	cp	a,#6
3581  063e 2502          	jrult	L1231
3582                     ; 1960 			Current_Step = 0;
3584  0640 3f2d          	clr	_Current_Step
3585  0642               L1231:
3586                     ; 1963 		if (g_pBLDC_Struct->pBLDC_Var->bFastDemag == 1)
3588  0642 92ce03        	ldw	x,[_g_pBLDC_Struct.w]
3589  0645 e614          	ld	a,(20,x)
3590  0647 4a            	dec	a
3591  0648 262b          	jrne	L3231
3592                     ; 1966 			TIM1->CCMR1 |= (u8)(Fast_Demag_Steps[Current_Step].CCMR_1 & 0x7F);
3594  064a b62d          	ld	a,_Current_Step
3595  064c 97            	ld	xl,a
3596  064d a605          	ld	a,#5
3597  064f 42            	mul	x,a
3598  0650 92d60b        	ld	a,([_Fast_Demag_Steps.w],x)
3599  0653 a47f          	and	a,#127
3600  0655 ca5258        	or	a,21080
3601  0658 c75258        	ld	21080,a
3602                     ; 1967 			TIM1->CCMR2 |= (u8)(Fast_Demag_Steps[Current_Step].CCMR_2 & 0x7F);
3604  065b 72bb000b      	addw	x,_Fast_Demag_Steps
3605  065f e601          	ld	a,(1,x)
3606  0661 a47f          	and	a,#127
3607  0663 ca5259        	or	a,21081
3608  0666 c75259        	ld	21081,a
3609                     ; 1968 			TIM1->CCMR3 |= (u8)(Fast_Demag_Steps[Current_Step].CCMR_3 & 0x7F);
3611  0669 b62d          	ld	a,_Current_Step
3612  066b 97            	ld	xl,a
3613  066c a605          	ld	a,#5
3614  066e 42            	mul	x,a
3615  066f 72bb000b      	addw	x,_Fast_Demag_Steps
3616                     ; 1969 			tmp_TIM1_CCER1 = Fast_Demag_Steps[Current_Step].CCER_1;
3617                     ; 1970 			tmp_TIM1_CCER2 = Fast_Demag_Steps[Current_Step].CCER_2;
3619  0673 2029          	jra	L5231
3620  0675               L3231:
3621                     ; 1975 			TIM1->CCMR1 |= (u8)(PhaseSteps[Current_Step].CCMR_1 & 0x7F);
3623  0675 b62d          	ld	a,_Current_Step
3624  0677 97            	ld	xl,a
3625  0678 a605          	ld	a,#5
3626  067a 42            	mul	x,a
3627  067b 92d609        	ld	a,([_PhaseSteps.w],x)
3628  067e a47f          	and	a,#127
3629  0680 ca5258        	or	a,21080
3630  0683 c75258        	ld	21080,a
3631                     ; 1976 			TIM1->CCMR2 |= (u8)(PhaseSteps[Current_Step].CCMR_2 & 0x7F);
3633  0686 72bb0009      	addw	x,_PhaseSteps
3634  068a e601          	ld	a,(1,x)
3635  068c a47f          	and	a,#127
3636  068e ca5259        	or	a,21081
3637  0691 c75259        	ld	21081,a
3638                     ; 1977 			TIM1->CCMR3 |= (u8)(PhaseSteps[Current_Step].CCMR_3 & 0x7F);
3640  0694 b62d          	ld	a,_Current_Step
3641  0696 97            	ld	xl,a
3642  0697 a605          	ld	a,#5
3643  0699 42            	mul	x,a
3644  069a 72bb0009      	addw	x,_PhaseSteps
3645                     ; 1978 			tmp_TIM1_CCER1 = PhaseSteps[Current_Step].CCER_1;
3647                     ; 1979 			tmp_TIM1_CCER2 = PhaseSteps[Current_Step].CCER_2;
3649  069e               L5231:
3650  069e e602          	ld	a,(2,x)
3651  06a0 a47f          	and	a,#127
3652  06a2 ca525a        	or	a,21082
3653  06a5 c7525a        	ld	21082,a
3655  06a8 e603          	ld	a,(3,x)
3656  06aa b701          	ld	_tmp_TIM1_CCER1,a
3658  06ac e604          	ld	a,(4,x)
3659  06ae b700          	ld	_tmp_TIM1_CCER2,a
3660                     ; 1983 		tmp_TIM1_CCMR1 = TIM1->CCMR1;
3662  06b0 5552580004    	mov	_tmp_TIM1_CCMR1,21080
3663                     ; 1984 		tmp_TIM1_CCMR2 = TIM1->CCMR2;
3665  06b5 5552590003    	mov	_tmp_TIM1_CCMR2,21081
3666                     ; 1985 		tmp_TIM1_CCMR3 = TIM1->CCMR3;
3668  06ba 55525a0002    	mov	_tmp_TIM1_CCMR3,21082
3669                     ; 1988 		TIM1->CCMR1 &= 0x8F;
3671  06bf c65258        	ld	a,21080
3672  06c2 a48f          	and	a,#143
3673  06c4 c75258        	ld	21080,a
3674                     ; 1989 		TIM1->CCMR2 &= 0x8F;
3676  06c7 c65259        	ld	a,21081
3677  06ca a48f          	and	a,#143
3678  06cc c75259        	ld	21081,a
3679                     ; 1990 		TIM1->CCMR3 &= 0x8F;
3681  06cf c6525a        	ld	a,21082
3682  06d2 a48f          	and	a,#143
3683  06d4 c7525a        	ld	21082,a
3684                     ; 1992 		Enable_ADC_BEMF_Sampling();
3686  06d7 cd02b0        	call	_Enable_ADC_BEMF_Sampling
3688                     ; 1993 		Phase_State = PHASE_ZERO; 
3690  06da 35020029      	mov	_Phase_State,#2
3691                     ; 1994 		break;
3693  06de cc0776        	jra	L7031
3694  06e1               L3621:
3695                     ; 1996 	case PHASE_ZERO:
3695                     ; 1997 		Enable_ADC_Current_Sampling();
3697  06e1 cd02b3        	call	_Enable_ADC_Current_Sampling
3699                     ; 1998 		if( Zero_Cross_Count != Last_Zero_Cross_Count )
3701  06e4 b619          	ld	a,_Zero_Cross_Count
3702  06e6 b118          	cp	a,_Last_Zero_Cross_Count
3703  06e8 2765          	jreq	L7231
3704                     ; 2006 			if( (MTC_Status & MTC_STEP_MODE) != MTC_STEP_MODE )
3706  06ea 7200002a3b    	btjt	_MTC_Status,#0,L1331
3707                     ; 2012 				if( Current_BEMF == BEMF_FALLING )
3709  06ef b62c          	ld	a,_Current_BEMF
3710  06f1 260f          	jrne	L3331
3711                     ; 2017 						ld A,_Previous_Zero_Cross_Time
3714  06f3 b621          	ld	A,_Previous_Zero_Cross_Time
3716                     ; 2018 						ld XL,A
3719  06f5 97            	ld	XL,A
3721                     ; 2019 						ld A,_BEMF_Falling_Factor
3724  06f6 b612          	ld	A,_BEMF_Falling_Factor
3726                     ; 2020 						mul X,A
3729  06f8 42            	mul	X,A
3731                     ; 2021 						ldw _Commutation_Time,X
3734  06f9 bf27          	ldw	_Commutation_Time,X
3736                     ; 2022 						ld A,_Previous_Zero_Cross_Time + 1
3739  06fb b622          	ld	A,_Previous_Zero_Cross_Time+1
3741                     ; 2023 						ld XL,A
3744  06fd 97            	ld	XL,A
3746                     ; 2024 						ld A,_BEMF_Falling_Factor
3749  06fe b612          	ld	A,_BEMF_Falling_Factor
3751                     ; 2025 						mul X,A
3755                     ; 2026 						ld A,XH
3759                     ; 2027 						clrw X
3763                     ; 2028 						ld XL,A
3767                     ; 2029 						addw X,_Commutation_Time
3771                     ; 2030 						ldw _Commutation_Time,X
3776  0700 200f          	jra	L5331
3777  0702               L3331:
3778                     ; 2035 					Motor_Stall_Count = 0;
3780  0702 3f0c          	clr	_Motor_Stall_Count
3781                     ; 2039 						ld A,_Previous_Zero_Cross_Time
3784  0704 b621          	ld	A,_Previous_Zero_Cross_Time
3786                     ; 2040 						ld XL,A
3789  0706 97            	ld	XL,A
3791                     ; 2041 						ld A,_BEMF_Rising_Factor
3794  0707 b611          	ld	A,_BEMF_Rising_Factor
3796                     ; 2042 						mul X,A
3799  0709 42            	mul	X,A
3801                     ; 2043 						ldw _Commutation_Time,X
3804  070a bf27          	ldw	_Commutation_Time,X
3806                     ; 2044 						ld A,_Previous_Zero_Cross_Time + 1
3809  070c b622          	ld	A,_Previous_Zero_Cross_Time+1
3811                     ; 2045 						ld XL,A
3814  070e 97            	ld	XL,A
3816                     ; 2046 						ld A,_BEMF_Rising_Factor
3819  070f b611          	ld	A,_BEMF_Rising_Factor
3821                     ; 2047 						mul X,A
3825                     ; 2048 						ld A,XH
3829                     ; 2049 						clrw X
3833                     ; 2050 						ld XL,A
3837                     ; 2051 						addw X,_Commutation_Time
3841                     ; 2052 						ldw _Commutation_Time,X
3845  0711               L5331:
3846  0711 42            	mul	X,A
3847  0712 9e            	ld	A,XH
3848  0713 5f            	clrw	X
3849  0714 97            	ld	XL,A
3850  0715 72bb0027      	addw	X,_Commutation_Time
3851  0719 bf27          	ldw	_Commutation_Time,X
3852                     ; 2056 				if( Zero_Sample_Count == 1 )
3854  071b be0f          	ldw	x,_Zero_Sample_Count
3855  071d 5a            	decw	x
3856  071e 2604          	jrne	L7331
3857                     ; 2059 					Commutation_Time >>= 1;
3859  0720 3427          	srl	_Commutation_Time
3860  0722 3628          	rrc	_Commutation_Time+1
3861  0724               L7331:
3862                     ; 2062 				hTim3Th = Commutation_Time;
3864  0724 be27          	ldw	x,_Commutation_Time
3865  0726 bf16          	ldw	_hTim3Th,x
3867  0728 2014          	jra	L1431
3868  072a               L1331:
3869                     ; 2068 					if( Zero_Cross_Count >= MINIMUM_CONSECTIVE_ZERO_CROSS )
3871  072a a10c          	cp	a,#12
3872  072c 2510          	jrult	L1431
3873                     ; 2070 						MTC_Status |= MTC_LAST_FORCED_STEP;
3875  072e 7216002a      	bset	_MTC_Status,#3
3876                     ; 2071 						Motor_Stall_Count = 0;
3878  0732 3f0c          	clr	_Motor_Stall_Count
3879                     ; 2072 						Commutation_Time = Average_Zero_Cross_Time;
3881  0734 be1f          	ldw	x,_Average_Zero_Cross_Time
3882  0736 bf27          	ldw	_Commutation_Time,x
3883                     ; 2074 						hTim3Th = Average_Zero_Cross_Time;
3885  0738 bf16          	ldw	_hTim3Th,x
3886                     ; 2077 						Previous_Zero_Cross_Time = Commutation_Time;
3888  073a bf21          	ldw	_Previous_Zero_Cross_Time,x
3889                     ; 2078 						Zero_Cross_Time = Commutation_Time;
3891  073c bf23          	ldw	_Zero_Cross_Time,x
3892  073e               L1431:
3893                     ; 2090 			Average_Zero_Cross_Time = (Previous_Zero_Cross_Time + Zero_Cross_Time) >> 1;
3895  073e be21          	ldw	x,_Previous_Zero_Cross_Time
3896  0740 72bb0023      	addw	x,_Zero_Cross_Time
3897  0744 54            	srlw	x
3898  0745 bf1f          	ldw	_Average_Zero_Cross_Time,x
3899                     ; 2091 			Previous_Zero_Cross_Time = Zero_Cross_Time;
3901  0747 be23          	ldw	x,_Zero_Cross_Time
3902  0749 bf21          	ldw	_Previous_Zero_Cross_Time,x
3903                     ; 2092 			Phase_State = PHASE_COMM; 
3905  074b 3f29          	clr	_Phase_State
3907  074d 2024          	jra	L5431
3908  074f               L7231:
3909                     ; 2098 			if( (MTC_Status & MTC_STEP_MODE) != MTC_STEP_MODE )
3911  074f 7200002a13    	btjt	_MTC_Status,#0,L7431
3912                     ; 2100 				if( Current_BEMF == BEMF_RISING )
3914  0754 b62c          	ld	a,_Current_BEMF
3915  0756 4a            	dec	a
3916  0757 260e          	jrne	L7431
3917                     ; 2102 					if( Motor_Stall_Count < MOTOR_STALL_THRESHOLD )
3919  0759 b60c          	ld	a,_Motor_Stall_Count
3920  075b a106          	cp	a,#6
3921  075d 2404          	jruge	L3531
3922                     ; 2104 						Motor_Stall_Count++;
3924  075f 3c0c          	inc	_Motor_Stall_Count
3926  0761 2004          	jra	L7431
3927  0763               L3531:
3928                     ; 2108 						MTC_Status |= MTC_MOTOR_STALLED;
3930  0763 7218002a      	bset	_MTC_Status,#4
3931  0767               L7431:
3932                     ; 2113 				C_D_DEBUG_PORT |= C_D_DEBUG_PIN;
3934  0767 7214500f      	bset	20495,#2
3935                     ; 2115 			Commutate_Motor();
3937  076b ad0b          	call	_Commutate_Motor
3939                     ; 2116 			Zero_Cross_Count=0;
3941  076d 3f19          	clr	_Zero_Cross_Count
3942                     ; 2118 				Phase_State = PHASE_DEMAG; 
3944  076f 35010029      	mov	_Phase_State,#1
3945  0773               L5431:
3946                     ; 2125 		Last_Zero_Cross_Count = Zero_Cross_Count;
3948  0773 451918        	mov	_Last_Zero_Cross_Count,_Zero_Cross_Count
3949                     ; 2126 		break;
3951  0776               L7031:
3952                     ; 2132 }
3955  0776 85            	popw	x
3956  0777 81            	ret	
4009                     ; 2135 	void Commutate_Motor( void )
4009                     ; 2136 	{
4010                     	switch	.text
4011  0778               _Commutate_Motor:
4013       00000002      OFST:	set	2
4016                     ; 2139 		cur_time = hTim3Cnt;
4018                     ; 2142 		TIM1->EGR |= BIT5;
4020  0778 721a5257      	bset	21079,#5
4021                     ; 2145 		TIM1->CCMR1 = tmp_TIM1_CCMR1;
4023  077c 5500045258    	mov	21080,_tmp_TIM1_CCMR1
4024                     ; 2146 		TIM1->CCMR2 = tmp_TIM1_CCMR2;
4026  0781 5500035259    	mov	21081,_tmp_TIM1_CCMR2
4027                     ; 2147 		TIM1->CCMR3 = tmp_TIM1_CCMR3;
4029  0786 550002525a    	mov	21082,_tmp_TIM1_CCMR3
4030                     ; 2148 		TIM1->CCER1 = tmp_TIM1_CCER1;
4032  078b 550001525c    	mov	21084,_tmp_TIM1_CCER1
4033                     ; 2149 		TIM1->CCER2 = tmp_TIM1_CCER2;
4035  0790 550000525d    	mov	21085,_tmp_TIM1_CCER2
4036                     ; 2152 		TIM1->EGR |= BIT5;
4038  0795 721a5257      	bset	21079,#5
4039  0799 89            	pushw	x
4040                     ; 2256 		Current_BEMF = BEMFSteps[Current_Step].BEMF_Level;
4042  079a b62d          	ld	a,_Current_Step
4043  079c 5f            	clrw	x
4044  079d 97            	ld	xl,a
4045  079e 58            	sllw	x
4046  079f 92d60d        	ld	a,([_BEMFSteps.w],x)
4047  07a2 b72c          	ld	_Current_BEMF,a
4048                     ; 2257 		Current_BEMF_Channel = BEMFSteps[Current_Step].ADC_Channel;
4050  07a4 72bb000d      	addw	x,_BEMFSteps
4051  07a8 e601          	ld	a,(1,x)
4052  07aa b72b          	ld	_Current_BEMF_Channel,a
4053                     ; 2259 		if (g_pBLDC_Struct->pBLDC_Var->bFastDemag == 0)
4055  07ac 92ce03        	ldw	x,[_g_pBLDC_Struct.w]
4056  07af e614          	ld	a,(20,x)
4057  07b1 2625          	jrne	L5731
4058                     ; 2262 			TIM1->CCMR1 = (u8)(PhaseSteps[Current_Step].CCMR_1 & 0x80);
4060  07b3 b62d          	ld	a,_Current_Step
4061  07b5 97            	ld	xl,a
4062  07b6 a605          	ld	a,#5
4063  07b8 42            	mul	x,a
4064  07b9 92d609        	ld	a,([_PhaseSteps.w],x)
4065  07bc a480          	and	a,#128
4066  07be c75258        	ld	21080,a
4067                     ; 2263 			TIM1->CCMR2 = (u8)(PhaseSteps[Current_Step].CCMR_2 & 0x80);
4069  07c1 72bb0009      	addw	x,_PhaseSteps
4070  07c5 e601          	ld	a,(1,x)
4071  07c7 a480          	and	a,#128
4072  07c9 c75259        	ld	21081,a
4073                     ; 2264 			TIM1->CCMR3 = (u8)(PhaseSteps[Current_Step].CCMR_3 & 0x80);
4075  07cc b62d          	ld	a,_Current_Step
4076  07ce 97            	ld	xl,a
4077  07cf a605          	ld	a,#5
4078  07d1 42            	mul	x,a
4079  07d2 72bb0009      	addw	x,_PhaseSteps
4081  07d6 2023          	jra	L7731
4082  07d8               L5731:
4083                     ; 2269 			TIM1->CCMR1 = (u8)(Fast_Demag_Steps[Current_Step].CCMR_1 & 0x80);
4085  07d8 b62d          	ld	a,_Current_Step
4086  07da 97            	ld	xl,a
4087  07db a605          	ld	a,#5
4088  07dd 42            	mul	x,a
4089  07de 92d60b        	ld	a,([_Fast_Demag_Steps.w],x)
4090  07e1 a480          	and	a,#128
4091  07e3 c75258        	ld	21080,a
4092                     ; 2270 			TIM1->CCMR2 = (u8)(Fast_Demag_Steps[Current_Step].CCMR_2 & 0x80);
4094  07e6 72bb000b      	addw	x,_Fast_Demag_Steps
4095  07ea e601          	ld	a,(1,x)
4096  07ec a480          	and	a,#128
4097  07ee c75259        	ld	21081,a
4098                     ; 2271 			TIM1->CCMR3 = (u8)(Fast_Demag_Steps[Current_Step].CCMR_3 & 0x80);
4100  07f1 b62d          	ld	a,_Current_Step
4101  07f3 97            	ld	xl,a
4102  07f4 a605          	ld	a,#5
4103  07f6 42            	mul	x,a
4104  07f7 72bb000b      	addw	x,_Fast_Demag_Steps
4105  07fb               L7731:
4106  07fb e602          	ld	a,(2,x)
4107  07fd a480          	and	a,#128
4108  07ff c7525a        	ld	21082,a
4109                     ; 2275 		TIM1->CCMR1 |= (u8)(PhaseSteps[Current_Step].CCMR_1 & 0x7F);
4111  0802 b62d          	ld	a,_Current_Step
4112  0804 97            	ld	xl,a
4113  0805 a605          	ld	a,#5
4114  0807 42            	mul	x,a
4115  0808 92d609        	ld	a,([_PhaseSteps.w],x)
4116  080b a47f          	and	a,#127
4117  080d ca5258        	or	a,21080
4118  0810 c75258        	ld	21080,a
4119                     ; 2276 		TIM1->CCMR2 |= (u8)(PhaseSteps[Current_Step].CCMR_2 & 0x7F);
4121  0813 72bb0009      	addw	x,_PhaseSteps
4122  0817 e601          	ld	a,(1,x)
4123  0819 a47f          	and	a,#127
4124  081b ca5259        	or	a,21081
4125  081e c75259        	ld	21081,a
4126                     ; 2277 		TIM1->CCMR3 |= (u8)(PhaseSteps[Current_Step].CCMR_3 & 0x7F);
4128  0821 b62d          	ld	a,_Current_Step
4129  0823 97            	ld	xl,a
4130  0824 a605          	ld	a,#5
4131  0826 42            	mul	x,a
4132  0827 72bb0009      	addw	x,_PhaseSteps
4133  082b e602          	ld	a,(2,x)
4134  082d a47f          	and	a,#127
4135  082f ca525a        	or	a,21082
4136  0832 c7525a        	ld	21082,a
4137                     ; 2278 		TIM1->CCER1 = PhaseSteps[Current_Step].CCER_1;
4139  0835 e603          	ld	a,(3,x)
4140  0837 c7525c        	ld	21084,a
4141                     ; 2279 		TIM1->CCER2 = PhaseSteps[Current_Step].CCER_2;
4143  083a e604          	ld	a,(4,x)
4144  083c c7525d        	ld	21085,a
4145                     ; 2282 		if( (MTC_Status & MTC_STEP_MODE) == MTC_STEP_MODE )
4147  083f 7201002a28    	btjf	_MTC_Status,#0,L1041
4148                     ; 2284 			if( (MTC_Status & MTC_LAST_FORCED_STEP) == MTC_LAST_FORCED_STEP )
4150  0844 7207002a08    	btjf	_MTC_Status,#3,L3041
4151                     ; 2286 				MTC_Status &= (u8)(~MTC_STEP_MODE);
4153  0849 7211002a      	bres	_MTC_Status,#0
4154                     ; 2288 					AUTO_SWITCH_PORT |= AUTO_SWITCH_PIN;
4156  084d 7210500f      	bset	20495,#0
4157  0851               L3041:
4158                     ; 2293 			tmp_u8 = BLDC_Get_Demag_Time();
4160  0851 cd0000        	call	_BLDC_Get_Demag_Time
4162  0854 b705          	ld	_tmp_u8,a
4163                     ; 2297 				ld A,_tmp_u8
4167                     ; 2298 				clrw x
4170  0856 5f            	clrw	x
4171  0857 b605          	ld	A,_tmp_u8
4173                     ; 2299 				ld XH,A
4176  0859 95            	ld	XH,A
4178                     ; 2300 				ld A,#0x64
4181  085a a664          	ld	A,#0x64
4183                     ; 2301 				div X,A
4186  085c 62            	div	X,A
4188                     ; 2303 				ld A,XL
4191  085d 9f            	ld	A,XL
4193                     ; 2304 				ld _tmp_u8,A
4196  085e b705          	ld	_tmp_u8,A
4198                     ; 2308 				ld A,_Commutation_Time
4201  0860 b627          	ld	A,_Commutation_Time
4203                     ; 2309 				ld XL,A
4206  0862 97            	ld	XL,A
4208                     ; 2310 				ld A,_tmp_u8
4211  0863 b605          	ld	A,_tmp_u8
4213                     ; 2311 				mul X,A
4216  0865 42            	mul	X,A
4218                     ; 2312 				ldw _tmp_u16,X
4221  0866 bf06          	ldw	_tmp_u16,X
4223                     ; 2313 				ld A,_Commutation_Time + 1
4226  0868 b628          	ld	A,_Commutation_Time+1
4228                     ; 2314 				ld XL,A
4232                     ; 2315 				ld A,_tmp_u8
4236                     ; 2316 				mul X,A
4240                     ; 2317 				ld A,XH
4244                     ; 2318 				clrw X
4248                     ; 2319 				ld XL,A
4252                     ; 2320 				addw X,_tmp_u16
4256                     ; 2321 				ldw _Demag_Time,X
4261  086a 2019          	jra	L5041
4262  086c               L1041:
4263                     ; 2327 			tmp_u8 = BLDC_Get_Demag_Time();
4265  086c cd0000        	call	_BLDC_Get_Demag_Time
4267  086f b705          	ld	_tmp_u8,a
4268                     ; 2331 				ld A,_tmp_u8
4272                     ; 2332 				clrw x
4275  0871 5f            	clrw	x
4276  0872 b605          	ld	A,_tmp_u8
4278                     ; 2333 				ld XH,A
4281  0874 95            	ld	XH,A
4283                     ; 2334 				ld A,#0x64
4286  0875 a664          	ld	A,#0x64
4288                     ; 2335 				div X,A
4291  0877 62            	div	X,A
4293                     ; 2337 				ld A,XL
4296  0878 9f            	ld	A,XL
4298                     ; 2338 				ld _tmp_u8,A
4301  0879 b705          	ld	_tmp_u8,A
4303                     ; 2342 				ld A,_Average_Zero_Cross_Time
4306  087b b61f          	ld	A,_Average_Zero_Cross_Time
4308                     ; 2343 				ld XL,A
4311  087d 97            	ld	XL,A
4313                     ; 2344 				ld A,_tmp_u8
4316  087e b605          	ld	A,_tmp_u8
4318                     ; 2345 				mul X,A
4321  0880 42            	mul	X,A
4323                     ; 2346 				ldw _tmp_u16,X
4326  0881 bf06          	ldw	_tmp_u16,X
4328                     ; 2347 				ld A,_Average_Zero_Cross_Time + 1
4331  0883 b620          	ld	A,_Average_Zero_Cross_Time+1
4333                     ; 2348 				ld XL,A
4337                     ; 2349 				ld A,_tmp_u8
4341                     ; 2350 				mul X,A
4345                     ; 2351 				ld A,XH
4349                     ; 2352 				clrw X
4353                     ; 2353 				ld XL,A
4357                     ; 2354 				addw X,_tmp_u16
4361                     ; 2355 				ldw _Demag_Time,X
4365  0885               L5041:
4366  0885 97            	ld	XL,A
4367  0886 b605          	ld	A,_tmp_u8
4368  0888 42            	mul	X,A
4369  0889 9e            	ld	A,XH
4370  088a 5f            	clrw	X
4371  088b 97            	ld	XL,A
4372  088c 72bb0006      	addw	X,_tmp_u16
4373  0890 bf25          	ldw	_Demag_Time,X
4374                     ; 2359 		LastSwitchedCom = hTim3Cnt;
4376  0892 be14          	ldw	x,_hTim3Cnt
4377  0894 bf1d          	ldw	_LastSwitchedCom,x
4378                     ; 2360 		hTim3Th = hTim3Cnt + Demag_Time;
4380  0896 72bb0025      	addw	x,_Demag_Time
4381  089a bf16          	ldw	_hTim3Th,x
4382                     ; 2361 }
4385  089c 85            	popw	x
4386  089d 81            	ret	
4411                     ; 2433 void StopMotor( void )
4411                     ; 2434 {	
4412                     	switch	.text
4413  089e               _StopMotor:
4417                     ; 2436 	TIM1->IER &= (u8)(~BIT0);
4419  089e 72115254      	bres	21076,#0
4420                     ; 2443 	TIM1->CCMR1 = CCMR_PWM;
4422  08a2 35685258      	mov	21080,#104
4423                     ; 2444 	TIM1->CCMR2 = CCMR_PWM;
4425  08a6 35685259      	mov	21081,#104
4426                     ; 2445 	TIM1->CCMR3 = CCMR_PWM;
4428  08aa 3568525a      	mov	21082,#104
4429                     ; 2446 	TIM1->CCER1 = (A_OFF|B_OFF);
4431  08ae 725f525c      	clr	21084
4432                     ; 2447 	TIM1->CCER2 = C_OFF;
4434  08b2 3510525d      	mov	21085,#16
4435                     ; 2448 	TIM1->EGR |= BIT5;
4437  08b6 721a5257      	bset	21079,#5
4438                     ; 2454 	Enable_ADC_User_Sync_Sampling();
4440  08ba cd02b8        	call	_Enable_ADC_User_Sync_Sampling
4442                     ; 2455 	Motor_Frequency = 0;
4444  08bd 5f            	clrw	x
4445  08be bf0d          	ldw	_Motor_Frequency,x
4446                     ; 2456 }
4449  08c0 81            	ret	
4484                     ; 2458 void BrakeMotor( void )
4484                     ; 2459 {
4485                     	switch	.text
4486  08c1               _BrakeMotor:
4488       00000002      OFST:	set	2
4491                     ; 2461 	brake_pwm_cnt = (u16)(((u32)hArrPwmVal * BRAKE_DUTY) / 100);
4493                     ; 2462 	ToCMPxH( TIM1->CCR1H, brake_pwm_cnt );
4495  08c1 35035265      	mov	21093,#3
4496                     ; 2463 	ToCMPxL( TIM1->CCR1L, brake_pwm_cnt );
4498  08c5 35785266      	mov	21094,#120
4499                     ; 2464 	ToCMPxH( TIM1->CCR2H, brake_pwm_cnt );
4501  08c9 35035267      	mov	21095,#3
4502                     ; 2465 	ToCMPxL( TIM1->CCR2L, brake_pwm_cnt );
4504  08cd 35785268      	mov	21096,#120
4505                     ; 2466 	ToCMPxH( TIM1->CCR3H, brake_pwm_cnt );
4507  08d1 35035269      	mov	21097,#3
4508                     ; 2467 	ToCMPxL( TIM1->CCR3L, brake_pwm_cnt );
4510  08d5 3578526a      	mov	21098,#120
4511                     ; 2470 	TIM1->IER &= (u8)(~BIT0);
4513  08d9 72115254      	bres	21076,#0
4514                     ; 2472 	TIM1->CCMR1 = CCMR_PWM;
4516  08dd 35685258      	mov	21080,#104
4517                     ; 2473 	TIM1->CCMR2 = CCMR_LOWSIDE;
4519  08e1 35485259      	mov	21081,#72
4520                     ; 2474 	TIM1->CCMR3 = CCMR_LOWSIDE;
4522  08e5 3548525a      	mov	21082,#72
4523                     ; 2475 	TIM1->CCER1 = (A_ON|B_COMP);
4525  08e9 3551525c      	mov	21084,#81
4526                     ; 2476 	TIM1->CCER2 = C_COMP;
4528  08ed 3515525d      	mov	21085,#21
4529                     ; 2478 	TIM1->EGR |= BIT5;
4531  08f1 721a5257      	bset	21079,#5
4532                     ; 2483 }
4535  08f5 81            	ret	
4559                     ; 2485 u8 BootStrap(void)
4559                     ; 2486 {
4560                     	switch	.text
4561  08f6               _BootStrap:
4565                     ; 2487 	TIM1->CCMR1 = CCMR_LOWSIDE;
4567  08f6 35485258      	mov	21080,#72
4568                     ; 2488 	TIM1->CCMR2 = CCMR_LOWSIDE;
4570  08fa 35485259      	mov	21081,#72
4571                     ; 2489 	TIM1->CCMR3 = CCMR_LOWSIDE;
4573  08fe 3548525a      	mov	21082,#72
4574                     ; 2490 	TIM1->CCER1 = (A_COMP|B_COMP);
4576  0902 3555525c      	mov	21084,#85
4577                     ; 2491 	TIM1->CCER2 = C_COMP;
4579  0906 3515525d      	mov	21085,#21
4580                     ; 2493 	TIM1->EGR |= BIT5;
4582  090a 721a5257      	bset	21079,#5
4583                     ; 2496 	TIM1->BKR |= BIT7;
4585                     ; 2502 	return (vtimer_TimerElapsed(MTC_ALIGN_RAMP_TIMER));
4587  090e a606          	ld	a,#6
4588  0910 721e526d      	bset	21101,#7
4592  0914 cc0000        	jp	_vtimer_TimerElapsed
4655                     ; 2505 u8 AlignRotor( void )
4655                     ; 2506 {
4656                     	switch	.text
4657  0917               _AlignRotor:
4659  0917 5207          	subw	sp,#7
4660       00000007      OFST:	set	7
4663                     ; 2511 	status = 0;
4665  0919 0f01          	clr	(OFST-6,sp)
4666                     ; 2512 	switch( Align_State )
4668  091b b615          	ld	a,_Align_State
4670                     ; 2589 		break;
4671  091d 270c          	jreq	L5441
4672  091f 4a            	dec	a
4673  0920 2603cc09aa    	jreq	L7441
4674  0925 4a            	dec	a
4675  0926 2603cc0a1f    	jreq	L1541
4676  092b               L5441:
4677                     ; 2514 	default:
4677                     ; 2515 	case ALIGN_IDLE:
4677                     ; 2516 		TIM1->CCMR1 = CCMR_PWM;
4679  092b 35685258      	mov	21080,#104
4680                     ; 2517 		TIM1->CCMR2 = CCMR_LOWSIDE;
4682  092f 35485259      	mov	21081,#72
4683                     ; 2518 		TIM1->CCMR3 = CCMR_LOWSIDE;
4685  0933 3548525a      	mov	21082,#72
4686                     ; 2519 		TIM1->CCER1 = (A_ON|B_COMP);
4688  0937 3551525c      	mov	21084,#81
4689                     ; 2520 		TIM1->CCER2 = C_COMP;
4691  093b 3515525d      	mov	21085,#21
4692                     ; 2522 		ToCMPxH( TIM1->CCR1H, 0 );
4694  093f 725f5265      	clr	21093
4695                     ; 2523 		ToCMPxL( TIM1->CCR1L, 0 );
4697  0943 725f5266      	clr	21094
4698                     ; 2524 		ToCMPxH( TIM1->CCR2H, 0 );
4700  0947 725f5267      	clr	21095
4701                     ; 2525 		ToCMPxL( TIM1->CCR2L, 0 );
4703  094b 725f5268      	clr	21096
4704                     ; 2526 		ToCMPxH( TIM1->CCR3H, 0 );
4706  094f 725f5269      	clr	21097
4707                     ; 2527 		ToCMPxL( TIM1->CCR3L, 0 );
4709  0953 725f526a      	clr	21098
4710                     ; 2529 		Align_Target = ALIGN_DUTY_CYCLE;
4712  0957 354b0014      	mov	_Align_Target,#75
4713                     ; 2530 		Align_Index = 0;
4715  095b 3f13          	clr	_Align_Index
4716                     ; 2532 		vtimer_SetTimer(MTC_ALIGN_RAMP_TIMER,ALIGN_SLOPE,0);
4718  095d 5f            	clrw	x
4719  095e 89            	pushw	x
4720  095f ae0004        	ldw	x,#4
4721  0962 89            	pushw	x
4722  0963 a606          	ld	a,#6
4723  0965 cd0000        	call	_vtimer_SetTimer
4725  0968 5b04          	addw	sp,#4
4726                     ; 2533 		vtimer_SetTimer(MTC_ALIGN_TIMER,ALIGN_DURATION,0);
4728  096a 5f            	clrw	x
4729  096b 89            	pushw	x
4730  096c ae012c        	ldw	x,#300
4731  096f 89            	pushw	x
4732  0970 a607          	ld	a,#7
4733  0972 cd0000        	call	_vtimer_SetTimer
4735  0975 5b04          	addw	sp,#4
4736                     ; 2536 		TIM1->EGR |= BIT5;
4738  0977 721a5257      	bset	21079,#5
4739                     ; 2543 		Current_Step=0;
4741  097b 3f2d          	clr	_Current_Step
4742                     ; 2544 		TIM1->CCMR1 = PhaseSteps[Current_Step].CCMR_1;
4744  097d be09          	ldw	x,_PhaseSteps
4745  097f f6            	ld	a,(x)
4746  0980 c75258        	ld	21080,a
4747                     ; 2545 		TIM1->CCMR2 = PhaseSteps[Current_Step].CCMR_2;
4749  0983 e601          	ld	a,(1,x)
4750  0985 c75259        	ld	21081,a
4751                     ; 2546 		TIM1->CCMR3 = PhaseSteps[Current_Step].CCMR_3;
4753  0988 e602          	ld	a,(2,x)
4754  098a c7525a        	ld	21082,a
4755                     ; 2547 		TIM1->CCER1 = PhaseSteps[Current_Step].CCER_1;
4757  098d e603          	ld	a,(3,x)
4758  098f c7525c        	ld	21084,a
4759                     ; 2548 		TIM1->CCER2 = PhaseSteps[Current_Step].CCER_2;
4761  0992 e604          	ld	a,(4,x)
4762  0994 c7525d        	ld	21085,a
4763                     ; 2550 		BEMF_Falling_Factor = BEMF_FALL_DELAY_FACTOR;
4765  0997 35800012      	mov	_BEMF_Falling_Factor,#128
4766                     ; 2551 		BEMF_Rising_Factor = BEMF_RISE_DELAY_FACTOR;
4768  099b 35800011      	mov	_BEMF_Rising_Factor,#128
4769                     ; 2553 		TIM1->DTR = (u8)(hCntDeadDtime);
4771  099f 55002f526e    	mov	21102,_hCntDeadDtime+1
4772                     ; 2555 		Align_State = ALIGN_RAMP;
4774  09a4 35010015      	mov	_Align_State,#1
4775                     ; 2556 		break;
4777  09a8 2078          	jra	L3051
4778  09aa               L7441:
4779                     ; 2558 	case ALIGN_RAMP:
4779                     ; 2559 		if (vtimer_TimerElapsed(MTC_ALIGN_RAMP_TIMER))
4781  09aa a606          	ld	a,#6
4782  09ac cd0000        	call	_vtimer_TimerElapsed
4784  09af 4d            	tnz	a
4785  09b0 275d          	jreq	L5051
4786                     ; 2561 			if( Align_Index < Align_Target )
4788  09b2 b613          	ld	a,_Align_Index
4789  09b4 b114          	cp	a,_Align_Target
4790  09b6 244a          	jruge	L7051
4791                     ; 2563 				Align_Index += 1;
4793  09b8 3c13          	inc	_Align_Index
4794                     ; 2564 				temp32 = ((u32)Align_Index * (u16)hArrPwmVal);
4796  09ba 5f            	clrw	x
4797  09bb b613          	ld	a,_Align_Index
4798  09bd 97            	ld	xl,a
4799  09be 90ae0378      	ldw	y,#888
4800  09c2 cd0000        	call	c_umul
4802  09c5 96            	ldw	x,sp
4803  09c6 1c0002        	addw	x,#OFST-5
4804  09c9 cd0000        	call	c_rtol
4806                     ; 2565 				temp32 = temp32/(u16)100;
4808  09cc 96            	ldw	x,sp
4809  09cd 1c0002        	addw	x,#OFST-5
4810  09d0 cd0000        	call	c_ltor
4812  09d3 ae012c        	ldw	x,#L631
4813  09d6 cd0000        	call	c_ludv
4815  09d9 96            	ldw	x,sp
4816  09da 1c0002        	addw	x,#OFST-5
4817  09dd cd0000        	call	c_rtol
4819                     ; 2566 				temp = (u16)temp32;
4821  09e0 1e04          	ldw	x,(OFST-3,sp)
4822  09e2 1f06          	ldw	(OFST-1,sp),x
4823                     ; 2568 				ToCMPxH( TIM1->CCR1H, temp );
4825  09e4 7b06          	ld	a,(OFST-1,sp)
4826  09e6 c75265        	ld	21093,a
4827                     ; 2569 				ToCMPxL( TIM1->CCR1L, temp );
4829  09e9 7b07          	ld	a,(OFST+0,sp)
4830  09eb c75266        	ld	21094,a
4831                     ; 2571 				ToCMPxH( TIM1->CCR2H, temp );
4833  09ee 7b06          	ld	a,(OFST-1,sp)
4834  09f0 c75267        	ld	21095,a
4835                     ; 2572 				ToCMPxL( TIM1->CCR2L, temp );
4837  09f3 7b07          	ld	a,(OFST+0,sp)
4838  09f5 c75268        	ld	21096,a
4839                     ; 2574 				ToCMPxH( TIM1->CCR3H, temp );
4841  09f8 7b06          	ld	a,(OFST-1,sp)
4842  09fa c75269        	ld	21097,a
4843                     ; 2575 				ToCMPxL( TIM1->CCR3L, temp );
4845  09fd 7b07          	ld	a,(OFST+0,sp)
4846  09ff c7526a        	ld	21098,a
4847  0a02               L7051:
4848                     ; 2577 			vtimer_SetTimer(MTC_ALIGN_RAMP_TIMER,ALIGN_SLOPE,0);
4850  0a02 5f            	clrw	x
4851  0a03 89            	pushw	x
4852  0a04 ae0004        	ldw	x,#4
4853  0a07 89            	pushw	x
4854  0a08 a606          	ld	a,#6
4855  0a0a cd0000        	call	_vtimer_SetTimer
4857  0a0d 5b04          	addw	sp,#4
4858  0a0f               L5051:
4859                     ; 2580 		if (vtimer_TimerElapsed(MTC_ALIGN_TIMER))
4861  0a0f a607          	ld	a,#7
4862  0a11 cd0000        	call	_vtimer_TimerElapsed
4864  0a14 4d            	tnz	a
4865  0a15 270b          	jreq	L3051
4866                     ; 2582 			Align_State = ALIGN_DONE;
4868  0a17 35020015      	mov	_Align_State,#2
4869                     ; 2583 			status = 1;
4871  0a1b a601          	ld	a,#1
4872  0a1d 2001          	jp	LC002
4873  0a1f               L1541:
4874                     ; 2587 	case ALIGN_DONE:
4874                     ; 2588 		status = 1;
4876  0a1f 4c            	inc	a
4877  0a20               LC002:
4878  0a20 6b01          	ld	(OFST-6,sp),a
4879                     ; 2589 		break;
4881  0a22               L3051:
4882                     ; 2591 	return( status );
4884  0a22 7b01          	ld	a,(OFST-6,sp)
4887  0a24 5b07          	addw	sp,#7
4888  0a26 81            	ret	
4949                     ; 2594 void StartMotor( void )
4949                     ; 2595 {
4950                     	switch	.text
4951  0a27               _StartMotor:
4953  0a27 5206          	subw	sp,#6
4954       00000006      OFST:	set	6
4957                     ; 2600 	Zero_Cross_Count=0;
4959  0a29 3f19          	clr	_Zero_Cross_Count
4960                     ; 2601 	Last_Zero_Cross_Count=0;
4962  0a2b 3f18          	clr	_Last_Zero_Cross_Count
4963                     ; 2602 	Ramp_Step=0;
4965  0a2d 3f1a          	clr	_Ramp_Step
4966                     ; 2603 	Commutation_Time = RAMP_TABLE[ Ramp_Step ];
4968  0a2f ae05be        	ldw	x,#1470
4969  0a32 bf27          	ldw	_Commutation_Time,x
4970                     ; 2604 	Ramp_Step++;
4972  0a34 3c1a          	inc	_Ramp_Step
4973                     ; 2607 	TIM1->EGR |= BIT5;
4975  0a36 721a5257      	bset	21079,#5
4976                     ; 2613 	Current_BEMF = BEMFSteps[Current_Step].BEMF_Level;
4978  0a3a 5f            	clrw	x
4979  0a3b b62d          	ld	a,_Current_Step
4980  0a3d 97            	ld	xl,a
4981  0a3e 58            	sllw	x
4982  0a3f 92d60d        	ld	a,([_BEMFSteps.w],x)
4983  0a42 b72c          	ld	_Current_BEMF,a
4984                     ; 2614 	Current_BEMF_Channel = BEMFSteps[Current_Step].ADC_Channel;
4986  0a44 72bb000d      	addw	x,_BEMFSteps
4987  0a48 e601          	ld	a,(1,x)
4988  0a4a b72b          	ld	_Current_BEMF_Channel,a
4989                     ; 2617 	Current_Step++;
4991  0a4c 3c2d          	inc	_Current_Step
4992                     ; 2618 	if( Current_Step >= NUMBER_PHASE_STEPS )
4994  0a4e b62d          	ld	a,_Current_Step
4995  0a50 a106          	cp	a,#6
4996  0a52 2503          	jrult	L5351
4997                     ; 2620 		Current_Step = 0;
4999  0a54 4f            	clr	a
5000  0a55 b72d          	ld	_Current_Step,a
5001  0a57               L5351:
5002                     ; 2622 	TIM1->CCMR1 = PhaseSteps[Current_Step].CCMR_1;
5004  0a57 97            	ld	xl,a
5005  0a58 a605          	ld	a,#5
5006  0a5a 42            	mul	x,a
5007  0a5b 92d609        	ld	a,([_PhaseSteps.w],x)
5008  0a5e c75258        	ld	21080,a
5009                     ; 2623 	TIM1->CCMR2 = PhaseSteps[Current_Step].CCMR_2;
5011  0a61 72bb0009      	addw	x,_PhaseSteps
5012  0a65 e601          	ld	a,(1,x)
5013  0a67 c75259        	ld	21081,a
5014                     ; 2624 	TIM1->CCMR3 = PhaseSteps[Current_Step].CCMR_3;
5016  0a6a b62d          	ld	a,_Current_Step
5017  0a6c 97            	ld	xl,a
5018  0a6d a605          	ld	a,#5
5019  0a6f 42            	mul	x,a
5020  0a70 72bb0009      	addw	x,_PhaseSteps
5021  0a74 e602          	ld	a,(2,x)
5022  0a76 c7525a        	ld	21082,a
5023                     ; 2625 	tmp_TIM1_CCER1 = PhaseSteps[Current_Step].CCER_1;
5025  0a79 e603          	ld	a,(3,x)
5026  0a7b b701          	ld	_tmp_TIM1_CCER1,a
5027                     ; 2626 	tmp_TIM1_CCER2 = PhaseSteps[Current_Step].CCER_2;
5029  0a7d e604          	ld	a,(4,x)
5030  0a7f b700          	ld	_tmp_TIM1_CCER2,a
5031                     ; 2629 	tmp_TIM1_CCMR1 = TIM1->CCMR1;
5033  0a81 5552580004    	mov	_tmp_TIM1_CCMR1,21080
5034                     ; 2630 	tmp_TIM1_CCMR2 = TIM1->CCMR2;
5036  0a86 5552590003    	mov	_tmp_TIM1_CCMR2,21081
5037                     ; 2631 	tmp_TIM1_CCMR3 = TIM1->CCMR3;
5039  0a8b 55525a0002    	mov	_tmp_TIM1_CCMR3,21082
5040                     ; 2634 	TIM1->CCMR1 &= 0x8F;
5042  0a90 c65258        	ld	a,21080
5043  0a93 a48f          	and	a,#143
5044  0a95 c75258        	ld	21080,a
5045                     ; 2635 	TIM1->CCMR2 &= 0x8F;
5047  0a98 c65259        	ld	a,21081
5048  0a9b a48f          	and	a,#143
5049  0a9d c75259        	ld	21081,a
5050                     ; 2636 	TIM1->CCMR3 &= 0x8F;
5052  0aa0 c6525a        	ld	a,21082
5053  0aa3 a48f          	and	a,#143
5054  0aa5 c7525a        	ld	21082,a
5055                     ; 2639 	hTim3Th = Commutation_Time;
5057  0aa8 be27          	ldw	x,_Commutation_Time
5058  0aaa bf16          	ldw	_hTim3Th,x
5059                     ; 2641 	data = ((u32)RAMP_DUTY_CYCLE * (u16)hArrPwmVal);
5061                     ; 2642 	data = data / (u16)100;
5063                     ; 2643 	temp = (u16)data;
5065                     ; 2646 	ToCMPxH( TIM1->CCR1H, temp );
5067  0aac 35025265      	mov	21093,#2
5068                     ; 2647 	ToCMPxL( TIM1->CCR1L, temp );
5070  0ab0 359a5266      	mov	21094,#154
5071                     ; 2649 	ToCMPxH( TIM1->CCR2H, temp );
5073  0ab4 35025267      	mov	21095,#2
5074                     ; 2650 	ToCMPxL( TIM1->CCR2L, temp );
5076  0ab8 359a5268      	mov	21096,#154
5077                     ; 2652 	ToCMPxH( TIM1->CCR3H, temp );
5079  0abc 35025269      	mov	21097,#2
5080                     ; 2653 	ToCMPxL( TIM1->CCR3L, temp );
5082  0ac0 359a526a      	mov	21098,#154
5083                     ; 2657 	ToCMPxH( TIM2->CCR2H, MILLIAMP_TOCNT (STARTUP_CURRENT_LIMITATION) );
5085  0ac4 725f5311      	clr	21265
5086                     ; 2658 	ToCMPxL( TIM2->CCR2L, MILLIAMP_TOCNT (STARTUP_CURRENT_LIMITATION) );
5088  0ac8 356e5312      	mov	21266,#110
5089                     ; 2665 	Phase_State = PHASE_ZERO; 
5091  0acc 35020029      	mov	_Phase_State,#2
5092                     ; 2666 }
5095  0ad0 5b06          	addw	sp,#6
5096  0ad2 81            	ret	
5146                     ; 2676 u16 Set_Duty(u16 duty)
5146                     ; 2677 {
5147                     	switch	.text
5148  0ad3               _Set_Duty:
5150  0ad3 89            	pushw	x
5151  0ad4 89            	pushw	x
5152       00000002      OFST:	set	2
5155                     ; 2681 	DelayCoefAdjust();
5157  0ad5 cd0c35        	call	_DelayCoefAdjust
5159                     ; 2683 	if( Z_Detection_Type == Z_DETECT_PWM_OFF )
5161  0ad8 b616          	ld	a,_Z_Detection_Type
5162  0ada 2613          	jrne	L1651
5163                     ; 2685 		if (duty > hMaxDutyCnt)
5165  0adc 1e03          	ldw	x,(OFST+1,sp)
5166  0ade a302e1        	cpw	x,#737
5167  0ae1 2505          	jrult	L3651
5168                     ; 2687 			duty = hMaxDutyCnt;   
5170  0ae3 ae02e0        	ldw	x,#736
5171  0ae6 1f03          	ldw	(OFST+1,sp),x
5172  0ae8               L3651:
5173                     ; 2691 		TIM1->DTR = (u8)(hCntDeadDtime); 
5175  0ae8 55002f526e    	mov	21102,_hCntDeadDtime+1
5177  0aed 202f          	jra	L5651
5178  0aef               L1651:
5179                     ; 2696 		time = hArrPwmVal - duty;
5181  0aef ae0378        	ldw	x,#888
5182  0af2 72f003        	subw	x,(OFST+1,sp)
5183  0af5 1f01          	ldw	(OFST-1,sp),x
5184                     ; 2697 		if( time >= hCntDeadDtime )
5186  0af7 b32e          	cpw	x,_hCntDeadDtime
5187  0af9 2507          	jrult	L7651
5188                     ; 2699 			TIM1->DTR = (u8)(hCntDeadDtime); 
5190  0afb 55002f526e    	mov	21102,_hCntDeadDtime+1
5192  0b00 2010          	jra	L1751
5193  0b02               L7651:
5194                     ; 2703 			if( time <= 16 )
5196  0b02 a30011        	cpw	x,#17
5197  0b05 2406          	jruge	L3751
5198                     ; 2706 				TIM1->DTR = 0;
5200  0b07 725f526e      	clr	21102
5202  0b0b 2005          	jra	L1751
5203  0b0d               L3751:
5204                     ; 2710 				TIM1->DTR = (u8)time; 
5206  0b0d 7b02          	ld	a,(OFST+0,sp)
5207  0b0f c7526e        	ld	21102,a
5208  0b12               L1751:
5209                     ; 2714 		if( duty > hArrPwmVal )
5211  0b12 1e03          	ldw	x,(OFST+1,sp)
5212  0b14 a30379        	cpw	x,#889
5213  0b17 2505          	jrult	L5651
5214                     ; 2717 			duty = hArrPwmVal;
5216  0b19 ae0378        	ldw	x,#888
5217  0b1c 1f03          	ldw	(OFST+1,sp),x
5218  0b1e               L5651:
5219                     ; 2721 	ToCMPxH( TIM1->CCR1H, duty );
5221  0b1e 7b03          	ld	a,(OFST+1,sp)
5222  0b20 c75265        	ld	21093,a
5223                     ; 2722 	ToCMPxL( TIM1->CCR1L, duty );
5225  0b23 7b04          	ld	a,(OFST+2,sp)
5226  0b25 c75266        	ld	21094,a
5227                     ; 2724 	ToCMPxH( TIM1->CCR2H, duty );
5229  0b28 7b03          	ld	a,(OFST+1,sp)
5230  0b2a c75267        	ld	21095,a
5231                     ; 2725 	ToCMPxL( TIM1->CCR2L, duty );
5233  0b2d 7b04          	ld	a,(OFST+2,sp)
5234  0b2f c75268        	ld	21096,a
5235                     ; 2727 	ToCMPxH( TIM1->CCR3H, duty );
5237  0b32 7b03          	ld	a,(OFST+1,sp)
5238  0b34 c75269        	ld	21097,a
5239                     ; 2728 	ToCMPxL( TIM1->CCR3L, duty );
5241  0b37 7b04          	ld	a,(OFST+2,sp)
5242  0b39 c7526a        	ld	21098,a
5243                     ; 2732 		ToCMPxH( TIM2->CCR2H, CurrentLimitCnt );
5245  0b3c 55001b5311    	mov	21265,_CurrentLimitCnt
5246                     ; 2733 		ToCMPxL( TIM2->CCR2L, CurrentLimitCnt );
5248  0b41 55001c5312    	mov	21266,_CurrentLimitCnt+1
5249                     ; 2740 	*pDutyCycleCounts_reg = duty;
5251  0b46 92cf08        	ldw	[L71_pDutyCycleCounts_reg.w],x
5252                     ; 2741 	return duty;
5256  0b49 5b04          	addw	sp,#4
5257  0b4b 81            	ret	
5315                     ; 2752 u16 Set_Current(u16 current)
5315                     ; 2753 {
5316                     	switch	.text
5317  0b4c               _Set_Current:
5319  0b4c 89            	pushw	x
5320  0b4d 5204          	subw	sp,#4
5321       00000004      OFST:	set	4
5324                     ; 2758 	DelayCoefAdjust();
5326  0b4f cd0c35        	call	_DelayCoefAdjust
5328                     ; 2761 	temp = hArrPwmVal;
5330  0b52 ae0378        	ldw	x,#888
5331  0b55 1f03          	ldw	(OFST-1,sp),x
5332                     ; 2763 	if( Z_Detection_Type == Z_DETECT_PWM_OFF )
5334  0b57 b616          	ld	a,_Z_Detection_Type
5335  0b59 2607          	jrne	L7261
5336                     ; 2768 			temp = hMaxDutyCnt;   
5338  0b5b ae02e0        	ldw	x,#736
5339  0b5e 1f03          	ldw	(OFST-1,sp),x
5340                     ; 2772 		TIM1->DTR = (u8)(hCntDeadDtime); 
5342  0b60 2004          	jp	LC003
5343  0b62               L7261:
5344                     ; 2777 		time = hArrPwmVal - temp;
5346                     ; 2778 		if( time >= hCntDeadDtime )
5348  0b62 be2e          	ldw	x,_hCntDeadDtime
5349  0b64 2607          	jrne	L3361
5350                     ; 2780 			TIM1->DTR = (u8)(hCntDeadDtime);
5352  0b66               LC003:
5354  0b66 55002f526e    	mov	21102,_hCntDeadDtime+1
5356  0b6b 2004          	jra	L1361
5357  0b6d               L3361:
5358                     ; 2787 				TIM1->DTR = 0;
5360  0b6d 725f526e      	clr	21102
5361  0b71               L1361:
5362                     ; 2796 	ToCMPxH( TIM1->CCR1H, temp );
5364  0b71 7b03          	ld	a,(OFST-1,sp)
5365  0b73 c75265        	ld	21093,a
5366                     ; 2797 	ToCMPxL( TIM1->CCR1L, temp );
5368  0b76 7b04          	ld	a,(OFST+0,sp)
5369  0b78 c75266        	ld	21094,a
5370                     ; 2799 	ToCMPxH( TIM1->CCR2H, temp );
5372  0b7b 7b03          	ld	a,(OFST-1,sp)
5373  0b7d c75267        	ld	21095,a
5374                     ; 2800 	ToCMPxL( TIM1->CCR2L, temp );
5376  0b80 7b04          	ld	a,(OFST+0,sp)
5377  0b82 c75268        	ld	21096,a
5378                     ; 2802 	ToCMPxH( TIM1->CCR3H, temp );
5380  0b85 7b03          	ld	a,(OFST-1,sp)
5381  0b87 c75269        	ld	21097,a
5382                     ; 2803 	ToCMPxL( TIM1->CCR3L, temp );
5384  0b8a 7b04          	ld	a,(OFST+0,sp)
5385  0b8c c7526a        	ld	21098,a
5386                     ; 2805 	temp = current;
5388  0b8f 1e05          	ldw	x,(OFST+1,sp)
5389  0b91 1f03          	ldw	(OFST-1,sp),x
5390                     ; 2808 	current = (u16)(MILLIAMP_TOCNT (current));
5392  0b93 a60a          	ld	a,#10
5393  0b95 cd0000        	call	c_cmulx
5395  0b98 ae0114        	ldw	x,#L01
5396  0b9b cd0000        	call	c_ludv
5398  0b9e ae0118        	ldw	x,#L21
5399  0ba1 cd0000        	call	c_lmul
5401  0ba4 ae011c        	ldw	x,#L41
5402  0ba7 cd0000        	call	c_ludv
5404  0baa be02          	ldw	x,c_lreg+2
5405                     ; 2810 	if (current > CurrentLimitCnt)
5407  0bac b31b          	cpw	x,_CurrentLimitCnt
5408  0bae 2302          	jrule	L7361
5409                     ; 2811 		current = CurrentLimitCnt;
5411  0bb0 be1b          	ldw	x,_CurrentLimitCnt
5412  0bb2               L7361:
5413  0bb2 1f05          	ldw	(OFST+1,sp),x
5414                     ; 2815 		ToCMPxH( TIM2->CCR2H, current );
5416  0bb4 7b05          	ld	a,(OFST+1,sp)
5417  0bb6 c75311        	ld	21265,a
5418                     ; 2816 		ToCMPxL( TIM2->CCR2L, current );
5420  0bb9 7b06          	ld	a,(OFST+2,sp)
5421  0bbb c75312        	ld	21266,a
5422                     ; 2823 	return temp;
5424  0bbe 1e03          	ldw	x,(OFST-1,sp)
5427  0bc0 5b06          	addw	sp,#6
5428  0bc2 81            	ret	
5457                     ; 2826 void SetSamplingPoint_BEMF(void)
5457                     ; 2827 {
5458                     	switch	.text
5459  0bc3               _SetSamplingPoint_BEMF:
5463                     ; 2829 		if( *pDutyCycleCounts_reg  < hDutyCntTh )
5465  0bc3 90be08        	ldw	y,L71_pDutyCycleCounts_reg
5466  0bc6 90fe          	ldw	y,(y)
5467  0bc8 90b330        	cpw	y,_hDutyCntTh
5468  0bcb 2417          	jruge	L1561
5469                     ; 2833 				PWM_ON_SW_PORT &= (u8)(~PWM_ON_SW_PIN);
5471  0bcd 72115014      	bres	20500,#0
5472                     ; 2836 			Z_Detection_Type = Z_DETECT_PWM_OFF;
5474  0bd1 3f16          	clr	_Z_Detection_Type
5475                     ; 2838 			MCI_CONTROL_DDR &= (u8)(~MCI_CONTROL_PINS);
5477  0bd3 c65002        	ld	a,20482
5478  0bd6 a48f          	and	a,#143
5479  0bd8 c75002        	ld	20482,a
5480                     ; 2841 			ToCMPxH( TIM1->CCR4H, (hArrPwmVal-SAMPLING_POINT_DURING_TOFF_CNT) );
5482  0bdb 3503526b      	mov	21099,#3
5483                     ; 2842 			ToCMPxL( TIM1->CCR4L, (hArrPwmVal-SAMPLING_POINT_DURING_TOFF_CNT) );
5485  0bdf 3560526c      	mov	21100,#96
5488  0be3 81            	ret	
5489  0be4               L1561:
5490                     ; 2848 				PWM_ON_SW_PORT |= PWM_ON_SW_PIN;
5492  0be4 72105014      	bset	20500,#0
5493                     ; 2850 			Z_Detection_Type = Z_DETECT_PWM_ON;
5495  0be8 35010016      	mov	_Z_Detection_Type,#1
5496                     ; 2852 			MCI_CONTROL_DR &= (u8)(~MCI_CONTROL_PINS);
5498  0bec c65000        	ld	a,20480
5499  0bef a48f          	and	a,#143
5500  0bf1 c75000        	ld	20480,a
5501                     ; 2853 			MCI_CONTROL_DDR |= MCI_CONTROL_PINS;
5503  0bf4 c65002        	ld	a,20482
5504  0bf7 aa70          	or	a,#112
5505  0bf9 c75002        	ld	20482,a
5506                     ; 2856 			ToCMPxH( TIM1->CCR4H, (hCntDeadDtime+SAMPLING_POINT_DURING_TON_CNT) );
5508  0bfc be2e          	ldw	x,_hCntDeadDtime
5509  0bfe 1c0090        	addw	x,#144
5510  0c01 4f            	clr	a
5511  0c02 01            	rrwa	x,a
5512  0c03 9f            	ld	a,xl
5513  0c04 c7526b        	ld	21099,a
5514                     ; 2857 			ToCMPxL( TIM1->CCR4L, (hCntDeadDtime+SAMPLING_POINT_DURING_TON_CNT) );
5516  0c07 b62f          	ld	a,_hCntDeadDtime+1
5517  0c09 ab90          	add	a,#144
5518  0c0b c7526c        	ld	21100,a
5519                     ; 2891 }
5522  0c0e 81            	ret	
5547                     ; 2893 void SetSamplingPoint_Current(void)
5547                     ; 2894 {
5548                     	switch	.text
5549  0c0f               _SetSamplingPoint_Current:
5553                     ; 2896 	ToCMPxH( TIM1->CCR4H, (hCntDeadDtime+SAMPLING_POINT_DURING_TON_CNT) );
5555  0c0f be2e          	ldw	x,_hCntDeadDtime
5556  0c11 1c0090        	addw	x,#144
5557  0c14 4f            	clr	a
5558  0c15 01            	rrwa	x,a
5559  0c16 9f            	ld	a,xl
5560  0c17 c7526b        	ld	21099,a
5561                     ; 2897 	ToCMPxL( TIM1->CCR4L, (hCntDeadDtime+SAMPLING_POINT_DURING_TON_CNT) );
5563  0c1a b62f          	ld	a,_hCntDeadDtime+1
5564  0c1c ab90          	add	a,#144
5565  0c1e c7526c        	ld	21100,a
5566                     ; 2898 }
5569  0c21 81            	ret	
5594                     ; 2900 void SetSamplingPoint_User_Sync(void)
5594                     ; 2901 {
5595                     	switch	.text
5596  0c22               _SetSamplingPoint_User_Sync:
5600                     ; 2903 	ToCMPxH( TIM1->CCR4H, (hCntDeadDtime+SAMPLING_POINT_DURING_TON_CNT) );
5602  0c22 be2e          	ldw	x,_hCntDeadDtime
5603  0c24 1c0090        	addw	x,#144
5604  0c27 4f            	clr	a
5605  0c28 01            	rrwa	x,a
5606  0c29 9f            	ld	a,xl
5607  0c2a c7526b        	ld	21099,a
5608                     ; 2904 	ToCMPxL( TIM1->CCR4L, (hCntDeadDtime+SAMPLING_POINT_DURING_TON_CNT) );
5610  0c2d b62f          	ld	a,_hCntDeadDtime+1
5611  0c2f ab90          	add	a,#144
5612  0c31 c7526c        	ld	21100,a
5613                     ; 2905 }
5616  0c34 81            	ret	
5642                     ; 2907 void DelayCoefAdjust(void)
5642                     ; 2908 {
5643                     	switch	.text
5644  0c35               _DelayCoefAdjust:
5648                     ; 2909 	BEMF_Rising_Factor = g_pBLDC_Struct->pBLDC_Var->bRising_Delay;
5650  0c35 92ce03        	ldw	x,[_g_pBLDC_Struct.w]
5651  0c38 e60d          	ld	a,(13,x)
5652  0c3a b711          	ld	_BEMF_Rising_Factor,a
5653                     ; 2910 	BEMF_Falling_Factor = g_pBLDC_Struct->pBLDC_Var->bFalling_Delay;
5655  0c3c e60c          	ld	a,(12,x)
5656  0c3e b712          	ld	_BEMF_Falling_Factor,a
5657                     ; 2911 }
5660  0c40 81            	ret	
6405                     	xdef	_ADC2_IRQHandler
6406                     	xdef	_TIM1_UPD_OVF_TRG_BRK_IRQHandler
6407                     	switch	.ubsct
6408  0000               _tmp_TIM1_CCER2:
6409  0000 00            	ds.b	1
6410                     	xdef	_tmp_TIM1_CCER2
6411  0001               _tmp_TIM1_CCER1:
6412  0001 00            	ds.b	1
6413                     	xdef	_tmp_TIM1_CCER1
6414  0002               _tmp_TIM1_CCMR3:
6415  0002 00            	ds.b	1
6416                     	xdef	_tmp_TIM1_CCMR3
6417  0003               _tmp_TIM1_CCMR2:
6418  0003 00            	ds.b	1
6419                     	xdef	_tmp_TIM1_CCMR2
6420  0004               _tmp_TIM1_CCMR1:
6421  0004 00            	ds.b	1
6422                     	xdef	_tmp_TIM1_CCMR1
6423  0005               _tmp_u8:
6424  0005 00            	ds.b	1
6425                     	xdef	_tmp_u8
6426  0006               _tmp_u16:
6427  0006 0000          	ds.b	2
6428                     	xdef	_tmp_u16
6429  0008               L71_pDutyCycleCounts_reg:
6430  0008 0000          	ds.b	2
6431  000a               L51_pcounter_reg:
6432  000a 0000          	ds.b	2
6433                     	xdef	_hTim3Th
6434                     	xdef	_hTim3Cnt
6435                     	xdef	_bComHanderEnable
6436  000c               _Motor_Stall_Count:
6437  000c 00            	ds.b	1
6438                     	xdef	_Motor_Stall_Count
6439  000d               _Motor_Frequency:
6440  000d 0000          	ds.b	2
6441                     	xdef	_Motor_Frequency
6442  000f               _Zero_Sample_Count:
6443  000f 0000          	ds.b	2
6444                     	xdef	_Zero_Sample_Count
6445  0011               _BEMF_Rising_Factor:
6446  0011 00            	ds.b	1
6447                     	xdef	_BEMF_Rising_Factor
6448  0012               _BEMF_Falling_Factor:
6449  0012 00            	ds.b	1
6450                     	xdef	_BEMF_Falling_Factor
6451                     	xdef	_first_cap
6452                     	xdef	_cap_index
6453                     	xdef	_cap_val
6454  0013               _Align_Index:
6455  0013 00            	ds.b	1
6456                     	xdef	_Align_Index
6457  0014               _Align_Target:
6458  0014 00            	ds.b	1
6459                     	xdef	_Align_Target
6460  0015               _Align_State:
6461  0015 00            	ds.b	1
6462                     	xdef	_Align_State
6463                     	xdef	_RAMP_TABLE
6464  0016               _Z_Detection_Type:
6465  0016 00            	ds.b	1
6466                     	xdef	_Z_Detection_Type
6467  0017               _BEMF_Sample_Debounce:
6468  0017 00            	ds.b	1
6469                     	xdef	_BEMF_Sample_Debounce
6470  0018               _Last_Zero_Cross_Count:
6471  0018 00            	ds.b	1
6472                     	xdef	_Last_Zero_Cross_Count
6473  0019               _Zero_Cross_Count:
6474  0019 00            	ds.b	1
6475                     	xdef	_Zero_Cross_Count
6476  001a               _Ramp_Step:
6477  001a 00            	ds.b	1
6478                     	xdef	_Ramp_Step
6479  001b               _CurrentLimitCnt:
6480  001b 0000          	ds.b	2
6481                     	xdef	_CurrentLimitCnt
6482  001d               _LastSwitchedCom:
6483  001d 0000          	ds.b	2
6484                     	xdef	_LastSwitchedCom
6485  001f               _Average_Zero_Cross_Time:
6486  001f 0000          	ds.b	2
6487                     	xdef	_Average_Zero_Cross_Time
6488  0021               _Previous_Zero_Cross_Time:
6489  0021 0000          	ds.b	2
6490                     	xdef	_Previous_Zero_Cross_Time
6491  0023               _Zero_Cross_Time:
6492  0023 0000          	ds.b	2
6493                     	xdef	_Zero_Cross_Time
6494  0025               _Demag_Time:
6495  0025 0000          	ds.b	2
6496                     	xdef	_Demag_Time
6497  0027               _Commutation_Time:
6498  0027 0000          	ds.b	2
6499                     	xdef	_Commutation_Time
6500  0029               _Phase_State:
6501  0029 00            	ds.b	1
6502                     	xdef	_Phase_State
6503  002a               _MTC_Status:
6504  002a 00            	ds.b	1
6505                     	xdef	_MTC_Status
6506  002b               _Current_BEMF_Channel:
6507  002b 00            	ds.b	1
6508                     	xdef	_Current_BEMF_Channel
6509  002c               _Current_BEMF:
6510  002c 00            	ds.b	1
6511                     	xdef	_Current_BEMF
6512  002d               _Current_Step:
6513  002d 00            	ds.b	1
6514                     	xdef	_Current_Step
6515                     	xdef	_BEMFSteps_CCW
6516                     	xdef	_BEMFSteps
6517                     	xdef	_BEMFSteps_CW
6518                     	xdef	_Fast_Demag_Steps_CCW
6519                     	xdef	_PhaseSteps_CCW
6520                     	xdef	_Fast_Demag_Steps
6521                     	xdef	_PhaseSteps
6522                     	xdef	_Fast_Demag_Steps_CW
6523                     	xdef	_PhaseSteps_CW
6524  002e               _hCntDeadDtime:
6525  002e 0000          	ds.b	2
6526                     	xdef	_hCntDeadDtime
6527  0030               _hDutyCntTh:
6528  0030 0000          	ds.b	2
6529                     	xdef	_hDutyCntTh
6530  0032               _hNeutralPoint:
6531  0032 0000          	ds.b	2
6532                     	xdef	_hNeutralPoint
6533  0034               L7_bCSR_Tmp:
6534  0034 00            	ds.b	1
6535  0035               _ADC_Buffer:
6536  0035 000000000000  	ds.b	12
6537                     	xdef	_ADC_Buffer
6538                     	xdef	_ADC_Async_State
6539                     	xdef	_ADC_Sync_State
6540  0041               _ADC_State:
6541  0041 00            	ds.b	1
6542                     	xdef	_ADC_State
6543                     	xdef	_g_pBLDC_Struct
6544                     	xdef	_g_pDevice
6545                     	xdef	_SetSamplingPoint_User_Sync
6546                     	xdef	_SetSamplingPoint_Current
6547                     	xdef	_SetSamplingPoint_BEMF
6548                     	xdef	_Set_Current
6549                     	xdef	_Set_Duty
6550                     	xdef	_DelayCoefAdjust
6551                     	xdef	_Enable_ADC_User_Sync_Sampling
6552                     	xdef	_Enable_ADC_Current_Sampling
6553                     	xdef	_Enable_ADC_BEMF_Sampling
6554                     	xdef	_Init_ADC
6555                     	xdef	_StartMotor
6556                     	xdef	_AlignRotor
6557                     	xdef	_BootStrap
6558                     	xdef	_BrakeMotor
6559                     	xdef	_StopMotor
6560                     	xdef	_Commutate_Motor
6561                     	xdef	_ComHandler
6562                     	xdef	_Init_TIM2
6563                     	xdef	_Init_TIM1
6564                     	xdef	_DebugPinsOff
6565                     	xdef	_SpeedMeasurement
6566                     	xdef	_GetStepTime
6567                     	xdef	_GetAsyncUserAdc
6568                     	xdef	_GetNeutralPoint
6569                     	xdef	_GetTemperature
6570                     	xdef	_GetBusVoltage
6571                     	xdef	_GetSyncUserAdc
6572                     	xdef	_GetCurrent
6573                     	xdef	_Application_ADC_Manager
6574                     	xdef	_dev_BLDC_driveUpdate
6575                     	xref	_BLDC_Set_Heatsink_Temperature
6576                     	xref	_BLDC_Set_Bus_Voltage
6577                     	xref	_BLDC_Get_Demag_Time
6578                     	xref	_BLDC_Set_Current_measured
6579                     	xref	_Get_BLDC_Struct
6580                     	xref	_vtimer_TimerElapsed
6581                     	xref	_vtimer_KillTimer
6582                     	xref	_vtimer_SetTimer
6583                     	xdef	_dev_driveWait
6584                     	xdef	_dev_driveStop
6585                     	xdef	_dev_driveRun
6586                     	xdef	_dev_driveStartUp
6587                     	xdef	_dev_driveStartUpInit
6588                     	xdef	_dev_driveIdle
6589                     	xdef	_dev_driveInit
6590                     	xref.b	c_lreg
6591                     	xref.b	c_x
6592                     	xref.b	c_y
6612                     	xref	c_ltor
6613                     	xref	c_rtol
6614                     	xref	c_umul
6615                     	xref	c_smul
6616                     	xref	c_lcmp
6617                     	xref	c_uitolx
6618                     	xref	c_lmul
6619                     	xref	c_ludv
6620                     	xref	c_cmulx
6621                     	end
