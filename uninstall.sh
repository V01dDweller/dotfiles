#!/bin/bash
########################################################################
# WARNING! - Use at your own risk
# In theory, this script should
# 1. Ask if you're sure
# 2. Delete all the files install.sh created
# 3. Restore the originals from ~/dotfile.backups
########################################################################

# Bash scripting tweaks credit:
#   https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail
set -Eeuo pipefail

# Colors
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
purple=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
orange=$(tput setaf 208)
reset=$(tput sgr0)

bashFiles=(".bashrc" ".bash_profile" ".LESS_TERMCAP" ".bash_prompt.sh")
minttyFiles=(".minttyrc" ".bash_mintty_colors" )
vimFiles=(".vimrc" ".gvimrc")
tmuxFiles=(".tmux.conf" ".tmux-syncoff.conf" ".tmux-syncon.conf" ".tmux.clipboard.conf")
deleteFiles=("${bashFiles[@]}" "${minttyFiles[@]}" "${vimFiles[@]}" "${tmuxFiles[@]}")

last_backup=$(find ~ -type d -iname "dotfile_backup*" | head -n 1)
if [ -z "$last_backup" ]
then
  echo "$green"No backups found"$reset"
else
  last_backup=$(basename "$last_backup")
  backup_date=$(echo "$last_backup" | cut -d'.' -f 2|cut -d'_' -f 1)
  echo "Restore backups from $backup_date?"
fi
exit 0

until [[ $deleteAll =~ ^[YyNn]$ ]]
do
  echo "$red"
  read -rn 1 -p "Are you sure you want to delete all dotfiles? (y/n): " deleteAll
  echo "$reset"
  echo ""
done

# Delete dotfiles and restore backups
if [[ $deleteAll =~ ^[Nn]$ ]]
then
  echo "Quitting"
  echo ""
  exit
else
  echo "Deleting current dotfiles..."
  for i in "${deleteFiles[@]}"
  do
    if [ -f ~/"$i" ]
    then
      rm -vf ~/"$i"
    fi
  done
  echo ""
fi

# Restore backed up dotfiles
echo "Restoring backups"
for i in $(ls -a ~/dotfiles.backup/| egrep -v "^.$|^..$")
do
  cp -v ~/dotfiles.backup/"$i" ~/
done
echo ""
