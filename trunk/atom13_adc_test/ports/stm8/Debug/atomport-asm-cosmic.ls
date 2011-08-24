   1                     ;
   2                     ; Copyright (c) 2010, Atomthreads Project. All rights reserved.
   3                     ;
   4                     ; Redistribution and use in source and binary forms, with or without
   5                     ; Modification, are permitted provided that the following conditions
   6                     ; are met:
   7                     ;
   8                     ; 1. Redistributions of source code must retain the above copyright
   9                     ;	   notice, this list of conditions and the following disclaimer.
  10                     ; 2. Redistributions in binary form must reproduce the above copyright
  11                     ;    notice, this list of conditions and the following disclaimer in the
  12                     ;    documentation and/or other materials provided with the distribution.
  13                     ; 3. No personal names or organizations' names associated with the
  14                     ;    Atomthreads project may be used to endorse or promote products
  15                     ;    derived from this software without specific prior written permission.
  16                     ;
  17                     ; THIS SOFTWARE IS PROVIDED BY THE ATOMTHREADS PROJECT AND CONTRIBUTORS
  18                     ; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
  19                     ; TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  20                     ; PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE PROJECT OR CONTRIBUTORS BE
  21                     ; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  22                     ; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  23                     ; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  24                     ; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  25                     ; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  26                     ; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  27                     ; POSSIBILITY OF SUCH DAMAGE.
  28                     ;
  29                     
  30                     
  31                     ; Cosmic assembler routines
  32                     
  33                     
  34                     ;  Export functions to other modules
  35                     xdef _archContextSwitch, _archFirstThreadRestore
  36                     
  37                     
  38                     ;  \b archContextSwitch
  39                     ;
  40                     ;  Architecture-specific context switch routine.
  41                     ;
  42                     ;  Note that interrupts are always locked out when this routine is
  43                     ;  called. For cooperative switches, the scheduler will have entered
  44                     ;  a critical region. For preemptions (called from an ISR), the
  45                     ;  ISR will have disabled interrupts on entry.
  46                     ;
  47                     ;  @param[in] old_tcb_ptr Pointer to the thread being scheduled out
  48                     ;  @param[in] new_tcb_ptr Pointer to the thread being scheduled in
  49                     ;
  50                     ;  @return None
  51                     ;
  52                     ;  void archContextSwitch (ATOM_TCB *old_tcb_ptr, ATOM_TCB *new_tcb_ptr)
  53  0000               _archContextSwitch:
  54                     
  55                         ; Parameter locations (Cosmic calling convention):
  56                         ;   old_tcb_ptr = X register (word-width)
  57                         ;   new_tcb_ptr = stack (word-width)
  58                     
  59                         ; STM8 CPU Registers:
  60                         ;
  61                         ; A, X, Y: Standard working registers
  62                         ; SP: Stack pointer
  63                         ; PC: Program counter
  64                         ; CC: Code condition register
  65                         ;
  66                         ; Cosmic compiler virtual registers:
  67                         ;
  68                         ; c_x, c_y: Scratch memory areas saved by ISRs
  69                         ; c_lreg: Scratch memory area only saved by ISRs with @svlreg
  70                         ;
  71                         ; If this is a cooperative context switch (a thread has called us
  72                         ; to schedule itself out), the Cosmic compiler will have saved any
  73                         ; of the registers which it does not want us to clobber. There are
  74                         ; no registers which are expected to retain their value across a
  75                         ; function call, hence for cooperative context switches with this
  76                         ; compiler we do not actually need to save any registers at all.
  77                         ;
  78                         ; If we were called from an interrupt routine (because a thread
  79                         ; is being preemptively scheduled out), the situation is exactly
  80                         ; the same. Any ISR which calls out to a subroutine will have
  81                         ; similarly saved all registers which it needs us not to clobber
  82                         ; which in the case of this compiler is all registers. Again, we
  83                         ; do not need to save any registers because no registers are
  84                     	; expected to be unclobbered by a subroutine. Note that it is
  85                     	; necessary to add the @svlreg modifier to ISRs which call out to
  86                     	; the OS in order to force a save of c_lreg. The rest of the CPU
  87                     	; registers and the c_x and c_y virtual registers are, however,
  88                         ; always saved by ISRs which call out to C subroutines.
  89                         ;
  90                         ; This is an unusual context switch routine, because it does not
  91                     	; need to actually save any registers. Instead, the act of
  92                     	; calling this function causes all registers which must not be
  93                     	; clobbered to be saved on the stack anyway in the case of
  94                     	; cooperative context switches. For preemptive switches, the
  95                     	; interrupt service routine which calls out to here also causes
  96                     	; all registers to be saved in a similar fashion.
  97                     
  98                         ; We do have to do some work in here though: we need to store
  99                         ; the current stack pointer to the current thread's TCB, and
 100                         ; switch in the new thread by taking the stack pointer from
 101                         ; the new thread's TCB and making that our new stack pointer.
 102                     
 103                         ; The parameter pointing to the the old TCB (a word-width
 104                         ;	pointer) is still untouched in the X register.
 105                     
 106                         ; Store current stack pointer as first entry in old_tcb_ptr
 107  0000 9096              ldw Y, SP    ; Move current stack pointer into Y register
 108  0002 ff                ldw (X), Y   ; Store current stack pointer at first offset in TCB
 109                     
 110                     
 111                         ; At this point, all of the current thread's context has been saved
 112                         ; so we no longer care about keeping the contents of any registers.
 113                         ; We do still need the first two bytes on the current thread's stack,
 114                         ; however, which contain new_tcb_ptr (a pointer to the TCB of the
 115                         ; thread which we wish to switch in).
 116                         ;
 117                         ; Our stack frame now contains all registers (if this is a preemptive
 118                         ; switch due to an interrupt handler) or those registers which the
 119                         ; calling function did not wish to be clobbered (if this is a
 120                         ; cooperative context switch). It also contains the return address
 121                         ; which will be either a function called via an ISR (for preemptive
 122                         ; switches) or a function called from thread context (for cooperative
 123                         ; switches). Finally, the stack also contains the aforementioned
 124                         ; word which is the new_tcb_ptr parameter passed via the stack.
 125                         ;
 126                         ; In addition, the thread's stack pointer (after context-save) is
 127                         ; stored in the thread's TCB.
 128                     
 129                         ; We are now ready to restore the new thread's context. In most
 130                         ; architecture ports we would typically switch our stack pointer
 131                         ; to the new thread's stack pointer, and pop all of its context
 132                         ; off the stack, before returning to the caller (the original
 133                         ; caller when the new thread was last scheduled out). In this
 134                         ; port, however, we do not need to actually restore any
 135                         ; registers here because none are saved when we switch out (at
 136                         ; least not by this function). We switch to the new thread's
 137                         ; stack pointer and then return to the original caller, which
 138                         ; will restore any registers which had to be saved.
 139                     
 140                         ; Get the new thread's stack pointer off the TCB (new_tcb_ptr).
 141                         ; new_tcb_ptr is still stored in the previous thread's stack.
 142                         ; We are free to use any registers here.
 143                     
 144                         ; Pull the new_tcb_ptr parameter from the stack into X register
 145  0003 1e03              ldw X,($3,SP)
 146                     
 147                         ; Pull the first entry out of new_tcb_ptr (the new thread's
 148                         ; stack pointer) into X register.
 149  0005 fe                ldw X,(X)
 150                     
 151                         ; Switch our current stack pointer to that of the new thread.
 152  0006 94                ldw SP,X
 153                     
 154                         ; Normally we would start restoring registers from the new
 155                         ; thread's stack here, but we don't save/restore any. We're
 156                         ; almost done.
 157                     
 158                         ; The return address on the stack will now be the new thread's return
 159                         ; address - i.e. although we just entered this function from a
 160                         ; function called by the old thread, now that we have restored the new
 161                         ; thread's stack, we actually return from this function to wherever
 162                         ; the new thread was when it was previously scheduled out. This could
 163                         ; be either a regular C routine if the new thread previously scheduled
 164                         ; itself out cooperatively, or it could be an ISR if this new thread was
 165                         ; previously preempted (on exiting the ISR, execution will return to
 166                         ; wherever the new thread was originally interrupted).
 167                     
 168                         ; Return to the caller. Note that we always use a regular RET here
 169                         ; because this is a subroutine regardless of whether we were called
 170                         ; during an ISR or by a thread cooperatively switching out. The
 171                         ; difference between RET and IRET on the STM8 architecture is that
 172                         ; RET only pops the return address off the stack, while IRET also
 173                         ; pops from the stack all of the CPU registers saved when the ISR
 174                         ; started, including restoring the interrupt-enable bits from the CC
 175                         ; register.
 176                         ;
 177                         ; It is important that whenever we call this function (whether from
 178                         ; an ISR for preemptive switches or from thread context for
 179                         ; cooperative switches) interrupts are always disabled. This means
 180                         ; that whichever method by which we leave this routine we always
 181                         ; have to reenable interrupts, so we can use the same context-switch
 182                         ; routine for preemptive and cooperative switches.
 183                         ;
 184                         ; The possible call/return paths are as follows:
 185                         ;
 186                         ; Scenario 1 (cooperative -> cooperative):
 187                         ;  Thread A: cooperatively switches out
 188                         ;    * Thread A relinquishes control / cooperatively switches out
 189                         ;    * Interrupts already disabled by kernel for cooperative reschedules
 190                         ;    * Partial register context saved by calling function
 191                         ;    * Call here at thread context
 192                         ;    * Switch to Thread B
 193                         ;  Thread B (was previously cooperatively switched out):
 194                         ;    * Stack context for Thread B contains its return address
 195                         ;    * Return to function which was called at thread context
 196                         ;    * Interrupts are reenabled by CRITICAL_END() call in kernel
 197                         ;    * Return to Thread B application code
 198                         ;
 199                         ; Scenario 2 (preemptive -> preemptive):
 200                         ;  Thread A: preemptively switches out
 201                         ;    * ISR occurs
 202                         ;    * Interrupts disabled by CPU at ISR entry (assume no nesting allowed)
 203                         ;    * Full register context saved by CPU at ISR entry
 204                         ;    * Call here at ISR context
 205                         ;    * Switch to Thread B
 206                         ;  Thread B (was previously preemptively switched out):
 207                         ;    * Stack context for Thread B contains its return address
 208                         ;      and all context saved by the CPU on ISR entry
 209                         ;    * Return to function which was called at ISR context
 210                         ;    * Eventually returns to calling ISR which calls IRET
 211                         ;    * IRET performs full register context restore
 212                         ;    * IRET reenables interrupts
 213                         ;    * Return to Thread B application code
 214                         ;
 215                         ; Scenario 3 (cooperative -> preemptive):
 216                         ;  Thread A: cooperatively switches out
 217                         ;    * Thread A relinquishes control / cooperatively switches out
 218                         ;    * Interrupts already disabled by kernel for cooperative reschedules
 219                         ;    * Partial register context saved by calling function
 220                         ;    * Call here at thread context
 221                         ;    * Switch to Thread B
 222                         ;  Thread B (was previously preemptively switched out):
 223                         ;    * Stack context for Thread B contains its return address
 224                         ;      and all context saved by the CPU on ISR entry
 225                         ;    * Return to function which was called at ISR context
 226                         ;    * Eventually returns to calling ISR which calls IRET
 227                         ;    * IRET performs full register context restore
 228                         ;    * IRET reenables interrupts
 229                         ;    * Return to Thread B application code
 230                         ;
 231                         ; Scenario 4 (preemptive -> cooperative):
 232                         ;  Thread A: preemptively switches out
 233                         ;    * ISR occurs
 234                         ;    * Interrupts disabled by CPU at ISR entry (assume no nesting allowed)
 235                         ;    * Full register context saved by CPU at ISR entry
 236                         ;    * Call here at ISR context
 237                         ;    * Switch to Thread B
 238                         ;  Thread B (was previously cooperatively switched out):
 239                         ;    * Stack context for Thread B contains its return address
 240                         ;    * Return to function which was called at thread context
 241                         ;    * Interrupts are reenabled by CRITICAL_END() call in kernel
 242                         ;    * Return to Thread B application code
 243                         ;
 244                         ; The above shows that it does not matter whether we are rescheduling
 245                         ; from/to thread context or ISR context. It is perfectly valid to
 246                         ; enter here at ISR context but leave via a thread which previously
 247                         ; cooperatively switched out because:
 248                         ; 1. Although the CPU handles ISRs differently by automatically
 249                         ;    stacking all 6 CPU registers, and restoring them on an IRET,
 250                         ;    we handle this because we switch the stack pointer to a
 251                         ;    different thread's stack. Because the stack pointer is
 252                         ;    switched, it does not matter that on entry via ISRs more
 253                         ;    registers are saved on the original thread's stack than entries
 254                         ;    via non-ISRs. Those extra registers will be restored properly
 255                         ;    by an IRET when the thread is eventually scheduled back in
 256                         ;    (which could be a long way off). This assumes that the CPU does
 257                         ;    not have hidden behaviour that occurs on interrupts, and we can
 258                         ;    in fact trick it into leaving via another thread's call stack,
 259                         ;     and performing the IRET much later.
 260                         ; 2. Although the CPU handles ISRs differently by setting the CC
 261                         ;    register interrupt-enable bits on entry/exit, we handle this
 262                         ;    anyway by always assuming interrupts are disabled on entry
 263                         ;    and exit regardless of the call path.
 264                     
 265                         ; Return from subroutine
 266  0007 81                ret
 267                     
 268                     
 269                     ; \b archFirstThreadRestore
 270                     ;
 271                     ; Architecture-specific function to restore and start the first thread.
 272                     ; This is called by atomOSStart() when the OS is starting. Its job is to
 273                     ; restore the context for the first thread and start running at its
 274                     ; entry point.
 275                     ;
 276                     ; All new threads have a stack context pre-initialised with suitable
 277                     ; data for being restored by either this function or the normal
 278                     ; function used for scheduling threads in, archContextSwitch(). Only
 279                     ; the first thread run by the system is launched via this function,
 280                     ; after which all other new threads will first be run by
 281                     ; archContextSwitch().
 282                     ;
 283                     ; Typically ports will implement something similar here to the
 284                     ; latter half of archContextSwitch(). In this port the context
 285                     ; switch does not restore many registers, and instead relies on the
 286                     ; fact that returning from any function which called
 287                     ; archContextSwitch() will restore any of the necessary registers.
 288                     ; For new threads which have never been run there is no calling
 289                     ; function which will restore context on return, therefore we
 290                     ; do not restore many register values here. It is not necessary
 291                     ; for the new threads to have initialised values for the scratch
 292                     ; registers A, X and Y or the code condition register CC which
 293                     ; leaves SP and PC. SP is restored because this is always needed to
 294                     ; switch to a new thread's stack context. It is not necessary to
 295                     ; restore PC, because the thread's entry point is in the stack
 296                     ; context (when this function returns using RET the PC is
 297                     ; automatically changed to the thread's entry point because the
 298                     ; entry point is stored in the preinitialised stack).
 299                     ;
 300                     ; When new threads are started interrupts must be enabled, so there
 301                     ; is some scope for enabling interrupts in the CC here. It must be
 302                     ; done for all new threads, however, not just the first thread, so
 303                     ; we use a different system. We instead use a thread shell routine
 304                     ; which all functions run when they are first started, and
 305                     ; interrupts are enabled in there. This allows us to avoid having
 306                     ; to enable interrupts both in here and in the normal context
 307                     ; switch routine (archContextSwitch()). For the normal context
 308                     ; switch routine we would otherwise need to pass in notification of
 309                     ; and implement special handling for the first time a thread is
 310                     ; restored.
 311                     ;
 312                     ; In summary, first threads do not require a set of CPU registers
 313                     ; to be initialised to known values, so we only set SP to the new
 314                     ; thread's stack pointer. PC is restored for free because the RET
 315                     ; call at the end of this function pops the return address off the
 316                     ; stack.
 317                     ;
 318                     ; Note that you can create more than one thread before starting
 319                     ; the OS - only one thread is restored using this function, so
 320                     ; all other threads are actually restored by archContextSwitch().
 321                     ; This is another reminder that the initial context set up by
 322                     ; archThreadContextInit() must look the same whether restored by
 323                     ; archFirstThreadRestore() or archContextSwitch().
 324                     ;
 325                     ; @param[in] new_tcb_ptr Pointer to the thread being scheduled in
 326                     ;
 327                     ; @return None
 328                     ;
 329                     ; void archFirstThreadRestore (ATOM_TCB *new_tcb_ptr)
 330  0008               _archFirstThreadRestore:
 331                     
 332                         ; Parameter locations:
 333                         ;  new_tcb_ptr = X register (word-width)
 334                     
 335                         ; As described above, first thread restores in this port do not
 336                         ; expect any initial register context to be pre-initialised in
 337                         ; the thread's stack area. The thread's initial stack need only
 338                         ; contain the thread's initial entry point, and we do not even
 339                         ; "restore" that within this function. We leave the thread's entry
 340                         ; point in the stack, and RET at the end of the function pops it
 341                         ; off and "returns" to the entry point as if we were called from
 342                         ; there.
 343                         ;
 344                         ; The one thing we do need to set in here, though, is the thread's
 345                         ; stack pointer. This is available from the passed thread TCB
 346                         ; structure.
 347                     
 348                         ; Get the new thread's stack pointer off the TCB (new_tcb_ptr).
 349                         ; new_tcb_ptr is stored in the parameter register X. The stack
 350                         ; pointer it conveniently located at the top of the TCB so no
 351                         ; indexing is required to pull it out.
 352  0008 fe                ldw X,(X)
 353                     
 354                         ; Switch our current stack pointer to that of the new thread.
 355  0009 94                ldw SP,X
 356                     
 357                         ; The "return address" left on the stack now will be the new
 358                         ; thread's entry point. RET will take us there as if we had
 359                         ; actually been there before calling this subroutine, whereas
 360                         ; the return address was actually set up by archThreadContextInit().
 361  000a 81                ret
 362                     
 363                     
 364                         end
