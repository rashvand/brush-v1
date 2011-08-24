   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
 103                     .const:	section	.text
 104  0000               L6:
 105  0000 000003e8      	dc.l	1000
 108                     ; 64 uint32_t test_start (void)
 108                     ; 65 {
 109                     	scross	off
 110                     .text:	section	.text,new
 111  0000               _test_start:
 113  0000 5211          	subw	sp,#17
 114       00000011      OFST:	set	17
 117                     ; 71     failures = 0;
 119  0002 5f            	clrw	x
 120  0003 1f10          	ldw	(OFST-1,sp),x
 121                     ; 74     for (i = 0; i < 1000; i++)
 123  0005 ae0000        	ldw	x,#0
 124  0008 1f0e          	ldw	(OFST-3,sp),x
 125  000a ae0000        	ldw	x,#0
 126  000d 1f0c          	ldw	(OFST-5,sp),x
 127  000f               L35:
 128                     ; 76         if (atomSemCreate (&sem1, 0) == ATOM_OK)
 130  000f 4b00          	push	#0
 131  0011 ae0131        	ldw	x,#L3_sem1
 132  0014 cd0000        	call	_atomSemCreate
 134  0017 5b01          	addw	sp,#1
 135  0019 4d            	tnz	a
 136  001a 2632          	jrne	L16
 137                     ; 78             if (atomSemDelete (&sem1) == ATOM_OK)
 139  001c ae0131        	ldw	x,#L3_sem1
 140  001f cd0000        	call	_atomSemDelete
 142  0022 4d            	tnz	a
 143  0023 261a          	jrne	L36
 145  0025               L17:
 146                     ; 74     for (i = 0; i < 1000; i++)
 148  0025 96            	ldw	x,sp
 149  0026 1c000c        	addw	x,#OFST-5
 150  0029 a601          	ld	a,#1
 151  002b cd0000        	call	c_lgadc
 155  002e 96            	ldw	x,sp
 156  002f 1c000c        	addw	x,#OFST-5
 157  0032 cd0000        	call	c_ltor
 159  0035 ae0000        	ldw	x,#L6
 160  0038 cd0000        	call	c_lcmp
 162  003b 25d2          	jrult	L35
 163  003d 201c          	jra	L75
 164  003f               L36:
 165                     ; 85                 ATOMLOG (_STR("Error deleting semaphore\n"));
 167  003f ae01e6        	ldw	x,#L76
 168  0042 cd0000        	call	_printf
 170                     ; 86                 failures++;
 172  0045 1e10          	ldw	x,(OFST-1,sp)
 173  0047 1c0001        	addw	x,#1
 174  004a 1f10          	ldw	(OFST-1,sp),x
 175                     ; 87                 break;
 177  004c 200d          	jra	L75
 178  004e               L16:
 179                     ; 93             ATOMLOG (_STR("Error creating semaphore\n"));
 181  004e ae01cc        	ldw	x,#L37
 182  0051 cd0000        	call	_printf
 184                     ; 94             failures++;
 186  0054 1e10          	ldw	x,(OFST-1,sp)
 187  0056 1c0001        	addw	x,#1
 188  0059 1f10          	ldw	(OFST-1,sp),x
 189                     ; 95             break;
 190  005b               L75:
 191                     ; 100     if (atomSemCreate (NULL, 0) != ATOM_OK)
 193  005b 4b00          	push	#0
 194  005d 5f            	clrw	x
 195  005e cd0000        	call	_atomSemCreate
 197  0061 5b01          	addw	sp,#1
 198  0063 4d            	tnz	a
 199  0064 260d          	jrne	L77
 201                     ; 107         ATOMLOG (_STR("Bad semaphore creation checks\n"));
 203  0066 ae01ad        	ldw	x,#L101
 204  0069 cd0000        	call	_printf
 206                     ; 108         failures++;
 208  006c 1e10          	ldw	x,(OFST-1,sp)
 209  006e 1c0001        	addw	x,#1
 210  0071 1f10          	ldw	(OFST-1,sp),x
 211  0073               L77:
 212                     ; 112     if (atomSemDelete (NULL) != ATOM_OK)
 214  0073 5f            	clrw	x
 215  0074 cd0000        	call	_atomSemDelete
 217  0077 4d            	tnz	a
 218  0078 260d          	jrne	L501
 220                     ; 119         ATOMLOG (_STR("Bad semaphore deletion checks\n"));
 222  007a ae018e        	ldw	x,#L701
 223  007d cd0000        	call	_printf
 225                     ; 120         failures++;
 227  0080 1e10          	ldw	x,(OFST-1,sp)
 228  0082 1c0001        	addw	x,#1
 229  0085 1f10          	ldw	(OFST-1,sp),x
 230  0087               L501:
 231                     ; 124     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 233  0087 4b00          	push	#0
 234  0089 ae0131        	ldw	x,#L3_sem1
 235  008c cd0000        	call	_atomSemCreate
 237  008f 5b01          	addw	sp,#1
 238  0091 4d            	tnz	a
 239  0092 2711          	jreq	L111
 240                     ; 126         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 242  0094 ae016d        	ldw	x,#L311
 243  0097 cd0000        	call	_printf
 245                     ; 127         failures++;
 247  009a 1e10          	ldw	x,(OFST-1,sp)
 248  009c 1c0001        	addw	x,#1
 249  009f 1f10          	ldw	(OFST-1,sp),x
 251  00a1 ac6b016b      	jpf	L511
 252  00a5               L111:
 253                     ; 130     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 255  00a5 4b00          	push	#0
 256  00a7 ae012e        	ldw	x,#L5_sem2
 257  00aa cd0000        	call	_atomSemCreate
 259  00ad 5b01          	addw	sp,#1
 260  00af 4d            	tnz	a
 261  00b0 2711          	jreq	L711
 262                     ; 132         ATOMLOG (_STR("Error creating test semaphore 2\n"));
 264  00b2 ae014c        	ldw	x,#L121
 265  00b5 cd0000        	call	_printf
 267                     ; 133         failures++;
 269  00b8 1e10          	ldw	x,(OFST-1,sp)
 270  00ba 1c0001        	addw	x,#1
 271  00bd 1f10          	ldw	(OFST-1,sp),x
 273  00bf ac6b016b      	jpf	L511
 274  00c3               L711:
 275                     ; 136     else if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test1_thread_func, 0,
 275                     ; 137               &test_thread_stack[0][TEST_THREAD_STACK_SIZE - 1],
 275                     ; 138               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 277  00c3 ae0080        	ldw	x,#128
 278  00c6 89            	pushw	x
 279  00c7 ae0000        	ldw	x,#0
 280  00ca 89            	pushw	x
 281  00cb ae007f        	ldw	x,#L11_test_thread_stack+127
 282  00ce 89            	pushw	x
 283  00cf ae0000        	ldw	x,#0
 284  00d2 89            	pushw	x
 285  00d3 ae0000        	ldw	x,#0
 286  00d6 89            	pushw	x
 287  00d7 ae0000        	ldw	x,#L31_test1_thread_func
 288  00da 89            	pushw	x
 289  00db 4b10          	push	#16
 290  00dd ae0100        	ldw	x,#L7_tcb
 291  00e0 cd0000        	call	_atomThreadCreate
 293  00e3 5b0d          	addw	sp,#13
 294  00e5 4d            	tnz	a
 295  00e6 270f          	jreq	L521
 296                     ; 141         ATOMLOG (_STR("Error creating test thread 1\n"));
 298  00e8 ae012e        	ldw	x,#L721
 299  00eb cd0000        	call	_printf
 301                     ; 142         failures++;
 303  00ee 1e10          	ldw	x,(OFST-1,sp)
 304  00f0 1c0001        	addw	x,#1
 305  00f3 1f10          	ldw	(OFST-1,sp),x
 307  00f5 2074          	jra	L511
 308  00f7               L521:
 309                     ; 156         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 311  00f7 ae0064        	ldw	x,#100
 312  00fa 89            	pushw	x
 313  00fb ae0000        	ldw	x,#0
 314  00fe 89            	pushw	x
 315  00ff cd0000        	call	_atomTimerDelay
 317  0102 5b04          	addw	sp,#4
 318  0104 4d            	tnz	a
 319  0105 270f          	jreq	L331
 320                     ; 158             ATOMLOG (_STR("Failed timer delay\n"));
 322  0107 ae011a        	ldw	x,#L531
 323  010a cd0000        	call	_printf
 325                     ; 159             failures++;
 327  010d 1e10          	ldw	x,(OFST-1,sp)
 328  010f 1c0001        	addw	x,#1
 329  0112 1f10          	ldw	(OFST-1,sp),x
 331  0114 2055          	jra	L511
 332  0116               L331:
 333                     ; 164             if (atomSemDelete(&sem1) != ATOM_OK)
 335  0116 ae0131        	ldw	x,#L3_sem1
 336  0119 cd0000        	call	_atomSemDelete
 338  011c 4d            	tnz	a
 339  011d 270f          	jreq	L141
 340                     ; 166                 ATOMLOG (_STR("Failed sem1 delete\n"));
 342  011f ae0106        	ldw	x,#L341
 343  0122 cd0000        	call	_printf
 345                     ; 167                 failures++;
 347  0125 1e10          	ldw	x,(OFST-1,sp)
 348  0127 1c0001        	addw	x,#1
 349  012a 1f10          	ldw	(OFST-1,sp),x
 351  012c 203d          	jra	L511
 352  012e               L141:
 353                     ; 172                 if ((status = atomSemGet (&sem2, (5*SYSTEM_TICKS_PER_SEC))) != ATOM_OK)
 355  012e ae01f4        	ldw	x,#500
 356  0131 89            	pushw	x
 357  0132 ae0000        	ldw	x,#0
 358  0135 89            	pushw	x
 359  0136 ae012e        	ldw	x,#L5_sem2
 360  0139 cd0000        	call	_atomSemGet
 362  013c 5b04          	addw	sp,#4
 363  013e 6b0b          	ld	(OFST-6,sp),a
 364  0140 2713          	jreq	L741
 365                     ; 174                     ATOMLOG (_STR("Notify fail (%d)\n"), status);
 367  0142 7b0b          	ld	a,(OFST-6,sp)
 368  0144 88            	push	a
 369  0145 ae00f4        	ldw	x,#L151
 370  0148 cd0000        	call	_printf
 372  014b 84            	pop	a
 373                     ; 175                     failures++;
 375  014c 1e10          	ldw	x,(OFST-1,sp)
 376  014e 1c0001        	addw	x,#1
 377  0151 1f10          	ldw	(OFST-1,sp),x
 379  0153 2016          	jra	L511
 380  0155               L741:
 381                     ; 182                     if (atomSemDelete (&sem2) != ATOM_OK)
 383  0155 ae012e        	ldw	x,#L5_sem2
 384  0158 cd0000        	call	_atomSemDelete
 386  015b 4d            	tnz	a
 387  015c 270d          	jreq	L511
 388                     ; 184                         ATOMLOG (_STR("Failed sem2 delete\n"));
 390  015e ae00e0        	ldw	x,#L751
 391  0161 cd0000        	call	_printf
 393                     ; 185                         failures++;
 395  0164 1e10          	ldw	x,(OFST-1,sp)
 396  0166 1c0001        	addw	x,#1
 397  0169 1f10          	ldw	(OFST-1,sp),x
 398  016b               L511:
 399                     ; 193     if (atomSemCreate (&sem1, 0) != ATOM_OK)
 401  016b 4b00          	push	#0
 402  016d ae0131        	ldw	x,#L3_sem1
 403  0170 cd0000        	call	_atomSemCreate
 405  0173 5b01          	addw	sp,#1
 406  0175 4d            	tnz	a
 407  0176 2711          	jreq	L161
 408                     ; 195         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 410  0178 ae016d        	ldw	x,#L311
 411  017b cd0000        	call	_printf
 413                     ; 196         failures++;
 415  017e 1e10          	ldw	x,(OFST-1,sp)
 416  0180 1c0001        	addw	x,#1
 417  0183 1f10          	ldw	(OFST-1,sp),x
 419  0185 ac4f024f      	jpf	L361
 420  0189               L161:
 421                     ; 198     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 423  0189 4b00          	push	#0
 424  018b ae012e        	ldw	x,#L5_sem2
 425  018e cd0000        	call	_atomSemCreate
 427  0191 5b01          	addw	sp,#1
 428  0193 4d            	tnz	a
 429  0194 2711          	jreq	L561
 430                     ; 200         ATOMLOG (_STR("Error creating test semaphore 2\n"));
 432  0196 ae014c        	ldw	x,#L121
 433  0199 cd0000        	call	_printf
 435                     ; 201         failures++;
 437  019c 1e10          	ldw	x,(OFST-1,sp)
 438  019e 1c0001        	addw	x,#1
 439  01a1 1f10          	ldw	(OFST-1,sp),x
 441  01a3 ac4f024f      	jpf	L361
 442  01a7               L561:
 443                     ; 203     else if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test2_thread_func, 0,
 443                     ; 204               &test_thread_stack[1][TEST_THREAD_STACK_SIZE - 1],
 443                     ; 205               TEST_THREAD_STACK_SIZE) != ATOM_OK)
 445  01a7 ae0080        	ldw	x,#128
 446  01aa 89            	pushw	x
 447  01ab ae0000        	ldw	x,#0
 448  01ae 89            	pushw	x
 449  01af ae00ff        	ldw	x,#L11_test_thread_stack+255
 450  01b2 89            	pushw	x
 451  01b3 ae0000        	ldw	x,#0
 452  01b6 89            	pushw	x
 453  01b7 ae0000        	ldw	x,#0
 454  01ba 89            	pushw	x
 455  01bb ae0000        	ldw	x,#L51_test2_thread_func
 456  01be 89            	pushw	x
 457  01bf 4b10          	push	#16
 458  01c1 ae0117        	ldw	x,#L7_tcb+23
 459  01c4 cd0000        	call	_atomThreadCreate
 461  01c7 5b0d          	addw	sp,#13
 462  01c9 4d            	tnz	a
 463  01ca 270f          	jreq	L171
 464                     ; 208         ATOMLOG (_STR("Error creating test thread 2\n"));
 466  01cc ae00c2        	ldw	x,#L371
 467  01cf cd0000        	call	_printf
 469                     ; 209         failures++;
 471  01d2 1e10          	ldw	x,(OFST-1,sp)
 472  01d4 1c0001        	addw	x,#1
 473  01d7 1f10          	ldw	(OFST-1,sp),x
 475  01d9 2074          	jra	L361
 476  01db               L171:
 477                     ; 222         if (atomTimerDelay(SYSTEM_TICKS_PER_SEC) != ATOM_OK)
 479  01db ae0064        	ldw	x,#100
 480  01de 89            	pushw	x
 481  01df ae0000        	ldw	x,#0
 482  01e2 89            	pushw	x
 483  01e3 cd0000        	call	_atomTimerDelay
 485  01e6 5b04          	addw	sp,#4
 486  01e8 4d            	tnz	a
 487  01e9 270f          	jreq	L771
 488                     ; 224             ATOMLOG (_STR("Failed timer delay\n"));
 490  01eb ae011a        	ldw	x,#L531
 491  01ee cd0000        	call	_printf
 493                     ; 225             failures++;
 495  01f1 1e10          	ldw	x,(OFST-1,sp)
 496  01f3 1c0001        	addw	x,#1
 497  01f6 1f10          	ldw	(OFST-1,sp),x
 499  01f8 2055          	jra	L361
 500  01fa               L771:
 501                     ; 230             if (atomSemDelete(&sem1) != ATOM_OK)
 503  01fa ae0131        	ldw	x,#L3_sem1
 504  01fd cd0000        	call	_atomSemDelete
 506  0200 4d            	tnz	a
 507  0201 270f          	jreq	L302
 508                     ; 232                 ATOMLOG (_STR("Failed sem1 delete\n"));
 510  0203 ae0106        	ldw	x,#L341
 511  0206 cd0000        	call	_printf
 513                     ; 233                 failures++;
 515  0209 1e10          	ldw	x,(OFST-1,sp)
 516  020b 1c0001        	addw	x,#1
 517  020e 1f10          	ldw	(OFST-1,sp),x
 519  0210 203d          	jra	L361
 520  0212               L302:
 521                     ; 238                 if ((status = atomSemGet (&sem2, (5*SYSTEM_TICKS_PER_SEC))) != ATOM_OK)
 523  0212 ae01f4        	ldw	x,#500
 524  0215 89            	pushw	x
 525  0216 ae0000        	ldw	x,#0
 526  0219 89            	pushw	x
 527  021a ae012e        	ldw	x,#L5_sem2
 528  021d cd0000        	call	_atomSemGet
 530  0220 5b04          	addw	sp,#4
 531  0222 6b0b          	ld	(OFST-6,sp),a
 532  0224 2713          	jreq	L702
 533                     ; 240                     ATOMLOG (_STR("Notify fail (%d)\n"), status);
 535  0226 7b0b          	ld	a,(OFST-6,sp)
 536  0228 88            	push	a
 537  0229 ae00f4        	ldw	x,#L151
 538  022c cd0000        	call	_printf
 540  022f 84            	pop	a
 541                     ; 241                     failures++;
 543  0230 1e10          	ldw	x,(OFST-1,sp)
 544  0232 1c0001        	addw	x,#1
 545  0235 1f10          	ldw	(OFST-1,sp),x
 547  0237 2016          	jra	L361
 548  0239               L702:
 549                     ; 248                     if (atomSemDelete (&sem2) != ATOM_OK)
 551  0239 ae012e        	ldw	x,#L5_sem2
 552  023c cd0000        	call	_atomSemDelete
 554  023f 4d            	tnz	a
 555  0240 270d          	jreq	L361
 556                     ; 250                         ATOMLOG (_STR("Failed sem2 delete\n"));
 558  0242 ae00e0        	ldw	x,#L751
 559  0245 cd0000        	call	_printf
 561                     ; 251                         failures++;
 563  0248 1e10          	ldw	x,(OFST-1,sp)
 564  024a 1c0001        	addw	x,#1
 565  024d 1f10          	ldw	(OFST-1,sp),x
 566  024f               L361:
 567                     ; 265         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 569  024f 5f            	clrw	x
 570  0250 1f09          	ldw	(OFST-8,sp),x
 571  0252               L512:
 572                     ; 268             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 574  0252 96            	ldw	x,sp
 575  0253 1c0005        	addw	x,#OFST-12
 576  0256 89            	pushw	x
 577  0257 96            	ldw	x,sp
 578  0258 1c0003        	addw	x,#OFST-14
 579  025b 89            	pushw	x
 580  025c 1e0d          	ldw	x,(OFST-4,sp)
 581  025e 90ae0017      	ldw	y,#23
 582  0262 cd0000        	call	c_imul
 584  0265 1c0100        	addw	x,#L7_tcb
 585  0268 cd0000        	call	_atomThreadStackCheck
 587  026b 5b04          	addw	sp,#4
 588  026d 4d            	tnz	a
 589  026e 270f          	jreq	L322
 590                     ; 270                 ATOMLOG (_STR("StackCheck\n"));
 592  0270 ae00b6        	ldw	x,#L522
 593  0273 cd0000        	call	_printf
 595                     ; 271                 failures++;
 597  0276 1e10          	ldw	x,(OFST-1,sp)
 598  0278 1c0001        	addw	x,#1
 599  027b 1f10          	ldw	(OFST-1,sp),x
 601  027d 2024          	jra	L722
 602  027f               L322:
 603                     ; 276                 if (free_bytes == 0)
 605  027f 96            	ldw	x,sp
 606  0280 1c0005        	addw	x,#OFST-12
 607  0283 cd0000        	call	c_lzmp
 609  0286 2611          	jrne	L132
 610                     ; 278                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 612  0288 1e09          	ldw	x,(OFST-8,sp)
 613  028a 89            	pushw	x
 614  028b ae00a4        	ldw	x,#L332
 615  028e cd0000        	call	_printf
 617  0291 85            	popw	x
 618                     ; 279                     failures++;
 620  0292 1e10          	ldw	x,(OFST-1,sp)
 621  0294 1c0001        	addw	x,#1
 622  0297 1f10          	ldw	(OFST-1,sp),x
 623  0299               L132:
 624                     ; 284                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 626  0299 1e03          	ldw	x,(OFST-14,sp)
 627  029b 89            	pushw	x
 628  029c ae0097        	ldw	x,#L532
 629  029f cd0000        	call	_printf
 631  02a2 85            	popw	x
 632  02a3               L722:
 633                     ; 265         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 635  02a3 1e09          	ldw	x,(OFST-8,sp)
 636  02a5 1c0001        	addw	x,#1
 637  02a8 1f09          	ldw	(OFST-8,sp),x
 640  02aa 9c            	rvf
 641  02ab 1e09          	ldw	x,(OFST-8,sp)
 642  02ad a30002        	cpw	x,#2
 643  02b0 2fa0          	jrslt	L512
 644                     ; 292     return failures;
 646  02b2 1e10          	ldw	x,(OFST-1,sp)
 647  02b4 cd0000        	call	c_itolx
 651  02b7 5b11          	addw	sp,#17
 652  02b9 81            	ret
 697                     ; 305 static void test1_thread_func (uint32_t param)
 697                     ; 306 {
 698                     .text:	section	.text,new
 699  0000               L31_test1_thread_func:
 701  0000 88            	push	a
 702       00000001      OFST:	set	1
 705                     ; 310     param = param;
 707                     ; 316     status = atomSemGet(&sem1, 0);
 709  0001 ae0000        	ldw	x,#0
 710  0004 89            	pushw	x
 711  0005 ae0000        	ldw	x,#0
 712  0008 89            	pushw	x
 713  0009 ae0131        	ldw	x,#L3_sem1
 714  000c cd0000        	call	_atomSemGet
 716  000f 5b04          	addw	sp,#4
 717  0011 6b01          	ld	(OFST+0,sp),a
 718                     ; 317     if (status != ATOM_ERR_DELETED)
 720  0013 7b01          	ld	a,(OFST+0,sp)
 721  0015 a1ca          	cp	a,#202
 722  0017 270c          	jreq	L552
 723                     ; 319         ATOMLOG (_STR("Test1 thread woke without deletion (%d)\n"), status);
 725  0019 7b01          	ld	a,(OFST+0,sp)
 726  001b 88            	push	a
 727  001c ae006e        	ldw	x,#L752
 728  001f cd0000        	call	_printf
 730  0022 84            	pop	a
 732  0023 2014          	jra	L762
 733  0025               L552:
 734                     ; 324         if ((status = atomSemPut(&sem2)) != ATOM_OK)
 736  0025 ae012e        	ldw	x,#L5_sem2
 737  0028 cd0000        	call	_atomSemPut
 739  002b 6b01          	ld	(OFST+0,sp),a
 740  002d 270a          	jreq	L762
 741                     ; 326             ATOMLOG (_STR("Error posting sem2 on wakeup (%d)\n"), status);
 743  002f 7b01          	ld	a,(OFST+0,sp)
 744  0031 88            	push	a
 745  0032 ae004b        	ldw	x,#L562
 746  0035 cd0000        	call	_printf
 748  0038 84            	pop	a
 749  0039               L762:
 750                     ; 333         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 752  0039 ae0064        	ldw	x,#100
 753  003c 89            	pushw	x
 754  003d ae0000        	ldw	x,#0
 755  0040 89            	pushw	x
 756  0041 cd0000        	call	_atomTimerDelay
 758  0044 5b04          	addw	sp,#4
 760  0046 20f1          	jra	L762
 805                     ; 347 static void test2_thread_func (uint32_t param)
 805                     ; 348 {
 806                     .text:	section	.text,new
 807  0000               L51_test2_thread_func:
 809  0000 88            	push	a
 810       00000001      OFST:	set	1
 813                     ; 352     param = param;
 815                     ; 358     status = atomSemGet(&sem1, (5 * SYSTEM_TICKS_PER_SEC));
 817  0001 ae01f4        	ldw	x,#500
 818  0004 89            	pushw	x
 819  0005 ae0000        	ldw	x,#0
 820  0008 89            	pushw	x
 821  0009 ae0131        	ldw	x,#L3_sem1
 822  000c cd0000        	call	_atomSemGet
 824  000f 5b04          	addw	sp,#4
 825  0011 6b01          	ld	(OFST+0,sp),a
 826                     ; 359     if (status != ATOM_ERR_DELETED)
 828  0013 7b01          	ld	a,(OFST+0,sp)
 829  0015 a1ca          	cp	a,#202
 830  0017 270c          	jreq	L113
 831                     ; 361         ATOMLOG (_STR("Test2 thread woke without deletion (%d)\n"), status);
 833  0019 7b01          	ld	a,(OFST+0,sp)
 834  001b 88            	push	a
 835  001c ae0022        	ldw	x,#L313
 836  001f cd0000        	call	_printf
 838  0022 84            	pop	a
 840  0023 2010          	jra	L323
 841  0025               L113:
 842                     ; 366         if ((status = atomSemPut(&sem2)) != ATOM_OK)
 844  0025 ae012e        	ldw	x,#L5_sem2
 845  0028 cd0000        	call	_atomSemPut
 847  002b 6b01          	ld	(OFST+0,sp),a
 848  002d 2706          	jreq	L323
 849                     ; 368             ATOMLOG (_STR("Error posting sem2 on wakeup\n"));
 851  002f ae0004        	ldw	x,#L123
 852  0032 cd0000        	call	_printf
 854  0035               L323:
 855                     ; 375         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 857  0035 ae0064        	ldw	x,#100
 858  0038 89            	pushw	x
 859  0039 ae0000        	ldw	x,#0
 860  003c 89            	pushw	x
 861  003d cd0000        	call	_atomTimerDelay
 863  0040 5b04          	addw	sp,#4
 865  0042 20f1          	jra	L323
1106                     	switch	.bss
1107  0000               L11_test_thread_stack:
1108  0000 000000000000  	ds.b	256
1109  0100               L7_tcb:
1110  0100 000000000000  	ds.b	46
1111  012e               L5_sem2:
1112  012e 000000        	ds.b	3
1113  0131               L3_sem1:
1114  0131 000000        	ds.b	3
1115                     	xdef	_test_start
1116                     	xref	_printf
1117                     	xref	_atomSemPut
1118                     	xref	_atomSemGet
1119                     	xref	_atomSemDelete
1120                     	xref	_atomSemCreate
1121                     	xref	_atomThreadStackCheck
1122                     	xref	_atomThreadCreate
1123                     	xref	_atomTimerDelay
1124                     	switch	.const
1125  0004               L123:
1126  0004 4572726f7220  	dc.b	"Error posting sem2"
1127  0016 206f6e207761  	dc.b	" on wakeup",10,0
1128  0022               L313:
1129  0022 546573743220  	dc.b	"Test2 thread woke "
1130  0034 776974686f75  	dc.b	"without deletion ("
1131  0046 2564290a00    	dc.b	"%d)",10,0
1132  004b               L562:
1133  004b 4572726f7220  	dc.b	"Error posting sem2"
1134  005d 206f6e207761  	dc.b	" on wakeup (%d)",10,0
1135  006e               L752:
1136  006e 546573743120  	dc.b	"Test1 thread woke "
1137  0080 776974686f75  	dc.b	"without deletion ("
1138  0092 2564290a00    	dc.b	"%d)",10,0
1139  0097               L532:
1140  0097 537461636b55  	dc.b	"StackUse:%d",10,0
1141  00a4               L332:
1142  00a4 537461636b4f  	dc.b	"StackOverflow %d",10,0
1143  00b6               L522:
1144  00b6 537461636b43  	dc.b	"StackCheck",10,0
1145  00c2               L371:
1146  00c2 4572726f7220  	dc.b	"Error creating tes"
1147  00d4 742074687265  	dc.b	"t thread 2",10,0
1148  00e0               L751:
1149  00e0 4661696c6564  	dc.b	"Failed sem2 delete"
1150  00f2 0a00          	dc.b	10,0
1151  00f4               L151:
1152  00f4 4e6f74696679  	dc.b	"Notify fail (%d)",10,0
1153  0106               L341:
1154  0106 4661696c6564  	dc.b	"Failed sem1 delete"
1155  0118 0a00          	dc.b	10,0
1156  011a               L531:
1157  011a 4661696c6564  	dc.b	"Failed timer delay"
1158  012c 0a00          	dc.b	10,0
1159  012e               L721:
1160  012e 4572726f7220  	dc.b	"Error creating tes"
1161  0140 742074687265  	dc.b	"t thread 1",10,0
1162  014c               L121:
1163  014c 4572726f7220  	dc.b	"Error creating tes"
1164  015e 742073656d61  	dc.b	"t semaphore 2",10,0
1165  016d               L311:
1166  016d 4572726f7220  	dc.b	"Error creating tes"
1167  017f 742073656d61  	dc.b	"t semaphore 1",10,0
1168  018e               L701:
1169  018e 426164207365  	dc.b	"Bad semaphore dele"
1170  01a0 74696f6e2063  	dc.b	"tion checks",10,0
1171  01ad               L101:
1172  01ad 426164207365  	dc.b	"Bad semaphore crea"
1173  01bf 74696f6e2063  	dc.b	"tion checks",10,0
1174  01cc               L37:
1175  01cc 4572726f7220  	dc.b	"Error creating sem"
1176  01de 6170686f7265  	dc.b	"aphore",10,0
1177  01e6               L76:
1178  01e6 4572726f7220  	dc.b	"Error deleting sem"
1179  01f8 6170686f7265  	dc.b	"aphore",10,0
1180                     	xref.b	c_x
1200                     	xref	c_itolx
1201                     	xref	c_lzmp
1202                     	xref	c_imul
1203                     	xref	c_lcmp
1204                     	xref	c_ltor
1205                     	xref	c_lgadc
1206                     	end
