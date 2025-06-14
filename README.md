My Dotfiles and Plug-Ins
========================

This project contains scripts that install my dotfiles and favorite plugins for Bash, Tmux and Vim. Tested on MacOS, AlmaLinux9, Fedora 40+ and Ubuntu 22.04+ including Windows Subsystem for Linux variants. This project is old and support for CentOS 7 was recently removed, but compatible dotfiles from Vim 7 and Tmux 2.8 are still in here somewhere, should they be needed.

Also included for manual install or copy/paste/append are my config file for iTerm2, a dotfile sample for `git`, as well stuff I use occasionally or not any more like `top`, `w3m` and the Cygwin variant of MinTTY. The MinTTY dotfile collection was primarily to change color schemes and windows settings, etc., via scripts (e.g., red for production or root) and are  easy to decipher, if needed.

**NOTE:** The Coc (Conqueror of Completion) and GitHub Copilot plugins require
NodeJS v22.x (LTS). If NodeJS is not found in the `PATH`, these plugins will be skipped.

![WSLTTy 3-way split with Vim and bash](/screenshot_04.png?raw=true
"Vim/bash/tmux nerdvada")

Vim, Tmux, and the bash prompt are visually themed/coordinated via the Vim [Airline](https://github.com/vim-airline/vim-airline), [Tmuxline](https://github.com/edkolev/tmuxline.vim) and [Promptline](https://github.com/edkolev/promptline.vim) plugins respectively.  Note that these plug-ins get their default settings from the `.vimrc` file.

These plugins assume a GUI terminal already configured with a [NERDFont](https://www.nerdfonts.com/font-downloads) or [Powerline](https://github.com/powerline/fonts) font which must be either installed separately or disabled by updating then sourcing `.vimrc`. Find and update the following lines and set the values to '0' to disable Powerline fonts:

```
  let g:airline_powerline_fonts = 0
  let g:tmuxline_powerline_separators = 0
  let g:promptline_powerline_symbols = 0
```

MacOS iTerm users can skip installing fonts and enable "Draw Powerline Glyphs" instead.

The install scripts will back up existing bash, Vim or Tmux dotfiles before replacing them (use at your own risk!).

From there, [Vim](https://github.com/V01dDweller/dotfiles/tree/master/vim) and [Tmux](https://github.com/V01dDweller/dotfiles/tree/master/tmux) plug-in managers ([pathogen](https://github.com/tpope/vim-pathogen) and [tpm](https://github.com/tmux-plugins/tpm) respectively) are installed along with vim plug-ins and color schemes. Only one Tmux plug-in is installed. See the [Vim](https://github.com/V01dDweller/dotfiles/tree/master/vim) and [Tmux](https://github.com/V01dDweller/dotfiles/tree/master/tmux) READMEs for more.

Plug-ins are installed directly from GitHub, so it is a good idea to periodically pull this project and/or re-run the install script (or individual Vim or Tmux plugin_install scripts) to update all the plug-ins and add new color schemes.

The `uninstall.sh` script was never finished and should be avoided for now, but backing this out/restoring original rc files is as simple as restoring the contents of the most recent `dotfile_backup` directory. Remove plug-ins by deleting `~/.vim/bundle` and `~/.tmux/plugins` directories.

These are tested fairly often on MacOS, WSL, ~~Cygwin~~, and Linux but results may
vary, **use at your own risk!**

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
Dotfiles for the apps below are installed (and backed up) by the install scripts, if the apps are present.

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

Backups will be created in `~/dotfile_backup_<date_time

```
├── .config
│   └── htop
│       └── htoprc
├── .gitignore
├── .toprc
├── .w3m
│   ├── .gitignore
│   └── config
├── README.md
├── bash
│   ├── .LESS_TERMCAP
│   ├── .bash_mintty_colors
│   ├── .bash_profile
│   ├── .bash_profile_simple
│   ├── .bash_profile_thinkpad
│   ├── .bash_prompt.sh
│   ├── .bashrc
│   ├── .bashrc_debian
│   ├── .bashrc_el7
│   ├── .bashrc_mintty
│   └── .bashrc_wsl
├── git
│   └── .gitconfig
├── install.py
├── install.sh
├── iterm
│   └── com.googlecode.iterm2.plist
├── macos
│   ├── hide
│   └── show
├── mintty
│   ├── .bash_mintty_colors
│   ├── .minttyrc
│   ├── .minttyrc-dark
│   ├── .minttyrcb
│   ├── .minttyrcg
│   ├── .minttyrcgd
│   ├── .minttyrcgl
│   ├── .minttyrcglo
│   ├── .minttyrcgr
│   ├── .minttyrco
│   ├── .minttyrcp
│   ├── .minttyrcr
│   └── .minttyrcw
├── screenshot_01.png
├── screenshot_02.png
├── screenshot_03.png
├── tmux
│   ├── .tmux-cssh
│   ├── .tmux-status.conf
│   ├── .tmux-syncoff.conf
│   ├── .tmux-syncon.conf
│   ├── .tmux.clipboard.conf
│   ├── .tmux.conf
│   ├── .tmux29.conf
│   ├── plugin_install.py
│   ├── plugin_install.sh
│   └── themes
│       ├── airline_dracula
│       │   ├── .tmux-status.conf
│       │   ├── .tmux-syncoff.conf
│       │   └── .tmux-syncon.conf
│       ├── airline_original
│       │   ├── .tmux-status.conf
│       │   ├── .tmux-syncoff.conf
│       │   ├── .tmux-syncon.conf
│       │   └── .tmux.conf
│       ├── green
│       │   ├── .tmux-syncoff.conf
│       │   └── .tmux.conf
│       ├── original
│       │   ├── .tmux-syncoff.conf
│       │   └── .tmux.conf
│       └── yellow
│           ├── .tmux-syncoff.conf
│           └── .tmux.conf
├── uninstall.sh
└── vim
    ├── .gvimrc
    ├── .gvimrc.old
    ├── .vimrc
    ├── .vimrc_noplugins
    ├── README.md
    ├── plugin_install.py
    ├── plugin_install.sh
    └── spell
        └── en.utf-8.add
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

[modeline]: # ( vi: set number colorcolumn=80: )
