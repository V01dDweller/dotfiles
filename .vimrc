" Karl's vimrc
" -------------
set shiftwidth=1
set ts=5
set lbr ic autoindent smartindent hlsearch incsearch smartcase ruler nobackup showcmd

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

" Disable auto-indent
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

" Toggle scrollbind, this synchronizes scrolling in split Vim
:nnoremap <F7> :setl scb!<CR>

" Toggle AnsiEsc plug-in
:nnoremap  <F6> :AnsiEsc<CR>

" Disable backup files
set nobackup
set nowritebackup

" For the SVN plug-in
let g:svnj_custom_statusbar_ops_hide = 1
let g:svnj_browse_cache_all = 1
