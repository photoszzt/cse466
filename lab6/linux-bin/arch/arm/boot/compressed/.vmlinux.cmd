cmd_arch/arm/boot/compressed/vmlinux := arm-linux-ld -EL    --defsym zreladdr=0x30008000 --defsym params_phys=0x30000100 -p --no-undefined -X /cse/courses/cse466/Instr/arm_gcc/4.3.2/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.2/armv4t/libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux 
