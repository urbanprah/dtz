CONFIGDIR="$$HOME/.local/src"
CDIR="$${PWD}"

install:
	mkdir -pv $(CONFIGDIR)
	declare -A REPOS=( \
		["dwm"]="https://github.com/urbanprah/dwm" \
		["dwmblocks"]="https://github.com/urbanprah/dwmblocks" \
		["dmenu"]="https://github.com/urbanprah/dmenu" ) ; \
		for key in "$${!REPOS[@]}" ; do \
			cd $(CONFIGDIR) ; \
			[ -d "$$key" ] || git clone "$${REPOS[$$key]}" ; \
			cd $$key ; \
			sudo make clean install && make clean ; \
			rm -rf *.orig ; \
		done
	cd $(CDIR)

uninstall:
	[ -d $(CONFIGDIR) ] || exit 1
	declare -A REPOS=( \
		["dwm"]="https://github.com/urbanprah/dwm" \
		["dwmblocks"]="https://github.com/urbanprah/dwmblocks" \
		["dmenu"]="https://github.com/urbanprah/dmenu" ) ; \
		for key in "$${!REPOS[@]}" ; do \
			cd $(CONFIGDIR) ; \
			cd $$key ; \
			sudo make uninstall ; \
			cd .. ; \
			echo '[WARNING]: THERE MAY BE LOCAL COMMITS!' ; \
			rm -Ir $$key ; \
		done
