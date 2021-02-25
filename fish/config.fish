set -x COLORTERM truecolor
set -x TERM xterm-kitty
set -x EDITOR vim

set -x LC_COLLATE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_MESSAGE en_US.UTF-8
set -x LC_MONETARY en_US.UTF-8
set -x LC_NUMERIC en_US.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x PATH $PATH /Users/jonas/go/bin
set -x PATH $PATH /opt/homebrew/bin
set -x GOPATH /Users/jonas/go

kitty + complete setup fish | source

alias 1live='mplayer https://wdr-1live-live.icecastssl.wdr.de/wdr/1live/live/mp3/128/stream.mp3'
alias hr1='mplayer http://hr-hr1-live.cast.addradio.de/hr/hr1/live/mp3/128/stream.mp3'
