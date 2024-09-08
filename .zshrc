eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

# Dots managing
alias dot="git --git-dir=$HOME/.dots/ --work-tree=$HOME"

# Save zsh history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory

# Lsd aliases
alias ls="lsd -A"
alias tree="lsd -A --tree"

# Use zsh-autosuggestions
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export PATH="$PATH:/home/inqognitoo/.local/bin"
export PATH="$PATH:/home/inqognitoo/.cargo/bin"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/inqognitoo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

