   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     	bsct
  20  0000               L7_g_vdevreg32:
  21  0000 0000          	dc.w	0
  22  0002               L31_g_vdevmem16:
  23  0002 0000          	dc.w	0
  24  0004               L51_g_vdevmem32:
  25  0004 0000          	dc.w	0
  85                     ; 74 errorcode vdev_init(void)
  85                     ; 75 {
  87                     	switch	.text
  88  0000               _vdev_init:
  90  0000 88            	push	a
  91       00000001      OFST:	set	1
  94                     ; 76 	errorcode ret = VDEV_ERROR_NONE;
  96                     ; 79 	device.regs.r8 = g_vdevreg8; 
  98  0001 ae005b        	ldw	x,#L3_g_vdevreg8
  99  0004 cf0000        	ldw	L12_device,x
 100                     ; 80 	device.regs.r8number = VDEV_REG8_NUMBER;
 102  0007 350c0006      	mov	L12_device+6,#12
 103                     ; 81 	device.regs.r16 = g_vdevreg16; 
 105  000b ae0047        	ldw	x,#L5_g_vdevreg16
 106  000e cf0002        	ldw	L12_device+2,x
 107                     ; 82 	device.regs.r16number = VDEV_REG16_NUMBER;
 109  0011 350a0007      	mov	L12_device+7,#10
 110                     ; 83 	device.regs.r32 = g_vdevreg32; 
 112  0015 be00          	ldw	x,L7_g_vdevreg32
 113  0017 cf0004        	ldw	L12_device+4,x
 114                     ; 84 	device.regs.r32number = VDEV_REG32_NUMBER;
 116  001a 725f0008      	clr	L12_device+8
 117                     ; 92 	device.mems.m8 = g_vdevmem8; 
 119  001e ae0026        	ldw	x,#L11_g_vdevmem8
 120  0021 cf0009        	ldw	L12_device+9,x
 121                     ; 93 	device.mems.m8size = VDEV_MEM8_SIZE;
 123  0024 ae0021        	ldw	x,#33
 124  0027 cf000f        	ldw	L12_device+15,x
 125                     ; 94 	device.mems.m16 = g_vdevreg16; 
 127  002a ae0047        	ldw	x,#L5_g_vdevreg16
 128  002d cf000b        	ldw	L12_device+11,x
 129                     ; 95 	device.mems.m16size = VDEV_MEM16_SIZE;
 131  0030 5f            	clrw	x
 132  0031 cf0011        	ldw	L12_device+17,x
 133                     ; 96 	device.mems.m32 = g_vdevreg32; 
 135  0034 be00          	ldw	x,L7_g_vdevreg32
 136  0036 cf000d        	ldw	L12_device+13,x
 137                     ; 97 	device.mems.m32size = VDEV_MEM32_SIZE;
 139  0039 5f            	clrw	x
 140  003a cf0013        	ldw	L12_device+19,x
 141                     ; 100 	device.ios.inp8 = vdev_fninp8;
 143  003d ae0000        	ldw	x,#_vdev_fninp8
 144  0040 cf0015        	ldw	L12_device+21,x
 145                     ; 101 	device.ios.inp16 = vdev_fninp16;
 147  0043 ae0000        	ldw	x,#_vdev_fninp16
 148  0046 cf0017        	ldw	L12_device+23,x
 149                     ; 102 	device.ios.inp32 = vdev_fninp32;
 151  0049 ae0000        	ldw	x,#_vdev_fninp32
 152  004c cf0019        	ldw	L12_device+25,x
 153                     ; 103 	device.ios.out8 = vdev_fnout8;
 155  004f ae0000        	ldw	x,#_vdev_fnout8
 156  0052 cf001b        	ldw	L12_device+27,x
 157                     ; 104 	device.ios.out16 = vdev_fnout16;
 159  0055 ae0000        	ldw	x,#_vdev_fnout16
 160  0058 cf001d        	ldw	L12_device+29,x
 161                     ; 105 	device.ios.out32 = vdev_fnout32;
 163  005b ae0000        	ldw	x,#_vdev_fnout32
 164  005e cf001f        	ldw	L12_device+31,x
 165                     ; 108 	device.callbacks.pfncallback = g_vdevcallback;          
 167  0061 ae0024        	ldw	x,#L71_g_vdevcallback
 168  0064 cf0021        	ldw	L12_device+33,x
 169                     ; 109 	device.callbacks.pfncallbacksize = VDEV_CALLBACK_NUMBER;
 171  0067 35010023      	mov	L12_device+35,#1
 172                     ; 111 	g_vdevcallback[VDEV_CALLBACK_DIVBY0_IDX] = fncallback_divby0;
 174  006b ae0000        	ldw	x,#_fncallback_divby0
 175  006e cf0024        	ldw	L71_g_vdevcallback,x
 176                     ; 118 	return ret;
 178  0071 4f            	clr	a
 181  0072 5b01          	addw	sp,#1
 182  0074 81            	ret	
 471                     ; 121 pvdev_device_t vdev_get(void)
 471                     ; 122 {
 472                     	switch	.text
 473  0075               _vdev_get:
 477                     ; 123 	return &device;
 479  0075 ae0000        	ldw	x,#L12_device
 482  0078 81            	ret	
 528                     ; 126 errorcode vdev_exec(pvdev_device_t pdevice)
 528                     ; 127 {
 529                     	switch	.text
 530  0079               _vdev_exec:
 532  0079 88            	push	a
 533       00000001      OFST:	set	1
 536                     ; 128 	errorcode ret = VDEV_ERROR_NONE;
 538                     ; 130 	return ret;
 540  007a 4f            	clr	a
 543  007b 5b01          	addw	sp,#1
 544  007d 81            	ret	
 641                     	switch	.bss
 642  0000               L12_device:
 643  0000 000000000000  	ds.b	36
 644  0024               L71_g_vdevcallback:
 645  0024 0000          	ds.b	2
 646  0026               L11_g_vdevmem8:
 647  0026 000000000000  	ds.b	33
 648  0047               L5_g_vdevreg16:
 649  0047 000000000000  	ds.b	20
 650  005b               L3_g_vdevreg8:
 651  005b 000000000000  	ds.b	12
 652                     	xref	_fncallback_divby0
 653                     	xdef	_vdev_exec
 654                     	xdef	_vdev_get
 655                     	xdef	_vdev_init
 656                     	xref	_vdev_fnout32
 657                     	xref	_vdev_fnout16
 658                     	xref	_vdev_fnout8
 659                     	xref	_vdev_fninp32
 660                     	xref	_vdev_fninp16
 661                     	xref	_vdev_fninp8
 681                     	end
