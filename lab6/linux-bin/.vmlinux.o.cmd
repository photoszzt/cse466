cmd_vmlinux.o := arm-linux-ld -EL  -r -o vmlinux.o arch/arm/kernel/head.o arch/arm/kernel/init_task.o  init/built-in.o --start-group  usr/built-in.o  arch/arm/kernel/built-in.o  arch/arm/mm/built-in.o  arch/arm/common/built-in.o  arch/arm/mach-s3c2410/built-in.o  arch/arm/mach-s3c2400/built-in.o  arch/arm/mach-s3c2412/built-in.o  arch/arm/mach-s3c2440/built-in.o  arch/arm/mach-s3c2442/built-in.o  arch/arm/mach-s3c2443/built-in.o  arch/arm/plat-s3c24xx/built-in.o  arch/arm/plat-s3c/built-in.o  arch/arm/nwfpe/built-in.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  block/built-in.o  arch/arm/lib/lib.a  lib/lib.a  arch/arm/lib/built-in.o  lib/built-in.o  drivers/built-in.o  sound/built-in.o  firmware/built-in.o  net/built-in.o --end-group 
