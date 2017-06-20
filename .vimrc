" V01dDweller's vimrc
" lucan88@msn.com
" -------------------

" Turn on line numbers
set number

" Highlight current line
set cursorline

" Show the ruler
set ruler

" Show commands as they are typed in command mode
set showcmd

" Indentation and tab handling
set shiftwidth=2
set softtabstop=4
set expandtab 
set autoindent

" Filetype indenting
filetype indent on

" Display breaks long lines at words
set lbr

" Disable backups
set nobackup 
set nowritebackup

" Search highlighting
set hlsearch incsearch 

" Search ignores case
set ic smartcase 

" Cause new windows to appear below or to the right
set splitright
set splitbelow

" Color Scheme
color elflord
set background=dark
syntax on

" Line numbers only in active side of split window
au WinEnter * :setlocal number
au WinLeave * :setlocal nonumber

" Always-on IP address highlighting
syn match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
hi link ipaddr Identifier

" F6 - Toggle AnsiEsc plug-in
nnoremap  <F6> :AnsiEsc<CR>

" F7 - Toggle scrollbind 
nnoremap <F7> :windo :1<CR>:windo setl scb! <CR>

" F8 -  Fully disable auto-indent
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" F9 - Show me column 80
nnoremap <F9> :set colorcolumn=80<CR>

" F10 - Stop showing me column 80
nnoremap <F10> :set colorcolumn=""<CR>

" Make Colorcolumn lightgrey
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" Netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide = ".svn,.git,.*.swp"

" ******* Vim-only options *******
" For the SVN plug-in
let g:svnj_custom_statusbar_ops_hide = 1
let g:svnj_browse_cache_all = 1

" Disable Vi compatibility
set nocp
