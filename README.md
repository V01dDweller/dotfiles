My Dotfiles and Plug-Ins
========================

This project installs a collection of dotfiles and plug-ins that I've come to
depend on over the years. It is set up to be installed in one step. The goal
is to get my workflow going quickly on a new system whether that system is
running MacOS, Cygwin, WSL 2 or mainstream Linux (EL or Ubuntu) distributions.

![WSLtty 3-way split with Vim and bash](/screenshot_03.png?raw=true
"Vim/bash/tmux nerdvada")

The priorities are Vim, Tmux, and bash which are visually themed/coordinated
via the Vim [Airline](https://github.com/vim-airline/vim-airline),
[Tmuxline](https://github.com/edkolev/tmuxline.vim) and
[Promptline](https://github.com/edkolev/promptline.vim) plugins respectivly.
Note that these plug-ins get their default settings from the `.vimrc` file.

By default, each of these will use
[Powerline](https://github.com/powerline/fonts) fonts which must be either
installed separately or disabled by updating then sourcing
`.vimrc`.  MacOS iTerm users can enable "Draw Powerline Glyphs".

The install scripts will back up existing bash, MinTTY (Cygwin only), Vim or
Tmux dotfiles before replacing them.

From there, [Vim](https://github.com/V01dDweller/dotfiles/tree/master/vim) and
[Tmux](https://github.com/V01dDweller/dotfiles/tree/master/tmux) plug-in
managers ([pathogen](https://github.com/tpope/vim-pathogen) and
[tpm](https://github.com/tmux-plugins/tpm) respectively) are installed along
with vim plug-ins and color schemes. Only one Tmux plug-in is installed. See
the [Vim](https://github.com/V01dDweller/dotfiles/tree/master/vim)
and [Tmux](https://github.com/V01dDweller/dotfiles/tree/master/tmux) READMEs for
more.

Plug-ins are installed directly from github, so it is a good idea to
periodically pull this project and/or re-run the install script (or individual
Vim or tmux plugin_install scripts) to update all the plug-ins and add new
color schemes.

The `uninstall.sh` script was never finished and should be avoided for now,
but backing this out/restoring original rc files is as simple as restoring the
contents of the most recent `dotfile_backup` directory. Remove plug-ins by
deleting `~/.vim/bundle` and `~/.tmux/plugins` directories.

These are tested fairly often on MacOS, WSL, Cygwin, and Linux but results may
vary, **use at your own risk.**

Quick Install
--------------

```console
git clone https://github.com/V01dDweller/dotfiles.git
./dotfiles/install.sh
```

or

```console
git clone https://github.com/V01dDweller/dotfiles.git
./dotfiles/install.py
```

Primary Apps
------------
Dotfiles for the apps below are installed (and backed up) by the install
scripts, if the apps are present.

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
```

2. Run the install shell (or Python) script

```
./dotfiles/install.sh
```

The install script will back up then replace the files below, if they exist:

**bash**
01. .bashrc
02. .bash\_profile
03. .bash\_prompt.sh
04. .LESS\_TERMCAP
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
dotfiles
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

Mintty Color Schemes - (Cygwin/Windows)
--------------------

Combined with a collection of Windows shortcuts and a folder in the
Windows PATH, one can quickly summon a Mintty session with a custom
color scheme.

Mintty Color Schemes - (Cygwin/WSL/Windows)
--------------------

Mintty and WSLtty will respond to escape sequences to change colors on
the fly, source `.bash_mintty_colors` to get bash aliases, e.g. blue,
green, red, etc..

Bash
----

Git-aware bash prompt, aliases, etc. for different environments. The
git-aware prompts were generated using the vim promptline plugin and
saved to .bash_prompt.sh which is sourced via .bash_profile. When
Airline themes change, promptline updates .bash_prompt.sh. to match.

Tmux
----

A collection of .tmux_xxx dotfiles that coordinate Tmux colors with
Vim and bash, thanks to a .tmux.conf generated by the Vim tmuxline plug-in.
If the vim-airline theme is changed, .tmux.conf will be updated and
sourced automatically.

Another priority for tmux is **clipboard integration**. Tmux has
its own clipboard, but uncommenting the appropriate line from the section below
will allow integration with the OS clipboard, as long as tmux is running in a
Desktop GUI. Note that Cygwin requires both lines:

```
# OS clipboard integration
# =============================
# Cygwin - Copy to Windows clipboard (tmux 2.4 and later)
#bind-key -T copy-mode Enter send-key -X copy-pipe-and-cancel "cat > /dev/clipboard"
#bind ] run "cat /dev/clipboard | tmux load-buffer - ; tmux paste-buffer"

# MacOS X - Copy to MacOS clipboard
#bind-key -T copy-mode Enter send-key -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

# Linux  - Copy to X11 clipboard
#bind-key -T copy-mode Enter send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"

# Windows Subsystem for Linux - Copy to Windows clipboard
#bind-key -T copy-mode enter send-key -X copy-pipe-and-cancel "cat | /mnt/c/Windows/System32/clip.exe"
```

Vim
---

This installs my .vimrc and .gvimrc files, the  pathogen plug-in manager and a
list of plugins.

[modeline]: # ( vi: set number textwidth=78 colorcolumn=80 nowrap: )
