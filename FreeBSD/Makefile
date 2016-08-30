.PHONY: all install deinstall

VTY != sysctl -n kern.vty

all:
	@echo Usage: make install or make deinstall

install:
	cp -f us.iso.swenglish.kbd /usr/share/syscons/keymaps/
	cp -f us.swenglish.kbd /usr/share/vt/keymaps/

.if $(VTY) == "sc"
	@printf "\nSystem console is syscons.\n\n"
	@printf "Test keyboard layout by running: kbdcontrol -l us.iso.swenglish.kbd\n\n"
	@printf "Make permanent by adding line\n   keymap=\"us.iso.swenglish\"\nto /etc/rc.conf.\n"
.elif $(VTY) == "vt"
	@printf "\nSystem console is vt.\n\n"
	@printf "Test keyboard layout by running: kbdcontrol -l us.swenglish.kbd\n\n"
	@printf "Make permanent by adding line\n   keymap=\"us.swenglish\"\nto /etc/rc.conf.\n"
.else
	@printf "\nERROR: Could not detect system console.\n"
.endif

deinstall:
	rm -f /usr/share/syscons/keymaps/us.iso.swenglish.kbd
	rm -f /usr/share/vt/keymaps/us.swenglish.kbd
