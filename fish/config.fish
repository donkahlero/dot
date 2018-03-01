set -Ux COLORTERM truecolor
set -Ux TERM xterm-kitty
set -Ux EDITOR vim

switch (uname)
case Linux
    # Linux stuff
    thefuck --alias | source
echo Darwin
    # macOS specific stuff
end

alias 1live='mplayer https://wdr-1live-live.icecastssl.wdr.de/wdr/1live/live/mp3/128/stream.mp3'
alias hr1='mplayer http://hr-hr1-live.cast.addradio.de/hr/hr1/live/mp3/128/stream.mp3'
