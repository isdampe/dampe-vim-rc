#!/bin/bash

if test "$(uname)" = "Darwin" ; then
	# MacOS
	font_dir="$HOME/Library/Fonts"
	cp ".vimrc-macos" ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	# Linux
	font_dir="$HOME/.fonts"
	mkdir -p $font_dir
	echo "Installing GTK2 GVIM fix..."
	cp ".gtkrc-2.0" ~/
	cp ".vimrc-linux" ~/.vimrc
	mkdir -p ~/.vim
	npm i intelephense -g
	pip install python-language-server --user
	sudo apt install clangd
	cp coc-settings.json ~/.vim/
	cp filetype.vim ~/.vim/
fi

echo "Installing Droid Sans Mono for Powerline..."
cp "font/Droid Sans Mono for Powerline.otf" "$font_dir/"
if which fc-cache >/dev/null 2>&1 ; then
	echo "Resetting font cache, this may take a moment..."
	fc-cache -f "$font_dir"
fi

echo "Installation complete."
