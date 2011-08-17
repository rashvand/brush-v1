   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     	bsct
  20  0000               L3_sBLDC_Var:
  21  0000 01            	dc.b	1
  22  0001 00            	dc.b	0
  23  0002 0000          	dc.w	0
  24  0004 07d0          	dc.w	2000
  25  0006 02c6          	dc.w	710
  26  0008 012c          	dc.w	300
  27  000a 0000          	dc.w	0
  28  000c 80            	dc.b	128
  29  000d 80            	dc.b	128
  30  000e 14            	dc.b	20
  31  000f 251c          	dc.w	9500
  32  0011 0000          	dc.w	0
  33  0013 00            	dc.b	0
  34  0014 00            	dc.b	0
  35  0015 00            	dc.b	0
  36  0016 00            	dc.b	0
  37  0017               L5_sPID_SPEED_Var:
  38  0017 0014          	dc.w	20
  39  0019 0014          	dc.w	20
  40  001b 0000          	dc.w	0
  41  001d 00000000      	dc.l	0
  42  0021 00000000      	dc.l	0
  43                     .const:	section	.text
  44  0000               L7_sPID_SPEED_Const:
  46  0000 0000          	dc.w	_PI_Regulator
  47  0002 0080          	dc.w	128
  48  0004 0200          	dc.w	512
  49  0006 0010          	dc.w	16
  50  0008 0000          	dc.w	0
  51  000a 07d0          	dc.w	2000
  52  000c 00000000      	dc.l	0
  53  0010 000fa000      	dc.l	1024000
  54  0014               L11_sPID_SPEED:
  55  0014 0017          	dc.w	L5_sPID_SPEED_Var
  56  0016 0000          	dc.w	L7_sPID_SPEED_Const
  57  0018               L31_sBLDC_Const:
  58  0018 02            	dc.b	2
  59  0019 0dac          	dc.w	3500
  60  001b 4650          	dc.w	18000
  61  001d 05            	dc.b	5
  62  001e 0014          	dc.w	L11_sPID_SPEED
  63  0020 2710          	dc.w	10000
  64  0022 0000          	dc.w	0
  65  0024               L51_sBLDC_Struct:
  66  0024 0000          	dc.w	L3_sBLDC_Var
  67  0026 0018          	dc.w	L31_sBLDC_Const
  68  0028               L71_pBLDC_Struct:
  69  0028 0024          	dc.w	L51_sBLDC_Struct
  70  002a               L12_hArrPwmVal:
  71  002a 0378          	dc.w	888
 488                     ; 103 PBLDC_Struct_t Get_BLDC_Struct(void)
 488                     ; 104 {
 490                     	switch	.text
 491  0000               _Get_BLDC_Struct:
 495                     ; 105 	return pBLDC_Struct;
 497  0000 ae0024        	ldw	x,#L51_sBLDC_Struct
 500  0003 81            	ret	
 527                     ; 108 PBLDC_Var_t Get_BLDC_Var(void)
 527                     ; 109 {
 528                     	switch	.text
 529  0004               _Get_BLDC_Var:
 533                     ; 110 	return sBLDC_Struct.pBLDC_Var;
 535  0004 ae0000        	ldw	x,#L3_sBLDC_Var
 538  0007 81            	ret	
 565                     ; 113 PBLDC_Const_t Get_BLDC_Const(void)
 565                     ; 114 {
 566                     	switch	.text
 567  0008               _Get_BLDC_Const:
 571                     ; 115 	return sBLDC_Struct.pBLDC_Const;
 573  0008 ae0018        	ldw	x,#L31_sBLDC_Const
 576  000b 81            	ret	
 601                     ; 118 s16 BLDC_Get_Target_rotor_speed(void)
 601                     ; 119 {
 602                     	switch	.text
 603  000c               _BLDC_Get_Target_rotor_speed:
 607                     ; 120 	return sBLDC_Struct.pBLDC_Var->hTarget_rotor_speed;
 609  000c be04          	ldw	x,L3_sBLDC_Var+4
 612  000e 81            	ret	
 648                     ; 123 void BLDC_Set_Target_rotor_speed(s16 val)
 648                     ; 124 {
 649                     	switch	.text
 650  000f               _BLDC_Set_Target_rotor_speed:
 654                     ; 125 	sBLDC_Struct.pBLDC_Var->hTarget_rotor_speed = val;
 656  000f bf04          	ldw	L3_sBLDC_Var+4,x
 657                     ; 126 }
 660  0011 81            	ret	
 685                     ; 128 s16 BLDC_Get_Measured_rotor_speed(void)
 685                     ; 129 {
 686                     	switch	.text
 687  0012               _BLDC_Get_Measured_rotor_speed:
 691                     ; 130 	return sBLDC_Struct.pBLDC_Var->hMeasured_rotor_speed;
 693  0012 be02          	ldw	x,L3_sBLDC_Var+2
 696  0014 81            	ret	
 722                     	switch	.const
 723  002c               L22:
 724  002c 00000378      	dc.l	888
 725                     ; 133 u8  BLDC_Get_Duty_cycle(void)
 725                     ; 134 {	
 726                     	switch	.text
 727  0015               _BLDC_Get_Duty_cycle:
 731                     ; 135 	return (u8)((100*(u32)(sBLDC_Struct.pBLDC_Var->hDuty_cycle))/hArrPwmVal);
 733  0015 be06          	ldw	x,L3_sBLDC_Var+6
 734  0017 a664          	ld	a,#100
 735  0019 cd0000        	call	c_cmulx
 737  001c ae002c        	ldw	x,#L22
 738  001f cd0000        	call	c_ludv
 740  0022 b603          	ld	a,c_lreg+3
 743  0024 81            	ret	
 768                     ; 138 u16  BLDC_Get_Duty_cycle_cnt(void)
 768                     ; 139 {	
 769                     	switch	.text
 770  0025               _BLDC_Get_Duty_cycle_cnt:
 774                     ; 140 	return sBLDC_Struct.pBLDC_Var->hDuty_cycle;
 776  0025 be06          	ldw	x,L3_sBLDC_Var+6
 779  0027 81            	ret	
 816                     	switch	.const
 817  0030               L03:
 818  0030 00000064      	dc.l	100
 819                     ; 143 void  BLDC_Set_Duty_cycle(u8 val)
 819                     ; 144 {
 820                     	switch	.text
 821  0028               _BLDC_Set_Duty_cycle:
 825                     ; 145 	sBLDC_Struct.pBLDC_Var->hDuty_cycle = (u16)(((u32)(hArrPwmVal)*val)/100);
 827  0028 5f            	clrw	x
 828  0029 97            	ld	xl,a
 829  002a 90ae0378      	ldw	y,#888
 830  002e cd0000        	call	c_umul
 832  0031 ae0030        	ldw	x,#L03
 833  0034 cd0000        	call	c_ludv
 835  0037 be02          	ldw	x,c_lreg+2
 836  0039 bf06          	ldw	L3_sBLDC_Var+6,x
 837                     ; 146 }
 840  003b 81            	ret	
 876                     ; 148 void  BLDC_Set_Duty_cycle_cnt(u16 val)
 876                     ; 149 {
 877                     	switch	.text
 878  003c               _BLDC_Set_Duty_cycle_cnt:
 882                     ; 150 	sBLDC_Struct.pBLDC_Var->hDuty_cycle = (u16)val;
 884  003c bf06          	ldw	L3_sBLDC_Var+6,x
 885                     ; 151 }
 888  003e 81            	ret	
 913                     ; 153 u16 BLDC_Get_Current_reference(void)
 913                     ; 154 {
 914                     	switch	.text
 915  003f               _BLDC_Get_Current_reference:
 919                     ; 155 	return sBLDC_Struct.pBLDC_Var->hCurrent_reference/100;
 921  003f be08          	ldw	x,L3_sBLDC_Var+8
 922  0041 90ae0064      	ldw	y,#100
 923  0045 65            	divw	x,y
 926  0046 81            	ret	
 962                     ; 158 void  BLDC_Set_Current_reference(u16 val)
 962                     ; 159 {
 963                     	switch	.text
 964  0047               _BLDC_Set_Current_reference:
 968                     ; 160 	sBLDC_Struct.pBLDC_Var->hCurrent_reference = val * 100;
 970  0047 90ae0064      	ldw	y,#100
 971  004b cd0000        	call	c_imul
 973  004e bf08          	ldw	L3_sBLDC_Var+8,x
 974                     ; 161 }
 977  0050 81            	ret	
1002                     ; 163 u16 BLDC_Get_Current_measured(void)
1002                     ; 164 {
1003                     	switch	.text
1004  0051               _BLDC_Get_Current_measured:
1008                     ; 165 	return sBLDC_Struct.pBLDC_Var->hCurrent_measured;
1010  0051 be0a          	ldw	x,L3_sBLDC_Var+10
1013  0053 81            	ret	
1049                     ; 168 void  BLDC_Set_Current_measured(u16 val)
1049                     ; 169 {
1050                     	switch	.text
1051  0054               _BLDC_Set_Current_measured:
1055                     ; 170 	sBLDC_Struct.pBLDC_Var->hCurrent_measured = val;
1057  0054 bf0a          	ldw	L3_sBLDC_Var+10,x
1058                     ; 171 }
1061  0056 81            	ret	
1086                     ; 173 u8  BLDC_Get_Falling_Delay(void)
1086                     ; 174 {
1087                     	switch	.text
1088  0057               _BLDC_Get_Falling_Delay:
1092                     ; 175 	return sBLDC_Struct.pBLDC_Var->bFalling_Delay;
1094  0057 b60c          	ld	a,L3_sBLDC_Var+12
1097  0059 81            	ret	
1133                     ; 178 void  BLDC_Set_Falling_Delay(u8 val)
1133                     ; 179 {
1134                     	switch	.text
1135  005a               _BLDC_Set_Falling_Delay:
1139                     ; 181 		sBLDC_Struct.pBLDC_Var->bRising_Delay = val;
1141  005a b70d          	ld	L3_sBLDC_Var+13,a
1142                     ; 183 	sBLDC_Struct.pBLDC_Var->bFalling_Delay = val;
1144  005c b70c          	ld	L3_sBLDC_Var+12,a
1145                     ; 184 }
1148  005e 81            	ret	
1173                     ; 186 u8 	BLDC_Get_Rising_Delay(void)
1173                     ; 187 {
1174                     	switch	.text
1175  005f               _BLDC_Get_Rising_Delay:
1179                     ; 188 	return sBLDC_Struct.pBLDC_Var->bRising_Delay;
1181  005f b60d          	ld	a,L3_sBLDC_Var+13
1184  0061 81            	ret	
1220                     ; 191 void 	BLDC_Set_Rising_Delay(u8 val)
1220                     ; 192 {
1221                     	switch	.text
1222  0062               _BLDC_Set_Rising_Delay:
1226                     ; 194 		sBLDC_Struct.pBLDC_Var->bFalling_Delay = val;
1228  0062 b70c          	ld	L3_sBLDC_Var+12,a
1229                     ; 196 	sBLDC_Struct.pBLDC_Var->bRising_Delay = val;
1231  0064 b70d          	ld	L3_sBLDC_Var+13,a
1232                     ; 197 }
1235  0066 81            	ret	
1260                     ; 199 u8 BLDC_Get_Demag_Time(void)
1260                     ; 200 {
1261                     	switch	.text
1262  0067               _BLDC_Get_Demag_Time:
1266                     ; 201 	return sBLDC_Struct.pBLDC_Var->bDemag_Time;
1268  0067 b60e          	ld	a,L3_sBLDC_Var+14
1271  0069 81            	ret	
1307                     ; 204 void BLDC_Set_Demag_Time(u8 val)
1307                     ; 205 {
1308                     	switch	.text
1309  006a               _BLDC_Set_Demag_Time:
1313                     ; 206 	sBLDC_Struct.pBLDC_Var->bDemag_Time = val;
1315  006a b70e          	ld	L3_sBLDC_Var+14,a
1316                     ; 207 }
1319  006c 81            	ret	
1344                     ; 209 u16 	BLDC_Get_MinimumOffTime(void)
1344                     ; 210 {
1345                     	switch	.text
1346  006d               _BLDC_Get_MinimumOffTime:
1350                     ; 211 	return sBLDC_Struct.pBLDC_Var->hMinimumOffTime;
1352  006d be0f          	ldw	x,L3_sBLDC_Var+15
1355  006f 81            	ret	
1391                     ; 214 void 	BLDC_Set_MinimumOffTime(u16 val)
1391                     ; 215 {
1392                     	switch	.text
1393  0070               _BLDC_Set_MinimumOffTime:
1397                     ; 216 	sBLDC_Struct.pBLDC_Var->hMinimumOffTime = val;
1399  0070 bf0f          	ldw	L3_sBLDC_Var+15,x
1400                     ; 217 }
1403  0072 81            	ret	
1427                     ; 219 s16  BLDC_Get_Speed_KP(void)
1427                     ; 220 {
1428                     	switch	.text
1429  0073               _BLDC_Get_Speed_KP:
1433                     ; 222 		return sBLDC_Struct.pBLDC_Const->pPID_Speed->pPID_Var->hKp_Gain;
1435  0073 72ce001e      	ldw	x,[L31_sBLDC_Const+6.w]
1436  0077 fe            	ldw	x,(x)
1439  0078 81            	ret	
1474                     ; 228 void  BLDC_Set_Speed_KP(s16 val)
1474                     ; 229 {
1475                     	switch	.text
1476  0079               _BLDC_Set_Speed_KP:
1480                     ; 230 	sBLDC_Struct.pBLDC_Const->pPID_Speed->pPID_Var->hKp_Gain = val;
1482  0079 5172ce001e51  	ldw	y,[L31_sBLDC_Const+6.w]
1483  007f 90ff          	ldw	(y),x
1484                     ; 231 }
1487  0081 81            	ret	
1511                     ; 233 s16  BLDC_Get_Speed_KI(void)
1511                     ; 234 {
1512                     	switch	.text
1513  0082               _BLDC_Get_Speed_KI:
1517                     ; 236 		return sBLDC_Struct.pBLDC_Const->pPID_Speed->pPID_Var->hKi_Gain;
1519  0082 72ce001e      	ldw	x,[L31_sBLDC_Const+6.w]
1520  0086 ee02          	ldw	x,(2,x)
1523  0088 81            	ret	
1558                     ; 242 void  BLDC_Set_Speed_KI(s16 val)
1558                     ; 243 {
1559                     	switch	.text
1560  0089               _BLDC_Set_Speed_KI:
1564                     ; 244 	sBLDC_Struct.pBLDC_Const->pPID_Speed->pPID_Var->hKi_Gain = val;
1566  0089 5172ce001e51  	ldw	y,[L31_sBLDC_Const+6.w]
1567  008f 90ef02        	ldw	(2,y),x
1568                     ; 245 }
1571  0092 81            	ret	
1595                     ; 247 s16  BLDC_Get_Speed_KD(void)
1595                     ; 248 {
1596                     	switch	.text
1597  0093               _BLDC_Get_Speed_KD:
1601                     ; 250 		return sBLDC_Struct.pBLDC_Const->pPID_Speed->pPID_Var->hKd_Gain;
1603  0093 72ce001e      	ldw	x,[L31_sBLDC_Const+6.w]
1604  0097 ee04          	ldw	x,(4,x)
1607  0099 81            	ret	
1642                     ; 256 void  BLDC_Set_Speed_KD(s16 val)
1642                     ; 257 {
1643                     	switch	.text
1644  009a               _BLDC_Set_Speed_KD:
1648                     ; 258 	sBLDC_Struct.pBLDC_Const->pPID_Speed->pPID_Var->hKd_Gain = val;
1650  009a 5172ce001e51  	ldw	y,[L31_sBLDC_Const+6.w]
1651  00a0 90ef04        	ldw	(4,y),x
1652                     ; 259 }
1655  00a3 81            	ret	
1680                     ; 261 s16 BLDC_Get_Bus_Voltage(void)
1680                     ; 262 {
1681                     	switch	.text
1682  00a4               _BLDC_Get_Bus_Voltage:
1686                     ; 263         return (s16)(sBLDC_Struct.pBLDC_Var->hBusVoltage);
1688  00a4 be11          	ldw	x,L3_sBLDC_Var+17
1691  00a6 81            	ret	
1727                     ; 266 void  BLDC_Set_Bus_Voltage(s16 BusVoltage)
1727                     ; 267 {
1728                     	switch	.text
1729  00a7               _BLDC_Set_Bus_Voltage:
1733                     ; 268 	sBLDC_Struct.pBLDC_Var->hBusVoltage = BusVoltage;
1735  00a7 bf11          	ldw	L3_sBLDC_Var+17,x
1736                     ; 269 }
1739  00a9 81            	ret	
1764                     ; 271 u8 BLDC_Get_Heatsink_Temperature(void)
1764                     ; 272 {
1765                     	switch	.text
1766  00aa               _BLDC_Get_Heatsink_Temperature:
1770                     ; 273 	return (u8)(sBLDC_Struct.pBLDC_Var->bHeatsinkTemp);
1772  00aa b613          	ld	a,L3_sBLDC_Var+19
1775  00ac 81            	ret	
1811                     ; 276 void BLDC_Set_Heatsink_Temperature(u8 temp)
1811                     ; 277 {
1812                     	switch	.text
1813  00ad               _BLDC_Set_Heatsink_Temperature:
1817                     ; 278 	sBLDC_Struct.pBLDC_Var->bHeatsinkTemp = temp;
1819  00ad b713          	ld	L3_sBLDC_Var+19,a
1820                     ; 279 }
1823  00af 81            	ret	
1847                     ; 281 u8 BLDC_Get_FastDemag(void)
1847                     ; 282 {
1848                     	switch	.text
1849  00b0               _BLDC_Get_FastDemag:
1853                     ; 283 	return (u8)(sBLDC_Struct.pBLDC_Var->bFastDemag);
1855  00b0 b614          	ld	a,L3_sBLDC_Var+20
1858  00b2 81            	ret	
1893                     ; 286 void BLDC_Set_FastDemag(u8 temp)
1893                     ; 287 {
1894                     	switch	.text
1895  00b3               _BLDC_Set_FastDemag:
1899                     ; 289 		sBLDC_Struct.pBLDC_Var->bFastDemag = temp;
1901  00b3 b714          	ld	L3_sBLDC_Var+20,a
1902                     ; 293 }
1905  00b5 81            	ret	
1930                     ; 295 u8 BLDC_Get_ToggleMode(void)
1930                     ; 296 {
1931                     	switch	.text
1932  00b6               _BLDC_Get_ToggleMode:
1936                     ; 297 	return (u8)(sBLDC_Struct.pBLDC_Var->bToggleMode);
1938  00b6 b615          	ld	a,L3_sBLDC_Var+21
1941  00b8 81            	ret	
1977                     ; 300 void BLDC_Set_ToggleMode(u8 temp)
1977                     ; 301 {
1978                     	switch	.text
1979  00b9               _BLDC_Set_ToggleMode:
1983                     ; 302 	sBLDC_Struct.pBLDC_Var->bToggleMode = temp;
1985  00b9 b715          	ld	L3_sBLDC_Var+21,a
1986                     ; 303 }
1989  00bb 81            	ret	
2013                     ; 305 u8 BLDC_Get_AutoDelay(void)
2013                     ; 306 {
2014                     	switch	.text
2015  00bc               _BLDC_Get_AutoDelay:
2019                     ; 307 	return (u8)(sBLDC_Struct.pBLDC_Var->bAutoDelay);
2021  00bc b616          	ld	a,L3_sBLDC_Var+22
2024  00be 81            	ret	
2059                     ; 310 void BLDC_Set_AutoDelay(u8 temp)
2059                     ; 311 {
2060                     	switch	.text
2061  00bf               _BLDC_Set_AutoDelay:
2065                     ; 312 	sBLDC_Struct.pBLDC_Var->bAutoDelay = temp;
2067  00bf b716          	ld	L3_sBLDC_Var+22,a
2068                     ; 313 }
2071  00c1 81            	ret	
2167                     	xref	_PI_Regulator
2168                     	xdef	_BLDC_Set_AutoDelay
2169                     	xdef	_BLDC_Get_AutoDelay
2170                     	xdef	_BLDC_Set_ToggleMode
2171                     	xdef	_BLDC_Get_ToggleMode
2172                     	xdef	_BLDC_Set_FastDemag
2173                     	xdef	_BLDC_Get_FastDemag
2174                     	xdef	_BLDC_Set_Heatsink_Temperature
2175                     	xdef	_BLDC_Get_Heatsink_Temperature
2176                     	xdef	_BLDC_Set_Bus_Voltage
2177                     	xdef	_BLDC_Get_Bus_Voltage
2178                     	xdef	_BLDC_Set_Speed_KD
2179                     	xdef	_BLDC_Get_Speed_KD
2180                     	xdef	_BLDC_Set_Speed_KI
2181                     	xdef	_BLDC_Get_Speed_KI
2182                     	xdef	_BLDC_Set_Speed_KP
2183                     	xdef	_BLDC_Get_Speed_KP
2184                     	xdef	_BLDC_Set_MinimumOffTime
2185                     	xdef	_BLDC_Get_MinimumOffTime
2186                     	xdef	_BLDC_Set_Demag_Time
2187                     	xdef	_BLDC_Get_Demag_Time
2188                     	xdef	_BLDC_Set_Rising_Delay
2189                     	xdef	_BLDC_Get_Rising_Delay
2190                     	xdef	_BLDC_Set_Falling_Delay
2191                     	xdef	_BLDC_Get_Falling_Delay
2192                     	xdef	_BLDC_Set_Current_measured
2193                     	xdef	_BLDC_Get_Current_measured
2194                     	xdef	_BLDC_Set_Current_reference
2195                     	xdef	_BLDC_Get_Current_reference
2196                     	xdef	_BLDC_Set_Duty_cycle_cnt
2197                     	xdef	_BLDC_Get_Duty_cycle_cnt
2198                     	xdef	_BLDC_Set_Duty_cycle
2199                     	xdef	_BLDC_Get_Duty_cycle
2200                     	xdef	_BLDC_Get_Measured_rotor_speed
2201                     	xdef	_BLDC_Set_Target_rotor_speed
2202                     	xdef	_BLDC_Get_Target_rotor_speed
2203                     	xdef	_Get_BLDC_Const
2204                     	xdef	_Get_BLDC_Var
2205                     	xdef	_Get_BLDC_Struct
2206                     	xref.b	c_lreg
2207                     	xref.b	c_x
2208                     	xref.b	c_y
2227                     	xref	c_imul
2228                     	xref	c_umul
2229                     	xref	c_ludv
2230                     	xref	c_cmulx
2231                     	end
