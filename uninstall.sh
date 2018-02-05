#!/usr/bin/bash
########################################################################
# WARNING! - Use at your own risk
########################################################################

bashFiles=(".bashrc" ".bash_profile" ".bash_mintty_colors")
minttyFiles=(".minttyrc")
vimFiles=(".vimrc" ".gvimrc")
tmuxFiles=(".tmux.conf" ".tmux-syncoff.conf" ".tmux-syncon.conf" ".tmux.clipboard.conf")
deleteFiles=("${bashFiles[@]}" "${minttyFiles[@]}" "${vimFiles[@]}" "${tmuxFiles[@]}")

until [[ $deleteAll =~ ^[YyNn]$ ]]
do
    read -n 1 -p "Are you sure you want to delete all dotfiles? (y/n): " deleteAll
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
        if [ -f ~/$i ]
        then
            rm -vf ~/$i
        fi
    done
    echo ""
fi

for i in `ls -a ~/dotfiles.backup/| egrep -v "^.$|^..$"`
do
    cp -v ~/dotfiles.backup/$i ~/
done
