# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/lib:$PATH

export PATH
PS1="\[\e]0;\w\a\]\n[\@ \[\e[1;33m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]]\n\$ "
HISTTIMEFORMAT="%d/%m/%y %T "
export TERM=xterm-256color
umask 027
