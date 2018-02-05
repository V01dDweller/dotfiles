#!/bin/bash
########################################################################
# WARNING! - Use at your own risk
########################################################################

todaysDate=`date +%Y-%m-%d`
systemInfo=`uname`

bashFiles=(".bash_profile" ".LESS_TERMCAP")
minttyFiles=(".minttyrc" ".bash_mintty_colors" )
vimFiles=(".vimrc" ".gvimrc")
tmuxFiles=(".tmux.conf" ".tmux-syncoff.conf" ".tmux-syncon.conf" ".tmux.clipboard.conf")
backupFiles=(".bashrc" "${bashFiles[@]}" "${minttyFiles[@]}" "${vimFiles[@]}" "${tmuxFiles[@]}")


# Check for previous backups dir then create one
if [ -d ~/dotfiles.backup ]
then
    until [[ $overwriteBackup =~ ^[YyNn]$ ]]
    do
        read -n 1 -p "Previous backup found, overwrite? (y/n): " overwriteBackup
        echo ""
    done
else
    mkdir ~/dotfiles.backup
fi

# Backup (or overwrite) dotfiles, or quit, per the above response
if [[ $overwriteBackup =~ ^[Nn]$ ]]
then
    echo "Quitting"
    echo ""
    exit
else
    echo "Backing up current dotfiles..."
    for i in "${backupFiles[@]}"
    do
        if [ -f ~/$i ]
        then
            cp -pv ~/$i ~/dotfiles.backup/
        fi
    done
    echo ""
fi

# Check environment (will add Linux later)
if echo $systemInfo | grep -q CYGWIN
then
    environment="Cygwin"
fi

# Setting up bash
echo "Setting up bash"
for i in "${bashFiles[@]}"
do
    cp -v bash/$i ~/
done
echo ""

# Set up Bash for Mintty
echo "Setting up Cygwin bashrc"
if environment="Cygwin"
then
    cp -v mintty/.bash_mintty_colors ~/
    cp -v bash/.bashrc_mintty ~/.bashrc
    cp -v mintty/.minttyrc ~/
fi
echo ""

# Setup tmux
if command -v tmux > /dev/null
then
    echo "Setting up tmux"
    tmuxVersion=`tmux -V|cut -d'.' -f 2`
    if [ $tmuxVersion -gt 4 ]
    then
        cp -v tmux/.tmux.clipboard24.conf ~/.tmux.clipboard.conf
    else
        cp -v tmux/.tmux.clipboard.conf ~/.tmux.clipboard.conf
    fi
    for i in .tmux.conf .tmux-syncon.conf .tmux-syncoff.conf
    do
        cp -v tmux/$i ~/$i
    done
    echo ""
fi

# Setup Vim
if command -v vim > /dev/null
then
    echo "Setting up Vim"
    for i in ${vimFiles[@]}
    do
        cp -v vim/$i ~/$i
    done
    echo ""
fi
