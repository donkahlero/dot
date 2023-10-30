#!/usr/bin/env bash

install_git() {
	if  command -v git
	then
		return
	fi

	sudo pacman -S git
}

install_yay() {
	install_git

	if command -v yay
	then
		return
	fi

	cd /tmp || exit 127
	git clone https://aur.archlinux.org/yay.git
	cd yay || exit 127
	sudo makepkg --syncdeps
	sudo makepkg --install
	sudo makepkg --clean
}

sudo pacman -S base base-devel
install_yay

# install required packages
yay -S \
	atool \
	battery-notify \
	blueman \
	bluez \
	dunst \
	feh \
	fish \
	fuse2 \
	glow \
	kitty \
	herbstluftwm \
	hideit.sh-git \
	libarchive \
	light \
	neofetch \
	neomutt \
	neovim \
	pavucontrol \
	polybar \
	python-pillow \
	qutebrowser \
	ranger \
	rclone \
	rofi \
	sshfs \
	trash-cli \
	udiskie \
	unzip \
	xautolock \
	xclip \
	zathura \
	zathura-pdf-poppler \
	zip

# symlink configs
ln -s "$(realpath ./fish)" "${HOME}/.config/fish"
ln -s "$(realpath ./herbstlufwm)" "${HOME}/.config/herbstluftwm"
ln -s "$(realpath ./kitty)" "${HOME}/.config/kitty"
ln -s "$(realpath ./neomutt)" "${HOME}/.config/neomutt"
ln -s "$(realpath ./nvim)" "${HOME}/.config/nvim"
ln -s "$(realpath ./polybar)" "${HOME}/.config/polybar"
ln -s "$(realpath ./ranger)" "${HOME}/.config/ranger"
ln -s "$(realpath ./rofi)" "${HOME}/.config/rofi"

