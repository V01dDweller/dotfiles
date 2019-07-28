# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/lib:$PATH
export PATH

# History setttins
HISTTIMEFORMAT="%m/%d/%y %T "
HISTSIZE=10000000
HISTFILESIZE=10000000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export TERM=xterm-256color
umask 027

#Prompt
case $OSTYPE in
  aix)
    # AIX
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
  bsd|freebsd)
    # FreeBSD
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
  cygwin)
    # Cygwin
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
  darwin)
    # MacOS
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
  linux-gnu)
    if grep -q Microsoft /proc/version
    then
      # WSL detected
      PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;33m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    else
      # Linux
      PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;36m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    fi
    ;;
  msys)
    # MinGW/GitBash
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
  solaris)
    # Solaris
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;31m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
  *)
    # Everything else
    PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;35m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
    ;;
esac
