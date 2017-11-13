## My Dotfile collection ##

This is just a small collection of the dotfiles I've accumulated and come to depend on over the years. I use them in a few environments from RHEL/CentOS, Cygwin and occationally WSL/Debian/Ubuntu. Most are self-explanatory. 

```
dotfiles/                      
├── bash                       
│   ├── .bash_mintty_colors    # source for bash Mintty color scheme escapes - red, blue, grey, purple, orange, white, etc.
│   ├── .bash_profile          
│   ├── .bashrc_debian         # Debian/Ubuntu
│   ├── .bashrc_el7            # CenOS7/RHEL7
│   ├── .bashrc_mintty         # Cygwin/mintty
│   ├── .bashrc_wsl            # Windows Subsystem for Linux
│   └── .LESS_TERMCAP          # Enables colors in the less pager and, by extension, man pages, needs extra lines in .bashrc, TBA
├── mintty                     # Mintty color schemees for use with Windows shortcuts
│   ├── .minttyrc              
│   ├── .minttyrcb             
│   ├── .minttyrc-dark         
│   ├── .minttyrcg             
│   ├── .minttyrcgd            
│   ├── .minttyrcgl            # Glass
│   ├── .minttyrcglo           
│   ├── .minttyrcgr            
│   ├── .minttyrco             
│   ├── .minttyrcp             
│   ├── .minttyrcr             
│   └── .minttyrcw             
├── README.md                  # You are here
├── tmux                       
│   ├── .tmux.clipboard24.conf # Windows clipbaord integration, tmux >= 2.4
│   ├── .tmux.clipboard.conf   # Windows clipbaord integration, tmux <= 2.3
│   ├── .tmux.conf             # requires .tmux-syncoff.conf and .tmux-syncon.conf
│   ├── .tmux-cssh             # Changes default ssh command to lssh wrapper for tmux-cssh
│   ├── .tmux-syncoff.conf     # Sourced by tmux for color changes when enabling synchronizing-panes via C-b e
│   └── .tmux-syncon.conf      # Sourced by tmux for color changes when disabling synchronize-panes via C-b E
├── vim                        
│   ├── .gvimrc_windows        # Happy Vimming in gVim 8.0 on Windows
│   └── .vimrc                 # Happy Vimming in vim 7-8 on Linux, Solaris and Cygwin
└── .w3m                       
    ├── config                 # w3m browser config
    └── .gitignore

```

### Mintty Color Schemes - Windows ###

Combined with a collection of Windows shortcuts and a folder in the Windows PATH, one can quickly summon a Mintty session with a custom color scheme.

### Mintty Color Schemes - bash ###
Mintty and WSLtty will respond to escape sequences to change colors on the fly, source `.bash_mintty_colors` to get bash aliases, e.g. blue, green, red, etc..

### Bash ###
My bash prompt, aliases, etc. for different environments.

### Tmux ###
A low-key color scheme (with due credit [Hermann Vocke](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf)) that is much easier on the eyes the the default CRT green. Also some shortcuts for color schemes, toggling pane sync and Cygwin/Windows clipboard integration.

### Vim! ###
Trying (and failing) to keep vim customizations to a minimum, but there are a few I can last long without. My most frequently updated files by far.
