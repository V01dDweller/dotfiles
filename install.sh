#!/bin/bash
########################################################################
# WARNING! - Use at your own risk
#
# In theory, this script should
#
# 1. Create ~/dotfile_backup.YYYY-MM-DD_HHMM-SS
# 2. Copy anything that it will replace into that directory
# 3. Create a ~/.bash directory (for a git-aware prompt)
# 4. Clone git://github.com/jimeh/git-aware-prompt.git into it 
# 5. Replace or create all .bash, .vim and .tmux rc files
# 6. Run ~/dotfiles/vim/plugin_install.sh
#
########################################################################

# Check for git
gitStatus=`command -v git`

if [ -z "$gitStatus" ]
then
  echo "========================================================="
  echo "   Git is not installed or is not in your \$PATH"
  echo "   Please install git or fix your \$PATH and try again"
  echo "========================================================="
  echo ""
  exit 0
fi

# Setup for a bash git-aware prompt
if [ -d ~/.bash ]
then
  echo "Found ~/.bash directory, checking for ~/.bash/git-aware-prompt"
  if [ -d ~/.bash/git-aware-prompt ]
  then
    echo "Found ~/.bash/git-aware-prompt, updating..."
    cd ~/.bash/git-aware-prompt
    git pull
    cd
    echo ""
  else
    echo "Didn't find git-aware-prompt,"
    echo "Cloning git://github.com/jimeh/git-aware-prompt.git"
    cd ~/.bash
    git clone git://github.com/jimeh/git-aware-prompt.git
    echo ""
    cd
  fi
else
  echo "No ~/.bash found, creating one..."
  mkdir ~/.bash
  cd ~/.bash
  git clone git://github.com/jimeh/git-aware-prompt.git
  echo ""
  cd
fi

currentDate=`date +%Y-%m-%d_%H%M-%S`
systemInfo=`uname`

bashFiles=(".bashrc" ".bash_profile" ".LESS_TERMCAP")
minttyFiles=(".minttyrc" ".bash_mintty_colors" )
vimFiles=(".vimrc" ".gvimrc")
tmuxFiles=(".tmux.conf" ".tmux-syncoff.conf" ".tmux-syncon.conf" ".tmux.clipboard.conf")
backupFiles=("${bashFiles[@]}" "${minttyFiles[@]}" "${vimFiles[@]}" "${tmuxFiles[@]}")
backupDirectory="dotfile_backup.${currentDate}"

mkdir ~/$backupDirectory

echo "Backing up current dotfiles..."
for i in "${backupFiles[@]}"
do
  if [ -f ~/$i ]
  then
    cp -pv ~/$i ~/$backupDirectory
  fi
done
echo ""

# Setting up bash
echo "Setting up bash"
echo "Creating ~/.bash_profile"
cp -v ~/dotfiles/bash/.bash_profile_git ~/.bash_profile
echo ""
echo "Creating ~/.bashrc"
cp -v ~/dotfiles/bash/.bashrc ~/.bashrc
echo ""
echo "Creating ~/.LESS_TERMCAP"
cp -v ~/dotfiles/bash/.LESS_TERMCAP ~/
echo ""

# Setup tmux (**Note: Does not work with tmux >= 3 or < 2.4)
if command -v tmux > /dev/null
then
  echo "Setting up tmux"
  tmuxMajorVersion=`tmux -V|cut -d' ' -f 2|cut -d'.' -f 1`
  echo "tmux major version: " $tmuxMajorVersion

  if [ $tmuxMajorVersion -gt 2 ]
  then
    echo "Tmux 3.x not supported yet"
  else
    for i in ${tmuxFiles}
    do 
      cp -v ~/dotfiles/tmux/$i ~/$i
    done
    echo "** Reminder: Uncomment the section of ~/.tmux.clipboard.conf for your OS"
  fi
  echo ""
  # Instal tmux plugins
  ~/dotfiles/tmux/plugin_install.sh
fi

# Tmux theme for Linux or WSL
if [ "$OSTYPE" == "linux-gnu" ]
then
  # Linux
  if grep -q Microsoft /proc/version
  then
    # WSL detected - yellow
    cp -v ~/dotfiles/tmux/themes/yellow/.tmux* ~/
  else
    # This really is Linux - original
    cp -v ~/dotfiles/tmux/themes/original/.tmux* ~/
  fi
fi

# Setup Vim
if command -v vim > /dev/null
then
  echo "Setting up Vim"
  for i in ${vimFiles[@]}
  do
    cp -v ~/dotfiles/vim/$i ~/$i
  done
  echo ""
  # Install Vim plug-ins
  ~/dotfiles/vim/plugin_install.sh
fi
