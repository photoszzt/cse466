cmd_lib/decompress.o := arm-linux-gcc -Wp,-MD,lib/.decompress.o.d  -nostdinc -isystem /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include -Iinclude -Iinclude2 -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include -include include/linux/autoconf.h  -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/lib -Ilib -D__KERNEL__ -mlittle-endian   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2400/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2412/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2440/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2442/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2443/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c24xx/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(decompress)"  -D"KBUILD_MODNAME=KBUILD_STR(decompress)"  -c -o lib/decompress.o /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/lib/decompress.c

deps_lib/decompress.o := \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/lib/decompress.c \
    $(wildcard include/config/decompress/gzip.h) \
    $(wildcard include/config/decompress/bzip2.h) \
    $(wildcard include/config/decompress/lzma.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/decompress/generic.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/decompress/bunzip2.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/decompress/unlzma.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/decompress/inflate.h \
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
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include/stdarg.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/string.h \

lib/decompress.o: $(deps_lib/decompress.o)

$(deps_lib/decompress.o):
