" Karl's gvimrc
" -------------

" Window size
set columns=90 lines=50
set shiftwidth=1
set ts=5
set lbr ic autoindent smartindent hlsearch incsearch smartcase ruler nobackup showcmd
"
" X11 Font
" set guifont=Monospace\ 11

" Windows Font
set guifont=Consolas:h11

" Turn on line numbers
set number

" Line numbers only in active side of split window
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

" IP address shighlighting
syn match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
hi link ipaddr Identifier

" Auto indent
filetype indent on

" Colors
syntax on
colors elflord

" Set up tabs to mimic Firefox
nmap <silent> <C-t> :tabnew<CR>
imap <silent> <C-t> <Esc>:tabnew<CR>
nmap <silent> <C-T> :tabnew<CR>
imap <silent> <C-T> <Esc>:tabnew<CR>
nmap <silent> <C-Tab> :tabn<CR>
imap <silent> <C-Tab> <Esc> :tabn<CR>
nmap <silent> <C-S-Tab> :tabp<CR>
imap <silent> <C-S-Tab> <Esc> :tabp<CR>

" Set arrow keys to work naturally
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Disable GUI toolbar
set guioptions=mr
set clipboard=unnamed
