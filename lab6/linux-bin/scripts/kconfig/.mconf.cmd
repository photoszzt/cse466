cmd_scripts/kconfig/mconf := gcc  -o scripts/kconfig/mconf scripts/kconfig/mconf.o scripts/kconfig/zconf.tab.o scripts/kconfig/lxdialog/checklist.o scripts/kconfig/lxdialog/util.o scripts/kconfig/lxdialog/inputbox.o scripts/kconfig/lxdialog/textbox.o scripts/kconfig/lxdialog/yesno.o scripts/kconfig/lxdialog/menubox.o -lncursesw 
