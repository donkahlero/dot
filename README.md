# TacoDot
This repo fullfills two purposes:
* Of course this is my personal backup - if something happens to my precious ;)
* For everyboy who likes my setup and wants to use it him/herself
Every important part of this repo will is explained further down.

#### Quick Info
* Computer: Lenovo Thinkpad X1 Carbon
* Window Manager: herbstluftwm
* Audio: PulseAudio
* Editor: Emacs
* Shell: Zsh
* T-Emu: rxvt-unicode
* eMail: mutt

## Installed packets
The following packets (!!!be careful: ArchLinux names!!!) need to be installed to make this stuff work:
```archpackets
herbstluftwm dzen2 conky rxvt-unicode zsh rofi pulseaudio pamixer emacs-nox mutt textlive-most networkmanager-dmenu-git xorg-xrandr
```

## Emacs
Yezzzzz - I love Emacs. Don't hate.

#### Files & their location
##### Backups
To avoid the creation of backup files directly in the folder and messing it up of the original file,
the config file makes emacs store these files in a special direction: ~/.emacs.d/saves
##### emacs_toolchain
It is important that you either copy the toolchain.sample as plain toolchain to your ~/.emacs.d/ 
```zsh
cp GITHUB/CLONE/DIR/Emacs/emacs_toolchain.sample ~/.emacs.d/emacs_toolchain
```
Then define the installed parts. For example: if you don't have any erlang packet installed set the variable to 0

