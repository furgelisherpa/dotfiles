# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[white]%} %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# alias
alias cp="cp -iv"
alias	mv="mv -iv"
alias	rm="rm -vI"
alias	bc="bc -ql"
alias	rsync="rsync -vrPlu"
alias	mkd="mkdir -pv"
alias	yt="yt-dlp --embed-metadata -i"
alias	yta="yt -x -f bestaudio/best"
alias	ytt="yt --skip-download --write-thumbnail"
alias	ffmpeg="ffmpeg -hide_banner"
alias ls="ls -hN --color=auto --group-directories-first"
alias	grep="grep --color=auto"
alias	diff="diff --color=auto"
alias	ccat="highlight --out-format=ansi"
alias	ip="ip -color=auto"
alias ka="killall"
alias	g="git"
alias	trem="transmission-remote"
alias	YT="youtube-viewer"
alias	sdn="shutdown -h now"
alias	e="$EDITOR"
alias	v="$EDITOR"
alias	z="zathura"
alias	magit="nvim -c MagitOnly"
alias bc="bc -lq"
# somehow debian repo's yt-dlp is broken so using python's yt-dlp
alias youtube-dl='$HOME/.venv/bin/yt-dlp'
alias cmacs="emacsclient -c -a 'nvim'"
alias nvimdiff="nvim -d"

# sudo not required for some system commands
for command in mount umount sv updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

# fuzzy finder
se() {
  choice="$(find ~/.local/bin -mindepth 1 -printf '%P\n' | fzf)"
  [ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
  ;}
