# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/a18706552/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Enable insecure directories
ZSH_DISABLE_COMPFIX="true"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
 git
 adb
 gradle
 vi-mode
 python
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# adb aliases

# get service_logs + logs + star.db + star.json ->
# put to zip & open in finder
alias staros_log_arch='adb wait-for-device; adb root; src="/data/staros/service_logs/"; src2="/data/staros/logs/"; src3="/data/staros/star.db"; src4="/vendor/staros/star.json"; dst_dir="$(mktemp -d)"/; adb pull $src $src2 $src3 $src4 $dst_dir; sn=$(adb shell getprop ro.serialno); date=$(date '+%Y_%m_%d_%H_%M_%S'); zip_name="all_logs_${sn}_${date}.zip"; (cd "$dst_dir"; zip -rFS9 "$zip_name" .); open "$dst_dir"'

# get build number
alias staros_version="adb shell cat /vendor/staros/star.json | grep starVer"

# staros reload
alias staros_reload="adb shell killall box" 

# staros step over authorization
function staros_auth_step(){
	local step="${1:-8}"
	adb shell cd system/vendor/staros/;
	./star-client -p 20020 'setup_step_finish {step: $step}';
	exit
}

# get service logs
alias staros_log_services_arch='adb wait-for-device; adb root; src="data/staros/service_logs/"; dst_dir="$(mktemp -d)";adb pull $src $dst_dir;date=$(date '+%Y_%m_%d_%H_%M_%S'); zip_name="all_services_logs_${date}.zip";(cd "$dst_dir"; zip -rFS9 "$zip_name" .); open "$dst_dir"'

# show service logs tail
alias staros_service_logs_tail='adb shell tail -f "/data/staros/service_logs/setup.log"'

# wifi enable
alias adb_wifi_on="adb shell svc wifi enable"

# wifi disable
alias adb_wifi_off="adb shell svc wifi disable"

export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="`pwd`/flutter/bin:$PATH"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source ${(q-)PWD}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
