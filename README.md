My Dotfiles and Plug-Ins
========================
This project installs a collection of dotfiles and plug-ins that I've come to
depend on over the years. It is set up to be installed in one step. The goal is
to get my often git-centric workflow going quickly on a new system whether that
system is running MacOS, Cygwin, WSL 2 or mainstream Linux (EL or Ubuntu) 
distributions.

![WSLtty 3-way split with Vim and bash](/screenshot_01.png?raw=true
"Vim/bash/tmux nerdvada")

Once installed, the bash prompt and Vim (Vim 8.x recommended) become "git
aware" and visually synchronized with tmux (Tmux 3.x recommended), thanks to
the lightweight [vim-airline](https://github.com/vim-airline/vim-airline),
[tmuxline](https://github.com/edkolev/tmuxline.vim) and
[promptline](https://github.com/edkolev/promptline.vim) vim plug-in trio. Git
icons and other decorations are added via
[Powerline](https://github.com/powerline/fonts) fonts. Powerline fonts are a separate install but an update that installs them on supported systems is coming.

The install scripts will first back up any existing bash, MinTTY (Cygwin only),
Vim or Tmux dotfiles then replace them with the ones from this repo.

From there, [Vim](https://github.com/V01dDweller/dotfiles/tree/master/vim) and
[Tmux](https://github.com/V01dDweller/dotfiles/tree/master/tmux) plug-in
managers ([pathogen](https://github.com/tpope/vim-pathogen) and
[tpm](https://github.com/tmux-plugins/tpm) respectively) are installed along
with my favorite vim plug-ins and color schemes along with  one Tmux plug-in.
See the [Vim](https://github.com/V01dDweller/dotfiles/tree/master/vim) and
[Tmux](https://github.com/V01dDweller/dotfiles/tree/master/tmux) READMEs for
more.

Everything is installed directly from github, so it is a good idea to re-run
the install scripts or the Vim or tmux plugin_install scripts to pull
the latest versions of everything.

The uninstall.sh script is a work-in-progress that was never finished but
backing this out should be very easy: Simply restore the contents of the most
recent `dotfile_backup` directory and delete the `~/.vim/bundle` and
`~/.tmux/plugins` directory contents.

I test theses fairly often on MacOS, WSL/WSL 2, Cygwin, RHEL/CentoS 7 & 8 and
Ubuntu. Results may vary, *use at your own risk.*

Quick Install
--------------
```console
git clone https://github.com/V01dDweller/dotfiles.git
./dotfiles/install.sh
```


Primary Apps
------------
Dotfiles for the apps below are installed (and backed up) by the install
scripts. 

* vim
* bash
* less
* tmux
* mintty

Secondary Apps
--------------
These are "secondary" only because their dotfiles are not replaced by the
install scripts. The dotfiles for these may be copied manually.

* Git
* w3m
* iTerm
* htop

Installation
------------

1. Clone this repo

```
git clone https://github.com/V01dDweller/dotfiles.git
./dotfiles/install.sh
```

2. Run the install shell script

```
./dotfiles/install.sh
```

The install.sh script will back up then replace the files below, if they exist:

**bash**
01. .bashrc
02. .bash\_profile
03. .bash\_prompt.sh
04. .LESS\_TERMCAP)
05. .minttyrc
06. .bash\_mintty\_colors
07. .vimrc
08. .gvimrc
09. .tmux.conf
10. .tmux-syncoff.conf
11. .tmux-syncon.conf
12. .tmux.clipboard.conf
13. .tmux-status.conf

Backups will be created in `~/dotfile_backup_<date_time>`

```
dotfiles/
├── .w3m                        # The w3m web browser
│   ├── .gitignore
│   └── config
│
├── bash
│   ├── .LESS_TERMCAP           # less with colors
│   ├── .bash_mintty_colors     # Cygwin Mintty
│   ├── .bash_profile           # Git-aware bash prompt
│   ├── .bash_profile_simple      (requires jimeh/git-aware-prompt)
│   ├── .bash_profile_thinkpad
│   ├── .bash_prompt.sh         # Generated by vim airline,
│   ├── .bashrc                   sourced by .bash_profile,
│   ├── .bashrc_debian            keeps bash promt in sync with
│   ├── .bashrc_el7               vim and tmux
│   ├── .bashrc_mintty
│   └── .bashrc_wsl
│
├── git
│   └── .gitconfig              # Base git config, starring vimdiff
│
├── iterm
│   └── com.googlecode.iterm2.plist
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
│   ├── .tmux-status.conf       # As created by tmuxline.vim
│   ├── .tmux-syncoff.conf      # Sourced by tmux for color changes when enabling synchronizing-panes via C-b e
│   ├── .tmux-syncon.conf       # Sourced by tmux for color changes when disabling synchronize-panes via C-b E
│   └── themes
│       ├── airline_dracula
│       │   ├── .tmux-status.conf
│       │   ├── .tmux-syncoff.conf
│       │   └── .tmux-syncon.conf
│       ├── airline_original
│       │   ├── .tmux-status.conf
│       │   ├── .tmux-syncoff.conf
│       │   ├── .tmux-syncon.conf
│       │   └── .tmux.conf
│       ├── green
│       │   ├── .tmux-syncoff.conf
│       │   └── .tmux.conf
│       ├── original
│       │   ├── .tmux-syncoff.conf
│       │   └── .tmux.conf
│       └── yellow
│           ├── .tmux-syncoff.conf
│           └── .tmux.conf
│
├── vim
│   ├── plugin_install.sh       # Installs pathogen and all my plugins from Github
│   ├── plugin_install.py       # Python version of the above
│   ├── .gvimrc                 # Happy Vimming in gVim 7-8 (requires .vimrc)
│   ├── .gvimrc.old
│   └── .vimrc                  # Happy Vimming in vim 7-8 on Linux, Solaris and Cygwin
│
├── README.md                   # You are here
├── install.sh                  # Copies bash, tmux, mintty and vim dotfiles then
│                                 runs tmux/plugin_install.sh and vim/plugin_install.sh
└── uninstall.sh                # **WARNING** - Not yet updated to match the install.sh
```

Mintty Color Schemes - Windows
------------------------------

Combined with a collection of Windows shortcuts and a folder in the
Windows PATH, one can quickly summon a Mintty session with a custom
color scheme.

Mintty Color Schemes - bash
---------------------------

Mintty and WSLtty will respond to escape sequences to change colors on
the fly, source `.bash_mintty_colors` to get bash aliases, e.g. blue,
green, red, etc..

Bash
----

My git-aware bash prompt, aliases, etc. for different environments.

Tmux
----

A low-key color scheme (with due credit to [Hermann
Vocke](http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf))
that is much easier on the eyes than the default CRT green. Also some
shortcuts for color schemes, toggling pane sync and clipboard integration.

Vim
---

Creates my .vimrc and .gvimrc files, installs pathogen and a list of plugins.

Installation
------------

```console
git clone https://github.com/V01dDweller/dotfiles.git
./dotfiles/install.sh
```
