#####
# JAVA
#####
export JAVA_8_HOME=$(/usr/libexec/java_home -v "1.8.0_292")
export JAVA_11_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
export JAVA_16_HOME=$(/usr/libexec/java_home -v16)

alias java8='unset JAVA_HOME;export JAVA_HOME=$JAVA_8_HOME;export PATH=$JAVA_HOME/bin:$PATH'
alias java11='unset JAVA_HOME;export JAVA_HOME=$JAVA_11_HOME;export PATH=$JAVA_HOME/bin:$PATH'
alias java16='unset JAVA_HOME;export JAVA_HOME=$JAVA_16_HOME;export PATH=$JAVA_HOME/bin:$PATH'

# default to Java 11
java11

#default editor
export EDITOR='nvim'

##########
# FZF SETTINGS
##########
export FZF_DEFAULT_OPTS="
    --layout=reverse
    --info=inline
    --height=80%
    --multi
    --preview-window=:hidden
    --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
    --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
    --prompt='∼ ' --pointer='▶' --marker='✓'
    --bind '?:toggle-preview'
    --bind 'ctrl-a:select-all'
"

# fzf's command
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git'"
# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

_fzf_compgen_path() {
    fd . "$1"
}

_fzf_compgen_dir() {
    fd --type d . "$1"
}


# help commands start
alias vim=nvim
alias v=vim
alias s='source ~/.zshrc'

# settings files start
alias zshrc='vim ~/dotfiles/.zshrc'
alias vimrc='vim ~/dotfiles/.vimrc'
alias idearc='vim ~/dotfiles/.ideavimrc'
alias notes='vim ~/Dropbox/notes.md'
alias notes_car='vim ~/Dropbox/notes_car.md'
alias notes_vim='vim ~/Dropbox/vim_notes.md'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable insecure directories
ZSH_DISABLE_COMPFIX="true"

ZSH_THEME="robbyrussell"
plugins=(
 git
 adb
 gradle
 vi-mode
 python
)
source $ZSH/oh-my-zsh.sh

# path settings
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="$HOME/Development/flutter/bin:$PATH"
export PATH="/usr/local/bin/python:$PATH"
export PATH="$HOME/dotfiles/scripts/bin:$PATH"
source "$HOME/dotfiles/scripts/staros_media_scripts"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh_aliases
