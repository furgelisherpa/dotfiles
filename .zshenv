export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -):$HOME/.local/share/go/bin:$HOME/.local/share/cargo/bin"
unsetopt PROMPT_SP 2>/dev/null

# default programs:
export EDITOR="nvim"

# ~/ clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GPG_TTY="$(tty)"
export GOROOT="/usr/lib/golang/"
export GOPATH="${XDG_DATA_HOME}/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CPLUS_INCLUDE_PATH="/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export HISTFILE="$XDG_DATA_HOME/history"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export UNISON="$XDG_DATA_HOME/unison"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS="R"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

export LC_ALL="en_US.UTF-8"
export MANPAGER='nvim +Man!'
export QT_STYLE_OVERRIDE="kvantum"
