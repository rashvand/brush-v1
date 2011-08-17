   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  79                     ; 63 void FLASH_Unlock(FLASH_MemType_TypeDef MemType)
  79                     ; 64 {
  81                     	switch	.text
  82  0000               _FLASH_Unlock:
  86                     ; 66     assert_param(IS_MEMORY_TYPE_OK(MemType));
  88                     ; 69     if (MemType == FLASH_MEMTYPE_PROG)
  90  0000 4d            	tnz	a
  91  0001 2609          	jrne	L73
  92                     ; 71         FLASH->PUKR = FLASH_RASS_KEY1;
  94  0003 35565062      	mov	20578,#86
  95                     ; 72         FLASH->PUKR = FLASH_RASS_KEY2;
  97  0007 35ae5062      	mov	20578,#174
 100  000b 81            	ret	
 101  000c               L73:
 102                     ; 78         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 104  000c 35ae5064      	mov	20580,#174
 105                     ; 79         FLASH->DUKR = FLASH_RASS_KEY1;
 107  0010 35565064      	mov	20580,#86
 108                     ; 82 }
 111  0014 81            	ret	
 146                     ; 98 void FLASH_Lock(FLASH_MemType_TypeDef MemType)
 146                     ; 99 {
 147                     	switch	.text
 148  0015               _FLASH_Lock:
 152                     ; 101     assert_param(IS_MEMORY_TYPE_OK(MemType));
 154                     ; 104     if (MemType == FLASH_MEMTYPE_PROG)
 156  0015 4d            	tnz	a
 157  0016 2605          	jrne	L16
 158                     ; 106         FLASH->IAPSR = (u8)(~FLASH_IAPSR_PUL);
 160  0018 35fd505f      	mov	20575,#253
 163  001c 81            	ret	
 164  001d               L16:
 165                     ; 112         FLASH->IAPSR = (u8)(~FLASH_IAPSR_DUL);
 167  001d 35f7505f      	mov	20575,#247
 168                     ; 114 }
 171  0021 81            	ret	
 205                     ; 130 void FLASH_DeInit(void)
 205                     ; 131 {
 206                     	switch	.text
 207  0022               _FLASH_DeInit:
 209       00000001      OFST:	set	1
 212                     ; 132     u8 temp = 0;
 214                     ; 133     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 216  0022 725f505a      	clr	20570
 217                     ; 134     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 219  0026 725f505b      	clr	20571
 220                     ; 135     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 222  002a 35ff505c      	mov	20572,#255
 223                     ; 136     FLASH->IAPSR &= (u8)(~FLASH_IAPSR_DUL);
 225  002e 7217505f      	bres	20575,#3
 226                     ; 137     FLASH->IAPSR &= (u8)(~FLASH_IAPSR_PUL);
 228  0032 7213505f      	bres	20575,#1
 229                     ; 138     temp = FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 231  0036 c6505f        	ld	a,20575
 232                     ; 139 }
 235  0039 81            	ret	
 290                     ; 154 void FLASH_ITConfig(FunctionalState NewState)
 290                     ; 155 {
 291                     	switch	.text
 292  003a               _FLASH_ITConfig:
 296                     ; 156     if (NewState != DISABLE)
 298  003a 4d            	tnz	a
 299  003b 2705          	jreq	L131
 300                     ; 158         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 302  003d 7212505a      	bset	20570,#1
 305  0041 81            	ret	
 306  0042               L131:
 307                     ; 162         FLASH->CR1 &= (u8)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 309  0042 7213505a      	bres	20570,#1
 310                     ; 164 }
 313  0046 81            	ret	
 366                     ; 184 void FLASH_EraseBlock(u16 BlockNum, FLASH_MemType_TypeDef MemType)
 366                     ; 185 {
 367                     	switch	.text
 368  0047               _FLASH_EraseBlock:
 370  0047 89            	pushw	x
 371  0048 5204          	subw	sp,#4
 372       00000004      OFST:	set	4
 375                     ; 186     u32 StartAddress = 0;
 377                     ; 189     assert_param(IS_MEMORY_TYPE_OK(MemType));
 379                     ; 190     if (MemType == FLASH_MEMTYPE_PROG)
 381  004a 7b09          	ld	a,(OFST+5,sp)
 382  004c 2605          	jrne	L361
 383                     ; 192         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
 385                     ; 193         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
 387  004e ae8000        	ldw	x,#32768
 389  0051 2003          	jra	L561
 390  0053               L361:
 391                     ; 197         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
 393                     ; 198         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
 395  0053 ae4000        	ldw	x,#16384
 396  0056               L561:
 397  0056 1f03          	ldw	(OFST-1,sp),x
 398  0058 5f            	clrw	x
 399  0059 1f01          	ldw	(OFST-3,sp),x
 400                     ; 202     StartAddress = StartAddress + ((u32)BlockNum * FLASH_BLOCK_SIZE);
 402  005b a680          	ld	a,#128
 403  005d 1e05          	ldw	x,(OFST+1,sp)
 404  005f cd0000        	call	c_cmulx
 406  0062 96            	ldw	x,sp
 407  0063 5c            	incw	x
 408  0064 cd0000        	call	c_lgadd
 410                     ; 205     FLASH->CR2 |= FLASH_CR2_ERASE;
 412  0067 721a505b      	bset	20571,#5
 413                     ; 206     FLASH->NCR2 &= (u8)(~FLASH_NCR2_NERASE);
 415  006b 721b505c      	bres	20572,#5
 416                     ; 209     *((@far u8*) StartAddress) = FLASH_CLEAR_BYTE;
 418  006f 7b02          	ld	a,(OFST-2,sp)
 419  0071 b700          	ld	c_x,a
 420  0073 1e03          	ldw	x,(OFST-1,sp)
 421  0075 bf01          	ldw	c_x+1,x
 422  0077 4f            	clr	a
 423  0078 92bd0000      	ldf	[c_x.e],a
 424                     ; 210     *((@far u8*) StartAddress + 1) = FLASH_CLEAR_BYTE;
 427  007c 90ae0001      	ldw	y,#1
 428  0080 93            	ldw	x,y
 429  0081 92a70000      	ldf	([c_x.e],x),a
 430                     ; 211     *((@far u8*) StartAddress + 2) = FLASH_CLEAR_BYTE;
 433  0085 905c          	incw	y
 434  0087 93            	ldw	x,y
 435  0088 92a70000      	ldf	([c_x.e],x),a
 436                     ; 212     *((@far u8*) StartAddress + 3) = FLASH_CLEAR_BYTE;
 439  008c 905c          	incw	y
 440  008e 93            	ldw	x,y
 441  008f 92a70000      	ldf	([c_x.e],x),a
 442                     ; 219 }
 446  0093 5b06          	addw	sp,#6
 447  0095 81            	ret	
 481                     ; 238 void FLASH_EraseByte(u32 Address)
 481                     ; 239 {
 482                     	switch	.text
 483  0096               _FLASH_EraseByte:
 485       00000000      OFST:	set	0
 488                     ; 241     assert_param(IS_FLASH_ADDRESS_OK(Address));
 490                     ; 244     *((@far u8*) Address) = FLASH_CLEAR_BYTE; /* Erase byte */
 492  0096 7b04          	ld	a,(OFST+4,sp)
 493  0098 b700          	ld	c_x,a
 494  009a 1e05          	ldw	x,(OFST+5,sp)
 495  009c bf01          	ldw	c_x+1,x
 496  009e 4f            	clr	a
 497  009f 92bd0000      	ldf	[c_x.e],a
 498                     ; 248 }
 502  00a3 81            	ret	
 538                     ; 267 void FLASH_EraseOptionByte(u32 Address)
 538                     ; 268 {
 539                     	switch	.text
 540  00a4               _FLASH_EraseOptionByte:
 542       00000000      OFST:	set	0
 545                     ; 270     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 547                     ; 273     FLASH->CR2 |= FLASH_CR2_OPT;
 549  00a4 721e505b      	bset	20571,#7
 550                     ; 274     FLASH->NCR2 &= (u8)(~FLASH_NCR2_NOPT);
 552  00a8 721f505c      	bres	20572,#7
 553                     ; 278     *((@far u8*)Address) = FLASH_CLEAR_BYTE;
 555  00ac 7b04          	ld	a,(OFST+4,sp)
 556  00ae b700          	ld	c_x,a
 557  00b0 1e05          	ldw	x,(OFST+5,sp)
 558  00b2 bf01          	ldw	c_x+1,x
 559  00b4 4f            	clr	a
 560  00b5 92bd0000      	ldf	[c_x.e],a
 561                     ; 279     *((@far u8*)(Address + 1 )) = FLASH_SET_BYTE;
 564  00b9 96            	ldw	x,sp
 565  00ba 1c0003        	addw	x,#OFST+3
 566  00bd cd0000        	call	c_ltor
 568  00c0 4c            	inc	a
 569  00c1 cd0000        	call	c_ladc
 571  00c4 450100        	mov	c_x,c_lreg+1
 572  00c7 be02          	ldw	x,c_lreg+2
 573  00c9 bf01          	ldw	c_x+1,x
 574  00cb a6ff          	ld	a,#255
 575  00cd 92bd0000      	ldf	[c_x.e],a
 576                     ; 285     FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
 579  00d1 a601          	ld	a,#1
 580  00d3 cd0280        	call	_FLASH_WaitForLastOperation
 582                     ; 288     FLASH->CR2 &= (u8)(~FLASH_CR2_OPT);
 584  00d6 721f505b      	bres	20571,#7
 585                     ; 289     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 587  00da 721e505c      	bset	20572,#7
 588                     ; 290 }
 591  00de 81            	ret	
 695                     ; 318 void FLASH_ProgramBlock(u16 BlockNum, FLASH_MemType_TypeDef MemType, FLASH_ProgramMode_TypeDef ProgMode, u8 *Buffer)
 695                     ; 319 {
 696                     	switch	.text
 697  00df               _FLASH_ProgramBlock:
 699  00df 89            	pushw	x
 700  00e0 5206          	subw	sp,#6
 701       00000006      OFST:	set	6
 704                     ; 320     u16 Count = 0;
 706                     ; 321     u32 StartAddress = 0;
 708                     ; 324     assert_param(IS_MEMORY_TYPE_OK(MemType));
 710                     ; 325     assert_param(IS_FLASH_PROGRAM_MODE_OK(ProgMode));
 712                     ; 326     if (MemType == FLASH_MEMTYPE_PROG)
 714  00e2 7b0b          	ld	a,(OFST+5,sp)
 715  00e4 2605          	jrne	L572
 716                     ; 328         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
 718                     ; 329         StartAddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
 720  00e6 ae8000        	ldw	x,#32768
 722  00e9 2003          	jra	L772
 723  00eb               L572:
 724                     ; 333         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
 726                     ; 334         StartAddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
 728  00eb ae4000        	ldw	x,#16384
 729  00ee               L772:
 730  00ee 1f03          	ldw	(OFST-3,sp),x
 731  00f0 5f            	clrw	x
 732  00f1 1f01          	ldw	(OFST-5,sp),x
 733                     ; 338     StartAddress = StartAddress + ((u32)BlockNum * FLASH_BLOCK_SIZE);
 735  00f3 a680          	ld	a,#128
 736  00f5 1e07          	ldw	x,(OFST+1,sp)
 737  00f7 cd0000        	call	c_cmulx
 739  00fa 96            	ldw	x,sp
 740  00fb 5c            	incw	x
 741  00fc cd0000        	call	c_lgadd
 743                     ; 341     if (ProgMode == FLASH_PROGRAMMODE_STANDARD)
 745  00ff 7b0c          	ld	a,(OFST+6,sp)
 746  0101 260a          	jrne	L103
 747                     ; 344         FLASH->CR2 |= FLASH_CR2_PRG;
 749  0103 7210505b      	bset	20571,#0
 750                     ; 345         FLASH->NCR2 &= (u8)(~FLASH_NCR2_NPRG);
 752  0107 7211505c      	bres	20572,#0
 754  010b 2008          	jra	L303
 755  010d               L103:
 756                     ; 350         FLASH->CR2 |= FLASH_CR2_FPRG;
 758  010d 7218505b      	bset	20571,#4
 759                     ; 351         FLASH->NCR2 &= (u8)(~FLASH_NCR2_NFPRG);
 761  0111 7219505c      	bres	20572,#4
 762  0115               L303:
 763                     ; 355     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 765  0115 5f            	clrw	x
 766  0116 1f05          	ldw	(OFST-1,sp),x
 767  0118               L503:
 768                     ; 357         *((u8*)StartAddress + Count) = ((u8)(Buffer[Count]));
 770  0118 1e0d          	ldw	x,(OFST+7,sp)
 771  011a 72fb05        	addw	x,(OFST-1,sp)
 772  011d f6            	ld	a,(x)
 773  011e 1e03          	ldw	x,(OFST-3,sp)
 774  0120 72fb05        	addw	x,(OFST-1,sp)
 775  0123 f7            	ld	(x),a
 776                     ; 355     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 778  0124 1e05          	ldw	x,(OFST-1,sp)
 779  0126 5c            	incw	x
 780  0127 1f05          	ldw	(OFST-1,sp),x
 783  0129 a30080        	cpw	x,#128
 784  012c 25ea          	jrult	L503
 785                     ; 359 }
 788  012e 5b08          	addw	sp,#8
 789  0130 81            	ret	
 832                     ; 381 void FLASH_ProgramByte(u32 Address, u8 Data)
 832                     ; 382 {
 833                     	switch	.text
 834  0131               _FLASH_ProgramByte:
 836       00000000      OFST:	set	0
 839                     ; 384     assert_param(IS_FLASH_ADDRESS_OK(Address));
 841                     ; 387     *((@far u8*) Address) = Data;
 843  0131 7b07          	ld	a,(OFST+7,sp)
 844  0133 88            	push	a
 845  0134 7b05          	ld	a,(OFST+5,sp)
 846  0136 b700          	ld	c_x,a
 847  0138 1e06          	ldw	x,(OFST+6,sp)
 848  013a bf01          	ldw	c_x+1,x
 849  013c 84            	pop	a
 850  013d 92bd0000      	ldf	[c_x.e],a
 851                     ; 391 }
 854  0141 81            	ret	
 899                     ; 411 void FLASH_ProgramOptionByte(u32 Address, u8 Data)
 899                     ; 412 {
 900                     	switch	.text
 901  0142               _FLASH_ProgramOptionByte:
 903       00000000      OFST:	set	0
 906                     ; 414     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 908                     ; 417     FLASH->CR2 |= FLASH_CR2_OPT;
 910  0142 721e505b      	bset	20571,#7
 911                     ; 418     FLASH->NCR2 &= (u8)(~FLASH_NCR2_NOPT);
 913  0146 721f505c      	bres	20572,#7
 914                     ; 422     *((@far u8*)Address) = Data;
 916  014a 7b07          	ld	a,(OFST+7,sp)
 917  014c 88            	push	a
 918  014d 7b05          	ld	a,(OFST+5,sp)
 919  014f b700          	ld	c_x,a
 920  0151 1e06          	ldw	x,(OFST+6,sp)
 921  0153 bf01          	ldw	c_x+1,x
 922  0155 84            	pop	a
 923  0156 92bd0000      	ldf	[c_x.e],a
 924                     ; 423     *((@far u8*)(Address + 1)) = (u8)(~Data);
 926  015a 96            	ldw	x,sp
 927  015b 1c0003        	addw	x,#OFST+3
 928  015e cd0000        	call	c_ltor
 930  0161 a601          	ld	a,#1
 931  0163 cd0000        	call	c_ladc
 933  0166 450100        	mov	c_x,c_lreg+1
 934  0169 be02          	ldw	x,c_lreg+2
 935  016b bf01          	ldw	c_x+1,x
 936  016d 7b07          	ld	a,(OFST+7,sp)
 937  016f 43            	cpl	a
 938  0170 92bd0000      	ldf	[c_x.e],a
 939                     ; 429     FLASH_WaitForLastOperation(FLASH_MEMTYPE_DATA);
 941  0174 a601          	ld	a,#1
 942  0176 cd0280        	call	_FLASH_WaitForLastOperation
 944                     ; 432     FLASH->CR2 &= (u8)(~FLASH_CR2_OPT);
 946  0179 721f505b      	bres	20571,#7
 947                     ; 433     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 949  017d 721e505c      	bset	20572,#7
 950                     ; 434 }
 953  0181 81            	ret	
 996                     ; 456 void FLASH_ProgramWord(u32 Address, u32 Data)
 996                     ; 457 {
 997                     	switch	.text
 998  0182               _FLASH_ProgramWord:
1000       00000000      OFST:	set	0
1003                     ; 459     assert_param(IS_FLASH_ADDRESS_OK(Address));
1005                     ; 462     FLASH->CR2 |= FLASH_CR2_WPRG;
1007  0182 721c505b      	bset	20571,#6
1008                     ; 463     FLASH->NCR2 &= (u8)(~FLASH_NCR2_NWPRG);
1010  0186 721d505c      	bres	20572,#6
1011                     ; 466     *((@far u8*)Address) = BYTE_0(Data); /* Write one byte */
1013  018a 7b0a          	ld	a,(OFST+10,sp)
1014  018c 88            	push	a
1015  018d 7b05          	ld	a,(OFST+5,sp)
1016  018f b700          	ld	c_x,a
1017  0191 1e06          	ldw	x,(OFST+6,sp)
1018  0193 bf01          	ldw	c_x+1,x
1019  0195 84            	pop	a
1020  0196 92bd0000      	ldf	[c_x.e],a
1021                     ; 467     *(((@far u8*)Address) + 1) = BYTE_1(Data); /* Write one byte */
1023  019a 7b09          	ld	a,(OFST+9,sp)
1024  019c 88            	push	a
1025  019d 7b05          	ld	a,(OFST+5,sp)
1026  019f b700          	ld	c_x,a
1027  01a1 1e06          	ldw	x,(OFST+6,sp)
1028  01a3 bf01          	ldw	c_x+1,x
1029  01a5 90ae0001      	ldw	y,#1
1030  01a9 93            	ldw	x,y
1031  01aa 84            	pop	a
1032  01ab 92a70000      	ldf	([c_x.e],x),a
1033                     ; 468     *(((@far u8*)Address) + 2) = BYTE_2(Data); /* Write one byte */
1035  01af 7b08          	ld	a,(OFST+8,sp)
1036  01b1 88            	push	a
1037  01b2 7b05          	ld	a,(OFST+5,sp)
1038  01b4 b700          	ld	c_x,a
1039  01b6 1e06          	ldw	x,(OFST+6,sp)
1040  01b8 bf01          	ldw	c_x+1,x
1041  01ba 905c          	incw	y
1042  01bc 93            	ldw	x,y
1043  01bd 84            	pop	a
1044  01be 92a70000      	ldf	([c_x.e],x),a
1045                     ; 469     *(((@far u8*)Address) + 3) = BYTE_3(Data); /* Write one byte */
1047  01c2 7b07          	ld	a,(OFST+7,sp)
1048  01c4 88            	push	a
1049  01c5 7b05          	ld	a,(OFST+5,sp)
1050  01c7 b700          	ld	c_x,a
1051  01c9 1e06          	ldw	x,(OFST+6,sp)
1052  01cb bf01          	ldw	c_x+1,x
1053  01cd 905c          	incw	y
1054  01cf 93            	ldw	x,y
1055  01d0 84            	pop	a
1056  01d1 92a70000      	ldf	([c_x.e],x),a
1057                     ; 476 }
1060  01d5 81            	ret	
1094                     ; 492 u8 FLASH_ReadByte(u32 Address)
1094                     ; 493 {
1095                     	switch	.text
1096  01d6               _FLASH_ReadByte:
1098       00000000      OFST:	set	0
1101                     ; 495     assert_param(IS_FLASH_ADDRESS_OK(Address));
1103                     ; 498     return(*((@far u8*) Address)); /* Read byte */
1105  01d6 7b04          	ld	a,(OFST+4,sp)
1106  01d8 b700          	ld	c_x,a
1107  01da 1e05          	ldw	x,(OFST+5,sp)
1108  01dc bf01          	ldw	c_x+1,x
1109  01de 92bc0000      	ldf	a,[c_x.e]
1112  01e2 81            	ret	
1175                     ; 518 u16 FLASH_ReadOptionByte(u32 Address)
1175                     ; 519 {
1176                     	switch	.text
1177  01e3               _FLASH_ReadOptionByte:
1179  01e3 5204          	subw	sp,#4
1180       00000004      OFST:	set	4
1183                     ; 520     u8 value_optbyte, value_optbyte_complement = 0;
1185                     ; 521     u16 res_value = 0;
1187                     ; 524     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1189                     ; 527     value_optbyte = *((@far u8*)Address); /* Read option byte */
1191  01e5 7b08          	ld	a,(OFST+4,sp)
1192  01e7 b700          	ld	c_x,a
1193  01e9 1e09          	ldw	x,(OFST+5,sp)
1194  01eb bf01          	ldw	c_x+1,x
1195  01ed 92bc0000      	ldf	a,[c_x.e]
1196  01f1 6b01          	ld	(OFST-3,sp),a
1197                     ; 528     value_optbyte_complement = *(((@far u8*)Address) + 1); /* Read option byte complement*/
1199  01f3 90ae0001      	ldw	y,#1
1200  01f7 93            	ldw	x,y
1201  01f8 92af0000      	ldf	a,([c_x.e],x)
1202  01fc 6b02          	ld	(OFST-2,sp),a
1203                     ; 534     if (value_optbyte == (u8)(~value_optbyte_complement))
1205  01fe 43            	cpl	a
1206  01ff 1101          	cp	a,(OFST-3,sp)
1207  0201 2614          	jrne	L154
1208                     ; 536         res_value = (u16)((u16)value_optbyte << 8);
1210  0203 7b01          	ld	a,(OFST-3,sp)
1211  0205 97            	ld	xl,a
1212  0206 4f            	clr	a
1213  0207 02            	rlwa	x,a
1214  0208 1f03          	ldw	(OFST-1,sp),x
1215                     ; 537         res_value = res_value | (u16)value_optbyte_complement;
1217  020a 5f            	clrw	x
1218  020b 7b02          	ld	a,(OFST-2,sp)
1219  020d 97            	ld	xl,a
1220  020e 01            	rrwa	x,a
1221  020f 1a04          	or	a,(OFST+0,sp)
1222  0211 01            	rrwa	x,a
1223  0212 1a03          	or	a,(OFST-1,sp)
1224  0214 01            	rrwa	x,a
1226  0215 2003          	jra	L354
1227  0217               L154:
1228                     ; 541         res_value = FLASH_OPTIONBYTE_ERROR;
1230  0217 ae5555        	ldw	x,#21845
1231  021a               L354:
1232                     ; 544     return(res_value);
1236  021a 5b04          	addw	sp,#4
1237  021c 81            	ret	
1311                     ; 561 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef LPMode)
1311                     ; 562 {
1312                     	switch	.text
1313  021d               _FLASH_SetLowPowerMode:
1315  021d 88            	push	a
1316       00000000      OFST:	set	0
1319                     ; 564     assert_param(IS_FLASH_LOW_POWER_MODE_OK(LPMode));
1321                     ; 566     FLASH->CR1 &= (u8)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); /* Clears the two bits */
1323  021e c6505a        	ld	a,20570
1324  0221 a4f3          	and	a,#243
1325  0223 c7505a        	ld	20570,a
1326                     ; 567     FLASH->CR1 |= (u8)LPMode; /* Sets the new mode */
1328  0226 c6505a        	ld	a,20570
1329  0229 1a01          	or	a,(OFST+1,sp)
1330  022b c7505a        	ld	20570,a
1331                     ; 568 }
1334  022e 84            	pop	a
1335  022f 81            	ret	
1393                     ; 584 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef ProgTime)
1393                     ; 585 {
1394                     	switch	.text
1395  0230               _FLASH_SetProgrammingTime:
1399                     ; 587     assert_param(IS_FLASH_PROGRAM_TIME_OK(ProgTime));
1401                     ; 589     FLASH->CR1 &= (u8)(~FLASH_CR1_FIX);
1403  0230 7211505a      	bres	20570,#0
1404                     ; 590     FLASH->CR1 |= (u8)ProgTime;
1406  0234 ca505a        	or	a,20570
1407  0237 c7505a        	ld	20570,a
1408                     ; 591 }
1411  023a 81            	ret	
1436                     ; 608 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1436                     ; 609 {
1437                     	switch	.text
1438  023b               _FLASH_GetLowPowerMode:
1442                     ; 610     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1444  023b c6505a        	ld	a,20570
1445  023e a40c          	and	a,#12
1448  0240 81            	ret	
1473                     ; 628 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1473                     ; 629 {
1474                     	switch	.text
1475  0241               _FLASH_GetProgrammingTime:
1479                     ; 630     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1481  0241 c6505a        	ld	a,20570
1482  0244 a401          	and	a,#1
1485  0246 81            	ret	
1519                     ; 648 u32 FLASH_GetBootSize(void)
1519                     ; 649 {
1520                     	switch	.text
1521  0247               _FLASH_GetBootSize:
1523  0247 5204          	subw	sp,#4
1524       00000004      OFST:	set	4
1527                     ; 650     u32 temp = 0;
1529                     ; 653     temp = (u32)((u32)FLASH->FPR * (u32)512);
1531  0249 c6505d        	ld	a,20573
1532  024c 5f            	clrw	x
1533  024d 97            	ld	xl,a
1534  024e 90ae0200      	ldw	y,#512
1535  0252 cd0000        	call	c_umul
1537  0255 96            	ldw	x,sp
1538  0256 5c            	incw	x
1539  0257 cd0000        	call	c_rtol
1541                     ; 656     if (FLASH->FPR == 0xFF)
1543  025a c6505d        	ld	a,20573
1544  025d 4c            	inc	a
1545  025e 260d          	jrne	L375
1546                     ; 658         temp += 512;
1548  0260 ae0200        	ldw	x,#512
1549  0263 bf02          	ldw	c_lreg+2,x
1550  0265 5f            	clrw	x
1551  0266 bf00          	ldw	c_lreg,x
1552  0268 96            	ldw	x,sp
1553  0269 5c            	incw	x
1554  026a cd0000        	call	c_lgadd
1556  026d               L375:
1557                     ; 662     return(temp);
1559  026d 96            	ldw	x,sp
1560  026e 5c            	incw	x
1561  026f cd0000        	call	c_ltor
1565  0272 5b04          	addw	sp,#4
1566  0274 81            	ret	
1675                     ; 682 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1675                     ; 683 {
1676                     	switch	.text
1677  0275               _FLASH_GetFlagStatus:
1679  0275 88            	push	a
1680       00000001      OFST:	set	1
1683                     ; 684     FlagStatus status = RESET;
1685                     ; 686     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1687                     ; 689     if ((FLASH->IAPSR & (u8)FLASH_FLAG) != (u8)RESET)
1689  0276 c4505f        	and	a,20575
1690  0279 2702          	jreq	L546
1691                     ; 691         status = SET; /* FLASH_FLAG is set */
1693  027b a601          	ld	a,#1
1695  027d               L546:
1696                     ; 695         status = RESET; /* FLASH_FLAG is reset*/
1698                     ; 699     return status;
1702  027d 5b01          	addw	sp,#1
1703  027f 81            	ret	
1788                     ; 717 FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef MemType)
1788                     ; 718 {
1789                     	switch	.text
1790  0280               _FLASH_WaitForLastOperation:
1792  0280 5205          	subw	sp,#5
1793       00000005      OFST:	set	5
1796                     ; 719     u32 timeout = 2000;
1798  0282 ae07d0        	ldw	x,#2000
1799  0285 1f03          	ldw	(OFST-2,sp),x
1800  0287 5f            	clrw	x
1801  0288 1f01          	ldw	(OFST-4,sp),x
1802                     ; 720     u8 flagstatus = 0x00;
1804  028a 0f05          	clr	(OFST+0,sp)
1805                     ; 722     if (MemType == FLASH_MEMTYPE_PROG)
1807  028c 4d            	tnz	a
1808  028d 262b          	jrne	L727
1810  028f 200e          	jra	L517
1811  0291               L317:
1812                     ; 726             flagstatus = (u8)(FLASH->IAPSR & (FLASH_IAPSR_EOP |
1812                     ; 727                                                  FLASH_IAPSR_WR_PG_DIS));
1814  0291 c6505f        	ld	a,20575
1815  0294 a405          	and	a,#5
1816  0296 6b05          	ld	(OFST+0,sp),a
1817                     ; 728             timeout--;
1819  0298 96            	ldw	x,sp
1820  0299 5c            	incw	x
1821  029a a601          	ld	a,#1
1822  029c cd0000        	call	c_lgsbc
1824  029f               L517:
1825                     ; 724         while ((flagstatus == 0x00) && (timeout != 0x00))
1827  029f 7b05          	ld	a,(OFST+0,sp)
1828  02a1 2622          	jrne	L327
1830  02a3 96            	ldw	x,sp
1831  02a4 5c            	incw	x
1832  02a5 cd0000        	call	c_lzmp
1834  02a8 26e7          	jrne	L317
1835  02aa 2019          	jra	L327
1836  02ac               L527:
1837                     ; 735             flagstatus = (u8)(FLASH->IAPSR & (FLASH_IAPSR_HVOFF |
1837                     ; 736                                                  FLASH_IAPSR_WR_PG_DIS));
1839  02ac c6505f        	ld	a,20575
1840  02af a441          	and	a,#65
1841  02b1 6b05          	ld	(OFST+0,sp),a
1842                     ; 737             timeout--;
1844  02b3 96            	ldw	x,sp
1845  02b4 5c            	incw	x
1846  02b5 a601          	ld	a,#1
1847  02b7 cd0000        	call	c_lgsbc
1849  02ba               L727:
1850                     ; 733         while ((flagstatus == 0x00) && (timeout != 0x00))
1852  02ba 7b05          	ld	a,(OFST+0,sp)
1853  02bc 2607          	jrne	L327
1855  02be 96            	ldw	x,sp
1856  02bf 5c            	incw	x
1857  02c0 cd0000        	call	c_lzmp
1859  02c3 26e7          	jrne	L527
1860  02c5               L327:
1861                     ; 740     if (timeout == 0x00 )
1863  02c5 96            	ldw	x,sp
1864  02c6 5c            	incw	x
1865  02c7 cd0000        	call	c_lzmp
1867  02ca 2604          	jrne	L537
1868                     ; 742         flagstatus = FLASH_STATUS_TIMEOUT;
1870  02cc a602          	ld	a,#2
1871  02ce 6b05          	ld	(OFST+0,sp),a
1872  02d0               L537:
1873                     ; 745     return((FLASH_Status_TypeDef)flagstatus);
1875  02d0 7b05          	ld	a,(OFST+0,sp)
1878  02d2 5b05          	addw	sp,#5
1879  02d4 81            	ret	
1892                     	xdef	_FLASH_WaitForLastOperation
1893                     	xdef	_FLASH_GetFlagStatus
1894                     	xdef	_FLASH_GetBootSize
1895                     	xdef	_FLASH_GetProgrammingTime
1896                     	xdef	_FLASH_GetLowPowerMode
1897                     	xdef	_FLASH_SetProgrammingTime
1898                     	xdef	_FLASH_SetLowPowerMode
1899                     	xdef	_FLASH_ReadOptionByte
1900                     	xdef	_FLASH_ReadByte
1901                     	xdef	_FLASH_ProgramWord
1902                     	xdef	_FLASH_ProgramOptionByte
1903                     	xdef	_FLASH_ProgramByte
1904                     	xdef	_FLASH_ProgramBlock
1905                     	xdef	_FLASH_EraseOptionByte
1906                     	xdef	_FLASH_EraseByte
1907                     	xdef	_FLASH_EraseBlock
1908                     	xdef	_FLASH_ITConfig
1909                     	xdef	_FLASH_DeInit
1910                     	xdef	_FLASH_Lock
1911                     	xdef	_FLASH_Unlock
1912                     	xref.b	c_lreg
1913                     	xref.b	c_x
1914                     	xref.b	c_y
1933                     	xref	c_lzmp
1934                     	xref	c_lgsbc
1935                     	xref	c_rtol
1936                     	xref	c_umul
1937                     	xref	c_ladc
1938                     	xref	c_ltor
1939                     	xref	c_lgadd
1940                     	xref	c_cmulx
1941                     	end
