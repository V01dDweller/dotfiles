## My Dotfile collection ##

This is a small collection of the dotfiles I've accumulated over the years. I use them in a few environments from RHEL/CentOS, Cygwin and WSL/Debian/Ubuntu. Most are self-explanatory. 

```
dotfiles/                      
├── .w3m                        # The w3m web browser
│   ├── .gitignore
│   └── config
├── bash
│   ├── .LESS_TERMCAP           # less with colors
│   ├── .bash_mintty_colors     # Cygwin Mintty
│   ├── .bash_profile       
│   ├── .bash_profile_git       # Git-aware bash prompt
│   ├── .bashrc_debian            (requires jimeh / git-aware-prompt)
│   ├── .bashrc_el7               (See starred repos)
│   ├── .bashrc_mintty
│   └── .bashrc_wsl    
├── git
│   └── .gitconfig              # Base git config, starring vimdiff
├── mintty
│   ├── .bash_mintty_colors     # Mintty color schemes
│   ├── .minttyrc
│   ├── .minttyrc-dark
│   ├── .minttyrcb
│   ├── .minttyrcg
│   ├── .minttyrcgd
│   ├── .minttyrcgl             # Glass
│   ├── .minttyrcglo
│   ├── .minttyrcgr
│   ├── .minttyrco
│   ├── .minttyrcp
│   ├── .minttyrcr
│   └── .minttyrcw
├── tmux
│   ├── .tmux-cssh              # Changes default ssh command to lssh wrapper for tmux-cssh
│   ├── .tmux-syncoff.conf      # Sourced by tmux for color changes when enabling synchronizing-panes via C-b e
│   ├── .tmux-syncon.conf       # Sourced by tmux for color changes when disabling synchronize-panes via C-b E
│   ├── .tmux.clipboard.conf    # Windows clipbaord integration, tmux <= 2.3
│   ├── .tmux.clipboard24.conf  # Windows clipbaord integration, tmux >= 2.4
│   └── .tmux.conf              # requires .tmux-syncoff.conf and .tmux-syncon.conf
├── vim
│   ├── .gvimrc                 # Happy Vimming in gVim 7-8 (requires .vimrc)
│   ├── .gvimrc.old
│   └── .vimrc                  # Happy Vimming in vim 7-8 on Linux, Solaris and Cygwin
├── .README.md.swp
├── README.md                   # You are here
├── install.sh                  # Will attempt to install everything relevant, very dangerous, not recommended yet
└── uninstall.sh                # Will attempt to undo all the damage caused by install.sh


```

### Mintty Color Schemes - Windows ###

Combined with a collection of Windows shortcuts and a folder in the Windows PATH, one can quickly summon a Mintty session with a custom color scheme.

### Mintty Color Schemes - bash ###
Mintty and WSLtty will respond to escape sequences to change colors on the fly, source `.bash_mintty_colors` to get bash aliases, e.g. blue, green, red, etc..

### Bash ###
My bash prompt, aliases, etc. for different environments.

### Tmux ###
A low-key color scheme (with due credit to [Hermann Vocke](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf)) that is much easier on the eyes than the default CRT green. Also some shortcuts for color schemes, toggling pane sync and Cygwin/Windows clipboard integration.

### Vim! ###
Trying (and failing) to keep vim customizations to a minimum, but there are a few I can last long without. My most frequently updated files so far.
