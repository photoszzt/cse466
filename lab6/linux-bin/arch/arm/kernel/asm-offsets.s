	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"asm-offsets.c"
@ GNU C (Sourcery G++ Lite 2008q3-72) version 4.3.2 (arm-none-linux-gnueabi)
@	compiled by GNU C version 3.4.4, GMP version 4.2.2, MPFR version 2.3.1.
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc -Iinclude -Iinclude2
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/. -I.
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2400/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2412/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2440/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2442/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2443/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c24xx/include
@ -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include
@ -imultilib armv4t -iprefix
@ /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/
@ -isysroot
@ /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../arm-none-linux-gnueabi/libc
@ -D__KERNEL__ -D__LINUX_ARM_ARCH__=4 -Uarm -DKBUILD_STR(s)=#s
@ -DKBUILD_BASENAME=KBUILD_STR(asm_offsets)
@ -DKBUILD_MODNAME=KBUILD_STR(asm_offsets) -isystem
@ /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include
@ -include include/linux/autoconf.h -MD arch/arm/kernel/.asm-offsets.s.d
@ /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c
@ -march=armv4t -mlittle-endian -marm -mapcs -mno-sched-prolog
@ -mabi=aapcs-linux -mno-thumb-interwork -march=armv4t -mtune=arm9tdmi
@ -msoft-float -auxbase-strip arch/arm/kernel/asm-offsets.s -O2 -Wall
@ -Wundef -Wstrict-prototypes -Wno-trigraphs
@ -Werror-implicit-function-declaration -Wno-format-security
@ -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-aliasing
@ -fno-common -fno-delete-null-pointer-checks -fno-stack-protector
@ -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-strict-overflow
@ -fverbose-asm
@ options enabled:  -falign-loops -fargument-alias -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fcprop-registers -fcrossjumping
@ -fcse-follow-jumps -fdefer-pop -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -fgcse -fgcse-lm
@ -fguess-branch-probability -fident -fif-conversion -fif-conversion2
@ -finline-functions-called-once -finline-small-functions -fipa-pure-const
@ -fipa-reference -fivopts -fkeep-static-consts -fleading-underscore
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -foptimize-register-move -fpeephole -fpeephole2
@ -freg-struct-return -fregmove -freorder-blocks -freorder-functions
@ -frerun-cse-after-loop -fsched-interblock -fsched-spec
@ -fsched-stalled-insns-dep -fschedule-insns -fschedule-insns2
@ -fsection-anchors -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fthread-jumps -ftoplevel-reorder -ftrapping-math
@ -ftree-ccp -ftree-ch -ftree-copy-prop -ftree-copyrename -ftree-cselim
@ -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-fre -ftree-loop-im
@ -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
@ -ftree-pre -ftree-reassoc -ftree-salias -ftree-scev-cprop -ftree-sink
@ -ftree-sra -ftree-store-ccp -ftree-ter -ftree-vect-loop-version
@ -ftree-vrp -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss
@ -mapcs-frame -mglibc -mlittle-endian

@ Compiler executable checksum: d3429b3d44dc83ee8ef5b80b6a06f8ca

	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp	@,
	stmfd	sp!, {fp, ip, lr, pc}	@,
	sub	fp, ip, #4	@,,
