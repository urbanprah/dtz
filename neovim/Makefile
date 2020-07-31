CONFIGDIR=~/.config/nvim
COCDIR=~/.config/coc


install: dependencies config plug coc
uninstall:
	rm -rf "$(CONFIGDIR)" "$(COCDIR)"

dependencies:
	yay --needed --noconfirm -S git neovim ruby python yarn nodejs npm xdotool ctags clang fzf
	gem install neovim

config:
	mkdir -pv $(CONFIGDIR)
	ln -sf $(PWD)/init.vim $(CONFIGDIR)/init.vim

plug:
	[ -e $(CONFIGDIR)/site/autoload/plug.vim ] || sh -c 'curl -fLo $(CONFIGDIR)/site/autoload/plug.vim --create-dirs \
	         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim +'PlugUpgrade | PlugInstall | PlugUpdate | PlugClean! | :qa!'

coc:
	mkdir -pv "$(COCDIR)/extensions"
	ln -sf "$(PWD)/coc.json" "$(COCDIR)/extensions/package.json"
	ln -sf "$(PWD)/coc-settings.json" "$(CONFIGDIR)"
	cd $(COCDIR)/extensions/ ; \
		npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

#https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
#coc-spell-checker
