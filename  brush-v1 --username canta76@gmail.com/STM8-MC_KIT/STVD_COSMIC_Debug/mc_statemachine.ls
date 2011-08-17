   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     	bsct
  20  0000               L3_bState:
  21  0000 00            	dc.b	0
  22  0001               L5_FaultingState:
  23  0001 00            	dc.b	0
 108                     ; 67 void StateMachineExec(void)
 108                     ; 68 {
 110                     	switch	.text
 111  0000               _StateMachineExec:
 113  0000 88            	push	a
 114       00000001      OFST:	set	1
 117                     ; 70   switch (bState)
 119  0001 b600          	ld	a,L3_bState
 121                     ; 154     break;
 122  0003 2724          	jreq	L7
 123  0005 4a            	dec	a
 124  0006 2735          	jreq	L11
 125  0008 4a            	dec	a
 126  0009 2743          	jreq	L31
 127  000b 4a            	dec	a
 128  000c 2750          	jreq	L51
 129  000e 4a            	dec	a
 130  000f 2768          	jreq	L71
 131  0011 4a            	dec	a
 132  0012 2775          	jreq	L12
 133  0014 4a            	dec	a
 134  0015 2603cc0099    	jreq	L32
 135  001a 4a            	dec	a
 136  001b 2603cc00a9    	jreq	L52
 137  0020 4a            	dec	a
 138  0021 2603cc00b9    	jreq	L72
 139  0026 cc00cd        	jra	L37
 140  0029               L7:
 141                     ; 72   case SM_RESET:
 141                     ; 73     bRetVal = sm_reset();
 143  0029 cd00cf        	call	_sm_reset
 145  002c 6b01          	ld	(OFST+0,sp),a
 146                     ; 74     if (bRetVal == STATE_REMAIN)
 148  002e 27f6          	jreq	L37
 150                     ; 76     else if (bRetVal == NEXT_STATE)
 152  0030 4a            	dec	a
 153  0031 2703cc00c9    	jrne	L502
 154                     ; 77       bState = SM_IDLE;
 156  0036 35010000      	mov	L3_bState,#1
 158  003a cc00cd        	jra	L37
 159                     ; 79       bState = SM_FAULT;
 160  003d               L11:
 161                     ; 81   case SM_IDLE:
 161                     ; 82     bRetVal = sm_idle();
 163  003d cd0109        	call	_sm_idle
 165  0040 6b01          	ld	(OFST+0,sp),a
 166                     ; 83     if (bRetVal == STATE_REMAIN)
 168  0042 27f6          	jreq	L37
 170                     ; 85     else if (bRetVal == NEXT_STATE)
 172  0044 4a            	dec	a
 173  0045 26ec          	jrne	L502
 174                     ; 86       bState = SM_STARTINIT;
 176  0047 35020000      	mov	L3_bState,#2
 178  004b cc00cd        	jra	L37
 179                     ; 88       bState = SM_FAULT;
 180  004e               L31:
 181                     ; 90   case SM_STARTINIT:
 181                     ; 91     bRetVal = sm_startinit();
 183  004e cd0122        	call	_sm_startinit
 185  0051 6b01          	ld	(OFST+0,sp),a
 186                     ; 92     if (bRetVal == STATE_REMAIN)
 188  0053 2778          	jreq	L37
 190                     ; 94     else if (bRetVal == NEXT_STATE)
 192  0055 4a            	dec	a
 193  0056 2671          	jrne	L502
 194                     ; 95       bState = SM_START;
 196  0058 35030000      	mov	L3_bState,#3
 198  005c 206f          	jra	L37
 199                     ; 97       bState = SM_FAULT;
 200  005e               L51:
 201                     ; 99   case SM_START:
 201                     ; 100     bRetVal = sm_start();
 203  005e cd016a        	call	_sm_start
 205  0061 6b01          	ld	(OFST+0,sp),a
 206                     ; 101     if (bRetVal == STATE_REMAIN)
 208  0063 2768          	jreq	L37
 210                     ; 103     else if (bRetVal == NEXT_STATE)
 212  0065 a101          	cp	a,#1
 213  0067 2606          	jrne	L131
 214                     ; 104       bState = SM_RUN;
 216  0069 35040000      	mov	L3_bState,#4
 218  006d 205e          	jra	L37
 219  006f               L131:
 220                     ; 105     else if (bRetVal == OPTIONAL_JUMP)
 222  006f a102          	cp	a,#2
 223  0071 2656          	jrne	L502
 224                     ; 106       bState = SM_STOP;
 226  0073 35050000      	mov	L3_bState,#5
 228  0077 2054          	jra	L37
 229                     ; 108       bState = SM_FAULT;
 230  0079               L71:
 231                     ; 110   case SM_RUN:
 231                     ; 111     bRetVal = sm_run();
 233  0079 cd01b3        	call	_sm_run
 235  007c 6b01          	ld	(OFST+0,sp),a
 236                     ; 112     if (bRetVal == STATE_REMAIN)
 238  007e 274d          	jreq	L37
 240                     ; 114     else if (bRetVal == NEXT_STATE)
 242  0080 4a            	dec	a
 243  0081 2646          	jrne	L502
 244                     ; 115       bState = SM_STOP;
 246  0083 35050000      	mov	L3_bState,#5
 248  0087 2044          	jra	L37
 249                     ; 117       bState = SM_FAULT;
 250  0089               L12:
 251                     ; 119   case SM_STOP:
 251                     ; 120     bRetVal = sm_stop();
 253  0089 cd01fb        	call	_sm_stop
 255  008c 6b01          	ld	(OFST+0,sp),a
 256                     ; 121     if (bRetVal == STATE_REMAIN)
 258  008e 273d          	jreq	L37
 260                     ; 123     else if (bRetVal == NEXT_STATE)
 262  0090 4a            	dec	a
 263  0091 2636          	jrne	L502
 264                     ; 124       bState = SM_WAIT;
 266  0093 35060000      	mov	L3_bState,#6
 268  0097 2034          	jra	L37
 269                     ; 126       bState = SM_FAULT;
 270  0099               L32:
 271                     ; 128   case SM_WAIT:
 271                     ; 129     bRetVal = sm_wait();
 273  0099 cd022e        	call	_sm_wait
 275  009c 6b01          	ld	(OFST+0,sp),a
 276                     ; 130     if (bRetVal == STATE_REMAIN)
 278  009e 272d          	jreq	L37
 280                     ; 132     else if (bRetVal == NEXT_STATE)
 282  00a0 4a            	dec	a
 283  00a1 2626          	jrne	L502
 284                     ; 133       bState = SM_IDLE;
 286  00a3 35010000      	mov	L3_bState,#1
 288  00a7 2024          	jra	L37
 289                     ; 135       bState = SM_FAULT;
 290  00a9               L52:
 291                     ; 137   case SM_FAULT:
 291                     ; 138     bRetVal = sm_fault();
 293  00a9 cd0261        	call	_sm_fault
 295  00ac 6b01          	ld	(OFST+0,sp),a
 296                     ; 139     if (bRetVal == STATE_REMAIN)
 298  00ae 271d          	jreq	L37
 300                     ; 141     else if (bRetVal == NEXT_STATE)
 302  00b0 4a            	dec	a
 303  00b1 2616          	jrne	L502
 304                     ; 142       bState = SM_FAULT_OVER;
 306  00b3 35080000      	mov	L3_bState,#8
 308  00b7 2014          	jra	L37
 309                     ; 144       bState = SM_FAULT;
 310  00b9               L72:
 311                     ; 146   case SM_FAULT_OVER:
 311                     ; 147     bRetVal = sm_faultover();
 313  00b9 cd0288        	call	_sm_faultover
 315  00bc 6b01          	ld	(OFST+0,sp),a
 316                     ; 148     if (bRetVal == STATE_REMAIN)
 318  00be 270d          	jreq	L37
 320                     ; 150     else if (bRetVal == NEXT_STATE)
 322  00c0 4a            	dec	a
 323  00c1 2606          	jrne	L502
 324                     ; 151       bState = SM_IDLE;
 326  00c3 35010000      	mov	L3_bState,#1
 328  00c7 2004          	jra	L37
 329  00c9               L502:
 330                     ; 153       bState = SM_FAULT;
 340  00c9 35070000      	mov	L3_bState,#7
 341  00cd               L37:
 342                     ; 172 }
 345  00cd 84            	pop	a
 346  00ce 81            	ret	
 654                     ; 174 SM_RetVal_t sm_reset(void)
 654                     ; 175 {
 655                     	switch	.text
 656  00cf               _sm_reset:
 658  00cf 89            	pushw	x
 659       00000002      OFST:	set	2
 662                     ; 180   vtimer_init();
 664  00d0 cd0000        	call	_vtimer_init
 666                     ; 182   vdev_init();
 668  00d3 cd0000        	call	_vdev_init
 670                     ; 183   pDevice = vdev_get();
 672  00d6 cd0000        	call	_vdev_get
 674  00d9 1f01          	ldw	(OFST-1,sp),x
 675                     ; 184   FaultingState = SM_NO_FAULT;
 677  00db 3f01          	clr	L5_FaultingState
 678                     ; 186   devInit(pDevice);
 680  00dd cd0000        	call	_devInit
 682                     ; 200   driveInit(pDevice);
 684  00e0 1e01          	ldw	x,(OFST-1,sp)
 685  00e2 cd0000        	call	_driveInit
 687                     ; 202   vtimer_SetTimer(VTIM_KEY,DISPLAY_WELCOME_MESSAGE_TIME,0);
 689  00e5 5f            	clrw	x
 690  00e6 89            	pushw	x
 691  00e7 ae07d0        	ldw	x,#2000
 692  00ea 89            	pushw	x
 693  00eb 4f            	clr	a
 694  00ec cd0000        	call	_vtimer_SetTimer
 696  00ef 5b04          	addw	sp,#4
 698  00f1               L104:
 699                     ; 203   while (!(vtimer_TimerElapsed(VTIM_KEY)));
 701  00f1 4f            	clr	a
 702  00f2 cd0000        	call	_vtimer_TimerElapsed
 704  00f5 4d            	tnz	a
 705  00f6 27f9          	jreq	L104
 706                     ; 204 	vtimer_SetTimer(VTIM_DISPLAY_BLINK,DISPLAY_BLINKING_TIME,0); // Used for set point blinking
 708  00f8 5f            	clrw	x
 709  00f9 89            	pushw	x
 710  00fa ae012c        	ldw	x,#300
 711  00fd 89            	pushw	x
 712  00fe a601          	ld	a,#1
 713  0100 cd0000        	call	_vtimer_SetTimer
 715  0103 5b04          	addw	sp,#4
 716                     ; 206   return NEXT_STATE;
 718  0105 a601          	ld	a,#1
 721  0107 85            	popw	x
 722  0108 81            	ret	
 806                     ; 209 SM_RetVal_t sm_idle(void)
 806                     ; 210 {
 807                     	switch	.text
 808  0109               _sm_idle:
 810  0109 5203          	subw	sp,#3
 811       00000003      OFST:	set	3
 814                     ; 211   SM_RetVal_t sm_retVal = STATE_REMAIN;
 816  010b 0f03          	clr	(OFST+0,sp)
 817                     ; 216   driveIdle();
 819  010d cd0000        	call	_driveIdle
 821                     ; 217   hwRetVal = devChkHWErr();
 823  0110 cd0000        	call	_devChkHWErr
 825  0113 6b02          	ld	(OFST-1,sp),a
 826                     ; 221 	kpRetVal = USER_SEL; // Start to run
 828                     ; 234   if (hwRetVal == FUNCTION_ERROR)
 830  0115 a102          	cp	a,#2
 831  0117 2604          	jrne	L544
 832                     ; 236     sm_retVal = ERROR_CONDITION;
 834  0119 a603          	ld	a,#3
 836  011b 2002          	jra	L744
 837  011d               L544:
 838                     ; 242     sm_retVal = NEXT_STATE; 
 840  011d a601          	ld	a,#1
 841  011f               L744:
 842                     ; 246   return sm_retVal;
 846  011f 5b03          	addw	sp,#3
 847  0121 81            	ret	
 917                     ; 249 SM_RetVal_t sm_startinit(void)
 917                     ; 250 {
 918                     	switch	.text
 919  0122               _sm_startinit:
 921  0122 5204          	subw	sp,#4
 922       00000004      OFST:	set	4
 925                     ; 251   SM_RetVal_t sm_retVal = STATE_REMAIN;
 927  0124 0f04          	clr	(OFST+0,sp)
 928                     ; 256   retVal = driveStartUpInit();
 930  0126 cd0000        	call	_driveStartUpInit
 932  0129 6b03          	ld	(OFST-1,sp),a
 933                     ; 257   hwRetVal = devChkHWErr();
 935  012b cd0000        	call	_devChkHWErr
 937  012e 6b02          	ld	(OFST-2,sp),a
 938                     ; 258   kpRetVal = keysProcess();
 940  0130 cd0000        	call	_keysProcess
 942  0133 6b01          	ld	(OFST-3,sp),a
 943                     ; 261   if (hwRetVal == FUNCTION_ERROR)
 945  0135 7b02          	ld	a,(OFST-2,sp)
 946  0137 a102          	cp	a,#2
 947  0139 2604          	jrne	L305
 948                     ; 263     sm_retVal = ERROR_CONDITION;
 950  013b a603          	ld	a,#3
 952  013d 2024          	jp	LC002
 953  013f               L305:
 954                     ; 267   else if (retVal == FUNCTION_ERROR) 
 956  013f 7b03          	ld	a,(OFST-1,sp)
 957  0141 a102          	cp	a,#2
 958  0143 260e          	jrne	L705
 959                     ; 269     sm_retVal = ERROR_CONDITION;
 961  0145 a603          	ld	a,#3
 962  0147 6b04          	ld	(OFST+0,sp),a
 963                     ; 272     FaultingState = SM_STARTINIT_FAULT;
 965  0149 35030001      	mov	L5_FaultingState,#3
 966                     ; 274     UserInterface_Fault(MOTOR_IS_RUNNING);    
 968  014d 4c            	inc	a
 969  014e cd0000        	call	_UserInterface_Fault
 972  0151 2012          	jra	L505
 973  0153               L705:
 974                     ; 276   else if (kpRetVal == USER_SEL)
 976  0153 7b01          	ld	a,(OFST-3,sp)
 977  0155 a107          	cp	a,#7
 978  0157 2604          	jrne	L315
 979                     ; 278     sm_retVal = OPTIONAL_JUMP; 
 981  0159 a602          	ld	a,#2
 983  015b 2006          	jp	LC002
 984  015d               L315:
 985                     ; 282   else if (retVal == FUNCTION_ENDED)
 987  015d 7b03          	ld	a,(OFST-1,sp)
 988  015f 4a            	dec	a
 989  0160 2603          	jrne	L505
 990                     ; 284     sm_retVal = NEXT_STATE;
 992  0162 4c            	inc	a
 993  0163               LC002:
 994  0163 6b04          	ld	(OFST+0,sp),a
 995  0165               L505:
 996                     ; 290   return sm_retVal;
 998  0165 7b04          	ld	a,(OFST+0,sp)
1001  0167 5b04          	addw	sp,#4
1002  0169 81            	ret	
1072                     ; 293 SM_RetVal_t sm_start(void)
1072                     ; 294 {
1073                     	switch	.text
1074  016a               _sm_start:
1076  016a 5204          	subw	sp,#4
1077       00000004      OFST:	set	4
1080                     ; 295   SM_RetVal_t sm_retVal = STATE_REMAIN;
1082  016c 0f04          	clr	(OFST+0,sp)
1083                     ; 300   retVal = driveStartUp();
1085  016e cd0000        	call	_driveStartUp
1087  0171 6b03          	ld	(OFST-1,sp),a
1088                     ; 301   hwRetVal = devChkHWErr();
1090  0173 cd0000        	call	_devChkHWErr
1092  0176 6b02          	ld	(OFST-2,sp),a
1093                     ; 302   kpRetVal = keysProcess();
1095  0178 cd0000        	call	_keysProcess
1097  017b 6b01          	ld	(OFST-3,sp),a
1098                     ; 305   if (hwRetVal == FUNCTION_ERROR)
1100  017d 7b02          	ld	a,(OFST-2,sp)
1101  017f a102          	cp	a,#2
1102  0181 2604          	jrne	L355
1103                     ; 307     sm_retVal = ERROR_CONDITION;
1105  0183 a603          	ld	a,#3
1107  0185 2012          	jp	LC003
1108  0187               L355:
1109                     ; 311   else if (kpRetVal == USER_SEL)
1111  0187 7b01          	ld	a,(OFST-3,sp)
1112  0189 a107          	cp	a,#7
1113  018b 2604          	jrne	L755
1114                     ; 313     sm_retVal = OPTIONAL_JUMP; 
1116  018d a602          	ld	a,#2
1118  018f 2008          	jp	LC003
1119  0191               L755:
1120                     ; 317   else if (retVal == FUNCTION_ENDED)
1122  0191 7b03          	ld	a,(OFST-1,sp)
1123  0193 a101          	cp	a,#1
1124  0195 2606          	jrne	L555
1125                     ; 319     sm_retVal = NEXT_STATE;
1127  0197 a601          	ld	a,#1
1128  0199               LC003:
1129  0199 6b04          	ld	(OFST+0,sp),a
1130  019b 7b03          	ld	a,(OFST-1,sp)
1131  019d               L555:
1132                     ; 323   if (retVal == FUNCTION_ERROR) 
1134  019d a102          	cp	a,#2
1135  019f 260d          	jrne	L565
1136                     ; 325     sm_retVal = ERROR_CONDITION;
1138  01a1 a603          	ld	a,#3
1139  01a3 6b04          	ld	(OFST+0,sp),a
1140                     ; 328     FaultingState = SM_START_FAULT;
1142  01a5 35040001      	mov	L5_FaultingState,#4
1143                     ; 331     UserInterface_Fault(STARTUP_FAILED);
1145  01a9 a601          	ld	a,#1
1146  01ab cd0000        	call	_UserInterface_Fault
1148  01ae               L565:
1149                     ; 334   return sm_retVal;
1151  01ae 7b04          	ld	a,(OFST+0,sp)
1154  01b0 5b04          	addw	sp,#4
1155  01b2 81            	ret	
1225                     ; 337 SM_RetVal_t sm_run(void)
1225                     ; 338 {
1226                     	switch	.text
1227  01b3               _sm_run:
1229  01b3 5204          	subw	sp,#4
1230       00000004      OFST:	set	4
1233                     ; 339   SM_RetVal_t sm_retVal = STATE_REMAIN;
1235  01b5 0f04          	clr	(OFST+0,sp)
1236                     ; 344   retVal = driveRun(); // Execute the motor control run
1238  01b7 cd0000        	call	_driveRun
1240  01ba 6b03          	ld	(OFST-1,sp),a
1241                     ; 345   hwRetVal = devChkHWErr();
1243  01bc cd0000        	call	_devChkHWErr
1245  01bf 6b02          	ld	(OFST-2,sp),a
1246                     ; 346   kpRetVal = keysProcess();
1248  01c1 cd0000        	call	_keysProcess
1250  01c4 6b01          	ld	(OFST-3,sp),a
1251                     ; 349   if (hwRetVal == FUNCTION_ERROR)
1253  01c6 7b02          	ld	a,(OFST-2,sp)
1254  01c8 a102          	cp	a,#2
1255  01ca 2604          	jrne	L126
1256                     ; 351     sm_retVal = ERROR_CONDITION;
1258  01cc a603          	ld	a,#3
1260  01ce 2024          	jp	LC004
1261  01d0               L126:
1262                     ; 355   else if (kpRetVal == USER_SEL)
1264  01d0 7b01          	ld	a,(OFST-3,sp)
1265  01d2 a107          	cp	a,#7
1266  01d4 2604          	jrne	L526
1267                     ; 357     sm_retVal = NEXT_STATE; 
1269  01d6 a601          	ld	a,#1
1271  01d8 201a          	jp	LC004
1272  01da               L526:
1273                     ; 361   else if (retVal == FUNCTION_ERROR)
1275  01da 7b03          	ld	a,(OFST-1,sp)
1276  01dc a102          	cp	a,#2
1277  01de 260f          	jrne	L136
1278                     ; 363     sm_retVal = ERROR_CONDITION;
1280  01e0 a603          	ld	a,#3
1281  01e2 6b04          	ld	(OFST+0,sp),a
1282                     ; 366     FaultingState = SM_RUN_FAULT;	
1284  01e4 35050001      	mov	L5_FaultingState,#5
1285                     ; 369     UserInterface_Fault(ERROR_ON_SPEED_FEEDBACK);
1287  01e8 a602          	ld	a,#2
1288  01ea cd0000        	call	_UserInterface_Fault
1291  01ed 2007          	jra	L326
1292  01ef               L136:
1293                     ; 372   else if (retVal == FUNCTION_ENDED)
1295  01ef 4a            	dec	a
1296  01f0 2604          	jrne	L326
1297                     ; 374     sm_retVal = OPTIONAL_JUMP;
1299  01f2 a602          	ld	a,#2
1300  01f4               LC004:
1301  01f4 6b04          	ld	(OFST+0,sp),a
1302  01f6               L326:
1303                     ; 379   return sm_retVal;
1305  01f6 7b04          	ld	a,(OFST+0,sp)
1308  01f8 5b04          	addw	sp,#4
1309  01fa 81            	ret	
1368                     ; 382 SM_RetVal_t sm_stop(void)
1368                     ; 383 {
1369                     	switch	.text
1370  01fb               _sm_stop:
1372  01fb 5203          	subw	sp,#3
1373       00000003      OFST:	set	3
1376                     ; 384   SM_RetVal_t sm_retVal = STATE_REMAIN;
1378  01fd 0f03          	clr	(OFST+0,sp)
1379                     ; 387   retVal = driveStop();
1381  01ff cd0000        	call	_driveStop
1383  0202 6b02          	ld	(OFST-1,sp),a
1384                     ; 388   hwRetVal = devChkHWErr();
1386  0204 cd0000        	call	_devChkHWErr
1388  0207 6b01          	ld	(OFST-2,sp),a
1389                     ; 391   if (hwRetVal == FUNCTION_ERROR)
1391  0209 a102          	cp	a,#2
1392  020b 2604          	jrne	L566
1393                     ; 393     sm_retVal = ERROR_CONDITION;
1395  020d a603          	ld	a,#3
1397  020f 2008          	jp	LC005
1398  0211               L566:
1399                     ; 397   else if (retVal == FUNCTION_ENDED)
1401  0211 7b02          	ld	a,(OFST-1,sp)
1402  0213 a101          	cp	a,#1
1403  0215 2606          	jrne	L176
1404                     ; 399     sm_retVal = NEXT_STATE;
1406  0217 a601          	ld	a,#1
1407  0219               LC005:
1408  0219 6b03          	ld	(OFST+0,sp),a
1410  021b 200c          	jra	L766
1411  021d               L176:
1412                     ; 403   else if (retVal == FUNCTION_ERROR)
1414  021d a102          	cp	a,#2
1415  021f 2608          	jrne	L766
1416                     ; 405     sm_retVal = ERROR_CONDITION;
1418  0221 a603          	ld	a,#3
1419  0223 6b03          	ld	(OFST+0,sp),a
1420                     ; 408     FaultingState = SM_STOP_FAULT;		
1422  0225 35060001      	mov	L5_FaultingState,#6
1423  0229               L766:
1424                     ; 411   return sm_retVal;
1426  0229 7b03          	ld	a,(OFST+0,sp)
1429  022b 5b03          	addw	sp,#3
1430  022d 81            	ret	
1489                     ; 414 SM_RetVal_t sm_wait(void)
1489                     ; 415 {
1490                     	switch	.text
1491  022e               _sm_wait:
1493  022e 5203          	subw	sp,#3
1494       00000003      OFST:	set	3
1497                     ; 416   SM_RetVal_t sm_retVal = STATE_REMAIN;
1499  0230 0f03          	clr	(OFST+0,sp)
1500                     ; 420   retVal = driveWait();
1502  0232 cd0000        	call	_driveWait
1504  0235 6b02          	ld	(OFST-1,sp),a
1505                     ; 421   hwRetVal = devChkHWErr();
1507  0237 cd0000        	call	_devChkHWErr
1509  023a 6b01          	ld	(OFST-2,sp),a
1510                     ; 424   if (hwRetVal == FUNCTION_ERROR)
1512  023c a102          	cp	a,#2
1513  023e 2604          	jrne	L527
1514                     ; 426     sm_retVal = ERROR_CONDITION;
1516  0240 a603          	ld	a,#3
1518  0242 2008          	jp	LC006
1519  0244               L527:
1520                     ; 430   else if (retVal == FUNCTION_ENDED)
1522  0244 7b02          	ld	a,(OFST-1,sp)
1523  0246 a101          	cp	a,#1
1524  0248 2606          	jrne	L137
1525                     ; 432     sm_retVal = NEXT_STATE;
1527  024a a601          	ld	a,#1
1528  024c               LC006:
1529  024c 6b03          	ld	(OFST+0,sp),a
1531  024e 200c          	jra	L727
1532  0250               L137:
1533                     ; 436   else if (retVal == FUNCTION_ERROR) 
1535  0250 a102          	cp	a,#2
1536  0252 2608          	jrne	L727
1537                     ; 438     sm_retVal = ERROR_CONDITION;
1539  0254 a603          	ld	a,#3
1540  0256 6b03          	ld	(OFST+0,sp),a
1541                     ; 441     FaultingState = SM_WAIT_FAULT;	
1543  0258 35070001      	mov	L5_FaultingState,#7
1544  025c               L727:
1545                     ; 444   return sm_retVal;
1547  025c 7b03          	ld	a,(OFST+0,sp)
1550  025e 5b03          	addw	sp,#3
1551  0260 81            	ret	
1554                     	bsct
1555  0002               L737_st_fault:
1556  0002 00            	dc.b	0
1614                     ; 447 SM_RetVal_t sm_fault(void)
1614                     ; 448 {
1615                     	switch	.text
1616  0261               _sm_fault:
1618  0261 89            	pushw	x
1619       00000002      OFST:	set	2
1622                     ; 449   SM_RetVal_t sm_retVal = STATE_REMAIN;
1624  0262 0f01          	clr	(OFST-1,sp)
1625                     ; 454   driveFault();
1627  0264 cd0000        	call	_driveFault
1629                     ; 455   if (st_fault == 0)
1631  0267 b602          	ld	a,L737_st_fault
1632  0269 260a          	jrne	L767
1633                     ; 457     driveStop();
1635  026b cd0000        	call	_driveStop
1637                     ; 460     UserInterface_Lock();
1639  026e cd0000        	call	_UserInterface_Lock
1641                     ; 462     st_fault = 1;
1643  0271 35010002      	mov	L737_st_fault,#1
1644  0275               L767:
1645                     ; 464   hwRetVal = devChkHWErrEnd();
1647  0275 cd0000        	call	_devChkHWErrEnd
1649  0278 6b02          	ld	(OFST+0,sp),a
1650                     ; 466   if (FaultingState != SM_NO_FAULT)
1652  027a 3d01          	tnz	L5_FaultingState
1653                     ; 472   if (hwRetVal == FUNCTION_ENDED)
1655  027c 4a            	dec	a
1656  027d 2605          	jrne	L377
1657                     ; 474     sm_retVal = NEXT_STATE;
1659  027f 4c            	inc	a
1660  0280 6b01          	ld	(OFST-1,sp),a
1661                     ; 476     st_fault = 0;
1663  0282 3f02          	clr	L737_st_fault
1664  0284               L377:
1665                     ; 479   return sm_retVal;
1667  0284 7b01          	ld	a,(OFST-1,sp)
1670  0286 85            	popw	x
1671  0287 81            	ret	
1731                     ; 482 SM_RetVal_t sm_faultover(void)
1731                     ; 483 {
1732                     	switch	.text
1733  0288               _sm_faultover:
1735  0288 5203          	subw	sp,#3
1736       00000003      OFST:	set	3
1739                     ; 484   SM_RetVal_t sm_retVal = STATE_REMAIN;
1741  028a 0f03          	clr	(OFST+0,sp)
1742                     ; 488   kpRetVal = keysProcess();
1744  028c cd0000        	call	_keysProcess
1746  028f 6b02          	ld	(OFST-1,sp),a
1747                     ; 489   hwRetVal = devChkHWErrEnd();
1749  0291 cd0000        	call	_devChkHWErrEnd
1751  0294 6b01          	ld	(OFST-2,sp),a
1752                     ; 492   if (hwRetVal == FUNCTION_ERROR)
1754  0296 a102          	cp	a,#2
1755  0298 260a          	jrne	L3201
1756                     ; 494     sm_retVal = ERROR_CONDITION;
1758  029a a603          	ld	a,#3
1759  029c 6b03          	ld	(OFST+0,sp),a
1760                     ; 496     FaultingState = SM_FAULTOVER_FAULT;	
1762  029e 35080001      	mov	L5_FaultingState,#8
1764  02a2 2010          	jra	L5201
1765  02a4               L3201:
1766                     ; 498   else if (kpRetVal == USER_SEL)
1768  02a4 7b02          	ld	a,(OFST-1,sp)
1769  02a6 a107          	cp	a,#7
1770  02a8 260a          	jrne	L5201
1771                     ; 500     sm_retVal = NEXT_STATE; 
1773  02aa a601          	ld	a,#1
1774  02ac 6b03          	ld	(OFST+0,sp),a
1775                     ; 503     devChkHWErrClr();    
1777  02ae cd0000        	call	_devChkHWErrClr
1779                     ; 505     UserInterface_Unlock();
1781  02b1 cd0000        	call	_UserInterface_Unlock
1783  02b4               L5201:
1784                     ; 507   return sm_retVal;
1786  02b4 7b03          	ld	a,(OFST+0,sp)
1789  02b6 5b03          	addw	sp,#3
1790  02b8 81            	ret	
1963                     	xdef	_sm_faultover
1964                     	xdef	_sm_fault
1965                     	xdef	_sm_wait
1966                     	xdef	_sm_stop
1967                     	xdef	_sm_run
1968                     	xdef	_sm_start
1969                     	xdef	_sm_startinit
1970                     	xdef	_sm_idle
1971                     	xdef	_sm_reset
1972                     	xref	_driveFault
1973                     	xref	_driveWait
1974                     	xref	_driveStop
1975                     	xref	_driveRun
1976                     	xref	_driveStartUp
1977                     	xref	_driveStartUpInit
1978                     	xref	_driveIdle
1979                     	xref	_driveInit
1980                     	xref	_devChkHWErrClr
1981                     	xref	_devChkHWErrEnd
1982                     	xref	_devChkHWErr
1983                     	xref	_devInit
1984                     	xref	_keysProcess
1985                     	xref	_UserInterface_Fault
1986                     	xref	_UserInterface_Unlock
1987                     	xref	_UserInterface_Lock
1988                     	xref	_vdev_get
1989                     	xref	_vdev_init
1990                     	xref	_vtimer_TimerElapsed
1991                     	xref	_vtimer_SetTimer
1992                     	xref	_vtimer_init
1993                     	xdef	_StateMachineExec
2012                     	end
