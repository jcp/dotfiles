#!/usr/bin/env bash

# Create dotfile
create_dotfile() {
  dotfile="${1}"
  new_file="$HOME/${1}"

  if [[ -L $new_file || -f $new_file ]]; then
    echo -e "\e[31m${new_file} exists. Do you want to overwrite this file (y/n)? \e[0m"
    read response

    if [ "${response,,}" = "y" ]; then
      rm $new_file
    else
      echo -e "\e[34mSkipping: ${new_file}\e[0m"
      return 1
    fi
  fi

  cp "${dotfile}" ${new_file}
}

# Execute `create_dotfile`
echo -e "\e[34mCreating dotfiles...\e[0m"
create_dotfile ".aliases"
create_dotfile ".editorconfig"
create_dotfile ".exports"
create_dotfile ".gitconfig"
create_dotfile ".gitignore_global"
create_dotfile ".p10k.zsh"
create_dotfile ".zshrc"

echo -e "\e[34mCleaning up unecessary dotfiles...\e[0m"
if [ -f "$HOME/.bash_profile" ]; then
  rm "$HOME/.bash_profile"
fi

if [ -f "$HOME/.bashrc" ]; then
  rm "$HOME/.bashrc"
fi

if [ -f "$HOME/.profile" ]; then
  rm "$HOME/.profile"
fi

# Load dconf settings
echo -e "\e[31mDo you want to load dconf settings (y/n)? \e[0m"
read response

if [ "${response,,}" = "y" ]; then
  dconf load / < .dconf
else
  echo -e "\e[34mSkipping dconf setup\e[0m"
fi

# Setup complete
echo -e "\e[32mInstallation complete. Remove dotfiles directory...\e[0m"
