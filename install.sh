#!/bin/bash

if test "$(uname)" = "Darwin" ; then
	# MacOS
	font_dir="$HOME/Library/Fonts"
	cp ".vimrc-macos" ~/.vimrc
else
	# Linux
	font_dir="$HOME/.fonts"
	mkdir -p $font_dir
	echo "Installing GTK2 GVIM fix..."
	cp ".gtkrc-2.0" ~/
	cp ".vimrc-linux" ~/.vimrc
fi

echo "Installing Droid Sans Mono for Powerline..."
cp "font/Droid Sans Mono for Powerline.otf" "$font_dir/"
if which fc-cache >/dev/null 2>&1 ; then
	echo "Resetting font cache, this may take a moment..."
	fc-cache -f "$font_dir"
fi

echo "Installation complete."
