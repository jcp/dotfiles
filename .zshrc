# Oh My Zsh
# ---------
export ZSH="${HOME}/.oh-my-zsh"

# Set Zsh theme
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
source $ZSH/oh-my-zsh.sh


# Dotfiles
# --------
function load_dotfile() {
    if [[ -f "$(pwd)/${1}" ]]; then
        source "$(pwd)/${1}"
    fi
}

# Load dotfiles
load_dotfile ".p10k.zsh"
load_dotfile ".aliases"
load_dotfile ".exports"
