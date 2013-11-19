cmd_scripts/kconfig/zconf.tab.o := gcc -Wp,-MD,scripts/kconfig/.zconf.tab.o.d -Iscripts/kconfig -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer   -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  -I/homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig -Iscripts/kconfig -c -o scripts/kconfig/zconf.tab.o scripts/kconfig/zconf.tab.c

deps_scripts/kconfig/zconf.tab.o := \
  scripts/kconfig/zconf.tab.c \
  /usr/include/ctype.h \
  /usr/include/features.h \
  /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/include/bits/typesizes.h \
  /usr/include/endian.h \
  /usr/include/bits/endian.h \
  /usr/include/bits/byteswap.h \
  /usr/include/xlocale.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/stdarg.h \
  /usr/include/stdio.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/stddef.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/include/bits/stdio_lim.h \
  /usr/include/bits/sys_errlist.h \
  /usr/include/bits/stdio.h \
  /usr/include/stdlib.h \
  /usr/include/bits/waitflags.h \
  /usr/include/bits/waitstatus.h \
  /usr/include/sys/types.h \
  /usr/include/time.h \
  /usr/include/sys/select.h \
  /usr/include/bits/select.h \
  /usr/include/bits/sigset.h \
  /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h \
  /usr/include/string.h \
  /usr/include/bits/string.h \
  /usr/include/bits/string2.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/stdbool.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/lkc.h \
    $(wildcard include/config/list.h) \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/expr.h \
  /usr/include/libintl.h \
  /usr/include/locale.h \
  /usr/include/bits/locale.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/lkc_proto.h \
  scripts/kconfig/zconf.hash.c \
  scripts/kconfig/lex.zconf.c \
  /usr/include/errno.h \
  /usr/include/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/limits.h \
  /usr/lib/gcc/i686-redhat-linux/4.4.7/include/syslimits.h \
  /usr/include/limits.h \
  /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h \
  /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h \
  /usr/include/bits/environments.h \
  /usr/include/bits/confname.h \
  /usr/include/getopt.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/util.c \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/lkc.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/confdata.c \
    $(wildcard include/config/config.h) \
    $(wildcard include/config/autoconfig.h) \
    $(wildcard include/config/.h) \
    $(wildcard include/config/overwriteconfig.h) \
    $(wildcard include/config/notimestamp.h) \
    $(wildcard include/config/autoheader.h) \
  /usr/include/sys/stat.h \
  /usr/include/bits/stat.h \
  /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/expr.c \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/symbol.c \
  /usr/include/regex.h \
  /usr/include/sys/utsname.h \
  /usr/include/bits/utsname.h \
  /homes/iws/zzt0215/cse_466/labs/lab6/linux-2.6.32.2/scripts/kconfig/menu.c \

scripts/kconfig/zconf.tab.o: $(deps_scripts/kconfig/zconf.tab.o)

$(deps_scripts/kconfig/zconf.tab.o):
