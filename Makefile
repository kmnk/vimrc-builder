# Makefile
.PHONY: all install update clean

all: vim-install linux

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' >> ~/.vimrc


windows:


vim-install:
	mkdir -p ~/.bundle
	git clone git://github.com/Shougo/neobundle.vim.git ~/.bundle/neobundle.vim
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall +q
	cd ~/.bundle/vimproc/ && make -f make_gcc.mak


install: vim-install-plugins

vim-install-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall +q


update: vim-update-plugins

vim-update-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall! +q


clean: vim-clean-plugins

vim-clean-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleClean +q
