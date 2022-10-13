#!/bin/bash

copy_file() {
  dotfile="${HOME}/.config/dotfiles/${1}"
  newfile="$(pwd)/${1}"

  if [[ -f "${newfile}" ]]; then
    printf "File \"${newfile}\" exists. Do you want to overwrite this file (y/n)? "
    read response

    if [[ "${response,,}" = "y" ]]; then
      rm $newfile
    else
      return 1
    fi
  fi

  cp $dotfile $newfile
}

printf "\n\e[34mCopying development dotfiles...\e[0m\n"
copy_file ".editorconfig"
copy_file ".npmrc"
copy_file ".prettierrc"

printf "\n\e[32mInstallation complete \U1F973\n\e[0m"
