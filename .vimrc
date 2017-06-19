" Karl's vimrc
" -------------

" My old settings
set shiftwidth=2
set tabstop=5
set lbr ic autoindent hlsearch incsearch smartcase ruler nobackup showcmd

" Turn on line numbers
set number

" Line numbers only in active side of split window
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber


" IP address shighlighting
syn match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
hi link ipaddr Identifier
"
" Auto indent
filetype indent on

" Color Scheme
color elflord
set background=dark
:syntax on

" Map F6 - Toggle AnsiEsc plug-in
:nnoremap  <F6> :AnsiEsc<CR>

" Map F7 - Toggle scrollbind 
nnoremap <F7> :windo setl scb! <CR>

" Map F8 -  Disable auto-indent to F8
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" Map F9 - colorcolumn=80
nnoremap <F9> :set colorcolumn=80<CR>

" Map F10 - colorcolumn=""
nnoremap <F10> :set colorcolumn=""<CR>

" Netrw  settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide = ".svn,.git,.*.swp"

" Disable backup files
set nobackup
set nowritebackup

" For the SVN plug-in
let g:svnj_custom_statusbar_ops_hide = 1
let g:svnj_browse_cache_all = 1

" Cause new windows to appear below or to the right
set splitright
set splitbelow

" Disable Vi compatibility
set nocp
