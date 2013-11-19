cmd_lib/gen_crc32table := gcc -Wp,-MD,lib/.gen_crc32table.d -Ilib -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -o lib/gen_crc32table /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/lib/gen_crc32table.c  

deps_lib/gen_crc32table := \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/lib/gen_crc32table.c \
  /usr/include/stdio.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/stddef.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/stdarg.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/lib/crc32defs.h \
  /usr/include/inttypes.h \
  /usr/include/stdint.h \
  /usr/include/bits/wchar.h \

lib/gen_crc32table: $(deps_lib/gen_crc32table)

$(deps_lib/gen_crc32table):
