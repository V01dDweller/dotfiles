## My Dotfile collection ##

This is just a small collection of the dotfiles I've accumulated and come to depend on over the years. I use them in a few environments from RHEL/CentOS, Cygwin and occationally WSL/Debian/Ubuntu. Most are self-explanatory. 

```
dotfiles
├── bash
│   ├── .bash_mintty_colors    # source this for Mintty color aliases - red, blue, grey, purple, orange, white, etc.
│   ├── .bash_profile       
│   ├── .bashrc_debian
│   ├── .bashrc_el7
│   ├── .bashrc_mintty         
│   ├── .bashrc_wsl
│   └── .LESS_TERMCAP          # Enables colors in the less pager and, by extension, man pages
├── mintty
│   ├── .minttyrc
│   ├── .minttyrcb
│   ├── .minttyrc-dark
│   ├── .minttyrcg
│   ├── .minttyrcgd
│   ├── .minttyrcgl
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
│   ├── .tmux-cssh             # Changes default ssh command to lssh wrapper
│   ├── .tmux-syncoff.conf     # Sourced when enabling synchronizing-panes via C-b e
│   └── .tmux-syncon.conf      # Source  when disabling synchronize-panes via C-b E
└── vim
    ├── .gvimrc_windows        # Happy Vimming in gVim 8.0 on Windows
    └── .vimrc                 # Happy Vimming in vim 7-8 on Linux, Solaris and Cygwin

```

### Mintty Color Schemes - Windows ###

```
.bash_mintty_colors
```

Combined with a collection of Windows shortcuts and a folder in the Windows PATH, one can quickly summon a Mintty session with a custom color scheme.

### Mintty Color Schemes - bash ###
Mintty will respond to escape sequences to change colors on the fly, source this file to get bash aliases, e.g. blue, green, red, etc..

### Bash ###
My bash prompt, aliases, etc. for different environments.

### Tmux ###
A low-key color scheme (with due credit [Hermann Vocke](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf)) that is much easier on the eyes the the default CRT green. Also some shortcuts for color schemes, toggling pane sync and Cygwin/Windows clipboard integration.

### Vim! ###
Trying (and failing) to keep vim customizations to a minimum, but there are a few I can last long without. My most frequently updated files by far.
