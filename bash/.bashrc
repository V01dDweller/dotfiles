# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# bash history time stamps
export HISTTIMEFORMAT="%d/%m/%y %T "

# Set EDITOR
export EDITOR="/usr/bin/vim"

# Add color to common commands
if [ "$OSTYPE" == "darwin"* ]
then
  alias ls="ls -G"
else
  alias ls="ls --color=auto"
fi

# Misc aliases
alias cleanbash="bash --noprofile --norc"
alias grep="grep --color=auto --exclude=*.swp --exclude-dir=.svn"
alias egrep="egrep --color=auto --exclude=*.swp --exclude-dir=.svn"
alias tree="tree -C  -I '.git|.svn|.pki'"
alias pu="source ~/.bash_profile"
alias p="source ~/.bash_profile"
alias tasks="task"
alias weather="curl -s wttr.in/Orlando?0?u"

# img2sixel
if  command -v img2sixel > /dev/null
then
  alias img2sixel="img2sixel -w 1024"
fi

# Teminal color
export TERM=xterm-256color

# Fuzzy finder with bat preview
if command -v fzf > /dev/null
then
  if command -v bat > /dev/null
  then
    alias fzf="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
  fi
fi

# Mintty color schemes
if [ -f "${HOME}/.bash_mintty_colors" ]
then
  source "${HOME}/.bash_mintty_colors"
fi

# Source company/project-specific aliases
if [ -f "${HOME}/.bash_company" ]
then
  source "${HOME}/.bash_company"
fi

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Use Vim as the man pager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma nospell' -\""

# Terminal title
function title() {
  export PS1="\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
  echo -ne "\e]0;$1\a"
}

# Set colors if tput is available
if hash tput 2> /dev/null
then
  red=$(tput setaf 1);export red
  redbg=$(tput setab 197);export redbg
  green=$(tput setaf 2);export green
  yellow=$(tput setaf 3);export yellow
  blue=$(tput setaf 4);export blue
  niceblue=$(tput setaf 27);export niceblue
  purple=$(tput setaf 5);export purple
  cyan=$(tput setaf 6);export cyan
  white=$(tput setaf 7);export white
  orange=$(tput setaf 208);export orange
  bold=$(tput bold);export bold
  reset=$(tput sgr0);export reset
fi

## Wise ponies or cows
if command -v fortune > /dev/null
then
  if command -v ponysay > /dev/null
  then
    fortune | ponysay -b round
  elif command -v cowsay > /dev/null
   then
     COW_DIR=$(find /opt/homebrew/Cellar -type d -name cows)
     export COW_DIR
     fortune | cowsay -f "$(ls $COW_DIR | shuf -n1)"
   else
     fortune
     echo ""
  fi
fi

# Pygments alias
alias pygmentize="pygmentize -f terminal"

# Markdown reading with pandc + lynx
md() { pandoc "$1" | lynx -stdin; }

# Change Git Bash Window Title
GITVERSION=$(git --version)
if [[ $GITVERSION == *"windows"* ]]; then
  echo -ne "\e]0;Git Bash\a"
fi

# Window Title and SSH Socket for Cygwin
GITVERSION=$(uname -a)
if [[ $GITVERSION == *"CYGWIN"* ]]; then
  echo -ne "\e]0;Cygwin\a"
  if [[ -f $HOME/.ssh/keeagent.sock ]]
  then
    export SSH_AUTH_SOCK=$HOME/.ssh/keeagent.sock
  fi
fi

# Set SSH_AUTH_SOCK for MSYS2
#
# I use Keepass with the Keeagent plugin to load ssh-keys automatically.
# When configured correctly, Keeagent will create a 'keeagent.sock'
# socket file for MSYS2 in $HOME/.ssh/keegent.sock. For Git Bash, I
# prefer to use Windows OpenSSL. Thus, if SSH_AUTH_SOCK is set with Git
# Bash configured this way then it breaks ssh-agent in Git Bash. Thus
# this determines if the session is in MSYS2 and if all the conditions
# are met to set SSH_AUTH_SOCK, i.e.:
#
# 1. The MSYSTEM var is set, e.g., MSYSTEM=MINGW64
# 2. There is no EXEPATH var with "Git" in the value (which means Git Bash)
# 3. The # $HOME/.ssh/keeagen.sock file exists

if [ ! -z ${MSYSTEM+x} ] && [[ ! $EXEPATH == *"Git"* ]] && [[ -S $HOME/.ssh/keeagent.sock ]]
then
  export SSH_AUTH_SOCK="$HOME/.ssh/keeagent.sock"
fi
