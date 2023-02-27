set -x COLORTERM truecolor
set -x TERM xterm-kitty
set -x EDITOR nvim

set -x LC_COLLATE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_MESSAGE en_US.UTF-8
set -x LC_MONETARY en_US.UTF-8
set -x LC_NUMERIC en_US.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x PATH $PATH /home/jonas/go/bin /usr/local/bin /home/jonas/.local/bin /opt/gcc-arm-none-eabi-10.3-2021.10/bin/
set -x GOPATH /home/jonas/go

set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

starship init fish | source

pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

