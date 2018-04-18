"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
" 
"           V01dDweller's vimrc
"             lucan88@msn.com
"
"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

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
set wildmenu

" Set path auto-complete  to be like bash
set wildmode=list:longest

" Auto indent shift-width
set shiftwidth=2

" Tabs at four spaces
set softtabstop=2

" Change tabs to spaces
set expandtab 

" Turn on auto indent, disable with <F8>
set autoindent

" Turn on Filetype indenting
filetype indent on

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

" Color Scheme
color elflord

" Dark background
set background=dark

" Syntax highlighting
syntax enable

" Highlight current line
set cursorline

" Highlight current line options
highlight CursorLine term=bold cterm=bold ctermbg=darkblue

" Line numbers only in active side of split window
" autocmd WinEnter * :setlocal number
" autocmd WinLeave * :setlocal nonumber

" Always-on IP address highlighting
syntax match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
highlight link ipaddr Identifier

" F6 - Toggle AnsiEsc plug-in
nnoremap  <F6> :AnsiEsc<CR>

" F7 - Toggle scrollbind, all panes
nnoremap <F7> :windo :1<CR>:windo setlocal scb! <CR>:windo setlocal crb! <CR>

" F8 -  Fully disable auto-indent
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" F9 - Toggle cursorline
nnoremap <F9> :set cursorline!<CR>

" F10 - Show me columns 2, 4, 6 and 80 (yaml-friendly)
nnoremap <F10> :set colorcolumn=2,4,6,80<CR>

" F11 - Stop showing me columns 2 and 80
nnoremap <F11> :set colorcolumn=<CR>

" Make Colorcolumn darkgreen
highlight ColorColumn ctermbg=darkgreen guibg=darkgreen

" Netrw tree style
let g:netrw_liststyle = 3

" Netrw with no banner
let g:netrw_banner = 0

" Netrw will hide these
let g:netrw_list_hide = ".svn,.git,.*.swp"

" F4 - Toggle Lexplore/netrw (Vim 8.0)
nnoremap <F4> :Lexplore<CR>

" Netrw confined to 35 columns
let g:netrw_winsize = -35

" Filename in title bar
set title


" Disable mouse support (**warning conflicts with tmux when enabled!)
set mouse=

" Function - toggle mouse support
" Thanks to crater2150 - https://unix.stackexchange.com/questions/156707
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

" F12 - Toggle mouse support
map <F12> :call ToggleMouse()<CR>

" Enable plugins
filetype plugin on

" Plugins for CLI only
if !has('gui_running') && !empty(glob("~/.vim/autoload/pathogen"))
  " Load Pathogen plug-in (needed for fugitive)
  execute pathogen#infect()
  " For the SVN plug-in (Vim 8.0)
  let g:svnj_custom_statusbar_ops_hide = 1
  let g:svnj_browse_cache_all = 1
endif
