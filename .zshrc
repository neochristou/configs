# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}%n@%M:%{$fg[blue]%}%~%{$reset_color%}$%b "

setopt appendhistory autocd
unsetopt beep nomatch

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile

export TERMINAL=$HOME/st/st
export EDITOR=/usr/local/bin/vim
export BROWSER=/usr/bin/brave-browser

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Man pages colors

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Precmd : to emulate bash's PROMPT_COMMAND variable
precmd(){
	pwd > /tmp/whereami
	}

xset +fp $HOME/.local/share/fonts
xset +fp $HOME/.fonts
xset fp rehash

# FZF settings
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# Key bindings
setxkbmap -option caps:swapescape
setxkbmap -option ctrl:ralt_rctrl

# General env sttings
export XDG_CONFIG_HOME="$HOME/.config"
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export ANDROID_HOME=/media/neo/Storage/android-studio
export ANDROID_AVD_HOME=/media/neo/Storage/.android
export ANDROID_SDK_HOME=/media/neo/Storage

export PATH=$PATH:/usr/local/java/bin
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# ctf-tools: PATH setup
export PATH="$HOME/ctf-tools/bin:$PATH"
# ctf-tools: gem install
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

# aliases
export PYTHONPATH="/home/neo/.local/lib/python3.7/site-packages:/home/neo/.local/lib/python3.8/site-packages"
fpath=($fpath "/home/neo/.zfunctions")

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#c0c0c0"
bindkey '^ ' autosuggest-execute
bindkey '^T' autosuggest-accept

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# thefuck activation
eval $(thefuck --alias)

### ARCHIVE EXTRACTION
# usage: ex <file>
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export WEENIX_DIR=/home/neo/phd/classes/csci1670/weenix-2021-neochristou

function wg {
    if [[ $# -eq 1 ]]; then
        if [[ "$1" != "-n" ]]; then
            echo 'incorrect usage'
            return 127
        fi
    fi

    # WEENIX_DIR=/vagrant

    if [[ "$1" = "-n" ]]; then
        $WEENIX_DIR/weenix -n -d gdb; pkill qemu
    else
        $WEENIX_DIR/weenix -d gdb; pkill qemu
    fi
}

function rw {
     if [[ $# -eq 1 ]]; then
        if [[ "$1" != "-n" ]]; then
            echo 'incorrect usage' ]]
            return 127
        fi
    fi

    # WEENIX_DIR=/vagrant

    if [[ "$1" = "-n" ]]; then
        $WEENIX_DIR/weenix -n;
    else
        $WEENIX_DIR/weenix;
    fi
}
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/neo/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/neo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/neo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/neo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

