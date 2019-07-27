# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# bash history time stamps
export HISTTIMEFORMAT="%d/%m/%y %T "

# Set EDITOR
export EDITOR="/usr/bin/vim"

# Add color to common commands
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto --exclude=*.swp --exclude-dir=.svn"
alias egrep="egrep --color=auto --exclude=*.swp --exclude-dir=.svn"
alias tree="tree -C --dirsfirst -I '.git|.svn|.pki'"

# Teminal color
export TERM=xterm-256color

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

# Terminal title
function title() {
  export PS1="\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
  echo -ne "\e]0;$1\a"
}

# Set colors if tput is available
if hash tput 2> /dev/null
then
  red=`tput setaf 1`
  redbg=`tput setab 197`
  green=`tput setaf 2`
  yellow=`tput setaf 3`
  blue=`tput setaf 4`
  niceblue=`tput setaf 27`
  purple=`tput setaf 5`
  cyan=`tput setaf 6`
  white=`tput setaf 7`
  orange=`tput setaf 208`
  bold=`tput bold`
  reset=`tput sgr0`
fi

## Wise ponies or cows
if command -v fortune > /dev/null
then
  if command -v ponysay > /dev/null
  then
    export pony_list="-f ahuizotl\
                      -f angel\
                      -f basil\
                      -f bear\
                      -f cerberus\
                      -f chrysalis\
                      -f cow\
                      -f discord\
                      -f dodo\
                      -f fido\
                      -f gildastand\
                      -f greta\
                      -f homer\
                      -f kevin\
                      -f ironwillwalk\
                      -f manticore\
                      -f mantishy\
                      -f orangebird\
                      -f orangefrog\
                      -f owl\
                      -f owlowiscious\
                      -f parasprite\
                      -f parrot\
                      -f raccoon\
                      -f rover\
                      -f stevemagnet\
                      -f tank"
    if [ -d ~/custom_ponies ]
    then
      for i in `ls ~/custom_ponies/*pony`
      do
        export pony_list="-f $i $pony_list"
      done
    fi
    fortune | ponysay -b round $pony_list
  elif command -v cowsay > /dev/null
   then
     fortune | cowsay -f $(ls /usr/local/share/cows/ | shuf -n1)
   else
     fortune
     echo ""
  fi
fi