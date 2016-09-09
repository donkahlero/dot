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

## herbstluftwm
Just symlink the the repo folder inside your ~/.config/ folder and everything should work.
```zsh
ln -s GITHUB/CLONE/DIR/herbstluftwm ~/.config/herbstluftwm
```
#### Files & their location
##### autostart
Just the regular autostart file. Every herbstuftwm installation needs that one.
##### panel.sh/tags.sh
Responsible for the left part of the status bar. The dzen2 part. Is just drawing the different page tags.
##### conkyrc
Responsible for the right part of the status bar. The conky part. Draws the different statuses, like temperature and cpu usage.
##### volume.sh
Reads out the volume from pamixer. Prints mute when audio muted.
##### wallpaper.sh
Selects a RANDOM image from the ~/.config/herbstluftwm/wallpaper directory each wm start and sets it as the desktop background.

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
