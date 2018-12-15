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
" Credit: https://sanctum.geek.nz/arabesque/vim-filename-completion/ 
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif

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

" Cursorline decoration - bold on darkblue
highlight CursorLine term=bold cterm=bold ctermbg=darkblue

" Line numbers only in active side of split window
" autocmd WinEnter * :setlocal number
" autocmd WinLeave * :setlocal nonumber

" Auto-create/auto-load views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

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

" F10 - Show me columns 2, 4, 6 and 80 (yaml-friendly)
nnoremap <F10> :set colorcolumn=2,4,6,80<CR>

" F11 - Turn off colorcolumn
nnoremap <F11> :set colorcolumn=<CR>

" Set up CTRL-T to create new tabs
nmap <silent> <C-t> :tabnew<CR>
imap <silent> <C-t> <Esc>:tabnew<CR>
nmap <silent> <C-T> :tabnew<CR>
imap <silent> <C-T> <Esc>:tabnew<CR>

" Make Colorcolumn darkgreen
highlight ColorColumn ctermbg=darkgreen guibg=darkgreen

" Netrw tree style
let g:netrw_liststyle = 3

" Netrw with no banner
let g:netrw_banner = 0

" Netrw will hide these
let g:netrw_list_hide = ".svn,.git,.*.swp,.DS_Store,.CFUserTextEncoding"

" F4 - Toggle netrw viaLexplore (Vim 8) or Vexplore (Vim 7)
if v:version > 799
  nnoremap <F4> :Lexplore<CR>
else
  nnoremap <F4> :Vexplore<CR>
endif

" Netrw confined to 30 columns
let g:netrw_winsize = -30

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
