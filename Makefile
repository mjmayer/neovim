install:
	mkdir -p $$HOME/.config/nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -r init.vim $$HOME/.config/nvim/init.vim
	go get -u github.com/mdempsky/gocode
	pip3 install --user pynvim flake8
	$(info $(red)Launch neovim and run: nvim +PluginInstall +qall$(reset))
update:
	cp -f init.vim $$HOME/.config/nvim/init.vim
	# append gitconfig alias section if it doesn't exist
	if ! grep -q "\[alias\]" "$$HOME/.gitconfig"; then \
	    cat git_alias >> $$HOME/.gitconfig; \
	fi;
	# Update gitconfig alias section if it already exists
	if  grep -q "\[alias\]" "$$HOME/.gitconfig"; then \
	    ./awk_gitconfig "$$HOME/.gitconfig" > temp_gitconfig; \
	    cat git_alias >> temp_gitconfig; \
	    cp temp_gitconfig "$$HOME/.gitconfig"; \
	    rm temp_gitconfig; \
	fi;
