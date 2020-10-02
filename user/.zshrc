# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set default browser to wslview so that URLs are opened on the Windows side
export BROWSER="wslview"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="cobalt2-custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	vi-mode git shrink-path zsh-autosuggestions docker docker-compose autojump zsh-syntax-highlighting zsh-z
)
# plugins=(
# 	vi-mode git shrink-path docker docker-compose autojump zsh-syntax-highlighting zsh-z
# )
# Note: zsh-autosuggestions must be installed/cloned in to ~/.oh-my-zsh/custom/plugins/

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

# Set vim as the default editor
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Turn on noclobber (prevent accidental overwriting of files using redirection)
set -o noclobber

# Tell zsh nto to nice background processes (fails in WSL)
unsetopt BG_NICE

# Set style of zsh autocompletion suggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# Add SSH keys to agent
if ! [ -f /tmp/ssh-keys-added ]; then
	$HOME/bin/add-ssh-keys
	touch /tmp/ssh-keys-added
fi

# Set style of zsh autocompletion suggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# Additional config
DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
# DISABLE_UNTRACKED_FILES_DIRTY=true

# Add additional git aliases
alias gdc="git diff --cached"
alias grc="git rebase --continue"
alias grs="git rebase --skip"

# Create aliases for jumping up several folders
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

# Make rg always color its output
alias rg="rg --color=always"

# Use e to launch emacsclient inside the terminal
alias e="emacsclient -t"

# Use dc instead of docker-compose
alias dc="docker-compose"

# Use bgo to open the current repo in Chrome
alias bgo="gh repo view -w"


# Add pip --user binary path
export PATH="$HOME/.local/bin:$PATH"

# vi-mode configuration:
# Use Ctrl+F for auto-completion by mapping it to 'forward-char' which is already setup for auto-completion
bindkey -M viins '^F' forward-char
# Use 'jk' as the escape sequence
bindkey -M viins 'jk' vi-cmd-mode

# Source fzf to make it work in zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Declare gems home folder and add gems bin folder to path
export GEM_HOME=$HOME/gems
export PATH=$PATH:$HOME/gems/bin

# Set DISPLAY for X applications. Remember to run XMing in Windows before-hand.
export DISPLAY=localhost:0.0

# Set Docker Host
# export DOCKER_HOST=tcp://0.0.0.0:2375
export DOCKER_HOST=tcp://localhost:2375

# Set work folder with full windows path (for mounting volumes to docker)
export whome=/c/Users/MujtabaAbidHasan
export work=/c/Users/MujtabaAbidHasan/work
export workspace=/c/Users/MujtabaAbidHasan/work/workspace
# Set windows root folder to be used by docker scripts
export DOCKER_ROOT=$work

# Do not use proxy for the DPKG API
export no_proxy=$no_proxy,blp-dpkg.dev.bloomberg.com


# Use fzf to browse Chrome History and launch page
# Requires a symbolic link 'windows-chrome' that points to the Chrome browser in Windows
# We filter out urls with length greater than 100 (these tend to be of limited utility)
# Source: https://junegunn.kr/2015/04/browsing-chrome-history-with-fzf/
ch() {
	local cols seps
	cols=$(( COLUMNS / 3 ))
	sep='{::}'

	cp -f /c/Users/MujtabaAbidHasan/AppData/Local/Google/Chrome/User\ Data/Default/History /tmp/History

	sqlite3 -separator $sep /tmp/History \
		"SELECT substr(title, 1, $cols), url FROM urls
		WHERE LENGTH(url) < 100 ORDER BY last_visit_time DESC" |
	awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
	fzf --ansi --multi --no-sort |
	sed 's#.*\(https*://\)#\1#' |
	xargs windows-chrome
}


# Search for item in Google in Chrome
cg() {
	windows-chrome "https://www.google.com/search?q=$(echo $@ | tr -s ' ' '+')"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set umask to 022
[[ "$(umask)" = "000" ]] && umask 0022

# Don't put duplicate command-lines in history
# If a command starts with space don't add it to history
HISTCONTROL=ignoredups:ignorespace

# Ignore duplicates when looking through history
setopt HIST_IGNORE_ALL_DUPS

# Timestamp for command history
HISTTIMEFORMAT="%F %T"

# Magic space expands !! and !-{n} when you hit spacebar after. You can also do
# {cmd-frag}!<space> to expand the last command that started with that fragment
bindkey " " magic-space

# Launch tmux by default
alias tmux="tmux -2 -u"
if which tmux 2>&1 >/dev/null; then
	test -z "$TMUX" && (tmux attach 2> /dev/null || tmux new-session)
fi
