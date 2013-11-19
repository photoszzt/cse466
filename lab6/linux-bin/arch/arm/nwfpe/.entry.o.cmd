cmd_arch/arm/nwfpe/entry.o := arm-linux-gcc -Wp,-MD,arch/arm/nwfpe/.entry.o.d  -nostdinc -isystem /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/include -Iinclude -Iinclude2 -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/include -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include -include include/linux/autoconf.h -D__KERNEL__ -mlittle-endian   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2410/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2400/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2412/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2440/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2442/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/mach-s3c2443/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c24xx/include   -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/plat-s3c/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -include asm/unified.h -msoft-float  -c -o arch/arm/nwfpe/entry.o /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/nwfpe/entry.S

deps_arch/arm/nwfpe/entry.o := \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/nwfpe/entry.S \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  include/asm/asm-offsets.h \

arch/arm/nwfpe/entry.o: $(deps_arch/arm/nwfpe/entry.o)

$(deps_arch/arm/nwfpe/entry.o):
