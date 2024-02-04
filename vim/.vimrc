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

"...................... Basic Settings ......................"

" Filename in title bar
set title

" Enable mouse support
set mouse=a
"set ttymouse=xterm2

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

" Use US English for spell check
set spelllang=en_us

" Enable auto-increment for alphabetic sequence
set nrformats+=alpha

" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
" Credit: http://www.panozzaj.com/blog/2016/03/21/ignore-urls-and-acroynms-while-spell-checking-vim/

syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

" Map CTRL-L to Fix Last Spelling Error
" Credit: https://stackoverflow.com/questions/5312235/how-do-i-correct-vim-spelling-mistakes-quicker
imap <C-l> <Esc>[s1z=`]a
nmap <C-l> [s1z=1`]

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

" Speed up updates, defaults to 4000ms. Affects a few things including
" GitGutter updates
set updatetime=100

" Syntax highlighting
syntax enable

" Syntax highlighting in markdown code block
let g:markdown_fenced_languages = [ 'ansible=yaml.ansible', 'bash=sh', 'bat=winbatch', 'c', 'cpp', 'css', 'dockerfile', 'fstab', 'html', 'Jenkinsfile', 'javascript', 'jinja2', 'ini=dosini', 'java', 'json', 'php', 'passwd', 'ps1', 'python', 'ruby', 'shell=sh', 'sh', 'sshconfig', 'sshdconfig', 'sudoers', 'systemd=dosini', 'tmux', 'vb', 'vim', 'xml', 'yaml', 'yaml.ansible']

" Highlight current line
set cursorline

" Vertical split separator
if !has("gui_running") && v:version > 799
  set fillchars=vert:│
endif

" Line numbers only in active side of split window
autocmd WinEnter * if &ft != "nerdtree" && &ft != 'netrw' | :setlocal number relativenumber | endif
autocmd WinLeave * if &ft != "nerdtree" && &ft != 'netrw' | :setlocal number norelativenumber | endif

" Auto-create/auto-load views
if !has("gui_running") && isdirectory("~/.vim")
  let current_file = expand('%')
  if !empty(current_file) || stridx(current_file, "NetrwTreeListing") == -1
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview
  endif
endif

" Always-on IP address highlighting
syntax match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
highlight link ipaddr Identifier

" Open Quickfix window automatically
" Credit: romainl @ StackOverflow
" URL: https://stackoverflow.com/questions/39009792/vimgrep-pattern-and-immediately-open-quickfix-in-split-mode
augroup myvimrc
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    lwindow
augroup END

"...................... Highlight All ......................."
" Allows 'z/' to toggle auto-higlighting all occurences of
" word under cursor
"
" Credit - mosh @ Vim Wiki
" URL: https://vim.fandom.com/wiki/Auto_highlight_current_word_when_idle
"
" Originally found on StackOverflow:
"     https://stackoverflow.com/questions/3431184/highlight-all-occurrence-of-a-selected-word
"
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=100
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


".................... File Type Settings ...................."
" Turn spell check on for these file types
autocmd FileType markdown,text,html,man,manual :set spell | syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

" Python 3 Omnicomplete
autocmd FileType python set omnifunc=python3complete#Complete

" Vagrantfiles need ruby syntax
au BufRead,BufNewFile Vagrantfile setfiletype ruby


"...................... Function keys ......................."
"                                                            "
"    F2 - Toggle line numbers                                "
"    F3 - Toggle line wrapping                               "
"    F4 - Toggle NERDTree plugin                             "
"    F5 - Toggle netrw left-navigation                       "
"    F6 - Toggle dark/light background                       "
"    F7 - Toggle scrollbind/cursorbind                       "
"    F8 - Disable all auto-indenting                         "
"    F9 - Toggle cursorline                                  "
"   F10 - Toggle cursorcolumn                                "
"   F11 - Toggle colorcolumns 2, 4, 6 and 80                 "
"   F12 - Toggle mouse                                       "
"............................................................"

" F2 - Toggle line numbers
map <silent> <F2> :set nu!<CR>
imap <silent> <F2> <Esc> :set nu!<CR>

" F3 - Toggle line wrapping
nmap <silent> <F3> :set wrap!<CR>
imap <silent> <F3> <Esc> :set wrap!<CR>

