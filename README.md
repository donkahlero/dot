![Uuuhhh Godfather](https://vignette.wikia.nocookie.net/villains/images/a/a5/20160918e1365.jpg/revision/latest?cb=20171016210905)
# TacoDot
This repo fullfills two purposes:
* Of course this is my personal backup - if something happens to my precious ;)
* For everyboy who likes my setup and wants to use it him/herself

All of the provided config files are obviously easiest to use by just symlinking at their correct spot.

#### Computers that use this configuration
* TUXEDO Book - Ubuntu 16.04
* MacBook Mid '15 - macOS 10.13 (for urxvt)

#### What am I running?
* Window Manager: herbstluftwm
* Audio: PulseAudio
* Main Editor: vim
* Shell: zshell
* T-Emu: rxvt-unicode
* eMail Client: mutt

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

Have fun!
