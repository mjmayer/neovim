install:
	mkdir -p $$HOME/.config/nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -r init.vim $$HOME/.config/nvim/init.vim
	go get -u github.com/mdempsky/gocode
	pip3 install --user pynvim
	$(info $(red)Launch neovim and run: nvim +PluginInstall +qall$(reset))
