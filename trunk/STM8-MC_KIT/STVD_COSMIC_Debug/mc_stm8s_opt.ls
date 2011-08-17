   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  81                     ; 32 void dev_optInit(void)
  81                     ; 33 {
  83                     	switch	.text
  84  0000               _dev_optInit:
  86  0000 5203          	subw	sp,#3
  87       00000003      OFST:	set	3
  90                     ; 39 	for (i=0;i<5000;i++);
  92  0002 5f            	clrw	x
  93  0003               L73:
  97  0003 5c            	incw	x
 100  0004 a31388        	cpw	x,#5000
 101  0007 25fa          	jrult	L73
 102  0009 1f02          	ldw	(OFST-1,sp),x
 103                     ; 42 	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
 105  000b 4f            	clr	a
 106  000c cd0000        	call	_FLASH_SetProgrammingTime
 108                     ; 45 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
 110  000f a601          	ld	a,#1
 111  0011 cd0000        	call	_FLASH_Unlock
 113                     ; 53 		if (FLASH_ReadOptionByte(0x480D) != 0x00FF)
 115  0014 ae480d        	ldw	x,#18445
 116  0017 89            	pushw	x
 117  0018 5f            	clrw	x
 118  0019 89            	pushw	x
 119  001a cd0000        	call	_FLASH_ReadOptionByte
 121  001d 5b04          	addw	sp,#4
 122  001f a300ff        	cpw	x,#255
 123  0022 270d          	jreq	L54
 124                     ; 55 			FLASH_ProgramOptionByte(0x480D, 0x00); // Set 0 Wait State
 126  0024 4b00          	push	#0
 127  0026 ae480d        	ldw	x,#18445
 128  0029 89            	pushw	x
 129  002a 5f            	clrw	x
 130  002b 89            	pushw	x
 131  002c cd0000        	call	_FLASH_ProgramOptionByte
 133  002f 5b05          	addw	sp,#5
 134  0031               L54:
 135                     ; 59 	Opt = 0;
 137                     ; 62 		Opt |= 0x20;
 139  0031 a620          	ld	a,#32
 140                     ; 70 		Opt &= (u8)(~0x02);
 142  0033 a4fd          	and	a,#253
 143  0035 6b01          	ld	(OFST-2,sp),a
 144                     ; 73 	OptComp = (u8)(~Opt) | (Opt << 8);
 146  0037 ae20df        	ldw	x,#8415
 147  003a 1f02          	ldw	(OFST-1,sp),x
 148                     ; 75 	if (OptComp != FLASH_ReadOptionByte(0x4803))
 150  003c ae4803        	ldw	x,#18435
 151  003f 89            	pushw	x
 152  0040 5f            	clrw	x
 153  0041 89            	pushw	x
 154  0042 cd0000        	call	_FLASH_ReadOptionByte
 156  0045 5b04          	addw	sp,#4
 157  0047 1302          	cpw	x,(OFST-1,sp)
 158  0049 270e          	jreq	L74
 159                     ; 77 		FLASH_ProgramOptionByte(0x4803, Opt );
 161  004b 7b01          	ld	a,(OFST-2,sp)
 162  004d 88            	push	a
 163  004e ae4803        	ldw	x,#18435
 164  0051 89            	pushw	x
 165  0052 5f            	clrw	x
 166  0053 89            	pushw	x
 167  0054 cd0000        	call	_FLASH_ProgramOptionByte
 169  0057 5b05          	addw	sp,#5
 170  0059               L74:
 171                     ; 81 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 173  0059 a601          	ld	a,#1
 174  005b cd0000        	call	_FLASH_Lock
 176                     ; 82 }
 179  005e 5b03          	addw	sp,#3
 180  0060 81            	ret	
 193                     	xdef	_dev_optInit
 194                     	xref	_FLASH_SetProgrammingTime
 195                     	xref	_FLASH_ReadOptionByte
 196                     	xref	_FLASH_ProgramOptionByte
 197                     	xref	_FLASH_Lock
 198                     	xref	_FLASH_Unlock
 217                     	end
