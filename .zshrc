# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable case insensitivity
HYPHEN_INSENSITIVE="true"

# Enable auto correction
ENABLE_CORRECTION="true"

# Enable completion dots
COMPLETION_WAITING_DOTS="true"

# Enable automatic updates
zstyle ':omz:update' mode auto

# Set update frequency
zstyle ':omz:update' frequency 7

# Enable custom plugins in $ZSH_CUSTOM/plugins/
plugins=(
    git
    colorize
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load Oh My Zsh
. $ZSH/oh-my-zsh.sh

# Powerlevel 10k settings
if [ -f ~/.p10k.zsh ]; then
    . ~/.p10k.zsh
fi

# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Exports
if [ -f ~/.exports ]; then
    . ~/.exports
fi