#APP
@ 41 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TSK_ACTIVE_MM #228 offsetof(struct task_struct, active_mm)	@
@ 0 "" 2
@ 42 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 43 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_FLAGS #0 offsetof(struct thread_info, flags)	@
@ 0 "" 2
@ 44 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_PREEMPT #4 offsetof(struct thread_info, preempt_count)	@
@ 0 "" 2
@ 45 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_ADDR_LIMIT #8 offsetof(struct thread_info, addr_limit)	@
@ 0 "" 2
@ 46 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_TASK #12 offsetof(struct thread_info, task)	@
@ 0 "" 2
@ 47 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_EXEC_DOMAIN #16 offsetof(struct thread_info, exec_domain)	@
@ 0 "" 2
@ 48 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_CPU #20 offsetof(struct thread_info, cpu)	@
@ 0 "" 2
@ 49 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_CPU_DOMAIN #24 offsetof(struct thread_info, cpu_domain)	@
@ 0 "" 2
@ 50 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_CPU_SAVE #28 offsetof(struct thread_info, cpu_context)	@
@ 0 "" 2
@ 51 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_USED_CP #80 offsetof(struct thread_info, used_cp)	@
@ 0 "" 2
@ 52 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_TP_VALUE #96 offsetof(struct thread_info, tp_value)	@
@ 0 "" 2
@ 53 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_FPSTATE #288 offsetof(struct thread_info, fpstate)	@
@ 0 "" 2
@ 54 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->TI_VFPSTATE #432 offsetof(struct thread_info, vfpstate)	@
@ 0 "" 2
@ 64 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 65 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R0 #0 offsetof(struct pt_regs, ARM_r0)	@
@ 0 "" 2
@ 66 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R1 #4 offsetof(struct pt_regs, ARM_r1)	@
@ 0 "" 2
@ 67 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R2 #8 offsetof(struct pt_regs, ARM_r2)	@
@ 0 "" 2
@ 68 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R3 #12 offsetof(struct pt_regs, ARM_r3)	@
@ 0 "" 2
@ 69 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R4 #16 offsetof(struct pt_regs, ARM_r4)	@
@ 0 "" 2
@ 70 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R5 #20 offsetof(struct pt_regs, ARM_r5)	@
@ 0 "" 2
@ 71 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R6 #24 offsetof(struct pt_regs, ARM_r6)	@
@ 0 "" 2
@ 72 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R7 #28 offsetof(struct pt_regs, ARM_r7)	@
@ 0 "" 2
@ 73 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R8 #32 offsetof(struct pt_regs, ARM_r8)	@
@ 0 "" 2
@ 74 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R9 #36 offsetof(struct pt_regs, ARM_r9)	@
@ 0 "" 2
@ 75 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_R10 #40 offsetof(struct pt_regs, ARM_r10)	@
@ 0 "" 2
@ 76 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_FP #44 offsetof(struct pt_regs, ARM_fp)	@
@ 0 "" 2
@ 77 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_IP #48 offsetof(struct pt_regs, ARM_ip)	@
@ 0 "" 2
@ 78 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_SP #52 offsetof(struct pt_regs, ARM_sp)	@
@ 0 "" 2
@ 79 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_LR #56 offsetof(struct pt_regs, ARM_lr)	@
@ 0 "" 2
@ 80 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_PC #60 offsetof(struct pt_regs, ARM_pc)	@
@ 0 "" 2
@ 81 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_PSR #64 offsetof(struct pt_regs, ARM_cpsr)	@
@ 0 "" 2
@ 82 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_OLD_R0 #68 offsetof(struct pt_regs, ARM_ORIG_r0)	@
@ 0 "" 2
@ 83 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->S_FRAME_SIZE #72 sizeof(struct pt_regs)	@
@ 0 "" 2
@ 84 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 89 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->VMA_VM_MM #0 offsetof(struct vm_area_struct, vm_mm)	@
@ 0 "" 2
@ 90 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->VMA_VM_FLAGS #20 offsetof(struct vm_area_struct, vm_flags)	@
@ 0 "" 2
@ 91 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 92 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->VM_EXEC #4 VM_EXEC	@
@ 0 "" 2
@ 93 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 94 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->PAGE_SZ #4096 PAGE_SIZE	@
@ 0 "" 2
@ 95 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 96 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->SYS_ERROR0 #10420224 0x9f0000	@
@ 0 "" 2
@ 97 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 98 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->SIZEOF_MACHINE_DESC #52 sizeof(struct machine_desc)	@
@ 0 "" 2
@ 99 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->MACHINFO_TYPE #0 offsetof(struct machine_desc, nr)	@
@ 0 "" 2
@ 100 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->MACHINFO_NAME #12 offsetof(struct machine_desc, name)	@
@ 0 "" 2
@ 101 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->MACHINFO_PHYSIO #4 offsetof(struct machine_desc, phys_io)	@
@ 0 "" 2
@ 102 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->MACHINFO_PGOFFIO #8 offsetof(struct machine_desc, io_pg_offst)	@
@ 0 "" 2
@ 103 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
@ 104 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->PROC_INFO_SZ #52 sizeof(struct proc_info_list)	@
@ 0 "" 2
@ 105 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->PROCINFO_INITFUNC #16 offsetof(struct proc_info_list, __cpu_flush)	@
@ 0 "" 2
@ 106 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->PROCINFO_MM_MMUFLAGS #8 offsetof(struct proc_info_list, __cpu_mm_mmu_flags)	@
@ 0 "" 2
@ 107 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->PROCINFO_IO_MMUFLAGS #12 offsetof(struct proc_info_list, __cpu_io_mmu_flags)	@
@ 0 "" 2
@ 108 "/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/kernel/asm-offsets.c" 1
	
->
@ 0 "" 2
	mov	r0, #0	@,
	ldmfd	sp, {fp, sp, pc}	@
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
