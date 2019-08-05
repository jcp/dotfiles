# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH & oh-my-zsh settings.
ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"
HYPHEN_INSENSITIVE="true"

plugins=(
    git
    colorize
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Execute oh-my-zsh.
source $ZSH/oh-my-zsh.sh

# Powerlevel 10k settings.
if [ -f ~/.p10k.zsh ]; then
    . ~/.p10k.zsh
fi

# Alias and export dotfiles.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.exports ]; then
    . ~/.exports
fi
