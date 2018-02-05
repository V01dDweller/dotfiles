#!/usr/bin/bash
########################################################################
# WARNING! - Use at your own risk
########################################################################

todaysDate=`date +%Y-%m-%d`
systemInfo=`uname`

bashFiles=(".bashrc" ".bash_profile" ".LESS_TERMCAP")
minttyFiles=(".minttyrc" ".bash_mintty_colors" )
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
