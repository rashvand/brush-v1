   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
 128                     ; 26 errorcode fncallback_divby0(pvdev_regs_t pregs, pvdev_mems_t pmems)
 128                     ; 27 {
 130                     	switch	.text
 131  0000               _fncallback_divby0:
 133  0000 88            	push	a
 134       00000001      OFST:	set	1
 137                     ; 28 	errorcode ret = VDEV_ERROR_NONE;
 139                     ; 30 	return ret;
 141  0001 4f            	clr	a
 144  0002 5b01          	addw	sp,#1
 145  0004 81            	ret	
 158                     	xdef	_fncallback_divby0
 177                     	end
