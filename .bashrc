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

# Command aliases
alias \
    vim="nvim" \
    ls="ls --color=auto --group-directories-first" \
    l="ls -al --color=auto --group-directories-first" \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv"

# Purge pacman package cache directory
PKG_DIR="/var/cache/pacman/pkg"

pacman_pkg(){
    if [ -z "$(ls -A $PKG_DIR)" ]; then
        echo "Directory empty, nothing to do..."
    else
        echo "Deleting pacman package cache..." ; ls -A $PKG_DIR ; sudo rm -rf $PKG_DIR/*
    fi
}

# Pacman aliases
alias \
    pacro="sudo pacman -Rns $(pacman -Qttdq)" \
    pacc="pacman_pkg"
