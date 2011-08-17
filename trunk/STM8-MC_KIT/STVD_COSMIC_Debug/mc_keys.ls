   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
  19                     	bsct
  20  0000               L3_g_pUserInterface:
  21  0000 0000          	dc.w	0
  22  0002               L5_g_pdevice:
  23  0002 0000          	dc.w	0
  24  0004               _bEditMode:
  25  0004 00            	dc.b	0
 643                     ; 51 void keysInit(pvdev_device_t pdevice, PUserInterface_t pUserInterface)
 643                     ; 52 {
 645                     	switch	.text
 646  0000               _keysInit:
 648       00000000      OFST:	set	0
 651                     ; 53 	g_pdevice = pdevice;
 653  0000 bf02          	ldw	L5_g_pdevice,x
 654  0002 89            	pushw	x
 655                     ; 54 	g_pUserInterface = pUserInterface;
 657  0003 1e05          	ldw	x,(OFST+5,sp)
 658  0005 bf00          	ldw	L3_g_pUserInterface,x
 659                     ; 55 }
 662  0007 85            	popw	x
 663  0008 81            	ret	
 666                     	switch	.ubsct
 667  0000               L104_user_input:
 668  0000 00            	ds.b	1
 702                     ; 64 u8 keysRead (void)
 702                     ; 65 {
 703                     	switch	.text
 704  0009               _keysRead:
 708                     ; 67 	g_pdevice->ios.inp8(VDEV_INP8_USER_INPUT,&user_input);
 710  0009 ae0000        	ldw	x,#L104_user_input
 711  000c 89            	pushw	x
 712  000d ae0001        	ldw	x,#1
 713  0010 89            	pushw	x
 714  0011 5f            	clrw	x
 715  0012 89            	pushw	x
 716  0013 be02          	ldw	x,L5_g_pdevice
 717  0015 ee15          	ldw	x,(21,x)
 718  0017 fd            	call	(x)
 720  0018 5b06          	addw	sp,#6
 721                     ; 188 	bPrevious_key = NOKEY;
 723  001a 3f01          	clr	L7_bPrevious_key
 724                     ; 189 	return NOKEY;
 726  001c 4f            	clr	a
 729  001d 81            	ret	
 752                     ; 201 u8 keysProcess(void)
 752                     ; 202 {
 753                     	switch	.text
 754  001e               _keysProcess:
 758                     ; 204 		return NOKEY;
 760  001e 4f            	clr	a
 763  001f 81            	ret	
 820                     	switch	.ubsct
 821  0001               L7_bPrevious_key:
 822  0001 00            	ds.b	1
 823                     	xdef	_keysRead
 824                     	xdef	_keysProcess
 825                     	xdef	_keysInit
 826                     	xdef	_bEditMode
 846                     	end
