install:
	mkdir -p $$HOME/.config/nvim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -r init.vim $$HOME/.config/nvim/init.vim
	go get -u github.com/mdempsky/gocode
	pip3 install --user pynvim flake8
	$(info $(red)Launch neovim and run: nvim +PluginInstall +qall$(reset))
update:
	cp -r init.vim $$HOME/.config/nvim/init.vim
	# append gitconfig alias section if it doesn't exist
	if ! grep -q "\[alias\]" "$$HOME/.gitconfig"; then \
	    cat git_config >> $$HOME/.gitconfig; \
	# Update gitconfig alias section if it already exists
	if  grep -q "\[alias\]" "$$HOME/.gitconfig"; then \
	    awk ./awk_gitconfig > temp_gitconfig; \
	    cat git_config >> temp_gitconfig; \
	    cp temp_gitconfig "$$HOME/.gitconfig";
	fi;
