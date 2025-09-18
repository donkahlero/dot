set -x COLORTERM truecolor
set -x TERM xterm-256color
set -x EDITOR nvim

set -x LC_COLLATE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_MESSAGE en_US.UTF-8
set -x LC_MONETARY en_US.UTF-8
set -x LC_NUMERIC en_US.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_ALL en_US.UTF-8

switch (uname)
    case Darwin
	set -x PATH $PATH /opt/homebrew/bin
	set -x PATH $PATH /opt/podman/bin
	set -x GOPATH /Users/jonaskahler/go
	set -x PATH $PATH /Users/jonaskahler/go/bin
	set -x PATH $PATH /usr/local/bin
    case Linux
	set -x PATH $PATH /home/jonas/go/bin /usr/local/bin /home/jonas/.local/bin
	set -x GOPATH /home/jonas/go
end

set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
starship init fish | source
