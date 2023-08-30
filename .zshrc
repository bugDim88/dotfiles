#####
# JAVA
#####
export JAVA_8_HOME=$(/usr/libexec/java_home -v "1.8.0_292")
export JAVA_11_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export JAVA_16_HOME=$(/usr/libexec/java_home -v16)

alias java8='unset JAVA_HOME;export JAVA_HOME=$JAVA_8_HOME;export PATH=$JAVA_HOME/bin:$PATH'
alias java11='unset JAVA_HOME;export JAVA_HOME=$JAVA_11_HOME;export PATH=$JAVA_HOME/bin:$PATH'
alias java16='unset JAVA_HOME;export JAVA_HOME=$JAVA_16_HOME;export PATH=$JAVA_HOME/bin:$PATH'

# default to Java 11
java11


# EMACS
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias clj_repl="clj -Sdeps '{:deps {nrepl/nrepl {:mvn/version "0.9.0"} cider/cider-nrepl {:mvn/version "0.28.4"}}}' \
    -m nrepl.cmdline \
    --middleware '["cider.nrepl/cider-middleware"]' \
    --interactive"

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

#default editor
export EDITOR='nvim'

# help commands start
alias vim=nvim
alias v=nvim
alias s='source ~/.zshrc'

alias rangercd='. ranger'

# settings files start
alias zshrc='vim ~/dotfiles/.zshrc'
alias vimrc='vim ~/dotfiles/.vimrc'
alias idearc='vim ~/dotfiles/.ideavimrc'
# alias notes='vim ~/Dropbox/notes.md'
alias notes='vim -c VimwikiIndex'
alias wiki_e='emacs ~/Dropbox/wiki_org'
alias notes_car='vim ~/Dropbox/notes_car.md'
alias notes_vim='vim ~/Dropbox/vim_notes.md'
alias zshalias='vim ~/.zsh_aliases'
function staros_scripts() { vim $HOME/dotfiles/scripts/staros_media_scripts }

# ranger with Q mapped to shell CD
function ranger(){
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable insecure directories
ZSH_DISABLE_COMPFIX="true"

# ZSH_THEME="blinks"
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
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="$HOME/Development/flutter/bin:$PATH"
export PATH="/usr/local/bin/python:$PATH"
export PATH="$HOME/dotfiles/scripts/bin:$PATH"
export PATH="$HOME/Development/neovide/target/release:$PATH"
source "$HOME/dotfiles/scripts/staros_media_scripts"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_com$

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export VI_MODE_SET_CURSOR=true


fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh_aliases
