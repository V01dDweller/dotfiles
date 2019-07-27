## My Dotfile collection ##

This is a small collection of the dotfiles I've accumulated over the
years. I use them in a few environments from RHEL/CentOS, Cygwin,
WSL/Debian/Ubuntu and MacOS. Most are self-explanatory.

```console
dotfiles/
├── .w3m                        # The w3m web browser
│   ├── .gitignore
│   └── config
│
├── bash
│   ├── .LESS_TERMCAP           # less with colors
│   ├── .bash_mintty_colors     # Cygwin Mintty
│   ├── .bash_profile
│   ├── .bash_profile_git       # Git-aware bash prompt
│   ├── .bashrc_debian            (requires jimeh / git-aware-prompt)
│   ├── .bashrc_el7               (See starred repos)
│   ├── .bashrc_mintty
│   └── .bashrc_wsl
│
├── git
│   └── .gitconfig              # Base git config, starring vimdiff
│
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
│
├── tmux
│   ├── plugin_install.sh       # Install Tmux Plugin Manager (tpm) and tmc for clusterssh
│   ├── .tmux-cssh              ## This is missing!## - optional, used to change tmc ssh command
│   ├── .tmux.clipboard.conf    # Cliboard integration for Cygwin, Linux and MacOS
│   ├── .tmux.conf              # requires .tmux-syncoff.conf and .tmux-syncon.conf 
│   ├── .tmux-syncoff.conf      # Sourced by tmux for color changes when enabling synchronizing-panes via C-b e 
│   ├── .tmux-syncon.conf       # Sourced by tmux for color changes when disabling synchronize-panes via C-b E  
│   └── themes
│       ├── green
│       │   ├── .tmux.conf
│       │   └── .tmux-syncoff.conf
│       ├── original
│       │   ├── .tmux.conf
│       │   └── .tmux-syncoff.conf
│       └── yellow
│           ├── .tmux.conf
│           └── .tmux-syncoff.conf
│
├── vim
│   ├── plugin_install.sh       # Installs pathogen and all my plugins from Github
│   ├── .gvimrc                 # Happy Vimming in gVim 7-8 (requires .vimrc)
│   ├── .gvimrc.old
│   └── .vimrc                  # Happy Vimming in vim 7-8 on Linux, Solaris and Cygwin
│
├── README.md                   # You are here
├── install.sh                  # Copies bash, tmux, mintty and vim dotfiles then
│                                 runs tmux/plugin_install.sh and vim/plugin_install.sh
└── uninstall.sh                # *WARNING** - Not yet updated to match the install.sh


```

### Mintty Color Schemes - Windows ###

Combined with a collection of Windows shortcuts and a folder in the
Windows PATH, one can quickly summon a Mintty session with a custom
color scheme.

### Mintty Color Schemes - bash ###
Mintty and WSLtty will respond to escape sequences to change colors on
the fly, source `.bash_mintty_colors` to get bash aliases, e.g. blue,
green, red, etc..

### Bash ###
My git-aware bash prompt, aliases, etc. for different environments.

### Tmux ###
A low-key color scheme (with due credit to [Hermann
Vocke](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf))
that is much easier on the eyes than the default CRT green. Also some
shortcuts for color schemes, toggling pane sync and Cygwin/Windows
clipboard integration.

### Vim ###
Creates my .vimrc and .gvimrc files, installs pathogen and a list of plugins.

### Installation ###
```console
git clone https://github.com/V01dDweller/dotfiles.git
./dotfiles/install.sh
```
