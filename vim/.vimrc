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

" Function Keys
" -----------------------------------------------------------"
"    F2 - Toggle line numbers                                "
"    F3 - Toggle line wrapping                               "
"    F4 - Toggle Lexplore ( > Vim 8) or Vexplore ( < Vim 8)  "
"    F5 - Toggle Colorizer plugin                            "
"    F6 - Toggle the AnsiEsc plugin                          "
"    F7 - Toggle scrollbind/cursorbind                       "
"    F8 - Disable all auto-indenting                         "
"    F9 - Toggle cursorline                                  "
"   F10 - Toggle cursorcolumn                                "
"   F11 - Toggle colorcolumns 2, 4, 6 and 80                 "
"   F12 - Toggle mouse                                       "
" -----------------------------------------------------------"


" Disable Vi compatibility/allow Vim features not in Vi
set nocompatible

" Visual bell
set visualbell

" Turn on the ruler
set ruler

" Show commands as they are typed
set showcmd

" Use tab for path auto-complete like bash
" Credit: https://sanctum.geek.nz/arabesque/vim-filename-completion/
if has("wildmenu")
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
  set wildmode=longest,list
endif

" Add dictionary completion when spell is on
set complete+=kspell

" Set path auto-complete to be like bash
set wildmode=list:longest

" Tabs and indentation
set shiftwidth=2        " Auto indent shift-width
set softtabstop=2       " Tabs at two spaces
set expandtab           " convert tabs to spaces
set autoindent          " self explanatory, disable with <F8>
filetype indent on      " Filetype indenting

" Wrapping breaks at words
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
if !has("gui_running") && v:version > 799
  set fillchars=vert:│
endif

" Line numbers only in active side of split window
"autocmd WinEnter * :setlocal number
"autocmd WinLeave * :setlocal nonumber

" Auto-create/auto-load views
if !has("gui_running")
  let current_file = expand('%')
  if !empty(current_file) || stridx(current_file, "NetrwTreeListing") == -1
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
  endif
endif

" Always-on IP address highlighting
syntax match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
highlight link ipaddr Identifier

" F5 - Toggle Colorizer
nnoremap <F5> :ColorToggle<CR>

" F6 - Toggle AnsiEsc plug-in
nnoremap <F6> :AnsiEsc<CR>

" F7 - Toggle scrollbind and cursorbind for all panes
nnoremap <F7> :windo setlocal scrollbind! cursorbind!<CR>

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

" Netrw tree style
let g:netrw_liststyle = 3

" Netrw with no banner
let g:netrw_banner = 0

" Netrw will hide these
let g:netrw_list_hide = "*NTUSER*,ntuser*,.svn,.git,.*.swo,.*.swp,.DS_Store,.CFUserTextEncoding"

" Netrw, stop complaining about unsaved hidden buffers
" Thanks Brian Tiffin @ StackExchange:
" https://stackoverflow.com/questions/49165624/netrw-modifying-directories-always-complains
autocmd FileType netrw setlocal bufhidden=delete

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

" F2 - Toggle line numbers
map <silent> <F2> :set nu!<CR>
imap <silent> <F2> <Esc> :set nu!<CR>

" F3 - Toggle line wrapping
nmap <silent> <F3> :set wrap!<CR>
imap <silent> <F3> <Esc> :set wrap!<CR>

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

" Load Pathogen, if this is the cli and it's there
if !has('gui_running') && !empty(glob("~/.vim/autoload/pathogen.vim"))
  execute pathogen#infect()
  Helptags
endif

" Color Scheme with matching Cursorline CursorColumn and colorcolumn
if !has('gui_running') && !empty(glob("~/.vim/colors/southernlights.vim"))
  color southernlights
  highlight CursorLine term=bold cterm=bold ctermbg=238
  highlight CursorColumn ctermbg=238
  highlight ColorColumn ctermbg=236
  highlight CursorLineNr term=bold cterm=bold  gui=bold
else
  color elflord
  highlight CursorLine term=bold cterm=bold ctermbg=darkblue
  highlight CursorColumn ctermbg=darkblue
  highlight ColorColumn ctermbg=darkgreen
  highlight CursorLineNr term=bold cterm=bold  gui=bold
endif

" Found the following here:
"     https://stackoverflow.com/questions/3431184/highlight-all-occurrence-of-a-selected-word
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction

" Vim mouse support in tmux
" found here: https://unix.stackexchange.com/questions/50733/cant-use-mouse-properly-when-running-vim-in-tmux
set ttymouse=xterm2
set mouse=a

