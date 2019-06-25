"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/"
"                                                            "
"                      V01dDweller's                         "
"                                                            "
"              __   _(_)_ __ ___  _ __ ___                   "
"              \ \ / / | '_ ` _ \| '__/ __|                  "
"               \ V /| | | | | | | | | (__                   "
"              (_)_/ |_|_| |_| |_|_|  \___|                  "
"                                                            "
"          https://github.com/V01dDweller/dotfiles           "
"                                                            "
"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/"

" Remapped Function Keys
" ---------------------------------------------------------"
"    F4 - Vexplore ( < Vim 8) or Toggle Lexplore ( > Vim 8)"
"    F6 - Toggle the AnsiEsc plugin                        "
"    F7 - Toggle syncrhonize panes                         "
"    F8 - Disable all auto-indenting                       "
"    F9 - Toggle cursorline highlighting                   "
"   F10 - Toggle cursorcolumn                              "
"   F11 - Toggle color columns 2, 4, 6 and 80              "
"   F12 - Toggle mouse                                     "
" ---------------------------------------------------------"


" Disable Vi compatibility
set nocompatible

" Visual bell
set vb

" Turn on line numbers
set number

" Turn on the ruler
set ruler

" Show commands as they are typed in command mode
set showcmd

" Enable wildmenu
" Credit: https://sanctum.geek.nz/arabesque/vim-filename-completion/
if has("wildmenu")
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
  set wildmode=longest,list
endif

" Add dictionaty completion when spell is on
set complete+=kspell

" Set path auto-complete  to be like bash
set wildmode=list:longest

" Auto indent shift-width
set shiftwidth=2

" Tabs at two spaces
set softtabstop=2

" Change tabs to spaces
set expandtab

" Turn on auto indent, disable with <F8>
set autoindent

" Turn on Filetype indenting
filetype indent on

" Limit autofolding to one level
set foldnestmax=1

" break long lines at words (display)
set linebreak

" Disable backups
set nobackup
set nowritebackup

" Search highlighting, find while I type
set hlsearch incsearch

" Search ignores case, unless mix case
set ignorecase smartcase

" New windows to appear below
set splitbelow

" New vertical windows to appear right
set splitright

" Minimal number of lines above and below the cursor
set scrolloff=2

" Dark background
set background=dark

" Syntax highlighting
syntax enable

" Highlight current line
set cursorline

" Dress up split windows
hi StatusLine ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
hi VertSplit ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

" Vertical split separator
if !has("gui_running")
  set fillchars=vert:│
endif

" Line numbers only in active side of split window
"autocmd WinEnter * :setlocal number
"autocmd WinLeave * :setlocal nonumber

" Auto-create/auto-load views
if !has("gui_running") 
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview
endif

" Always-on IP address highlighting
syntax match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
highlight link ipaddr Identifier

" F6 - Toggle AnsiEsc plug-in
nnoremap  <F6> :AnsiEsc<CR>

" F7 - Toggle scrollbind and cursorbind for all panes
nnoremap <F7> :windo :1<CR>:windo setlocal scb! <CR>:windo setlocal crb! <CR>

" F8 -  Fully disable auto-indent
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" F9 - Toggle cursorline
nnoremap <F9> :set cursorline!<CR>

" F10 - Toggle cursorcolumn
nnoremap <F10> :set cursorcolumn!<CR>

" F11 - Toggle color columns 2, 4, 6 and 80
let g:ColorColumnOn = 0
function! ToggleColorColumn()
  if g:ColorColumnOn
    set colorcolumn=""
    let g:ColorColumnOn=0
  else
    set colorcolumn=2,4,6,80
    let g:ColorColumnOn=1
  endif
endfunction
map <silent> <F11> :call ToggleColorColumn()<CR>

" Make Colorcolumn darkgreen
highlight ColorColumn ctermbg=darkgreen guibg=darkgreen

" Netrw tree style
let g:netrw_liststyle = 3

" Netrw with no banner
let g:netrw_banner = 0

" Netrw will hide these
let g:netrw_list_hide = "NTUSER.DAT,ntuser*,.svn,.git,.*.swo,.*.swp,.DS_Store,.CFUserTextEncoding"

" Function to toggle netrw for Vim 8+
" Thanks to: https://vi.stackexchange.com/questions/10988/toggle-explorer-window
let g:NetrwIsOpen=0
function! ToggleNetrwVim8()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:NetrwIsOpen=1
    silent Lexplore
  endif
endfunction

" Function to toggle netrw for Vim 7 and older
function! ToggleNetrwVim7()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:NetrwIsOpen=1
    silent Vexplore
  endif
endfunction

" F4 - Toggle netrw
if v:version > 799
  map <silent> <F4> :call ToggleNetrwVim8()<CR>
else
  map <silent> <F4> :call ToggleNetrwVim7()<CR>
endif

" Netrw confined to 30 columns
let g:netrw_winsize = -30

" Netrw buffer settings
let g:netrw_bufsettings = 'nomodifiable nomodified readonly nobuflisted nowrap nonumber'

" Filename in title bar
set title

" Enable mouse support
set mouse=a

" Function - toggle mouse support
" Thanks to crater2150 - https://unix.stackexchange.com/questions/156707
function! ToggleMouse()
  " check if mouse is enabled
  if &mouse == 'a'
    " disable mouse
    set mouse=
    echo "Mouse off"
  else
    " enable mouse everywhere
    set mouse=a
    echo "Mouse on"
  endif
endfunc

" F12 - Toggle mouse support
map <silent> <F12> :call ToggleMouse()<CR>

" Open Quickfix window automatically
" Credit: romainl @ StackOverflow
" URL: https://stackoverflow.com/questions/39009792/vimgrep-pattern-and-immediately-open-quickfix-in-split-mode
augroup myvimrc
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    lwindow
augroup END

" Enable plugins
filetype plugin on

" Load Pathogen, if it's there
if !has('gui_running') && !empty(glob("~/.vim/autoload/pathogen.vim"))
  execute pathogen#infect()
endif

" Color Scheme
if !empty(glob("~/.vim/bundle/vim256-color"))
  "color flattr
  "color atom-dark-256
  color xoria256
  "color cobalt2
else
  color elflord
endif

" Cursorline decoration - bold on darkblue
highlight CursorLine term=bold cterm=bold ctermbg=darkblue

" CursorColumn decoration - bold on darkblue
highlight CursorColumn ctermbg=darkblue
