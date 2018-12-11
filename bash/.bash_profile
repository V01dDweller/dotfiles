# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/lib:$PATH
export PATH
PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "

# History setttins
HISTTIMEFORMAT="%m/%d/%y %T "
HISTSIZE=10000000
HISTFILESIZE=10000000
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export TERM=xterm-256color
umask 027
