"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/"
"                                                            "
"                       V01dDweller's                        "
"                          _                                 "
"               __ ___   _(_)_ __ ___  _ __ ___              "
"              / _` \ \ / / | '_ ` _ \| '__/ __|             "
"             | (_| |\ V /| | | | | | | | | (__              "
"            (_)__, | \_/ |_|_| |_| |_|_|  \___|             "
"              |___/                                         "
"          https://github.com/V01dDweller/dotfiles           "
"                                                            "
"_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/"

" Keyboard shortcuts
" ---------------------------------------------------------"
"     CTRL-F1        - Toggle menu bar                     "
"     CTRL-F2        - Toggle tool bar                     "
"     CTRL-F3        - Toggle right-hand scroll bar        "
"     CTRL-TAB       - Cycle forward through tabs          "
"     CTRL-Shift-Tab - Cycle backwards through tabs        "
" ---------------------------------------------------------"


" gVim fonts thanks to Tony Mechelynck via http://vim.wikia.com/wiki/Setting_the_font_in_the_GUI
" and romainl via StachOverflow: https://stackoverflow.com/questions/12295692/gvim-find-out-if-guifont-is-available
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Monospace\ Regular\ 10
  elseif has("gui_photon")
    set guifont=Monospace\ Regular:s11
  elseif has("gui_kde")
    set guifont=Monospace\ Regular/10/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10,Lucida_Console:h11:cDEFAUL
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
  set background=light
  color PaperColor
endif

" Vim Airline for gVim
if !empty(glob("~/vimfiles/pack/plugins/start/vim-airline"))
  " Thanks to Alexander Myshov, StachExchange: https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin
  " Use a powerline-patched font to see these symbols, e.g.
  "  - https://github.com/powerline/fonts
  "  - https://github.com/powerline/fonts/tree/master/DejaVuSansMono
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
