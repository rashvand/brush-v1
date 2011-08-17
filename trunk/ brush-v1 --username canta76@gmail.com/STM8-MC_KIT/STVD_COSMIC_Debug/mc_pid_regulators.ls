   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.10 - 10 Feb 2011
   3                     ; Generator (Limited) V4.3.6 - 15 Feb 2011
   4                     ; Optimizer V4.3.5 - 15 Feb 2011
 269                     ; 31 s16 PI_Regulator(s16 hReference, s16 hPresentFeedback, PPID_Struct_t PID_Struct)
 269                     ; 32 {
 271                     	switch	.text
 272  0000               _PI_Regulator:
 274  0000 89            	pushw	x
 275  0001 5218          	subw	sp,#24
 276       00000018      OFST:	set	24
 279                     ; 37   wError= (s32)(hReference - hPresentFeedback);
 281  0003 72f01d        	subw	x,(OFST+5,sp)
 282  0006 cd0000        	call	c_itolx
 284  0009 96            	ldw	x,sp
 285  000a 1c0011        	addw	x,#OFST-7
 286  000d cd0000        	call	c_rtol
 288                     ; 40   wProportional_Term = PID_Struct->pPID_Var->hKp_Gain * wError;
 290  0010 1e1f          	ldw	x,(OFST+7,sp)
 291  0012 fe            	ldw	x,(x)
 292  0013 fe            	ldw	x,(x)
 293  0014 cd0000        	call	c_itolx
 295  0017 96            	ldw	x,sp
 296  0018 1c0011        	addw	x,#OFST-7
 297  001b cd0000        	call	c_lmul
 299  001e 96            	ldw	x,sp
 300  001f 1c000d        	addw	x,#OFST-11
 301  0022 cd0000        	call	c_rtol
 303                     ; 43   if (PID_Struct->pPID_Var->hKi_Gain == 0)
 305  0025 1e1f          	ldw	x,(OFST+7,sp)
 306  0027 fe            	ldw	x,(x)
 307  0028 e603          	ld	a,(3,x)
 308  002a ea02          	or	a,(2,x)
 309  002c 260c          	jrne	L151
 310                     ; 45     PID_Struct->pPID_Var->wIntegral = 0;
 312  002e 1e1f          	ldw	x,(OFST+7,sp)
 313  0030 fe            	ldw	x,(x)
 314  0031 e708          	ld	(8,x),a
 315  0033 e709          	ld	(9,x),a
 316  0035 e707          	ld	(7,x),a
 318  0037 cc0111        	jp	LC002
 319  003a               L151:
 320                     ; 49     wIntegral_Term = PID_Struct->pPID_Var->hKi_Gain * wError;
 322  003a 1e1f          	ldw	x,(OFST+7,sp)
 323  003c fe            	ldw	x,(x)
 324  003d ee02          	ldw	x,(2,x)
 325  003f cd0000        	call	c_itolx
 327  0042 96            	ldw	x,sp
 328  0043 1c0011        	addw	x,#OFST-7
 329  0046 cd0000        	call	c_lmul
 331  0049 96            	ldw	x,sp
 332  004a 1c0011        	addw	x,#OFST-7
 333  004d cd0000        	call	c_rtol
 335                     ; 50     wIntegral_sum_temp = PID_Struct->pPID_Var->wIntegral + wIntegral_Term;
 337  0050 1e1f          	ldw	x,(OFST+7,sp)
 338  0052 fe            	ldw	x,(x)
 339  0053 1c0006        	addw	x,#6
 340  0056 cd0000        	call	c_ltor
 342  0059 96            	ldw	x,sp
 343  005a 1c0011        	addw	x,#OFST-7
 344  005d cd0000        	call	c_ladd
 346  0060 96            	ldw	x,sp
 347  0061 1c0015        	addw	x,#OFST-3
 348  0064 cd0000        	call	c_rtol
 350                     ; 52 		if (wIntegral_sum_temp > 0)
 352  0067 96            	ldw	x,sp
 353  0068 1c0015        	addw	x,#OFST-3
 354  006b cd0000        	call	c_lzmp
 356  006e 2d13          	jrsle	L551
 357                     ; 54 			if (PID_Struct->pPID_Var->wIntegral < 0)
 359  0070 1e1f          	ldw	x,(OFST+7,sp)
 360  0072 fe            	ldw	x,(x)
 361  0073 e606          	ld	a,(6,x)
 362  0075 2a2a          	jrpl	L361
 363                     ; 56 				if (wIntegral_Term < 0)
 365  0077 7b11          	ld	a,(OFST-7,sp)
 366  0079 2a26          	jrpl	L361
 367                     ; 58 					wIntegral_sum_temp = S32_MIN;
 369  007b 5f            	clrw	x
 370  007c 1f17          	ldw	(OFST-1,sp),x
 371  007e ae8000        	ldw	x,#-32768
 372  0081 201c          	jp	LC001
 373  0083               L551:
 374                     ; 64 			if (PID_Struct->pPID_Var->wIntegral > 0)
 376  0083 1e1f          	ldw	x,(OFST+7,sp)
 377  0085 fe            	ldw	x,(x)
 378  0086 1c0006        	addw	x,#6
 379  0089 cd0000        	call	c_lzmp
 381  008c 2d13          	jrsle	L361
 382                     ; 66 				if (wIntegral_Term > 0)
 384  008e 96            	ldw	x,sp
 385  008f 1c0011        	addw	x,#OFST-7
 386  0092 cd0000        	call	c_lzmp
 388  0095 2d0a          	jrsle	L361
 389                     ; 68 					wIntegral_sum_temp = S32_MAX;
 391  0097 aeffff        	ldw	x,#65535
 392  009a 1f17          	ldw	(OFST-1,sp),x
 393  009c ae7fff        	ldw	x,#32767
 394  009f               LC001:
 395  009f 1f15          	ldw	(OFST-3,sp),x
 396  00a1               L361:
 397                     ; 73     if (wIntegral_sum_temp > PID_Struct->pPID_Const->wUpper_Limit_Integral)
 399  00a1 1e1f          	ldw	x,(OFST+7,sp)
 400  00a3 ee02          	ldw	x,(2,x)
 401  00a5 1c0010        	addw	x,#16
 402  00a8 cd0000        	call	c_ltor
 404  00ab 96            	ldw	x,sp
 405  00ac 1c0015        	addw	x,#OFST-3
 406  00af cd0000        	call	c_lcmp
 408  00b2 2e1e          	jrsge	L171
 409                     ; 75       PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wUpper_Limit_Integral;
 411  00b4 1e1f          	ldw	x,(OFST+7,sp)
 412  00b6 161f          	ldw	y,(OFST+7,sp)
 413  00b8 ee02          	ldw	x,(2,x)
 414  00ba 90fe          	ldw	y,(y)
 415  00bc e613          	ld	a,(19,x)
 416  00be 90e709        	ld	(9,y),a
 417  00c1 e612          	ld	a,(18,x)
 418  00c3 90e708        	ld	(8,y),a
 419  00c6 e611          	ld	a,(17,x)
 420  00c8 90e707        	ld	(7,y),a
 421  00cb e610          	ld	a,(16,x)
 422  00cd               LC003:
 423  00cd 90e706        	ld	(6,y),a
 425  00d0 2041          	jra	L351
 426  00d2               L171:
 427                     ; 77     else if (wIntegral_sum_temp < PID_Struct->pPID_Const->wLower_Limit_Integral)
 429  00d2 1e1f          	ldw	x,(OFST+7,sp)
 430  00d4 ee02          	ldw	x,(2,x)
 431  00d6 1c000c        	addw	x,#12
 432  00d9 cd0000        	call	c_ltor
 434  00dc 96            	ldw	x,sp
 435  00dd 1c0015        	addw	x,#OFST-3
 436  00e0 cd0000        	call	c_lcmp
 438  00e3 2d1b          	jrsle	L571
 439                     ; 79       PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wLower_Limit_Integral;
 441  00e5 1e1f          	ldw	x,(OFST+7,sp)
 442  00e7 161f          	ldw	y,(OFST+7,sp)
 443  00e9 ee02          	ldw	x,(2,x)
 444  00eb 90fe          	ldw	y,(y)
 445  00ed e60f          	ld	a,(15,x)
 446  00ef 90e709        	ld	(9,y),a
 447  00f2 e60e          	ld	a,(14,x)
 448  00f4 90e708        	ld	(8,y),a
 449  00f7 e60d          	ld	a,(13,x)
 450  00f9 90e707        	ld	(7,y),a
 451  00fc e60c          	ld	a,(12,x)
 453  00fe 20cd          	jp	LC003
 454  0100               L571:
 455                     ; 83       PID_Struct->pPID_Var->wIntegral = wIntegral_sum_temp;
 457  0100 1e1f          	ldw	x,(OFST+7,sp)
 458  0102 fe            	ldw	x,(x)
 459  0103 7b18          	ld	a,(OFST+0,sp)
 460  0105 e709          	ld	(9,x),a
 461  0107 7b17          	ld	a,(OFST-1,sp)
 462  0109 e708          	ld	(8,x),a
 463  010b 7b16          	ld	a,(OFST-2,sp)
 464  010d e707          	ld	(7,x),a
 465  010f 7b15          	ld	a,(OFST-3,sp)
 466  0111               LC002:
 467  0111 e706          	ld	(6,x),a
 468  0113               L351:
 469                     ; 87   houtput_32 = (wProportional_Term/PID_Struct->pPID_Const->hKp_Divisor+ 
 469                     ; 88                 PID_Struct->pPID_Var->wIntegral/PID_Struct->pPID_Const->hKi_Divisor);
 471  0113 1e1f          	ldw	x,(OFST+7,sp)
 472  0115 ee02          	ldw	x,(2,x)
 473  0117 ee04          	ldw	x,(4,x)
 474  0119 cd0000        	call	c_uitolx
 476  011c 96            	ldw	x,sp
 477  011d 1c0009        	addw	x,#OFST-15
 478  0120 cd0000        	call	c_rtol
 480  0123 1e1f          	ldw	x,(OFST+7,sp)
 481  0125 fe            	ldw	x,(x)
 482  0126 1c0006        	addw	x,#6
 483  0129 cd0000        	call	c_ltor
 485  012c 96            	ldw	x,sp
 486  012d 1c0009        	addw	x,#OFST-15
 487  0130 cd0000        	call	c_ldiv
 489  0133 96            	ldw	x,sp
 490  0134 1c0005        	addw	x,#OFST-19
 491  0137 cd0000        	call	c_rtol
 493  013a 1e1f          	ldw	x,(OFST+7,sp)
 494  013c ee02          	ldw	x,(2,x)
 495  013e ee02          	ldw	x,(2,x)
 496  0140 cd0000        	call	c_uitolx
 498  0143 96            	ldw	x,sp
 499  0144 5c            	incw	x
 500  0145 cd0000        	call	c_rtol
 502  0148 96            	ldw	x,sp
 503  0149 1c000d        	addw	x,#OFST-11
 504  014c cd0000        	call	c_ltor
 506  014f 96            	ldw	x,sp
 507  0150 5c            	incw	x
 508  0151 cd0000        	call	c_ldiv
 510  0154 96            	ldw	x,sp
 511  0155 1c0005        	addw	x,#OFST-19
 512  0158 cd0000        	call	c_ladd
 514  015b 96            	ldw	x,sp
 515  015c 1c0015        	addw	x,#OFST-3
 516  015f cd0000        	call	c_rtol
 518                     ; 90   if (houtput_32 > PID_Struct->pPID_Const->hUpper_Limit_Output)
 520  0162 1e1f          	ldw	x,(OFST+7,sp)
 521  0164 ee02          	ldw	x,(2,x)
 522  0166 ee0a          	ldw	x,(10,x)
 523  0168 cd0000        	call	c_itolx
 525  016b 96            	ldw	x,sp
 526  016c 1c0015        	addw	x,#OFST-3
 527  016f cd0000        	call	c_lcmp
 529  0172 2e08          	jrsge	L102
 530                     ; 92     houtput_32 = PID_Struct->pPID_Const->hUpper_Limit_Output;		  			 	
 532  0174 1e1f          	ldw	x,(OFST+7,sp)
 533  0176 ee02          	ldw	x,(2,x)
 534  0178 ee0a          	ldw	x,(10,x)
 538  017a 2018          	jp	LC004
 539  017c               L102:
 540                     ; 94   else if (houtput_32 < PID_Struct->pPID_Const->hLower_Limit_Output)
 542  017c 1e1f          	ldw	x,(OFST+7,sp)
 543  017e ee02          	ldw	x,(2,x)
 544  0180 ee08          	ldw	x,(8,x)
 545  0182 cd0000        	call	c_itolx
 547  0185 96            	ldw	x,sp
 548  0186 1c0015        	addw	x,#OFST-3
 549  0189 cd0000        	call	c_lcmp
 551  018c 2d10          	jrsle	L302
 552                     ; 96     houtput_32 = PID_Struct->pPID_Const->hLower_Limit_Output;
 554  018e 1e1f          	ldw	x,(OFST+7,sp)
 555  0190 ee02          	ldw	x,(2,x)
 556  0192 ee08          	ldw	x,(8,x)
 558  0194               LC004:
 559  0194 cd0000        	call	c_itolx
 560  0197 96            	ldw	x,sp
 561  0198 1c0015        	addw	x,#OFST-3
 562  019b cd0000        	call	c_rtol
 564  019e               L302:
 565                     ; 98   return((s16)(houtput_32)); 		
 567  019e 1e17          	ldw	x,(OFST-1,sp)
 570  01a0 5b1a          	addw	sp,#26
 571  01a2 81            	ret	
 689                     ; 101 s16 PID_Regulator(s16 hReference, s16 hPresentFeedback, PPID_Struct_t PID_Struct)
 689                     ; 102 {
 690                     	switch	.text
 691  01a3               _PID_Regulator:
 693  01a3 89            	pushw	x
 694  01a4 5224          	subw	sp,#36
 695       00000024      OFST:	set	36
 698                     ; 108   wError= (s32)(hReference - hPresentFeedback);
 700  01a6 72f029        	subw	x,(OFST+5,sp)
 701  01a9 cd0000        	call	c_itolx
 703  01ac 96            	ldw	x,sp
 704  01ad 1c0019        	addw	x,#OFST-11
 705  01b0 cd0000        	call	c_rtol
 707                     ; 111   wProportional_Term = PID_Struct->pPID_Var->hKp_Gain * wError;
 709  01b3 1e2b          	ldw	x,(OFST+7,sp)
 710  01b5 fe            	ldw	x,(x)
 711  01b6 fe            	ldw	x,(x)
 712  01b7 cd0000        	call	c_itolx
 714  01ba 96            	ldw	x,sp
 715  01bb 1c0019        	addw	x,#OFST-11
 716  01be cd0000        	call	c_lmul
 718  01c1 96            	ldw	x,sp
 719  01c2 1c0015        	addw	x,#OFST-15
 720  01c5 cd0000        	call	c_rtol
 722                     ; 114   if (PID_Struct->pPID_Var->hKi_Gain == 0)
 724  01c8 1e2b          	ldw	x,(OFST+7,sp)
 725  01ca fe            	ldw	x,(x)
 726  01cb e603          	ld	a,(3,x)
 727  01cd ea02          	or	a,(2,x)
 728  01cf 260c          	jrne	L372
 729                     ; 116     PID_Struct->pPID_Var->wIntegral = 0;
 731  01d1 1e2b          	ldw	x,(OFST+7,sp)
 732  01d3 fe            	ldw	x,(x)
 733  01d4 e708          	ld	(8,x),a
 734  01d6 e709          	ld	(9,x),a
 735  01d8 e707          	ld	(7,x),a
 737  01da cc02b4        	jp	LC006
 738  01dd               L372:
 739                     ; 120     wIntegral_Term = PID_Struct->pPID_Var->hKi_Gain * wError;
 741  01dd 1e2b          	ldw	x,(OFST+7,sp)
 742  01df fe            	ldw	x,(x)
 743  01e0 ee02          	ldw	x,(2,x)
 744  01e2 cd0000        	call	c_itolx
 746  01e5 96            	ldw	x,sp
 747  01e6 1c0019        	addw	x,#OFST-11
 748  01e9 cd0000        	call	c_lmul
 750  01ec 96            	ldw	x,sp
 751  01ed 1c001d        	addw	x,#OFST-7
 752  01f0 cd0000        	call	c_rtol
 754                     ; 121     wIntegral_sum_temp = PID_Struct->pPID_Var->wIntegral + wIntegral_Term;
 756  01f3 1e2b          	ldw	x,(OFST+7,sp)
 757  01f5 fe            	ldw	x,(x)
 758  01f6 1c0006        	addw	x,#6
 759  01f9 cd0000        	call	c_ltor
 761  01fc 96            	ldw	x,sp
 762  01fd 1c001d        	addw	x,#OFST-7
 763  0200 cd0000        	call	c_ladd
 765  0203 96            	ldw	x,sp
 766  0204 1c0021        	addw	x,#OFST-3
 767  0207 cd0000        	call	c_rtol
 769                     ; 123 		if (wIntegral_sum_temp > 0)
 771  020a 96            	ldw	x,sp
 772  020b 1c0021        	addw	x,#OFST-3
 773  020e cd0000        	call	c_lzmp
 775  0211 2d13          	jrsle	L772
 776                     ; 125 			if (PID_Struct->pPID_Var->wIntegral < 0)
 778  0213 1e2b          	ldw	x,(OFST+7,sp)
 779  0215 fe            	ldw	x,(x)
 780  0216 e606          	ld	a,(6,x)
 781  0218 2a2a          	jrpl	L503
 782                     ; 127 				if (wIntegral_Term < 0)
 784  021a 7b1d          	ld	a,(OFST-7,sp)
 785  021c 2a26          	jrpl	L503
 786                     ; 129 					wIntegral_sum_temp = S32_MIN;
 788  021e 5f            	clrw	x
 789  021f 1f23          	ldw	(OFST-1,sp),x
 790  0221 ae8000        	ldw	x,#-32768
 791  0224 201c          	jp	LC005
 792  0226               L772:
 793                     ; 135 			if (PID_Struct->pPID_Var->wIntegral > 0)
 795  0226 1e2b          	ldw	x,(OFST+7,sp)
 796  0228 fe            	ldw	x,(x)
 797  0229 1c0006        	addw	x,#6
 798  022c cd0000        	call	c_lzmp
 800  022f 2d13          	jrsle	L503
 801                     ; 137 				if (wIntegral_Term > 0)
 803  0231 96            	ldw	x,sp
 804  0232 1c001d        	addw	x,#OFST-7
 805  0235 cd0000        	call	c_lzmp
 807  0238 2d0a          	jrsle	L503
 808                     ; 139 					wIntegral_sum_temp = S32_MAX;
 810  023a aeffff        	ldw	x,#65535
 811  023d 1f23          	ldw	(OFST-1,sp),x
 812  023f ae7fff        	ldw	x,#32767
 813  0242               LC005:
 814  0242 1f21          	ldw	(OFST-3,sp),x
 815  0244               L503:
 816                     ; 144     if (wIntegral_sum_temp > PID_Struct->pPID_Const->wUpper_Limit_Integral)
 818  0244 1e2b          	ldw	x,(OFST+7,sp)
 819  0246 ee02          	ldw	x,(2,x)
 820  0248 1c0010        	addw	x,#16
 821  024b cd0000        	call	c_ltor
 823  024e 96            	ldw	x,sp
 824  024f 1c0021        	addw	x,#OFST-3
 825  0252 cd0000        	call	c_lcmp
 827  0255 2e1e          	jrsge	L313
 828                     ; 146       PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wUpper_Limit_Integral;
 830  0257 1e2b          	ldw	x,(OFST+7,sp)
 831  0259 162b          	ldw	y,(OFST+7,sp)
 832  025b ee02          	ldw	x,(2,x)
 833  025d 90fe          	ldw	y,(y)
 834  025f e613          	ld	a,(19,x)
 835  0261 90e709        	ld	(9,y),a
 836  0264 e612          	ld	a,(18,x)
 837  0266 90e708        	ld	(8,y),a
 838  0269 e611          	ld	a,(17,x)
 839  026b 90e707        	ld	(7,y),a
 840  026e e610          	ld	a,(16,x)
 841  0270               LC007:
 842  0270 90e706        	ld	(6,y),a
 844  0273 2041          	jra	L572
 845  0275               L313:
 846                     ; 148     else if (wIntegral_sum_temp < PID_Struct->pPID_Const->wLower_Limit_Integral)
 848  0275 1e2b          	ldw	x,(OFST+7,sp)
 849  0277 ee02          	ldw	x,(2,x)
 850  0279 1c000c        	addw	x,#12
 851  027c cd0000        	call	c_ltor
 853  027f 96            	ldw	x,sp
 854  0280 1c0021        	addw	x,#OFST-3
 855  0283 cd0000        	call	c_lcmp
 857  0286 2d1b          	jrsle	L713
 858                     ; 150       PID_Struct->pPID_Var->wIntegral = PID_Struct->pPID_Const->wLower_Limit_Integral;
 860  0288 1e2b          	ldw	x,(OFST+7,sp)
 861  028a 162b          	ldw	y,(OFST+7,sp)
 862  028c ee02          	ldw	x,(2,x)
 863  028e 90fe          	ldw	y,(y)
 864  0290 e60f          	ld	a,(15,x)
 865  0292 90e709        	ld	(9,y),a
 866  0295 e60e          	ld	a,(14,x)
 867  0297 90e708        	ld	(8,y),a
 868  029a e60d          	ld	a,(13,x)
 869  029c 90e707        	ld	(7,y),a
 870  029f e60c          	ld	a,(12,x)
 872  02a1 20cd          	jp	LC007
 873  02a3               L713:
 874                     ; 154       PID_Struct->pPID_Var->wIntegral = wIntegral_sum_temp;
 876  02a3 1e2b          	ldw	x,(OFST+7,sp)
 877  02a5 fe            	ldw	x,(x)
 878  02a6 7b24          	ld	a,(OFST+0,sp)
 879  02a8 e709          	ld	(9,x),a
 880  02aa 7b23          	ld	a,(OFST-1,sp)
 881  02ac e708          	ld	(8,x),a
 882  02ae 7b22          	ld	a,(OFST-2,sp)
 883  02b0 e707          	ld	(7,x),a
 884  02b2 7b21          	ld	a,(OFST-3,sp)
 885  02b4               LC006:
 886  02b4 e706          	ld	(6,x),a
 887  02b6               L572:
 888                     ; 161   wtemp = wError - PID_Struct->pPID_Var->wPreviousError;
 890  02b6 96            	ldw	x,sp
 891  02b7 1c0019        	addw	x,#OFST-11
 892  02ba cd0000        	call	c_ltor
 894  02bd 1e2b          	ldw	x,(OFST+7,sp)
 895  02bf fe            	ldw	x,(x)
 896  02c0 1c000a        	addw	x,#10
 897  02c3 cd0000        	call	c_lsub
 899  02c6 96            	ldw	x,sp
 900  02c7 1c001d        	addw	x,#OFST-7
 901  02ca cd0000        	call	c_rtol
 903                     ; 162   wDifferential_Term = PID_Struct->pPID_Var->hKd_Gain * wtemp;
 905  02cd 1e2b          	ldw	x,(OFST+7,sp)
 906  02cf fe            	ldw	x,(x)
 907  02d0 ee04          	ldw	x,(4,x)
 908  02d2 cd0000        	call	c_itolx
 910  02d5 96            	ldw	x,sp
 911  02d6 1c001d        	addw	x,#OFST-7
 912  02d9 cd0000        	call	c_lmul
 914  02dc 96            	ldw	x,sp
 915  02dd 1c001d        	addw	x,#OFST-7
 916  02e0 cd0000        	call	c_rtol
 918                     ; 163   PID_Struct->pPID_Var->wPreviousError = wError;    // store value 
 920  02e3 1e2b          	ldw	x,(OFST+7,sp)
 921  02e5 fe            	ldw	x,(x)
 922  02e6 7b1c          	ld	a,(OFST-8,sp)
 923  02e8 e70d          	ld	(13,x),a
 924  02ea 7b1b          	ld	a,(OFST-9,sp)
 925  02ec e70c          	ld	(12,x),a
 926  02ee 7b1a          	ld	a,(OFST-10,sp)
 927  02f0 e70b          	ld	(11,x),a
 928  02f2 7b19          	ld	a,(OFST-11,sp)
 929  02f4 e70a          	ld	(10,x),a
 930                     ; 166   houtput_32 = (wProportional_Term/PID_Struct->pPID_Const->hKp_Divisor+ 
 930                     ; 167                 PID_Struct->pPID_Var->wIntegral/PID_Struct->pPID_Const->hKi_Divisor + 
 930                     ; 168                 wDifferential_Term/PID_Struct->pPID_Const->hKd_Divisor); 
 932  02f6 1e2b          	ldw	x,(OFST+7,sp)
 933  02f8 ee02          	ldw	x,(2,x)
 934  02fa ee06          	ldw	x,(6,x)
 935  02fc cd0000        	call	c_uitolx
 937  02ff 96            	ldw	x,sp
 938  0300 1c0011        	addw	x,#OFST-19
 939  0303 cd0000        	call	c_rtol
 941  0306 96            	ldw	x,sp
 942  0307 1c001d        	addw	x,#OFST-7
 943  030a cd0000        	call	c_ltor
 945  030d 96            	ldw	x,sp
 946  030e 1c0011        	addw	x,#OFST-19
 947  0311 cd0000        	call	c_ldiv
 949  0314 96            	ldw	x,sp
 950  0315 1c000d        	addw	x,#OFST-23
 951  0318 cd0000        	call	c_rtol
 953  031b 1e2b          	ldw	x,(OFST+7,sp)
 954  031d ee02          	ldw	x,(2,x)
 955  031f ee04          	ldw	x,(4,x)
 956  0321 cd0000        	call	c_uitolx
 958  0324 96            	ldw	x,sp
 959  0325 1c0009        	addw	x,#OFST-27
 960  0328 cd0000        	call	c_rtol
 962  032b 1e2b          	ldw	x,(OFST+7,sp)
 963  032d fe            	ldw	x,(x)
 964  032e 1c0006        	addw	x,#6
 965  0331 cd0000        	call	c_ltor
 967  0334 96            	ldw	x,sp
 968  0335 1c0009        	addw	x,#OFST-27
 969  0338 cd0000        	call	c_ldiv
 971  033b 96            	ldw	x,sp
 972  033c 1c0005        	addw	x,#OFST-31
 973  033f cd0000        	call	c_rtol
 975  0342 1e2b          	ldw	x,(OFST+7,sp)
 976  0344 ee02          	ldw	x,(2,x)
 977  0346 ee02          	ldw	x,(2,x)
 978  0348 cd0000        	call	c_uitolx
 980  034b 96            	ldw	x,sp
 981  034c 5c            	incw	x
 982  034d cd0000        	call	c_rtol
 984  0350 96            	ldw	x,sp
 985  0351 1c0015        	addw	x,#OFST-15
 986  0354 cd0000        	call	c_ltor
 988  0357 96            	ldw	x,sp
 989  0358 5c            	incw	x
 990  0359 cd0000        	call	c_ldiv
 992  035c 96            	ldw	x,sp
 993  035d 1c0005        	addw	x,#OFST-31
 994  0360 cd0000        	call	c_ladd
 996  0363 96            	ldw	x,sp
 997  0364 1c000d        	addw	x,#OFST-23
 998  0367 cd0000        	call	c_ladd
1000  036a 96            	ldw	x,sp
1001  036b 1c0021        	addw	x,#OFST-3
1002  036e cd0000        	call	c_rtol
1004                     ; 170   if (houtput_32 > PID_Struct->pPID_Const->hUpper_Limit_Output)
1006  0371 1e2b          	ldw	x,(OFST+7,sp)
1007  0373 ee02          	ldw	x,(2,x)
1008  0375 ee0a          	ldw	x,(10,x)
1009  0377 cd0000        	call	c_itolx
1011  037a 96            	ldw	x,sp
1012  037b 1c0021        	addw	x,#OFST-3
1013  037e cd0000        	call	c_lcmp
1015  0381 2e08          	jrsge	L323
1016                     ; 172     houtput_32 = PID_Struct->pPID_Const->hUpper_Limit_Output;		  			 	
1018  0383 1e2b          	ldw	x,(OFST+7,sp)
1019  0385 ee02          	ldw	x,(2,x)
1020  0387 ee0a          	ldw	x,(10,x)
1024  0389 2018          	jp	LC008
1025  038b               L323:
1026                     ; 174   else if (houtput_32 < PID_Struct->pPID_Const->hLower_Limit_Output)
1028  038b 1e2b          	ldw	x,(OFST+7,sp)
1029  038d ee02          	ldw	x,(2,x)
1030  038f ee08          	ldw	x,(8,x)
1031  0391 cd0000        	call	c_itolx
1033  0394 96            	ldw	x,sp
1034  0395 1c0021        	addw	x,#OFST-3
1035  0398 cd0000        	call	c_lcmp
1037  039b 2d10          	jrsle	L523
1038                     ; 176     houtput_32 = PID_Struct->pPID_Const->hLower_Limit_Output;
1040  039d 1e2b          	ldw	x,(OFST+7,sp)
1041  039f ee02          	ldw	x,(2,x)
1042  03a1 ee08          	ldw	x,(8,x)
1044  03a3               LC008:
1045  03a3 cd0000        	call	c_itolx
1046  03a6 96            	ldw	x,sp
1047  03a7 1c0021        	addw	x,#OFST-3
1048  03aa cd0000        	call	c_rtol
1050  03ad               L523:
1051                     ; 178   return((s16)(houtput_32)); 		
1053  03ad 1e23          	ldw	x,(OFST-1,sp)
1056  03af 5b26          	addw	sp,#38
1057  03b1 81            	ret	
1070                     	xdef	_PID_Regulator
1071                     	xdef	_PI_Regulator
1072                     	xref.b	c_x
1091                     	xref	c_lsub
1092                     	xref	c_ldiv
1093                     	xref	c_uitolx
1094                     	xref	c_lcmp
1095                     	xref	c_lzmp
1096                     	xref	c_ladd
1097                     	xref	c_ltor
1098                     	xref	c_lmul
1099                     	xref	c_rtol
1100                     	xref	c_itolx
1101                     	end
