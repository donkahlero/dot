use path
use re
use str
use readline-binding

# ==============================================================================
# Environment Variables
# ==============================================================================
set E:COLORTERM = truecolor
set E:TERM = xterm-kitty
set E:EDITOR = nvim

set E:LC_COLLATE = en_US.UTF-8
set E:LC_CTYPE = en_US.UTF-8
set E:LC_MESSAGE = en_US.UTF-8
set E:LC_MONETARY = en_US.UTF-8
set E:LC_NUMERIC = en_US.UTF-8
set E:LC_TIME = en_US.UTF-8
set E:LC_ALL = en_US.UTF-8

# ==============================================================================
# OS-specific PATH and GOPATH
# ==============================================================================
var os = (str:trim-space (uname))
if (eq $os Darwin) {
  set E:GOPATH = /Users/jonaskahler/go
  set paths = [
    $@paths
    /opt/homebrew/bin
    /opt/podman/bin
    /Users/jonaskahler/go/bin
    /usr/local/bin
  ]
} elif (eq $os Linux) {
  set E:GOPATH = /home/jonas/go
  set paths = [
    $@paths
    /home/jonas/go/bin
    /usr/local/bin
    /home/jonas/.local/bin
  ]
}

# ==============================================================================
# GPG
# ==============================================================================
try {
  set E:GPG_TTY = (tty)
  gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
} catch { }

# ==============================================================================
# staship
# ==============================================================================
eval (starship init elvish)

# ==============================================================================
# epm
# ==============================================================================
use epm

epm:install &silent-if-installed       ^
github.com/zzamboni/elvish-modules

# iTerm2 integration: works with kitty
# https://sw.kovidgoyal.net/kitty/shell-integration/#notes-for-shell-developers
use github.com/zzamboni/elvish-modules/iterm2
iterm2:init
set edit:insert:binding[Ctrl-L] = $iterm2:clear-screen~

# Set title to CWD when at prompt, running command when executing
set edit:before-readline = [
  {
    var title = (str:replace $E:HOME "~" (path:abs $pwd))
    iterm2:windowtitle $title
  }
  $@edit:before-readline
]
set edit:after-readline = [
  $@edit:after-readline
  {|cmd|
    iterm2:windowtitle $cmd
  }
]

# ==============================================================================
# carapace
# ==============================================================================
set-env CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
eval (carapace _carapace|slurp)
