cmd_net/mac80211/michael.o := arm-linux-gcc -Wp,-MD,net/mac80211/.michael.o.d  -nostdinc -isystem /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include -Iinclude -Iinclude2 -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include -include include/linux/autoconf.h  -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/net/mac80211 -Inet/mac80211 -D__KERNEL__ -mlittle-endian   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2400/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2412/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2440/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2442/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2443/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c24xx/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -D__CHECK_ENDIAN__   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(michael)"  -D"KBUILD_MODNAME=KBUILD_STR(mac80211)"  -c -o net/mac80211/michael.o /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/net/mac80211/michael.c

deps_net/mac80211/michael.o := \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/net/mac80211/michael.c \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/types.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/int-ll64.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/bitsperlong.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitsperlong.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/posix_types.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/stddef.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/compiler-gcc4.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/posix_types.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/bitops.h \
    $(wildcard include/config/generic/find/first/bit.h) \
    $(wildcard include/config/generic/find/last/bit.h) \
    $(wildcard include/config/generic/find/next/bit.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/linkage.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/linkage.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
    $(wildcard include/config/x86.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/typecheck.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/irqflags.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/hwcap.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/cmpxchg-local.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/cmpxchg.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/non-atomic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/ffz.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/__fls.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/__ffs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/fls.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/ffs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/fls64.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/sched.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/hweight.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bitops/lock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ieee80211.h \
    $(wildcard include/config/len.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/byteorder.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/byteorder/little_endian.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/swab.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/swab.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/byteorder/generic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/unaligned.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/unaligned/le_byteshift.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/unaligned/be_byteshift.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/unaligned/generic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/net/mac80211/michael.h \

net/mac80211/michael.o: $(deps_net/mac80211/michael.o)

$(deps_net/mac80211/michael.o):