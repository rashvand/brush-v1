   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
  18                     	switch	.data
  19  0000               _tcbReadyQ:
  20  0000 0000          	dc.w	0
  21  0002               _atomOSStarted:
  22  0002 00            	dc.b	0
  23  0003               L3_curr_tcb:
  24  0003 0000          	dc.w	0
  25  0005               L7_atomIntCnt:
  26  0005 0000          	dc.w	0
 254                     ; 224 void atomSched (uint8_t timer_tick)
 254                     ; 225 {
 256                     .text:	section	.text,new
 257  0000               _atomSched:
 259  0000 88            	push	a
 260  0001 5203          	subw	sp,#3
 261       00000003      OFST:	set	3
 264                     ; 227     ATOM_TCB *new_tcb = NULL;
 266                     ; 235     if (atomOSStarted == FALSE)
 268  0003 725d0002      	tnz	_atomOSStarted
 269  0007 2603          	jrne	L01
 270  0009 cc008b        	jp	L6
 271  000c               L01:
 272                     ; 238         return;
 274                     ; 242     CRITICAL_START ();
 276  000c 96            	ldw	x,sp
 277  000d 1c0001        	addw	x,#OFST-2
 279  0010 8a            push CC
 280  0011 84            pop a
 281  0012 f7            ld (X),A
 282  0013 9b            sim
 284                     ; 248     if (curr_tcb->suspended == TRUE)
 286  0014 ce0003        	ldw	x,L3_curr_tcb
 287  0017 e60d          	ld	a,(13,x)
 288  0019 a101          	cp	a,#1
 289  001b 2614          	jrne	L351
 290                     ; 256         new_tcb = tcbDequeueHead (&tcbReadyQ);
 292  001d ae0000        	ldw	x,#_tcbReadyQ
 293  0020 cd0000        	call	_tcbDequeueHead
 295  0023 1f02          	ldw	(OFST-1,sp),x
 296                     ; 266         atomThreadSwitch (curr_tcb, new_tcb);
 298  0025 1e02          	ldw	x,(OFST-1,sp)
 299  0027 89            	pushw	x
 300  0028 ce0003        	ldw	x,L3_curr_tcb
 301  002b cd0000        	call	L11_atomThreadSwitch
 303  002e 85            	popw	x
 305  002f 2053          	jra	L551
 306  0031               L351:
 307                     ; 276         if (timer_tick == TRUE)
 309  0031 7b04          	ld	a,(OFST+1,sp)
 310  0033 a101          	cp	a,#1
 311  0035 260b          	jrne	L751
 312                     ; 279             lowest_pri = (int16_t)curr_tcb->priority;
 314  0037 ce0003        	ldw	x,L3_curr_tcb
 315  003a e602          	ld	a,(2,x)
 316  003c 5f            	clrw	x
 317  003d 97            	ld	xl,a
 318  003e 1f02          	ldw	(OFST-1,sp),x
 320  0040 2018          	jra	L161
 321  0042               L751:
 322                     ; 281         else if (curr_tcb->priority > 0)
 324  0042 ce0003        	ldw	x,L3_curr_tcb
 325  0045 6d02          	tnz	(2,x)
 326  0047 270c          	jreq	L361
 327                     ; 284             lowest_pri = (int16_t)(curr_tcb->priority - 1);
 329  0049 ce0003        	ldw	x,L3_curr_tcb
 330  004c e602          	ld	a,(2,x)
 331  004e 5f            	clrw	x
 332  004f 97            	ld	xl,a
 333  0050 5a            	decw	x
 334  0051 1f02          	ldw	(OFST-1,sp),x
 336  0053 2005          	jra	L161
 337  0055               L361:
 338                     ; 292             lowest_pri = -1;
 340  0055 aeffff        	ldw	x,#65535
 341  0058 1f02          	ldw	(OFST-1,sp),x
 342  005a               L161:
 343                     ; 296         if (lowest_pri >= 0)
 345  005a 9c            	rvf
 346  005b 1e02          	ldw	x,(OFST-1,sp)
 347  005d 2f25          	jrslt	L551
 348                     ; 299             new_tcb = tcbDequeuePriority (&tcbReadyQ, (uint8_t)lowest_pri);
 350  005f 7b03          	ld	a,(OFST+0,sp)
 351  0061 88            	push	a
 352  0062 ae0000        	ldw	x,#_tcbReadyQ
 353  0065 cd0000        	call	_tcbDequeuePriority
 355  0068 84            	pop	a
 356  0069 1f02          	ldw	(OFST-1,sp),x
 357                     ; 302             if (new_tcb)
 359  006b 1e02          	ldw	x,(OFST-1,sp)
 360  006d 2715          	jreq	L551
 361                     ; 305                 (void)tcbEnqueuePriority (&tcbReadyQ, curr_tcb);
 363  006f ce0003        	ldw	x,L3_curr_tcb
 364  0072 89            	pushw	x
 365  0073 ae0000        	ldw	x,#_tcbReadyQ
 366  0076 cd0000        	call	_tcbEnqueuePriority
 368  0079 85            	popw	x
 369                     ; 308                 atomThreadSwitch (curr_tcb, new_tcb);
 371  007a 1e02          	ldw	x,(OFST-1,sp)
 372  007c 89            	pushw	x
 373  007d ce0003        	ldw	x,L3_curr_tcb
 374  0080 cd0000        	call	L11_atomThreadSwitch
 376  0083 85            	popw	x
 377  0084               L551:
 378                     ; 314     CRITICAL_END ();
 380  0084 96            	ldw	x,sp
 381  0085 1c0001        	addw	x,#OFST-2
 383  0088 f6            ld A,(X)
 384  0089 88            push A
 385  008a 86            pop CC
 387                     ; 315 }
 388  008b               L6:
 391  008b 5b04          	addw	sp,#4
 392  008d 81            	ret
 443                     ; 333 static void atomThreadSwitch(ATOM_TCB *old_tcb, ATOM_TCB *new_tcb)
 443                     ; 334 {
 444                     .text:	section	.text,new
 445  0000               L11_atomThreadSwitch:
 447  0000 89            	pushw	x
 448       00000000      OFST:	set	0
 451                     ; 341     if (old_tcb != new_tcb)
 453  0001 1305          	cpw	x,(OFST+5,sp)
 454  0003 270e          	jreq	L122
 455                     ; 344         curr_tcb = new_tcb;
 457  0005 1e05          	ldw	x,(OFST+5,sp)
 458  0007 cf0003        	ldw	L3_curr_tcb,x
 459                     ; 347         archContextSwitch (old_tcb, new_tcb);
 461  000a 1e05          	ldw	x,(OFST+5,sp)
 462  000c 89            	pushw	x
 463  000d 1e03          	ldw	x,(OFST+3,sp)
 464  000f cd0000        	call	_archContextSwitch
 466  0012 85            	popw	x
 467  0013               L122:
 468                     ; 355     old_tcb->suspended = FALSE;
 470  0013 1e01          	ldw	x,(OFST+1,sp)
 471  0015 6f0d          	clr	(13,x)
 472                     ; 357 }
 475  0017 85            	popw	x
 476  0018 81            	ret
 576                     ; 386 uint8_t atomThreadCreate (ATOM_TCB *tcb_ptr, uint8_t priority, void (*entry_point)(uint32_t), uint32_t entry_param, void *stack_top, uint32_t stack_size)
 576                     ; 387 {
 577                     .text:	section	.text,new
 578  0000               _atomThreadCreate:
 580  0000 89            	pushw	x
 581  0001 5204          	subw	sp,#4
 582       00000004      OFST:	set	4
 585                     ; 391     if ((tcb_ptr == NULL) || (entry_point == NULL) || (stack_top == NULL)
 585                     ; 392         || (stack_size == 0))
 587  0003 a30000        	cpw	x,#0
 588  0006 2711          	jreq	L762
 590  0008 1e0a          	ldw	x,(OFST+6,sp)
 591  000a 270d          	jreq	L762
 593  000c 1e10          	ldw	x,(OFST+12,sp)
 594  000e 2709          	jreq	L762
 596  0010 96            	ldw	x,sp
 597  0011 1c0012        	addw	x,#OFST+14
 598  0014 cd0000        	call	c_lzmp
 600  0017 2609          	jrne	L562
 601  0019               L762:
 602                     ; 395         status = ATOM_ERR_PARAM;
 604  0019 a6c9          	ld	a,#201
 605  001b 6b04          	ld	(OFST+0,sp),a
 607  001d               L572:
 608                     ; 483     return (status);
 610  001d 7b04          	ld	a,(OFST+0,sp)
 613  001f 5b06          	addw	sp,#6
 614  0021 81            	ret
 615  0022               L562:
 616                     ; 401         tcb_ptr->suspended = FALSE;
 618  0022 1e05          	ldw	x,(OFST+1,sp)
 619  0024 6f0d          	clr	(13,x)
 620                     ; 402         tcb_ptr->priority = priority;
 622  0026 7b09          	ld	a,(OFST+5,sp)
 623  0028 1e05          	ldw	x,(OFST+1,sp)
 624  002a e702          	ld	(2,x),a
 625                     ; 403         tcb_ptr->prev_tcb = NULL;
 627  002c 1e05          	ldw	x,(OFST+1,sp)
 628  002e 905f          	clrw	y
 629  0030 ef09          	ldw	(9,x),y
 630                     ; 404         tcb_ptr->next_tcb = NULL;
 632  0032 1e05          	ldw	x,(OFST+1,sp)
 633  0034 905f          	clrw	y
 634  0036 ef0b          	ldw	(11,x),y
 635                     ; 405         tcb_ptr->suspend_timo_cb = NULL;
 637  0038 1e05          	ldw	x,(OFST+1,sp)
 638  003a 905f          	clrw	y
 639  003c ef0f          	ldw	(15,x),y
 640                     ; 412         tcb_ptr->entry_point = entry_point;
 642  003e 1e05          	ldw	x,(OFST+1,sp)
 643  0040 160a          	ldw	y,(OFST+6,sp)
 644  0042 ef03          	ldw	(3,x),y
 645                     ; 413         tcb_ptr->entry_param = entry_param;
 647  0044 1e05          	ldw	x,(OFST+1,sp)
 648  0046 7b0f          	ld	a,(OFST+11,sp)
 649  0048 e708          	ld	(8,x),a
 650  004a 7b0e          	ld	a,(OFST+10,sp)
 651  004c e707          	ld	(7,x),a
 652  004e 7b0d          	ld	a,(OFST+9,sp)
 653  0050 e706          	ld	(6,x),a
 654  0052 7b0c          	ld	a,(OFST+8,sp)
 655  0054 e705          	ld	(5,x),a
 656                     ; 424         tcb_ptr->stack_top = stack_top;
 658  0056 1e05          	ldw	x,(OFST+1,sp)
 659  0058 1610          	ldw	y,(OFST+12,sp)
 660  005a ef11          	ldw	(17,x),y
 661                     ; 425         tcb_ptr->stack_size = stack_size;
 663  005c 1e05          	ldw	x,(OFST+1,sp)
 664  005e 7b15          	ld	a,(OFST+17,sp)
 665  0060 e716          	ld	(22,x),a
 666  0062 7b14          	ld	a,(OFST+16,sp)
 667  0064 e715          	ld	(21,x),a
 668  0066 7b13          	ld	a,(OFST+15,sp)
 669  0068 e714          	ld	(20,x),a
 670  006a 7b12          	ld	a,(OFST+14,sp)
 671  006c e713          	ld	(19,x),a
 673  006e 2016          	jra	L303
 674  0070               L772:
 675                     ; 435             *((uint8_t *)stack_top - (stack_size - 1)) = STACK_CHECK_BYTE;
 677  0070 1e14          	ldw	x,(OFST+16,sp)
 678  0072 5a            	decw	x
 679  0073 1f01          	ldw	(OFST-3,sp),x
 680  0075 1e10          	ldw	x,(OFST+12,sp)
 681  0077 72f001        	subw	x,(OFST-3,sp)
 682  007a a65a          	ld	a,#90
 683  007c f7            	ld	(x),a
 684                     ; 436             stack_size--;
 686  007d 96            	ldw	x,sp
 687  007e 1c0012        	addw	x,#OFST+14
 688  0081 a601          	ld	a,#1
 689  0083 cd0000        	call	c_lgsbc
 691  0086               L303:
 692                     ; 432         while (stack_size > 0)
 694  0086 96            	ldw	x,sp
 695  0087 1c0012        	addw	x,#OFST+14
 696  008a cd0000        	call	c_lzmp
 698  008d 26e1          	jrne	L772
 699                     ; 452         archThreadContextInit (tcb_ptr, stack_top, entry_point, entry_param);
 701  008f 1e0e          	ldw	x,(OFST+10,sp)
 702  0091 89            	pushw	x
 703  0092 1e0e          	ldw	x,(OFST+10,sp)
 704  0094 89            	pushw	x
 705  0095 1e0e          	ldw	x,(OFST+10,sp)
 706  0097 89            	pushw	x
 707  0098 1e16          	ldw	x,(OFST+18,sp)
 708  009a 89            	pushw	x
 709  009b 1e0d          	ldw	x,(OFST+9,sp)
 710  009d cd0000        	call	_archThreadContextInit
 712  00a0 5b08          	addw	sp,#8
 713                     ; 455         CRITICAL_START ();
 715  00a2 96            	ldw	x,sp
 716  00a3 1c0003        	addw	x,#OFST-1
 718  00a6 8a            push CC
 719  00a7 84            pop a
 720  00a8 f7            ld (X),A
 721  00a9 9b            sim
 723                     ; 458         if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 725  00aa 1e05          	ldw	x,(OFST+1,sp)
 726  00ac 89            	pushw	x
 727  00ad ae0000        	ldw	x,#_tcbReadyQ
 728  00b0 cd0000        	call	_tcbEnqueuePriority
 730  00b3 85            	popw	x
 731  00b4 4d            	tnz	a
 732  00b5 270f          	jreq	L703
 733                     ; 461             CRITICAL_END ();
 735  00b7 96            	ldw	x,sp
 736  00b8 1c0003        	addw	x,#OFST-1
 738  00bb f6            ld A,(X)
 739  00bc 88            push A
 740  00bd 86            pop CC
 742                     ; 464             status = ATOM_ERR_QUEUE;
 744  00be a6cc          	ld	a,#204
 745  00c0 6b04          	ld	(OFST+0,sp),a
 747  00c2 ac1d001d      	jpf	L572
 748  00c6               L703:
 749                     ; 469             CRITICAL_END ();
 751  00c6 96            	ldw	x,sp
 752  00c7 1c0003        	addw	x,#OFST-1
 754  00ca f6            ld A,(X)
 755  00cb 88            push A
 756  00cc 86            pop CC
 758                     ; 475             if ((atomOSStarted == TRUE) && atomCurrentContext())
 760  00cd c60002        	ld	a,_atomOSStarted
 761  00d0 a101          	cp	a,#1
 762  00d2 260c          	jrne	L313
 764  00d4 cd0000        	call	_atomCurrentContext
 766  00d7 a30000        	cpw	x,#0
 767  00da 2704          	jreq	L313
 768                     ; 476                 atomSched (FALSE);
 770  00dc 4f            	clr	a
 771  00dd cd0000        	call	_atomSched
 773  00e0               L313:
 774                     ; 479             status = ATOM_OK;
 776  00e0 0f04          	clr	(OFST+0,sp)
 777  00e2 ac1d001d      	jpf	L572
 859                     ; 518 uint8_t atomThreadStackCheck (ATOM_TCB *tcb_ptr, uint32_t *used_bytes, uint32_t *free_bytes)
 859                     ; 519 {
 860                     .text:	section	.text,new
 861  0000               _atomThreadStackCheck:
 863  0000 89            	pushw	x
 864  0001 5209          	subw	sp,#9
 865       00000009      OFST:	set	9
 868                     ; 524     if ((tcb_ptr == NULL) || (used_bytes == NULL) || (free_bytes == NULL))
 870  0003 a30000        	cpw	x,#0
 871  0006 2708          	jreq	L753
 873  0008 1e0e          	ldw	x,(OFST+5,sp)
 874  000a 2704          	jreq	L753
 876  000c 1e10          	ldw	x,(OFST+7,sp)
 877  000e 2609          	jrne	L553
 878  0010               L753:
 879                     ; 527         status = ATOM_ERR_PARAM;
 881  0010 a6c9          	ld	a,#201
 882  0012 6b05          	ld	(OFST-4,sp),a
 884  0014               L363:
 885                     ; 557     return (status);
 887  0014 7b05          	ld	a,(OFST-4,sp)
 890  0016 5b0b          	addw	sp,#11
 891  0018 81            	ret
 892  0019               L553:
 893                     ; 535         stack_ptr = (uint8_t *)tcb_ptr->stack_top - (tcb_ptr->stack_size - 1);
 895  0019 1e0a          	ldw	x,(OFST+1,sp)
 896  001b ee15          	ldw	x,(21,x)
 897  001d 5a            	decw	x
 898  001e 1f03          	ldw	(OFST-6,sp),x
 899  0020 1e0a          	ldw	x,(OFST+1,sp)
 900  0022 ee11          	ldw	x,(17,x)
 901  0024 72f003        	subw	x,(OFST-6,sp)
 902  0027 1f06          	ldw	(OFST-3,sp),x
 903                     ; 536         for (i = 0; i < tcb_ptr->stack_size; i++)
 905  0029 5f            	clrw	x
 906  002a 1f08          	ldw	(OFST-1,sp),x
 908  002c 2036          	jra	L173
 909  002e               L563:
 910                     ; 539             if (*stack_ptr++ != STACK_CHECK_BYTE)
 912  002e 1e06          	ldw	x,(OFST-3,sp)
 913  0030 1c0001        	addw	x,#1
 914  0033 1f06          	ldw	(OFST-3,sp),x
 915  0035 1d0001        	subw	x,#1
 916  0038 f6            	ld	a,(x)
 917  0039 a15a          	cp	a,#90
 918  003b 2720          	jreq	L573
 919                     ; 542                 break;
 920  003d               L373:
 921                     ; 547         *free_bytes = (uint32_t)i;
 923  003d 1e08          	ldw	x,(OFST-1,sp)
 924  003f cd0000        	call	c_itolx
 926  0042 1e10          	ldw	x,(OFST+7,sp)
 927  0044 cd0000        	call	c_rtol
 929                     ; 550         *used_bytes = tcb_ptr->stack_size - *free_bytes;
 931  0047 1e0a          	ldw	x,(OFST+1,sp)
 932  0049 1c0013        	addw	x,#19
 933  004c cd0000        	call	c_ltor
 935  004f 1e10          	ldw	x,(OFST+7,sp)
 936  0051 cd0000        	call	c_lsub
 938  0054 1e0e          	ldw	x,(OFST+5,sp)
 939  0056 cd0000        	call	c_rtol
 941                     ; 553         status = ATOM_OK;
 943  0059 0f05          	clr	(OFST-4,sp)
 944  005b 20b7          	jra	L363
 945  005d               L573:
 946                     ; 536         for (i = 0; i < tcb_ptr->stack_size; i++)
 948  005d 1e08          	ldw	x,(OFST-1,sp)
 949  005f 1c0001        	addw	x,#1
 950  0062 1f08          	ldw	(OFST-1,sp),x
 951  0064               L173:
 954  0064 1e08          	ldw	x,(OFST-1,sp)
 955  0066 cd0000        	call	c_itolx
 957  0069 96            	ldw	x,sp
 958  006a 1c0001        	addw	x,#OFST-8
 959  006d cd0000        	call	c_rtol
 961  0070 1e0a          	ldw	x,(OFST+1,sp)
 962  0072 1c0013        	addw	x,#19
 963  0075 cd0000        	call	c_ltor
 965  0078 96            	ldw	x,sp
 966  0079 1c0001        	addw	x,#OFST-8
 967  007c cd0000        	call	c_lcmp
 969  007f 22ad          	jrugt	L563
 970  0081 20ba          	jra	L373
 994                     ; 573 void atomIntEnter (void)
 994                     ; 574 {
 995                     .text:	section	.text,new
 996  0000               _atomIntEnter:
1000                     ; 576     atomIntCnt++;
1002  0000 ce0005        	ldw	x,L7_atomIntCnt
1003  0003 1c0001        	addw	x,#1
1004  0006 cf0005        	ldw	L7_atomIntCnt,x
1005                     ; 577 }
1008  0009 81            	ret
1042                     ; 596 void atomIntExit (uint8_t timer_tick)
1042                     ; 597 {
1043                     .text:	section	.text,new
1044  0000               _atomIntExit:
1048                     ; 599     atomIntCnt--;
1050  0000 ce0005        	ldw	x,L7_atomIntCnt
1051  0003 1d0001        	subw	x,#1
1052  0006 cf0005        	ldw	L7_atomIntCnt,x
1053                     ; 602     atomSched (timer_tick);
1055  0009 cd0000        	call	_atomSched
1057                     ; 603 }
1060  000c 81            	ret
1088                     ; 616 ATOM_TCB *atomCurrentContext (void)
1088                     ; 617 {
1089                     .text:	section	.text,new
1090  0000               _atomCurrentContext:
1094                     ; 619     if (atomIntCnt == 0)
1096  0000 ce0005        	ldw	x,L7_atomIntCnt
1097  0003 2604          	jrne	L534
1098                     ; 620         return (curr_tcb);
1100  0005 ce0003        	ldw	x,L3_curr_tcb
1103  0008 81            	ret
1104  0009               L534:
1105                     ; 622         return (NULL);
1107  0009 5f            	clrw	x
1110  000a 81            	ret
1168                     ; 657 uint8_t atomOSInit (void *idle_thread_stack_top, uint32_t idle_thread_stack_size)
1168                     ; 658 {
1169                     .text:	section	.text,new
1170  0000               _atomOSInit:
1172  0000 89            	pushw	x
1173  0001 88            	push	a
1174       00000001      OFST:	set	1
1177                     ; 662     curr_tcb = NULL;
1179  0002 5f            	clrw	x
1180  0003 cf0003        	ldw	L3_curr_tcb,x
1181                     ; 663     tcbReadyQ = NULL;
1183  0006 5f            	clrw	x
1184  0007 cf0000        	ldw	_tcbReadyQ,x
1185                     ; 664     atomOSStarted = FALSE;
1187  000a 725f0002      	clr	_atomOSStarted
1188                     ; 667     status = atomThreadCreate(&idle_tcb,
1188                     ; 668                  IDLE_THREAD_PRIORITY,
1188                     ; 669                  atomIdleThread,
1188                     ; 670                  0,
1188                     ; 671                  idle_thread_stack_top,
1188                     ; 672                  idle_thread_stack_size);
1190  000e 1e08          	ldw	x,(OFST+7,sp)
1191  0010 89            	pushw	x
1192  0011 1e08          	ldw	x,(OFST+7,sp)
1193  0013 89            	pushw	x
1194  0014 1e06          	ldw	x,(OFST+5,sp)
1195  0016 89            	pushw	x
1196  0017 ae0000        	ldw	x,#0
1197  001a 89            	pushw	x
1198  001b ae0000        	ldw	x,#0
1199  001e 89            	pushw	x
1200  001f ae0000        	ldw	x,#L31_atomIdleThread
1201  0022 89            	pushw	x
1202  0023 4bff          	push	#255
1203  0025 ae0000        	ldw	x,#L5_idle_tcb
1204  0028 cd0000        	call	_atomThreadCreate
1206  002b 5b0d          	addw	sp,#13
1207  002d 6b01          	ld	(OFST+0,sp),a
1208                     ; 675     return (status);
1210  002f 7b01          	ld	a,(OFST+0,sp)
1213  0031 5b03          	addw	sp,#3
1214  0033 81            	ret
1256                     ; 694 void atomOSStart (void)
1256                     ; 695 {
1257                     .text:	section	.text,new
1258  0000               _atomOSStart:
1260  0000 89            	pushw	x
1261       00000002      OFST:	set	2
1264                     ; 703     atomOSStarted = TRUE;
1266  0001 35010002      	mov	_atomOSStarted,#1
1267                     ; 712     new_tcb = tcbDequeuePriority (&tcbReadyQ, 255);
1269  0005 4bff          	push	#255
1270  0007 ae0000        	ldw	x,#_tcbReadyQ
1271  000a cd0000        	call	_tcbDequeuePriority
1273  000d 84            	pop	a
1274  000e 1f01          	ldw	(OFST-1,sp),x
1275                     ; 713     if (new_tcb)
1277  0010 1e01          	ldw	x,(OFST-1,sp)
1278  0012 270a          	jreq	L505
1279                     ; 716         curr_tcb = new_tcb;
1281  0014 1e01          	ldw	x,(OFST-1,sp)
1282  0016 cf0003        	ldw	L3_curr_tcb,x
1283                     ; 719         archFirstThreadRestore (new_tcb);
1285  0019 1e01          	ldw	x,(OFST-1,sp)
1286  001b cd0000        	call	_archFirstThreadRestore
1289  001e               L505:
1290                     ; 728 }
1293  001e 85            	popw	x
1294  001f 81            	ret
1326                     ; 744 static void atomIdleThread (uint32_t param)
1326                     ; 745 {
1327                     .text:	section	.text,new
1328  0000               L31_atomIdleThread:
1330       00000000      OFST:	set	0
1333                     ; 747     param = param;
1335  0000               L325:
1337  0000 20fe          	jra	L325
1418                     ; 780 uint8_t tcbEnqueuePriority (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1418                     ; 781 {
1419                     .text:	section	.text,new
1420  0000               _tcbEnqueuePriority:
1422  0000 89            	pushw	x
1423  0001 5205          	subw	sp,#5
1424       00000005      OFST:	set	5
1427                     ; 786     if ((tcb_queue_ptr == NULL) || (tcb_ptr == NULL))
1429  0003 a30000        	cpw	x,#0
1430  0006 2704          	jreq	L575
1432  0008 1e0a          	ldw	x,(OFST+5,sp)
1433  000a 2609          	jrne	L375
1434  000c               L575:
1435                     ; 789         status = ATOM_ERR_PARAM;
1437  000c a6c9          	ld	a,#201
1438  000e 6b01          	ld	(OFST-4,sp),a
1440  0010               L775:
1441                     ; 839     return (status);
1443  0010 7b01          	ld	a,(OFST-4,sp)
1446  0012 5b07          	addw	sp,#7
1447  0014 81            	ret
1448  0015               L375:
1449                     ; 794         prev_ptr = next_ptr = *tcb_queue_ptr;
1451  0015 1e06          	ldw	x,(OFST+1,sp)
1452  0017 fe            	ldw	x,(x)
1453  0018 1f04          	ldw	(OFST-1,sp),x
1454  001a 1e04          	ldw	x,(OFST-1,sp)
1455  001c 1f02          	ldw	(OFST-3,sp),x
1456  001e               L106:
1457                     ; 801             if ((next_ptr == NULL) || (next_ptr->priority > tcb_ptr->priority))
1459  001e 1e04          	ldw	x,(OFST-1,sp)
1460  0020 270a          	jreq	L116
1462  0022 1e04          	ldw	x,(OFST-1,sp)
1463  0024 e602          	ld	a,(2,x)
1464  0026 1e0a          	ldw	x,(OFST+5,sp)
1465  0028 e102          	cp	a,(2,x)
1466  002a 2346          	jrule	L706
1467  002c               L116:
1468                     ; 804                 if (next_ptr == *tcb_queue_ptr)
1470  002c 1e06          	ldw	x,(OFST+1,sp)
1471  002e 9093          	ldw	y,x
1472  0030 51            	exgw	x,y
1473  0031 fe            	ldw	x,(x)
1474  0032 1304          	cpw	x,(OFST-1,sp)
1475  0034 51            	exgw	x,y
1476  0035 261d          	jrne	L316
1477                     ; 806                     *tcb_queue_ptr = tcb_ptr;
1479  0037 1e06          	ldw	x,(OFST+1,sp)
1480  0039 160a          	ldw	y,(OFST+5,sp)
1481  003b ff            	ldw	(x),y
1482                     ; 807                     tcb_ptr->prev_tcb = NULL;
1484  003c 1e0a          	ldw	x,(OFST+5,sp)
1485  003e 905f          	clrw	y
1486  0040 ef09          	ldw	(9,x),y
1487                     ; 808                     tcb_ptr->next_tcb = next_ptr;
1489  0042 1e0a          	ldw	x,(OFST+5,sp)
1490  0044 1604          	ldw	y,(OFST-1,sp)
1491  0046 ef0b          	ldw	(11,x),y
1492                     ; 809                     if (next_ptr)
1494  0048 1e04          	ldw	x,(OFST-1,sp)
1495  004a 2734          	jreq	L506
1496                     ; 810                         next_ptr->prev_tcb = tcb_ptr;
1498  004c 1e04          	ldw	x,(OFST-1,sp)
1499  004e 160a          	ldw	y,(OFST+5,sp)
1500  0050 ef09          	ldw	(9,x),y
1501  0052 202c          	jra	L506
1502  0054               L316:
1503                     ; 815                     tcb_ptr->prev_tcb = prev_ptr;
1505  0054 1e0a          	ldw	x,(OFST+5,sp)
1506  0056 1602          	ldw	y,(OFST-3,sp)
1507  0058 ef09          	ldw	(9,x),y
1508                     ; 816                     tcb_ptr->next_tcb = next_ptr;
1510  005a 1e0a          	ldw	x,(OFST+5,sp)
1511  005c 1604          	ldw	y,(OFST-1,sp)
1512  005e ef0b          	ldw	(11,x),y
1513                     ; 817                     prev_ptr->next_tcb = tcb_ptr;
1515  0060 1e02          	ldw	x,(OFST-3,sp)
1516  0062 160a          	ldw	y,(OFST+5,sp)
1517  0064 ef0b          	ldw	(11,x),y
1518                     ; 818                     if (next_ptr)
1520  0066 1e04          	ldw	x,(OFST-1,sp)
1521  0068 2716          	jreq	L506
1522                     ; 819                         next_ptr->prev_tcb = tcb_ptr;
1524  006a 1e04          	ldw	x,(OFST-1,sp)
1525  006c 160a          	ldw	y,(OFST+5,sp)
1526  006e ef09          	ldw	(9,x),y
1527  0070 200e          	jra	L506
1528  0072               L706:
1529                     ; 828                 prev_ptr = next_ptr;
1531  0072 1e04          	ldw	x,(OFST-1,sp)
1532  0074 1f02          	ldw	(OFST-3,sp),x
1533                     ; 829                 next_ptr = next_ptr->next_tcb;
1535  0076 1e04          	ldw	x,(OFST-1,sp)
1536  0078 ee0b          	ldw	x,(11,x)
1537  007a 1f04          	ldw	(OFST-1,sp),x
1538  007c               L306:
1539                     ; 833         while (prev_ptr != NULL);
1541  007c 1e02          	ldw	x,(OFST-3,sp)
1542  007e 269e          	jrne	L106
1543  0080               L506:
1544                     ; 836         status = ATOM_OK;
1546  0080 0f01          	clr	(OFST-4,sp)
1547  0082 208c          	jra	L775
1600                     ; 865 ATOM_TCB *tcbDequeueHead (ATOM_TCB **tcb_queue_ptr)
1600                     ; 866 {
1601                     .text:	section	.text,new
1602  0000               _tcbDequeueHead:
1604  0000 89            	pushw	x
1605  0001 89            	pushw	x
1606       00000002      OFST:	set	2
1609                     ; 870     if (tcb_queue_ptr == NULL)
1611  0002 a30000        	cpw	x,#0
1612  0005 2605          	jrne	L556
1613                     ; 873         ret_ptr = NULL;
1615  0007 5f            	clrw	x
1616  0008 1f01          	ldw	(OFST-1,sp),x
1618  000a 2038          	jra	L756
1619  000c               L556:
1620                     ; 876     else if (*tcb_queue_ptr == NULL)
1622  000c 1e03          	ldw	x,(OFST+1,sp)
1623  000e e601          	ld	a,(1,x)
1624  0010 fa            	or	a,(x)
1625  0011 2605          	jrne	L166
1626                     ; 879         ret_ptr = NULL;
1628  0013 5f            	clrw	x
1629  0014 1f01          	ldw	(OFST-1,sp),x
1631  0016 202c          	jra	L756
1632  0018               L166:
1633                     ; 884         ret_ptr = *tcb_queue_ptr;
1635  0018 1e03          	ldw	x,(OFST+1,sp)
1636  001a fe            	ldw	x,(x)
1637  001b 1f01          	ldw	(OFST-1,sp),x
1638                     ; 885         *tcb_queue_ptr = ret_ptr->next_tcb;
1640  001d 1e01          	ldw	x,(OFST-1,sp)
1641  001f 1603          	ldw	y,(OFST+1,sp)
1642  0021 89            	pushw	x
1643  0022 ee0b          	ldw	x,(11,x)
1644  0024 90ff          	ldw	(y),x
1645  0026 85            	popw	x
1646                     ; 886         if (*tcb_queue_ptr)
1648  0027 1e03          	ldw	x,(OFST+1,sp)
1649  0029 e601          	ld	a,(1,x)
1650  002b fa            	or	a,(x)
1651  002c 2707          	jreq	L566
1652                     ; 887             (*tcb_queue_ptr)->prev_tcb = NULL;
1654  002e 1e03          	ldw	x,(OFST+1,sp)
1655  0030 fe            	ldw	x,(x)
1656  0031 905f          	clrw	y
1657  0033 ef09          	ldw	(9,x),y
1658  0035               L566:
1659                     ; 888         ret_ptr->next_tcb = ret_ptr->prev_tcb = NULL;
1661  0035 1e01          	ldw	x,(OFST-1,sp)
1662  0037 905f          	clrw	y
1663  0039 ef09          	ldw	(9,x),y
1664  003b 1601          	ldw	y,(OFST-1,sp)
1665  003d 89            	pushw	x
1666  003e ee09          	ldw	x,(9,x)
1667  0040 90ef0b        	ldw	(11,y),x
1668  0043 85            	popw	x
1669  0044               L756:
1670                     ; 891     return (ret_ptr);
1672  0044 1e01          	ldw	x,(OFST-1,sp)
1675  0046 5b04          	addw	sp,#4
1676  0048 81            	ret
1765                     ; 916 ATOM_TCB *tcbDequeueEntry (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1765                     ; 917 {
1766                     .text:	section	.text,new
1767  0000               _tcbDequeueEntry:
1769  0000 89            	pushw	x
1770  0001 5206          	subw	sp,#6
1771       00000006      OFST:	set	6
1774                     ; 921     if (tcb_queue_ptr == NULL)
1776  0003 a30000        	cpw	x,#0
1777  0006 2605          	jrne	L147
1778                     ; 924         ret_ptr = NULL;
1780  0008 5f            	clrw	x
1781  0009 1f03          	ldw	(OFST-3,sp),x
1783  000b 200a          	jra	L347
1784  000d               L147:
1785                     ; 927     else if (*tcb_queue_ptr == NULL)
1787  000d 1e07          	ldw	x,(OFST+1,sp)
1788  000f e601          	ld	a,(1,x)
1789  0011 fa            	or	a,(x)
1790  0012 2608          	jrne	L547
1791                     ; 930         ret_ptr = NULL;
1793  0014 5f            	clrw	x
1794  0015 1f03          	ldw	(OFST-3,sp),x
1796  0017               L347:
1797                     ; 967     return (ret_ptr);
1799  0017 1e03          	ldw	x,(OFST-3,sp)
1802  0019 5b08          	addw	sp,#8
1803  001b 81            	ret
1804  001c               L547:
1805                     ; 935         ret_ptr = NULL;
1807  001c 5f            	clrw	x
1808  001d 1f03          	ldw	(OFST-3,sp),x
1809                     ; 936         prev_ptr = next_ptr = *tcb_queue_ptr;
1811  001f 1e07          	ldw	x,(OFST+1,sp)
1812  0021 fe            	ldw	x,(x)
1813  0022 1f05          	ldw	(OFST-1,sp),x
1814  0024 1e05          	ldw	x,(OFST-1,sp)
1815  0026 1f01          	ldw	(OFST-5,sp),x
1817  0028 2065          	jra	L557
1818  002a               L157:
1819                     ; 940             if (next_ptr == tcb_ptr)
1821  002a 1e05          	ldw	x,(OFST-1,sp)
1822  002c 130b          	cpw	x,(OFST+5,sp)
1823  002e 2655          	jrne	L167
1824                     ; 942                 if (next_ptr == *tcb_queue_ptr)
1826  0030 1e07          	ldw	x,(OFST+1,sp)
1827  0032 9093          	ldw	y,x
1828  0034 51            	exgw	x,y
1829  0035 fe            	ldw	x,(x)
1830  0036 1305          	cpw	x,(OFST-1,sp)
1831  0038 51            	exgw	x,y
1832  0039 261a          	jrne	L367
1833                     ; 945                     *tcb_queue_ptr = next_ptr->next_tcb;
1835  003b 1e05          	ldw	x,(OFST-1,sp)
1836  003d 1607          	ldw	y,(OFST+1,sp)
1837  003f 89            	pushw	x
1838  0040 ee0b          	ldw	x,(11,x)
1839  0042 90ff          	ldw	(y),x
1840  0044 85            	popw	x
1841                     ; 946                     if (*tcb_queue_ptr)
1843  0045 1e07          	ldw	x,(OFST+1,sp)
1844  0047 e601          	ld	a,(1,x)
1845  0049 fa            	or	a,(x)
1846  004a 2724          	jreq	L767
1847                     ; 947                         (*tcb_queue_ptr)->prev_tcb = NULL;
1849  004c 1e07          	ldw	x,(OFST+1,sp)
1850  004e fe            	ldw	x,(x)
1851  004f 905f          	clrw	y
1852  0051 ef09          	ldw	(9,x),y
1853  0053 201b          	jra	L767
1854  0055               L367:
1855                     ; 952                     prev_ptr->next_tcb = next_ptr->next_tcb;
1857  0055 1e05          	ldw	x,(OFST-1,sp)
1858  0057 1601          	ldw	y,(OFST-5,sp)
1859  0059 89            	pushw	x
1860  005a ee0b          	ldw	x,(11,x)
1861  005c 90ef0b        	ldw	(11,y),x
1862  005f 85            	popw	x
1863                     ; 953                     if (next_ptr->next_tcb)
1865  0060 1e05          	ldw	x,(OFST-1,sp)
1866  0062 e60c          	ld	a,(12,x)
1867  0064 ea0b          	or	a,(11,x)
1868  0066 2708          	jreq	L767
1869                     ; 954                         next_ptr->next_tcb->prev_tcb = prev_ptr;
1871  0068 1e05          	ldw	x,(OFST-1,sp)
1872  006a ee0b          	ldw	x,(11,x)
1873  006c 1601          	ldw	y,(OFST-5,sp)
1874  006e ef09          	ldw	(9,x),y
1875  0070               L767:
1876                     ; 956                 ret_ptr = next_ptr;
1878  0070 1e05          	ldw	x,(OFST-1,sp)
1879  0072 1f03          	ldw	(OFST-3,sp),x
1880                     ; 957                 ret_ptr->prev_tcb = ret_ptr->next_tcb = NULL;
1882  0074 1e03          	ldw	x,(OFST-3,sp)
1883  0076 905f          	clrw	y
1884  0078 ef0b          	ldw	(11,x),y
1885  007a 1603          	ldw	y,(OFST-3,sp)
1886  007c 89            	pushw	x
1887  007d ee0b          	ldw	x,(11,x)
1888  007f 90ef09        	ldw	(9,y),x
1889  0082 85            	popw	x
1890                     ; 958                 break;
1892  0083 2092          	jra	L347
1893  0085               L167:
1894                     ; 962             prev_ptr = next_ptr;
1896  0085 1e05          	ldw	x,(OFST-1,sp)
1897  0087 1f01          	ldw	(OFST-5,sp),x
1898                     ; 963             next_ptr = next_ptr->next_tcb;
1900  0089 1e05          	ldw	x,(OFST-1,sp)
1901  008b ee0b          	ldw	x,(11,x)
1902  008d 1f05          	ldw	(OFST-1,sp),x
1903  008f               L557:
1904                     ; 937         while (next_ptr)
1906  008f 1e05          	ldw	x,(OFST-1,sp)
1907  0091 2697          	jrne	L157
1908  0093 2082          	jra	L347
1968                     ; 997 ATOM_TCB *tcbDequeuePriority (ATOM_TCB **tcb_queue_ptr, uint8_t priority)
1968                     ; 998 {
1969                     .text:	section	.text,new
1970  0000               _tcbDequeuePriority:
1972  0000 89            	pushw	x
1973  0001 89            	pushw	x
1974       00000002      OFST:	set	2
1977                     ; 1002     if (tcb_queue_ptr == NULL)
1979  0002 a30000        	cpw	x,#0
1980  0005 2605          	jrne	L5201
1981                     ; 1005         ret_ptr = NULL;
1983  0007 5f            	clrw	x
1984  0008 1f01          	ldw	(OFST-1,sp),x
1986  000a 203e          	jra	L7201
1987  000c               L5201:
1988                     ; 1008     else if (*tcb_queue_ptr == NULL)
1990  000c 1e03          	ldw	x,(OFST+1,sp)
1991  000e e601          	ld	a,(1,x)
1992  0010 fa            	or	a,(x)
1993  0011 2605          	jrne	L1301
1994                     ; 1011         ret_ptr = NULL;
1996  0013 5f            	clrw	x
1997  0014 1f01          	ldw	(OFST-1,sp),x
1999  0016 2032          	jra	L7201
2000  0018               L1301:
2001                     ; 1014     else if ((*tcb_queue_ptr)->priority <= priority)
2003  0018 1e03          	ldw	x,(OFST+1,sp)
2004  001a fe            	ldw	x,(x)
2005  001b e602          	ld	a,(2,x)
2006  001d 1107          	cp	a,(OFST+5,sp)
2007  001f 2226          	jrugt	L5301
2008                     ; 1017         ret_ptr = *tcb_queue_ptr;
2010  0021 1e03          	ldw	x,(OFST+1,sp)
2011  0023 fe            	ldw	x,(x)
2012  0024 1f01          	ldw	(OFST-1,sp),x
2013                     ; 1018         *tcb_queue_ptr = (*tcb_queue_ptr)->next_tcb;
2015  0026 1e03          	ldw	x,(OFST+1,sp)
2016  0028 fe            	ldw	x,(x)
2017  0029 1603          	ldw	y,(OFST+1,sp)
2018  002b 89            	pushw	x
2019  002c ee0b          	ldw	x,(11,x)
2020  002e 90ff          	ldw	(y),x
2021  0030 85            	popw	x
2022                     ; 1019         if (*tcb_queue_ptr)
2024  0031 1e03          	ldw	x,(OFST+1,sp)
2025  0033 e601          	ld	a,(1,x)
2026  0035 fa            	or	a,(x)
2027  0036 2712          	jreq	L7201
2028                     ; 1021             (*tcb_queue_ptr)->prev_tcb = NULL;
2030  0038 1e03          	ldw	x,(OFST+1,sp)
2031  003a fe            	ldw	x,(x)
2032  003b 905f          	clrw	y
2033  003d ef09          	ldw	(9,x),y
2034                     ; 1022             ret_ptr->next_tcb = NULL;
2036  003f 1e01          	ldw	x,(OFST-1,sp)
2037  0041 905f          	clrw	y
2038  0043 ef0b          	ldw	(11,x),y
2039  0045 2003          	jra	L7201
2040  0047               L5301:
2041                     ; 1028         ret_ptr = NULL;
2043  0047 5f            	clrw	x
2044  0048 1f01          	ldw	(OFST-1,sp),x
2045  004a               L7201:
2046                     ; 1031     return (ret_ptr);
2048  004a 1e01          	ldw	x,(OFST-1,sp)
2051  004c 5b04          	addw	sp,#4
2052  004e 81            	ret
2115                     	switch	.bss
2116  0000               L5_idle_tcb:
2117  0000 000000000000  	ds.b	23
2118                     	xref	_archFirstThreadRestore
2119                     	xref	_archThreadContextInit
2120                     	xref	_archContextSwitch
2121                     	xdef	_atomThreadStackCheck
2122                     	xdef	_atomThreadCreate
2123                     	xdef	_atomCurrentContext
2124                     	xdef	_tcbDequeuePriority
2125                     	xdef	_tcbDequeueEntry
2126                     	xdef	_tcbDequeueHead
2127                     	xdef	_tcbEnqueuePriority
2128                     	xdef	_atomIntExit
2129                     	xdef	_atomIntEnter
2130                     	xdef	_atomSched
2131                     	xdef	_atomOSStart
2132                     	xdef	_atomOSInit
2133                     	xdef	_atomOSStarted
2134                     	xdef	_tcbReadyQ
2154                     	xref	c_lsub
2155                     	xref	c_lcmp
2156                     	xref	c_rtol
2157                     	xref	c_itolx
2158                     	xref	c_ltor
2159                     	xref	c_lgsbc
2160                     	xref	c_lzmp
2161                     	end
