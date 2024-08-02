# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[white]%} %{$fg[magenta]%}%1~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$HOME/.cache/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# emacs mode
set -o emacs

# alias
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias bc="bc -ql"
alias rsync="rsync -vrPlu"
alias mkd="mkdir -pv"
alias yt="yt-dlp --embed-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias ytt="yt --skip-download --write-thumbnail"
alias ffmpeg="ffmpeg -hide_banner"
alias ls="lsd -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi"
alias ip="ip -color=auto"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias YT="youtube-viewer"
alias sdn="shutdown -h now"
alias e="$EDITOR"
alias v="$EDITOR"
alias z="zathura"
alias bc="bc -lq"
alias cmacs="emacsclient -c -a 'nvim'"
alias nvimdiff="nvim -d"
alias python="python3"
alias sim="setsid -f ~/.local/src/SimulIDE_1.1.0-SR0_Lin64/simulide 2&>1 >/dev/null"

# sudo not required for some system commands
for command in mount umount updatedb su shutdown poweroff reboot; do
	alias $command="sudo $command"
done; unset command

# fuzzy find
function sr {
  dir="$1"
  choice="$(find $dir -mindepth 1 -printf '%P\n' | fzf)"
  [[ -d "$dir/$choice" || -f "$dir/$choice" ]] && $EDITOR "$dir/$choice"
}

alias se="sr ~/.local/bin" # scripts
alias scc="sr ~/.config" # config
alias sp="sr ~/.github" # projects

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