" Turn spell check on for these file types
autocmd FileType markdown,text,html,man,manual :set spell

" Hide dotfiles in netrw with gh to toggle, thanks to
"  https://vi.stackexchange.com/questions/18650/how-to-make-netrw-start-with-dotfiles-hidden
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

" ALE Icons and highlights
if !empty(glob("~/.vim/bundle/ale"))
  let g:ale_sign_error = '✗▐'
  let g:ale_sign_warning = '▲▐'
  let g:ale_set_highlights = 1
  nnoremap <C-n> :ALENext<CR>
  nnoremap <C-p> :ALEPrevious<CR>
endif

" Disable linting for Java
" Recommend installing checkstyle, otherwise java linting gets weird
"let g:ale_pattern_options = {'\.java$': {'ale_enabled': 0}}

" Match GitGutter and ALE colors to active color scheme
if !empty(glob("~/.vim/bundle/vim-gitgutter"))
  if (colors_name == "xoria256")
    highlight GitGutterAdd    guifg=#009900 ctermfg=46 ctermbg=242 " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=51 ctermbg=242 " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=197 ctermbg=242 " red _
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=242 ctermfg=Yellow
      highlight ALEErrorSign ctermbg=242 ctermfg=Red
    endif
  elseif (colors_name == "bubblegum-256-dark")
    highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=236 " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=6 ctermbg=236 " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=236 " red _
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=236 ctermfg=Yellow
      highlight ALEErrorSign ctermbg=236 ctermfg=Red
    endif
  elseif (colors_name == "atom-dark-256")
    " Black background
    highlight Normal ctermfg=grey ctermbg=black
    highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=235 " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=6 ctermbg=235 " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=235 " red _
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=242 ctermfg=Yellow
      highlight ALEErrorSign ctermbg=242 ctermfg=Red
    endif
  elseif (colors_name == "hybrid")
    " Black background
    highlight Normal ctermfg=grey ctermbg=black
    highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=234 " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=6 ctermbg=234 " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=234 " red _
    highlight CursorLine term=bold cterm=bold ctermbg=234
    highlight CursorColumn ctermbg=234
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=234 ctermfg=Yellow
      highlight ALEErrorSign ctermbg=234 ctermfg=Red
    endif
  elseif (colors_name == "southernlights")
    highlight GitGutterAdd    guifg=#009900 ctermfg=46  ctermbg=240 " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=51  ctermbg=240 " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=197 ctermbg=240 " red _
    highlight CursorLine term=bold cterm=bold ctermbg=234
    highlight CursorLineNr term=bold cterm=bold ctermfg=yellow gui=bold
    highlight CursorColumn ctermbg=234
    hi Folded ctermbg=235 ctermfg=gray
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=240 ctermfg=Yellow
      highlight ALEErrorSign ctermbg=240 ctermfg=Red
    endif
  elseif (colors_name == "dracula")
    highlight CursorLine term=bold cterm=bold ctermbg=234
    highlight CursorColumn ctermbg=234
    highlight ColorColumn ctermbg=241
    highlight CursorLineNr term=bold cterm=bold  gui=bold
    highlight GitGutterAdd    guifg=#009900 ctermfg=2 ctermbg=black " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=6 ctermbg=black " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=1 ctermbg=black " red _
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=black ctermfg=Yellow
      highlight ALEErrorSign ctermbg=black ctermfg=Red
    endif
  elseif (colors_name == "elflord")
    highlight CursorLine term=bold cterm=bold ctermbg=darkblue
    highlight CursorColumn ctermbg=darkblue
    highlight ColorColumn ctermbg=darkgreen
    highlight CursorLineNr term=bold cterm=bold  gui=bold
    highlight GitGutterAdd    guifg=#009900 ctermfg=46  ctermbg=242 " green +
    highlight GitGutterChange guifg=#bbbb00 ctermfg=51  ctermbg=242 " cyan ~
    highlight GitGutterDelete guifg=#ff2222 ctermfg=197 ctermbg=242 " red _
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Blue
      highlight ALEError ctermbg=Red
      highlight ALEWarningSign ctermbg=242 ctermfg=Yellow
      highlight ALEErrorSign ctermbg=242 ctermfg=Red
    endif
  endif
endif

" Vagrantfiles need ruby syntax
au BufRead,BufNewFile Vagrantfile setfiletype ruby
