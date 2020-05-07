CONFIGDIR=$(XDG_CONFIG_HOME)/nvim
COCDIR=$(XDG_CONFIG_HOME)/coc


install: dependencies config plug coc
uninstall:
	rm -rf "$(CONFIGDIR)" "$(COCDIR)"

dependencies:
	yay --needed -S git neovim ruby python yarn nodejs npm nerd-fonts-complete ctags xdotool brave-bin
	gem install neovim

config:
	ln -sf $(PWD)/init.vim $(CONFIGDIR)/init.vim

plug:
	[ -e $(CONFIGDIR)/site/autoload/plug.vim ] || sh -c 'curl -fLo "$(XDG_CONFIG_HOME)/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim +'PlugUpgrade | PlugInstall | PlugUpdate | PlugClean! | :qa!'

coc:
	mkdir -pv $(COCDIR)/extensions
	ln -sf $(PWD)/coc.json $(COCDIR)/extensions/package.json
	cd $(COCDIR)/extensions
	npm install coc-snippets --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

