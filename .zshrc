# ~/.zshrc: Zsh configuration file

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Paths
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$PATH:Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/macbook/.lmstudio/bin"

# Plugins
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion system
autoload -Uz compinit
compinit
autoload -U colors && colors
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Prompt configuration
# PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# Common aliases
# alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl="git log --graph --stat --decorate --all"
alias gd='git diff'

# Aliases
command -v eza &>/dev/null && alias ls="eza -l --icons=always --group-directories-first"
alias tree="tree -I '.git'"

# Vim mode
bindkey -v
bindkey '^ ' autosuggest-accept  # Optional
bindkey '^R' history-incremental-search-backward

# Load local customizations if they exist
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# Faster paste speed (removes the slight delay when pasting commands)
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS+=(bracketed-paste)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# DOTFILES=$HOME/dotfiles

# AeroSpace
# [ ! -L "$HOME/.config/aerospace/aerospace.toml" ] && ln -sfn $DOTFILES/aerospace.toml $HOME/.config/aerospace/aerospace.toml

# # Neovim
# [ ! -L "$HOME/.config/nvim" ] && ln -sfn $DOTFILES/nvim $HOME/.config/nvim

# # VIM
# [ ! -L "$HOME/.vimrc" ] && ln -sfn $DOTFILES/vimrc $HOME/.vimrc


# # Ghostty
# [ ! -L "$HOME/Library/Application Support/com.mitchellh.ghostty/config" ] && ln -sfn $DOTFILES/ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# # Tmux
# [ ! -L "$HOME/.tmux.conf" ] && ln -sfn $DOTFILES/tmux.conf $HOME/.tmux.conf

# # Zsh itself
# [ ! -L "$HOME/.zshrc" ] && ln -sfn $DOTFILES/zshrc $HOME/.zshrc

# Export all proxies to hiddify default port (:12334)
# export http_proxy=socks5://127.0.0.1:12334
# export https_proxy=socks5://127.0.0.1:12334
# export all_proxy=socks5://127.0.0.1:123334