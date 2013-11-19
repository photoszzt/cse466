cmd_fs/nfs/sysctl.o := arm-linux-gcc -Wp,-MD,fs/nfs/.sysctl.o.d  -nostdinc -isystem /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include -Iinclude -Iinclude2 -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include -include include/linux/autoconf.h  -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/fs/nfs -Ifs/nfs -D__KERNEL__ -mlittle-endian   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2400/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2412/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2440/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2442/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2443/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c24xx/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(sysctl)"  -D"KBUILD_MODNAME=KBUILD_STR(nfs)"  -c -o fs/nfs/sysctl.o /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/fs/nfs/sysctl.c

deps_fs/nfs/sysctl.o := \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/fs/nfs/sysctl.c \
    $(wildcard include/config/nfs/v4.h) \
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
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/linkage.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/linkage.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ctype.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/fs.h \
    $(wildcard include/config/dnotify.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/inotify.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/limits.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ioctl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/ioctl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/ioctl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/wait.h \
    $(wildcard include/config/lockdep.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/poison.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/prefetch.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/processor.h \
    $(wildcard include/config/mmu.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/hwcap.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
    $(wildcard include/config/x86.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/typecheck.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/irqflags.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/cmpxchg-local.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/cmpxchg.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/bitops.h \
    $(wildcard include/config/generic/find/first/bit.h) \
    $(wildcard include/config/generic/find/last/bit.h) \
    $(wildcard include/config/generic/find/next/bit.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/bitops.h \
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
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include/stdarg.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ratelimit.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/param.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dynamic_debug.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/byteorder.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/byteorder/little_endian.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/swab.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/swab.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/byteorder/generic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/stringify.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/bottom_half.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/spinlock_types.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/spinlock_types_up.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/generic/hardirqs.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/spinlock_up.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/atomic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/atomic-long.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/spinlock_api_up.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/current.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kdev_t.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dcache.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rculist.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rcupdate.h \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/bitmap.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/string.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/seqlock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/completion.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rcutree.h \
    $(wildcard include/config/no/hz.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/path.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/stat.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/stat.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/math64.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/div64.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kobject.h \
    $(wildcard include/config/hotplug.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sysfs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/errno.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/errno.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/errno.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/errno-base.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kref.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/radix-tree.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/prio_tree.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/init.h \
    $(wildcard include/config/modules.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/pid.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/capability.h \
    $(wildcard include/config/security/file/capabilities.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/semaphore.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/fiemap.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/quota.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rwsem-spinlock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dqblk_xfs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dqblk_v1.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dqblk_v2.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dqblk_qtree.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs_fs_i.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/msg_prot.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/inet.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/fcntl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/fcntl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/fcntl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/err.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sysctl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/module.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kmod.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/gfp.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/debug/vm.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nodemask.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/linux/bounds.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/glue.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/abrt/lv4t.h) \
    $(wildcard include/config/cpu/abrt/ev4.h) \
    $(wildcard include/config/cpu/abrt/ev4t.h) \
    $(wildcard include/config/cpu/abrt/ev5tj.h) \
    $(wildcard include/config/cpu/abrt/ev5t.h) \
    $(wildcard include/config/cpu/abrt/ev6.h) \
    $(wildcard include/config/cpu/abrt/ev7.h) \
    $(wildcard include/config/cpu/pabrt/legacy.h) \
    $(wildcard include/config/cpu/pabrt/v6.h) \
    $(wildcard include/config/cpu/pabrt/v7.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/const.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include/mach/memory.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/sizes.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/memory_model.h \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/getorder.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/memory_hotplug.h \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/memory/hotremove.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/notifier.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/srcu.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/topology.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/topology.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/mmdebug.h \
    $(wildcard include/config/debug/virtual.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/elf.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/elf-em.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/elf.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/user.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/tracepoint.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/local.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/local.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/percpu.h \
    $(wildcard include/config/have/legacy/per/cpu/area.h) \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/debug/kmemleak.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/slub_def.h \
    $(wildcard include/config/slub/stats.h) \
    $(wildcard include/config/slub/debug.h) \
    $(wildcard include/config/kmemtrace.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/workqueue.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/jiffies.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/timex.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/timex.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include/mach/timex.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects/free.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kmemtrace.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/trace/events/kmem.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/trace/define_trace.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kmemleak.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/pfn.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/percpu.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/percpu.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/trace/events/module.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs4.h \
    $(wildcard include/config/nfs/v4/1.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs_idmap.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs_fs.h \
    $(wildcard include/config/nfs/v3/acl.h) \
    $(wildcard include/config/nfs/fscache.h) \
    $(wildcard include/config/nfs/v3.h) \
    $(wildcard include/config/sysctl.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/magic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/in.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/socket.h \
    $(wildcard include/config/proc/fs.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/socket.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/sockios.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sockios.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/uio.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/mm.h \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rbtree.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/want/page/debug/flags.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mm/owner.h) \
    $(wildcard include/config/mmu/notifier.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/auxvec.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/auxvec.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/page-debug-flags.h \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/page/debug/something/else.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/4level-fixup.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/cpu/32.h) \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v7.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/cpu-single.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include/mach/vmalloc.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/pgtable-hwdef.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/pgtable.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/have/mlocked/page/bit.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/s390.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/pagemap.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/highmem.h \
    $(wildcard include/config/debug/highmem.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/uaccess.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/uaccess.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/cacheflush.h \
    $(wildcard include/config/cpu/cache/v3.h) \
    $(wildcard include/config/cpu/cache/v4.h) \
    $(wildcard include/config/cpu/cache/v4wb.h) \
    $(wildcard include/config/outer/cache.h) \
    $(wildcard include/config/cpu/cache/vipt.h) \
    $(wildcard include/config/arm/errata/411920.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/shmparam.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/cachetype.h \
    $(wildcard include/config/cpu/cache/vivt.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/kmap_types.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/hardirq.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/hardirq.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/irq.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include/mach/irqs.h \
    $(wildcard include/config/cpu/s3c2443.h) \
    $(wildcard include/config/cpu/s3c2440.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/irq_cpustat.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/debug.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/auth.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/sched.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/types.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/xdr.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/unaligned.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/unaligned/le_byteshift.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/unaligned/be_byteshift.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/unaligned/generic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/scatterlist.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/io.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include/mach/io.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include/mach/hardware.h \
    $(wildcard include/config/cpu/s3c2412.h) \
    $(wildcard include/config/no/multiword/io.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include/mach/map.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include/plat/map-base.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c24xx/include/plat/map.h \
    $(wildcard include/config/cpu/s3c2413.h) \
    $(wildcard include/config/cpu/s3c2412/only.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/clnt.h \
    $(wildcard include/config/ipv6.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/in6.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/xprt.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/stats.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/proc_fs.h \
    $(wildcard include/config/proc/devicetree.h) \
    $(wildcard include/config/proc/kcore.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sunrpc/timer.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/signal.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/signal-defs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/sigcontext.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/ipv6.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ipv6.h \
    $(wildcard include/config/ipv6/privacy.h) \
    $(wildcard include/config/ipv6/router/pref.h) \
    $(wildcard include/config/ipv6/route/info.h) \
    $(wildcard include/config/ipv6/optimistic/dad.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/mip6.h) \
    $(wildcard include/config/ipv6/subtrees.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/icmpv6.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/net/dma.h) \
    $(wildcard include/config/network/secmark.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/kmemcheck.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/net.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/random.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/irqnr.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/textsearch.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/checksum.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/checksum.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dmaengine.h \
    $(wildcard include/config/dma/engine.h) \
    $(wildcard include/config/async/tx/dma.h) \
    $(wildcard include/config/async/tx/disable/channel/switch.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/devtmpfs.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ioport.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/klist.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/pm.h \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/pm/runtime.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/pm_wakeup.h \
    $(wildcard include/config/pm.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dma-mapping.h \
    $(wildcard include/config/have/dma/attrs.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/dma-attrs.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/bug.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/dma-mapping.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/dma-coherent.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/wlan/80211.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/tr.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/fcoe.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/net/ns.h) \
    $(wildcard include/config/net/dsa/tag/dsa.h) \
    $(wildcard include/config/net/dsa/tag/trailer.h) \
    $(wildcard include/config/netpoll/trap.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/if.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/hdlc/ioctl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/if_ether.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/if_packet.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/delay.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/delay.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ethtool.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/net_namespace.h \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/net.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/core.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/snmp.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/snmp.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/unix.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/packet.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
    $(wildcard include/config/ip/mroute.h) \
    $(wildcard include/config/ip/pimsm/v1.h) \
    $(wildcard include/config/ip/pimsm/v2.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/inet_frag.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/pimsm/v2.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/dst_ops.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/dccp.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/x_tables.h \
    $(wildcard include/config/bridge/nf/ebtables.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/netfilter.h \
    $(wildcard include/config/netfilter/debug.h) \
    $(wildcard include/config/nf/nat/needed.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/xfrm.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/xfrm.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/seq_file_net.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/seq_file.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/dsa.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/interrupt.h \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/debug/shirq.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/irqreturn.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/tcp.h \
    $(wildcard include/config/tcp/md5sig.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/sock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/list_nulls.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/security.h \
    $(wildcard include/config/security/path.h) \
    $(wildcard include/config/security/network.h) \
    $(wildcard include/config/security/network/xfrm.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/securityfs.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/binfmts.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/signal.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/siginfo.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/siginfo.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/resource.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/resource.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/resource.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sem.h \
    $(wildcard include/config/sysvipc.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/ipc.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/ipcbuf.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/sembuf.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/shm.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/shmbuf.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/msg.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/msgbuf.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/detect/softlockup.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/user/sched.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/group/sched.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/cputime.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/cputime.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/proportions.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/percpu_counter.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/latencytop.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/key.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/aio.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/aio_abi.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/flow.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/filter.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rculist_nulls.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/poll.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/poll.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/asm-generic/poll.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/dst.h \
    $(wildcard include/config/net/cls/route.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/rtnetlink.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/netlink.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/if_link.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/if_addr.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/neighbour.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/neighbour.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/rtnetlink.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netlink.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/inet_connection_sock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/inet_sock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/jhash.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/request_sock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/netns/hash.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/inet_timewait_sock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/tcp_states.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/timewait_sock.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/udp.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/if_inet6.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/net/ndisc.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs2.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs3.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs_xdr.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfsacl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/posix_acl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/nfs_fs_sb.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/backing-dev.h \
    $(wildcard include/config/debug/fs.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/writeback.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/mempool.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/fs/nfs/callback.h \

fs/nfs/sysctl.o: $(deps_fs/nfs/sysctl.o)

$(deps_fs/nfs/sysctl.o):
