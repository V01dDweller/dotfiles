"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
"
"                       V01dDweller's
"                          _                    
"               __ ___   _(_)_ __ ___  _ __ ___ 
"              / _` \ \ / / | '_ ` _ \| '__/ __|
"             | (_| |\ V /| | | | | | | | | (__ 
"            (_)__, | \_/ |_|_| |_| |_|_|  \___|
"              |___/                            
"          https://github.com/V01dDweller/dotfiles
"
"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

" Keyboard shortcuts
" ---------------------------------------------------------
"     CTRL-F1        - Toggle menu bar
"     CTRL-F2        - Toggle tool bar
"     CTRL-F3        - Toggle right-hand scroll bar
"     CTRL-TAB       - Cycle forward through tabs
"     CTRL-Shift-Tab - Cycle backwards through tabs
" ---------------------------------------------------------


" GVim fonts thanks to http://vim.wikia.com/wiki/Setting_the_font_in_the_GUI
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Monospace\ Regular\ 10
  elseif has("gui_photon")
    set guifont=Monospace\ Regular:s11
  elseif has("gui_kde")
    set guifont=Monospace\ Regular/10/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Lucida_Console:h11:cDEFAULT
  endif
endif

" Window size
set columns=86 lines=45
    
" Hide GUI toolbar
set guioptions=mr

" Enable tear-off menus
set guioptions+=t

" Hide menu bar
set guioptions-=m

" Hide right-hand scroll bar
set guioptions-=r

" CTRL-F1 - Toggle menu bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" CTRL-F2 - Toggle tool bar
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>

" CTRL-F3 - Toggle scrollbar
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-Tab and CTRL-Shift Tab to cycle through tabs
nmap <silent> <C-Tab> :tabn<CR>
imap <silent> <C-Tab> <Esc> :tabn<CR>
nmap <silent> <C-S-Tab> :tabp<CR>
imap <silent> <C-S-Tab> <Esc> :tabp<CR>

" Enable the mouse
set mouse=a

" Mouse selection behaves like Windows
behave mswin

" Disable undo files
set noundofile

" Enable remote via editing via PuTTY in Windows
if has('WIN32')
  let g:netrw_cygwin = 0
  let g:netrw_ssh_cmd = '"C:\Program Files\PuTTY\plink.exe" -T -ssh'
  let g:netrw_scp_cmd = '"C:\Program Files\PuTTY\pscp.exe" -q -scp'
  let g:netrw_sftp_cmd = '"C:\Program Files\PuTTY\pscp.exe" -q -sftp'
endif

" Different colors for Windows GUI
if has('WIN32')
  color industry
endif
