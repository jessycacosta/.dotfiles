# Set up the prompt

autoload -Uz promptinit
promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
##########################
### Zap Plugin Manager ###
##########################

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-history-substring-search"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/completions"
# plug "zap-zsh/sudo"
plug "web-search"
plug "zap-zsh/fzf"
plug "zap-zsh/web-search"
plug "jeffreytse/zsh-vi-mode"

alias ccw='cc -Wall -Wextra -Werror -g'

# git
alias ga='git add'
alias gap='git add -p'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias glgg='git log --graph --oneline --decorate'
alias gm='git merge --stat --log'

alias v="nvim"
#
# Add homebrew to PATH
if [[ $USER == "jecosta" ]]; then
	export PATH="$HOME/sgoinfre/homebrew/bin:$PATH"
	export PATH="$HOME/sgoinfre/jecosta/homebrew/bin:$PATH"
	export PATH="$HOME/sgoinfre/jecosta/homebrew/sbin:$PATH"
elif [[ $USER == "JECASA" ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Load Homebrew config script
source $HOME/.brewconfig.zsh

############################
### Load Starship Prompt ###
############################

eval "$(starship init zsh)"
