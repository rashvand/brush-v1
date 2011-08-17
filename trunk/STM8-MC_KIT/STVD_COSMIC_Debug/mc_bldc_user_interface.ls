   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     .const:	section	.text
  20  0000               _sEditExtraField_TAB_3_FIELD_0:
  22  0000 0000          	dc.w	_BLDC_Set_Target_rotor_speed
  23  0002 0dac          	dc.w	3500
  24  0004 f254          	dc.w	-3500
  25  0006 0032          	dc.w	50
  26  0008               _sEditExtraField_TAB_4_FIELD_0:
  28  0008 0000          	dc.w	_BLDC_Set_Falling_Delay
  29  000a 00ff          	dc.w	255
  30  000c 0000          	dc.w	0
  31  000e 000a          	dc.w	10
  32  0010               _sEditExtraField_TAB_4_FIELD_1:
  34  0010 0000          	dc.w	_BLDC_Set_Rising_Delay
  35  0012 00ff          	dc.w	255
  36  0014 0000          	dc.w	0
  37  0016 000a          	dc.w	10
  38  0018               _sEditExtraField_TAB_5_FIELD_0:
  40  0018 0000          	dc.w	_BLDC_Set_Current_reference
  41  001a 07d0          	dc.w	2000
  42  001c 0000          	dc.w	0
  43  001e 0001          	dc.w	1
  44  0020               _sEditExtraField_TAB_5_FIELD_1:
  46  0020 0000          	dc.w	_BLDC_Set_Duty_cycle
  47  0022 0064          	dc.w	100
  48  0024 0000          	dc.w	0
  49  0026 0002          	dc.w	2
  50  0028               _sEditExtraField_TAB_6_FIELD_0:
  52  0028 0000          	dc.w	_BLDC_Set_Speed_KP
  53  002a 00ff          	dc.w	255
  54  002c 0000          	dc.w	0
  55  002e 0001          	dc.w	1
  56  0030               _sEditExtraField_TAB_6_FIELD_1:
  58  0030 0000          	dc.w	_BLDC_Set_Speed_KI
  59  0032 00ff          	dc.w	255
  60  0034 0000          	dc.w	0
  61  0036 0001          	dc.w	1
  62  0038               _sEditExtraField_TAB_7_FIELD_0:
  64  0038 0000          	dc.w	_BLDC_Set_Speed_KD
  65  003a 00ff          	dc.w	255
  66  003c 0000          	dc.w	0
  67  003e 0001          	dc.w	1
  68  0040               _sEditExtraField_TAB_7_FIELD_1:
  70  0040 0000          	dc.w	_BLDC_Set_Demag_Time
  71  0042 0032          	dc.w	50
  72  0044 0005          	dc.w	5
  73  0046 0001          	dc.w	1
  74  0048               _sEditExtraField_TAB_10_FIELD_0:
  76  0048 0000          	dc.w	_BLDC_Set_FastDemag
  77  004a 0001          	dc.w	1
  78  004c 0000          	dc.w	0
  79  004e 0001          	dc.w	1
  80  0050               _sEditExtraField_TAB_10_FIELD_1:
  82  0050 0000          	dc.w	_BLDC_Set_ToggleMode
  83  0052 0001          	dc.w	1
  84  0054 0000          	dc.w	0
  85  0056 0001          	dc.w	1
  86  0058               _sEditExtraField_TAB_11_FIELD_0:
  88  0058 0000          	dc.w	_BLDC_Set_AutoDelay
  89  005a 0001          	dc.w	1
  90  005c 0000          	dc.w	0
  91  005e 0001          	dc.w	1
  92  0060               _sField_0:
  93  0060 025d          	dc.w	L3
  94  0062 00            	dc.b	0
  95  0063 01            	dc.b	1
  96  0064 05            	dc.b	5
  97  0065 0000          	dc.w	0
  98  0067 0000          	dc.w	0
  99  0069 024d          	dc.w	L5
 100  006b 00            	dc.b	0
 101  006c 01            	dc.b	1
 102  006d 05            	dc.b	5
 103  006e 0000          	dc.w	0
 104  0070 0000          	dc.w	0
 105  0072               _sField_1:
 106  0072 023d          	dc.w	L7
 107  0074 00            	dc.b	0
 108  0075 01            	dc.b	1
 109  0076 05            	dc.b	5
 110  0077 0000          	dc.w	0
 111  0079 0000          	dc.w	0
 112  007b 022d          	dc.w	L11
 113  007d 00            	dc.b	0
 114  007e 01            	dc.b	1
 115  007f 05            	dc.b	5
 116  0080 0000          	dc.w	0
 117  0082 0000          	dc.w	0
 118  0084               _sField_2:
 119  0084 021d          	dc.w	L31
 120  0086 00            	dc.b	0
 121  0087 01            	dc.b	1
 122  0088 05            	dc.b	5
 123  0089 0000          	dc.w	0
 124  008b 0000          	dc.w	0
 125  008d 020d          	dc.w	L51
 126  008f 00            	dc.b	0
 127  0090 01            	dc.b	1
 128  0091 05            	dc.b	5
 129  0092 0000          	dc.w	0
 130  0094 0000          	dc.w	0
 131  0096               _sField_3:
 132  0096 0204          	dc.w	L71
 133  0098 00            	dc.b	0
 134  0099 01            	dc.b	1
 135  009a 03            	dc.b	3
 137  009b 0000          	dc.w	_BLDC_Get_Target_rotor_speed
 138  009d 0000          	dc.w	_sEditExtraField_TAB_3_FIELD_0
 139  009f 01fb          	dc.w	L12
 140  00a1 00            	dc.b	0
 141  00a2 01            	dc.b	1
 142  00a3 03            	dc.b	3
 144  00a4 0000          	dc.w	_BLDC_Get_Measured_rotor_speed
 145  00a6 0000          	dc.w	0
 146  00a8               _sField_4:
 147  00a8 01f2          	dc.w	L32
 148  00aa 20            	dc.b	32
 149  00ab 00            	dc.b	0
 150  00ac 00            	dc.b	0
 152  00ad 0000          	dc.w	_BLDC_Get_Falling_Delay
 153  00af 0008          	dc.w	_sEditExtraField_TAB_4_FIELD_0
 154  00b1 01e9          	dc.w	L52
 155  00b3 20            	dc.b	32
 156  00b4 00            	dc.b	0
 157  00b5 00            	dc.b	0
 159  00b6 0000          	dc.w	_BLDC_Get_Rising_Delay
 160  00b8 0010          	dc.w	_sEditExtraField_TAB_4_FIELD_1
 161  00ba               _sField_5:
 162  00ba 01e0          	dc.w	L72
 163  00bc 41            	dc.b	65
 164  00bd 00            	dc.b	0
 165  00be 04            	dc.b	4
 167  00bf 0000          	dc.w	_BLDC_Get_Current_reference
 168  00c1 0018          	dc.w	_sEditExtraField_TAB_5_FIELD_0
 169  00c3 01d7          	dc.w	L13
 170  00c5 25            	dc.b	37
 171  00c6 00            	dc.b	0
 172  00c7 00            	dc.b	0
 174  00c8 0000          	dc.w	_BLDC_Get_Duty_cycle
 175  00ca 0020          	dc.w	_sEditExtraField_TAB_5_FIELD_1
 176  00cc               _sField_6:
 177  00cc 01ce          	dc.w	L33
 178  00ce 00            	dc.b	0
 179  00cf 00            	dc.b	0
 180  00d0 02            	dc.b	2
 182  00d1 0000          	dc.w	_BLDC_Get_Speed_KP
 183  00d3 0028          	dc.w	_sEditExtraField_TAB_6_FIELD_0
 184  00d5 01c5          	dc.w	L53
 185  00d7 00            	dc.b	0
 186  00d8 00            	dc.b	0
 187  00d9 02            	dc.b	2
 189  00da 0000          	dc.w	_BLDC_Get_Speed_KI
 190  00dc 0030          	dc.w	_sEditExtraField_TAB_6_FIELD_1
 191  00de               _sField_7:
 192  00de 01bc          	dc.w	L73
 193  00e0 00            	dc.b	0
 194  00e1 00            	dc.b	0
 195  00e2 02            	dc.b	2
 197  00e3 0000          	dc.w	_BLDC_Get_Speed_KD
 198  00e5 0038          	dc.w	_sEditExtraField_TAB_7_FIELD_0
 199  00e7 01b3          	dc.w	L14
 200  00e9 25            	dc.b	37
 201  00ea 00            	dc.b	0
 202  00eb 00            	dc.b	0
 204  00ec 0000          	dc.w	_BLDC_Get_Demag_Time
 205  00ee 0040          	dc.w	_sEditExtraField_TAB_7_FIELD_1
 206  00f0               _sField_8:
 207  00f0 01e0          	dc.w	L72
 208  00f2 41            	dc.b	65
 209  00f3 01            	dc.b	1
 210  00f4 04            	dc.b	4
 212  00f5 0000          	dc.w	_BLDC_Get_Current_reference
 213  00f7 0038          	dc.w	_sEditExtraField_TAB_7_FIELD_0
 214  00f9 01aa          	dc.w	L34
 215  00fb 41            	dc.b	65
 216  00fc 01            	dc.b	1
 217  00fd 04            	dc.b	4
 219  00fe 0000          	dc.w	_BLDC_Get_Current_measured
 220  0100 0000          	dc.w	0
 221  0102               _sField_9:
 222  0102 01a1          	dc.w	L54
 223  0104 56            	dc.b	86
 224  0105 01            	dc.b	1
 225  0106 02            	dc.b	2
 227  0107 0000          	dc.w	_BLDC_Get_Bus_Voltage
 228  0109 0000          	dc.w	0
 229  010b 0198          	dc.w	L74
 230  010d 43            	dc.b	67
 231  010e 01            	dc.b	1
 232  010f 00            	dc.b	0
 234  0110 0000          	dc.w	_BLDC_Get_Heatsink_Temperature
 235  0112 0000          	dc.w	0
 236  0114               _sField_10:
 237  0114 018f          	dc.w	L15
 238  0116 00            	dc.b	0
 239  0117 00            	dc.b	0
 240  0118 06            	dc.b	6
 242  0119 0000          	dc.w	_BLDC_Get_FastDemag
 243  011b 0048          	dc.w	_sEditExtraField_TAB_10_FIELD_0
 244  011d 0186          	dc.w	L35
 245  011f 00            	dc.b	0
 246  0120 00            	dc.b	0
 247  0121 06            	dc.b	6
 249  0122 0000          	dc.w	_BLDC_Get_ToggleMode
 250  0124 0050          	dc.w	_sEditExtraField_TAB_10_FIELD_1
 251  0126               _sField_11:
 252  0126 017d          	dc.w	L55
 253  0128 00            	dc.b	0
 254  0129 00            	dc.b	0
 255  012a 06            	dc.b	6
 257  012b 0000          	dc.w	_BLDC_Get_AutoDelay
 258  012d 0058          	dc.w	_sEditExtraField_TAB_11_FIELD_0
 259  012f 017c          	dc.w	L75
 260  0131 00            	dc.b	0
 261  0132 01            	dc.b	1
 262  0133 05            	dc.b	5
 263  0134 0000          	dc.w	0
 264  0136 0000          	dc.w	0
 265  0138               _sTab:
 266  0138 02            	dc.b	2
 267  0139 0060          	dc.w	_sField_0
 268  013b 02            	dc.b	2
 269  013c 0072          	dc.w	_sField_1
 270  013e 02            	dc.b	2
 271  013f 0084          	dc.w	_sField_2
 272  0141 02            	dc.b	2
 273  0142 0096          	dc.w	_sField_3
 274  0144 02            	dc.b	2
 275  0145 00a8          	dc.w	_sField_4
 276  0147 02            	dc.b	2
 277  0148 00ba          	dc.w	_sField_5
 278  014a 02            	dc.b	2
 279  014b 00cc          	dc.w	_sField_6
 280  014d 02            	dc.b	2
 281  014e 00de          	dc.w	_sField_7
 282  0150 02            	dc.b	2
 283  0151 00f0          	dc.w	_sField_8
 284  0153 02            	dc.b	2
 285  0154 0102          	dc.w	_sField_9
 286  0156 02            	dc.b	2
 287  0157 0114          	dc.w	_sField_10
 288  0159 02            	dc.b	2
 289  015a 0126          	dc.w	_sField_11
 290                     	bsct
 291  0000               _UserInterface:
 292  0000 00            	dc.b	0
 293  0001 00            	dc.b	0
 294  0002 0000          	dc.w	0
 295  0004 00            	dc.b	0
 296  0005 00            	dc.b	0
 297  0006 0c            	dc.b	12
 298  0007 0138          	dc.w	_sTab
 299  0009 03            	dc.b	3
 300  000a 016c          	dc.w	L16
 301  000c 015c          	dc.w	L36
 634                     ; 45 PUserInterface_t Get_UserInterface(void)
 634                     ; 46 {
 636                     	switch	.text
 637  0000               _Get_UserInterface:
 641                     ; 47 	return &UserInterface;
 643  0000 ae0000        	ldw	x,#_UserInterface
 646  0003 81            	ret	
 959                     	xdef	_UserInterface
 960                     	xdef	_sTab
 961                     	xdef	_sField_11
 962                     	xdef	_sField_10
 963                     	xdef	_sField_9
 964                     	xdef	_sField_8
 965                     	xdef	_sField_7
 966                     	xdef	_sField_6
 967                     	xdef	_sField_5
 968                     	xdef	_sField_4
 969                     	xdef	_sField_3
 970                     	xdef	_sField_2
 971                     	xdef	_sField_1
 972                     	xdef	_sField_0
 973                     	xdef	_sEditExtraField_TAB_11_FIELD_0
 974                     	xdef	_sEditExtraField_TAB_10_FIELD_1
 975                     	xdef	_sEditExtraField_TAB_10_FIELD_0
 976                     	xdef	_sEditExtraField_TAB_7_FIELD_1
 977                     	xdef	_sEditExtraField_TAB_7_FIELD_0
 978                     	xdef	_sEditExtraField_TAB_6_FIELD_1
 979                     	xdef	_sEditExtraField_TAB_6_FIELD_0
 980                     	xdef	_sEditExtraField_TAB_5_FIELD_1
 981                     	xdef	_sEditExtraField_TAB_5_FIELD_0
 982                     	xdef	_sEditExtraField_TAB_4_FIELD_1
 983                     	xdef	_sEditExtraField_TAB_4_FIELD_0
 984                     	xdef	_sEditExtraField_TAB_3_FIELD_0
 985                     	xref	_BLDC_Set_AutoDelay
 986                     	xref	_BLDC_Get_AutoDelay
 987                     	xref	_BLDC_Set_ToggleMode
 988                     	xref	_BLDC_Get_ToggleMode
 989                     	xref	_BLDC_Set_FastDemag
 990                     	xref	_BLDC_Get_FastDemag
 991                     	xref	_BLDC_Get_Heatsink_Temperature
 992                     	xref	_BLDC_Get_Bus_Voltage
 993                     	xref	_BLDC_Set_Speed_KD
 994                     	xref	_BLDC_Get_Speed_KD
 995                     	xref	_BLDC_Set_Speed_KI
 996                     	xref	_BLDC_Get_Speed_KI
 997                     	xref	_BLDC_Set_Speed_KP
 998                     	xref	_BLDC_Get_Speed_KP
 999                     	xref	_BLDC_Set_Demag_Time
1000                     	xref	_BLDC_Get_Demag_Time
1001                     	xref	_BLDC_Set_Rising_Delay
1002                     	xref	_BLDC_Get_Rising_Delay
1003                     	xref	_BLDC_Set_Falling_Delay
1004                     	xref	_BLDC_Get_Falling_Delay
1005                     	xref	_BLDC_Get_Current_measured
1006                     	xref	_BLDC_Set_Current_reference
1007                     	xref	_BLDC_Get_Current_reference
1008                     	xref	_BLDC_Set_Duty_cycle
1009                     	xref	_BLDC_Get_Duty_cycle
1010                     	xref	_BLDC_Get_Measured_rotor_speed
1011                     	xref	_BLDC_Set_Target_rotor_speed
1012                     	xref	_BLDC_Get_Target_rotor_speed
1013                     	xdef	_Get_UserInterface
1014                     	switch	.const
1015  015c               L36:
1016  015c 20424c444320  	dc.b	" BLDC  ver 1.0 ",0
1017  016c               L16:
1018  016c 2053544d3820  	dc.b	" STM8 ",150
1019  0173 204d43204b69  	dc.b	" MC Kit ",0
1020  017c               L75:
1021  017c 00            	dc.b	0
1022  017d               L55:
1023  017d 4175746f2044  	dc.b	"Auto Dly",0
1024  0186               L35:
1025  0186 546f67676c65  	dc.b	"Toggle  ",0
1026  018f               L15:
1027  018f 466173744465  	dc.b	"FastDemg",0
1028  0198               L74:
1029  0198 486561747369  	dc.b	"Heatsink",0
1030  01a1               L54:
1031  01a1 427573204443  	dc.b	"Bus DC  ",0
1032  01aa               L34:
1033  01aa 43757272206d  	dc.b	"Curr mes",0
1034  01b3               L14:
1035  01b3 44656d616754  	dc.b	"DemagTim",0
1036  01bc               L73:
1037  01bc 537065656420  	dc.b	"Speed KD",0
1038  01c5               L53:
1039  01c5 537065656420  	dc.b	"Speed KI",0
1040  01ce               L33:
1041  01ce 537065656420  	dc.b	"Speed KP",0
1042  01d7               L13:
1043  01d7 447574792063  	dc.b	"Duty cyc",0
1044  01e0               L72:
1045  01e0 437572722072  	dc.b	"Curr ref",0
1046  01e9               L52:
1047  01e9 526973652044  	dc.b	"Rise Dly",0
1048  01f2               L32:
1049  01f2 46616c6c2044  	dc.b	"Fall Dly",0
1050  01fb               L12:
1051  01fb 4d6561732e72  	dc.b	"Meas.rpm",0
1052  0204               L71:
1053  0204 546172672e72  	dc.b	"Targ.rpm",0
1054  020d               L51:
1055  020d 202020202020  	dc.b	"              ",16,0
1056  021d               L31:
1057  021d 4b6579201a    	dc.b	"Key ",26
1058  0222 2072756e206d  	dc.b	" run motor",0
1059  022d               L11:
1060  022d 181920636861  	dc.b	24,25,32,99,104,97
1061  0233 6e6765207661  	dc.b	"nge value",0
1062  023d               L7:
1063  023d 4a6f7953656c  	dc.b	"JoySel ",26
1064  0245 2073656c6563  	dc.b	" select",0
1065  024d               L5:
1066  024d 181920636861  	dc.b	24,25,32,99,104,97
1067  0253 6e6765206669  	dc.b	"nge field",0
1068  025d               L3:
1069  025d 1b1a20636861  	dc.b	27,26,32,99,104,97
1070  0263 6e6765207461  	dc.b	"nge tab",0
1090                     	end
