# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt autocd 
setopt extendedglob 
setopt notify 
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dao77777/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zinit manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# End

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# End

#################################Custom#########################################

# alias
alias l='lsd -F'
alias ll='lsd -Flh'
alias la='lsd -Fa'
alias lla='lsd -Flha'
alias lt='lsd --tree'

alias df='df --si -x tmpfs -x efivarfs | awk "!/^dev/"'
alias free='free --si -h'

alias gi='git init'
alias ga='git add .'
alias gc='git commit -a -m'
alias gs='git status'
alias gb='git branch -avv'
alias gl='git log --oneline --graph --all --decorate'
alias gps='git push'
alias gpl='git pull'

alias rm='rm -I'

alias v='nvim'

alias icat='kitten icat'

alias q='ollama run llama3.2'

# starship init
eval "$(starship init zsh)"

# yazi init
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf init
eval "$(fzf --zsh)"

# zoxide init
eval "$(zoxide init zsh)"

# nvm init
source /usr/share/nvm/init-nvm.sh

# welcome
pfetch
