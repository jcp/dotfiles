#!/usr/bin/env bash

# Create symlink
create_symlink() {
  dotfile="$(pwd)/${1}"
  symlink="$HOME/${1}"

  if [[ -L $symlink || -f $symlink ]]; then
    printf "File \"${symlink}\" exists. Do you want to overwrite this file (y/n)? "
    read response

    if [[ "${response,,}" = "y" ]]; then
      rm $symlink
    else
      return 1
    fi
  fi

  ln -s $dotfile $symlink
}

# Execute `create_symlink`
printf "\n\e[34mCreating dotfile symlinks...\e[0m\n"
create_symlink ".aliases"
create_symlink ".editorconfig"
create_symlink ".exports"
create_symlink ".gitconfig"
create_symlink ".gitignore_global"
create_symlink ".p10k.zsh"
create_symlink ".zshrc"

printf "\n\e[34mRemoving unecessary dotfiles...\e[0m\n\n"
rm -f "$HOME/.bash_profile"
rm -f "$HOME/.bashrc"
rm -f "$HOME/.profile"

# Load dconf settings
printf "Do you want to load dconf settings (y/n)? "
read response

if [[ "${response,,}" = "y" ]]; then
  dconf load / < .dconf
fi

# Load .zshrc
printf "Do you want to load .zshrc settings (y/n)? "
read response

if [[ "${response,,}" = "y" ]]; then
  if [[ -f "/usr/bin/zsh" ]]; then
    /usr/bin/zsh $HOME/.zshrc
  else
    printf "\e[31m/usr/bin/zsh not found. Skipping...\e[0m\n"
  fi
fi

# Installation complete
printf "\n\e[32mInstallation complete \U1F973\n\e[0m"
