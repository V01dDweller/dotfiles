## My Dotfile collection ##

This is just a small collection of the dotfiles I've accumulated and come to depend on over the years. I use them in a few environments from RHEL/CentOS, Cygwin and occationally WSL/Debian/Ubuntu. Most are self-explanatory. 

```
dotfiles
├── bash
│   ├── .bash_mintty_colors
│   ├── .bash_profile
│   ├── .bashrc_debian
│   ├── .bashrc_mintty
│   └── .bashrc_wsl
│ 
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
│ 
├── README.md
├── tmux
│   ├── .tmux.clipboard24.conf
│   ├── .tmux.clipboard.conf
│   ├── .tmux.conf
│   ├── .tmux-cssh
│   ├── .tmux-syncoff.conf
│   └── .tmux-syncon.conf
│ 
└── vim
    ├── .gvimrc_windows
    └── .vimrc
```

### Mintty Color Schemes - Windows ###

Combined with a collection of Windows shortcuts and a folder in the Windows PATH, one can quickly summon a Mintty session with a custom color scheme.

### Mintty Color Schemes - bash ###
Mintty will respond to escape sequences to change colors on the fly, source this file to get bash aliases, e.g. blue, green, red, etc.

### Bash ###
My bash prompt, aliases, etc..

### Tmux ###
A low-key color scheme (with due credit [Hermann Vocke](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf)) that is much easier on the eyes the the default CRT green. Also some shortcuts for color schemes, toggling pane sync and clipboard integration, 

* .tmux.clipboard24.conf
* .tmux.clipboard.conf
* .tmux.conf
* .tmux-syncoff.conf
* .tmux-syncon.conf

### Vim! ###
Trying (and failing) to keep vim customizations to a minimum, but there are a few I can last long without. My most frequently updated files by far.

* .vimrc
* .gvimrc_windows

