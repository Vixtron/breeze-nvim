#
# ~/.bashrc
#

# Default editors
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export BROWSER="firefox"

# Export home directory paths
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export CARGO_HOME="$HOME/.local/share/cargo"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\u@\h:\w> '

function alert() {
    if [ $? = 0 ]; then icon=terminal; else icon=error; fi
    last_cmd="$(history | tail -n1 | sed 's/^\s*[0-9]*\s*//' | sed 's/;\s*alert\s*$//')"
    notify-send -i $icon "$last_cmd"
}

# Command aliases
alias \
    vim="nvim" \
    ls="ls --color=auto --group-directories-first" \
    l="ls -al --color=auto --group-directories-first" \
    grep="grep --color-auto" \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv"