" F4 - Toggle NERDTree
if !has('gui_running')
  " F4 - Toggle NERDTree
  nnoremap <F4> :NERDTreeToggle<CR>
endif

" F6 - Switch between light and dark background
function! ToggleShade()
  if g:LightsOn
    set background=dark
    let g:LightsOn = 0
    if !empty(glob("~/.vim/bundle/ale")) " Change ALE colors to match
      highlight ALEWarning ctermbg=Darkyellow ctermfg=Black
      highlight ALEError ctermbg=DarkRed
      highlight ALEWarningSign ctermfg=Yellow
      highlight ALEErrorSign ctermfg=Red
    endif
    if !empty(glob("~/.vim/bundle/vim-gitgutter"))
      highlight GitGutterChange guifg=#bbbb00 ctermfg=6 " cyan ~
    endif
  else
    set background="light"
    let g:LightsOn = 1
    if !empty(glob("~/.vim/bundle/ale")) " Change ALE colors to match
      highlight ALEWarning ctermbg=Yellow
      highlight ALEError ctermbg=Lightred
      highlight ALEWarningSign ctermfg=Darkyellow
      highlight ALEErrorSign ctermfg=Darkred
    endif
    if !empty(glob("~/.vim/bundle/vim-gitgutter"))
      highlight GitGutterChange guifg=#bbbb00 ctermfg=6 " cyan ~
    endif
  endif
endfunction
map <silent> <F6> :call ToggleShade()<CR>

" F5 - Toggle netrw
if v:version > 799
  map <silent> <F5> :call ToggleNetrwVim8()<CR>
else
  map <silent> <F5> :call ToggleNetrwVim7()<CR>
endif

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

" F7 - Toggle scrollbind and cursorbind, all panes
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

" F12 - Toggle mouse support
map <silent> <F12> :call ToggleMouse()<CR>

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

if has("Win32")
  set termguicolors
endif

".......................... NetRW ..........................."
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

" Netrw confined to 30 columns
let g:netrw_winsize = -30

" Netrw buffer settings
let g:netrw_bufsettings = 'nomodifiable nomodified readonly nobuflisted nowrap nonumber'

" Hide dotfiles in netrw with gh to toggle, thanks to
"  https://vi.stackexchange.com/questions/18650/how-to-make-netrw-start-with-dotfiles-hidden
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

"....................... Color Scheme ......................."
let g:LightsOn = 0
if !has('gui_running') && !empty(glob("~/.vim/colors/PaperColor.vim"))
  color PaperColor
  " Set background to 'light' between 6am and 6pm, otherwise
  " set to 'dark' with " coordinated ALE colors.
  "
  " See also mapping for F6 to toggl
  "
  " Thanks to Tan Wei Hao:
  " https://medium.com/@bentanweihao/switch-between-solarized-light-dark-in-vim-auto-magically-18ed5a8ff88f
  let hour = strftime("%H")
  if 6 <= hour && hour < 18
    set background=light
    let g:LightsOn = 1
    " Set ALE colors and highlights
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Yellow
      highlight ALEError ctermbg=Lightred
      highlight ALEWarningSign ctermfg=Darkyellow
      highlight ALEErrorSign ctermfg=Darkred
    endif
  else
    set background=dark
    let g:LightsOn = 0
    if !empty(glob("~/.vim/bundle/ale"))
      highlight ALEWarning ctermbg=Yellow ctermfg=Black
      highlight ALEError ctermbg=Red ctermfg=Black
      highlight ALEWarningSign ctermfg=Yellow
      highlight ALEErrorSign ctermfg=Red
    endif
  endif
else
  color elflord
endif

" " Uncomment this block to default to dark background
" color PaperColor
" set background=dark
" if !empty(glob("~/.vim/bundle/ale"))
"   highlight ALEWarning ctermbg=Yellow ctermfg=Black
"   highlight ALEError ctermbg=Red ctermfg=Black
"   highlight ALEWarningSign ctermfg=Yellow
"   highlight ALEErrorSign ctermfg=Red
" endif

"......................... Plugins .........................."
" Enable plugins
if isdirectory("~/.vim/bundle")
  filetype plugin on
endif

