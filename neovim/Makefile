CONFIGDIR=$(XDG_CONFIG_HOME)/nvim

install:
	[ -e $(CONFIGDIR)/site/autoload/plug.vim ] || sh -c 'curl -fLo "$(XDG_CONFIG_HOME)/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	ln -sf $(PWD)/init.vim $(CONFIGDIR)/init.vim

uninstall:
	rm -rf "$(XDG_CONFIG_HOME)/nvim"