" Load Pathogen, if this is the cli and it's there
if !has('gui_running') && !empty(glob("~/.vim/autoload/pathogen.vim"))
  execute pathogen#infect()
  Helptags
endif

" ALE Icons and highlights
if !empty(glob("~/.vim/bundle/ale"))
  let g:ale_sign_error = '✗▐'
  let g:ale_sign_warning = '▲▐'
  let g:ale_set_highlights = 1
  nnoremap <C-n> :ALENext<CR>
  nnoremap <C-p> :ALEPrevious<CR>
endif

" Enable ALE for Java only if checkstyle is present,
" otherwise java linting gets weird
if executable("checkstyle")
  let g:ale_pattern_options = {'\.java$': {'ale_enabled': 1}}
else
  let g:ale_pattern_options = {'\.java$': {'ale_enabled': 0}}
endif

" GitGutter
if !empty(glob("~/.vim/bundle/vim-gitgutter"))
  let g:gitgutter_sign_added              = '+▐'
  let g:gitgutter_sign_modified           = '~▐'
  let g:gitgutter_sign_removed            = '-▐'
  highlight GitGutterChange guifg=#bbbb00 ctermfg=6 " cyan ~
endif

" Airline, Powerline, Tmuxline options for CLI only
if !has('gui_running') && !empty(glob("~/.vim/autoload/pathogen.vim"))
  " Vim-airline replace file encoding info with buffer number
  let g:airline_section_y = '♯%{bufnr("%")}'
  let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
  let g:airline_powerline_fonts = 1
  let g:tmuxline_powerline_separators = 1
  let g:promptline_powerline_symbols = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#tab_min_count = 2
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#branch#format = 1
  " Remove paths from tab names, add modification status
  let g:airline#extensions#tabline#fnamemod = ':t: %M.'

  let g:airline_theme='minimalist'

  let g:tmuxline_preset = {
      \'a'       : '#H',
      \'win'     : '#I \ue0b1 #{b:pane_current_path}',
      \'cwin'    : '#I \ue0b1 #{b:pane_current_path}',
      \'x'       : '%a %b %d',
      \'y'       : '%I:%M %p',
      \'z'       : '#S',
      \'options' : {'status-justify' : 'left'}}

  " Promptline settings
  " Update ~/.bash_promptline.sh with:
  "     :PromptlineSnapshot ~/.bash_prompt.sh airline
  let g:promptline_symbols = {
      \ 'dir_sep'        : '/'}
  let g:promptline_preset = {
        \'a'    : [ '\@' ],
        \'b'    : [ '\h' ],
        \'c'    : [ '\W' ],
        \'y'    : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ] }
  let airline#extensions#promptline#snapshot_file = "~/.bash_prompt.sh"
endif

" NERDTree
if !has('gui_running')
  " Open the existing NERDTree on each new tab.
  autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

  " NERDTree minimal UI
  let NERDTreeMinimalUI=1

  " Thicker NERDTree arrows
  let g:NERDTreeDirArrowExpandable = '▷'
  let g:NERDTreeDirArrowCollapsible = '▽'
  let NERDTreeIgnore=['\.vim$', '\.swp$', '.git*', '\~$']

  " Exit Vim if NERDTree is the only window remaining in the only tab.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | echo feedkeys("ZZ") | endif

  " Exit Vim if NERDTree is the only window remaining in the only window.
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | echo feedkeys("ZZ") | endif
endif

" Center a selection
" Reference: https://stackoverflow.com/questions/26137838/vim-centering-text-within-selection
function! GetVisual()
    try
        let v_save = @v
        normal! gv"vy
        return @v
    finally
        let @v = v_save
    endtry
endfunction

fun! CenterMe()
    let v = GetVisual()
    "let l = getline('.')
    let lre = '^\zs\s*\ze\S'
    let rre = '\s*$'
    let sp= matchstr(v,lre)
    let sp .= matchstr(v,rre)
    let ln=len(sp)
    let v = substitute(v,lre,sp[:ln/2-1],'')
    let v = substitute(v,rre,sp[ln/2:],'')
    let ve_save = &virtualedit
    let v_save = @v
    let &virtualedit = 'all'
    call setreg('v', v,visualmode())
    normal! gvx"vP
    let @v = v_save
    let &virtualedit = ve_save
endf

" vim: nospell number
