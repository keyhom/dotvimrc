" Vundle Settings {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Code completions
Plugin 'valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'                                                    " ZenCoding
Plugin 'Raimondi/delimitMate'

" snippets
"Plugin 'SirVer/ultisnips'

" Fast editing
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'

" Fast navigations
Plugin 'edsono/vim-matchit'
Plugin 'Lokaltog/vim-easymotion'

" IDE features
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"Plugin 'humiaozuzu/TabBar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'

" Gits
"Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'

" Color scheme
Plugin 'flazz/vim-colorschemes'

" Python
"Plugin 'davidhalter/jedi-vim'

" Lua
Plugin 'xolox/vim-misc'                                                     " required by lua.vim
Plugin 'xolox/vim-lua-ftplugin'                                             " Lua file type plug-in for the Vim text editor

" Javascript
Plugin 'marijnh/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'nono/jquery.vim'

" Html5
Plugin 'othree/html5.vim'

" Json
Plugin 'elzr/vim-json'

" Less
Plugin 'groenewege/vim-less'

" Other utils
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-reload'
Plugin 'vim-scripts/a.vim'

call vundle#end()
" }}}

" Debug vimrc {{{
" Fast editing of the .vimrc and reload
if has('win32') || has('win64')
  map <silent> <leader>e :e! ~/_vimrc<cr>
  map <silent> <leader>te :tabe! ~/_vimrc<cr>
  autocmd! bufwritepost _vimrc source ~/_vimrc
else
  map <silent> <leader>e :e! ~/.vimrc<cr>
  map <silent> <leader>te :te! ~/.vimrc<cr>
  autocmd! bufwritepost .vimrc source ~/.vimrc
endif
" }}}

" General {{{
" With a map leader it's possible to do extra key combinations.
let mapleader=","
let g:mapleader=","

" encoding dectection
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" }}}

" VIM GUI {{{

syntax on

" color scheme
set background=dark
colo solarized

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" }}}

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Editor settings {{{
set wildmenu                                    " Turn of wildmenu
set history=1000                                " Sets how many lines of history VIM has to remember
set nocompatible
set nofoldenable                                " disable folding
set confirm                                     " prompt when existing from an unsaved file
set backspace=indent,eol,start                  " More powerful backspacing
set whichwrap+=<,>,h,l
set t_Co=256                                    " Explicity tell vim that the terminal has 256 colors
set mouse=a                                     " Use mouse in all modes
set report=0                                    " Always report number of lines changed
set nowrap                                      " Don't wrap lines
set scrolloff=5                                 " 5 lines above/below cursor when srolling
"set number                                     " Show line number
set showmatch                                   " Show matching bracket (briefly jump)
set showcmd                                     " Show typed command in status bar
set title                                       " show file in titlebar
set laststatus=2                                " Use 2 lines for the status bar
set matchtime=2                                 " Show matching bracket for 0.2 seconds
"set matchpairs+=<:>                             " Specially for HTML
"set relativenumber
set autoread                                    " Set to auto read when a file is changed from the system
"set wildmenu                                   " Turn on wild menu
set ruler                                       " Always show current position
set cmdheight=2                                 " Set 2 lines command bar
set hidden                                      " Change buffer - without saving
"set nolazyredraw                                " Don't redraw while executing macros
"set magic                                       " Set magic on, for regular expressions
set noerrorbells                                " No sound on errors
set novisualbell
"set t_vb=
"set timeoutlen=500
set modeline                                    " Enable the modeline

" Try to set lang to 'en_US'
try
  lang en_US
catch
  let $LANG='en_US'
endtry

" Set the default file types
set fileformats=unix,dos,mac

" Default indentation
set autoindent
set smartindent
set tabstop=4                                   " tab width
set softtabstop=4                               " backspace
set shiftwidth=4                                " indent width
set expandtab                                   " expand tab to space
set smarttab
"set linebreak                                  " enable line break
"set textwidth=78

" default options for 'c/c++" indent.
autocmd! FileType c,cpp setlocal cinoptions=>4,:4,l1,g0,N-s,t0,(0,u0,w1,m1,j1,J1

" }}}

" Useful Functions {{{
" ------------------------------------------------------------------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
"nnoremap ; :
":command! W w
":command! WQ wq
":command! Wq wq
":command! Q q
":command! Qa qa
":command! QA qa

" Spell checking
nmap <silent> <leader>ss :setlocal spell!<cr>
" Toggle paste mode
nmap <silent> <leader><leader>p :setlocal paste!<cr>
" Fast quit file
nmap <silent> <leader>q :q<cr>
" Remove the windows ^M - when the encodings gets messed up.
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Files backups and undo
" Turn backup off, since most stuff is in SVN, git anyway ...
set nobackup
set nowritebackup
set noswapfile

"Set undo in temp
try
 set undodir=$temp
 set undofile
catch
endtry

" Fast grep content in files by magic.
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Shift+Enter and Ctrl+Shift+Enter in insert mode to fast editing
imap <S-CR> <ESC>o
imap <C-S-CR> <ESC>O

" Bash like keys for the command line.
cno <C-H> <HOME>
cno <C-L> <END>
cno <C-P> <Up>
cno <C-N> <Down>

" }}}

" FiletypeEx {{{
augroup FileTypeEx
  au!
  autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
  autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
  autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
  autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
  autocmd BufNewFile,BufRead *.apt setf apt
  autocmd BufNewFile,BufRead *.vm setf vm
  autocmd BufNewFile,BufRead *.properties setf properties
  autocmd BufNewFile,BufRead *.mxml setf mxml
  autocmd! BufNewFile,BufRead,BufWritePost *vimrc setf vim
augroup END
" }}}

" syntax support
" autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
" let g:html_indent_inctags = "html,body,head,tbody"
" let g:html_indent_script1 = "inc"
" let g:html_indent_style1 = "inc"

" Plugin Settings {{{
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<leader>'

" Tagbar
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "left"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
"let g:user_emmet_expandabbr_key='<C-j>'

" Enable omni completion.
"autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd! FileType html setlocal omnifunc=tern#Complete|call tern#Enable()
"autocmd! FileType html setlocal omnifunc=tern#Complete|call tern#Enable()|set ft=html.javascript_tern|set ft=html.javascript
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS         " Conflicts with TERN_FOR_VIM


" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>
nmap <F9> :TagbarToggle<cr>
nmap <F8> :NERDTreeToggle<cr>
"nmap <F3> :GundoToggle<cr>
nmap <leader>l :IndentLinesToggle<cr>
nmap <leader><cr> :nohl<cr>
"nmap  <D-/> :
nnoremap <leader>a :Ack

" powerline
set fillchars+=stl:\ ,stlnc:\ 
let g:Powerline_symbols = 'fancy'
" airline
"let g:airline_section_b = '${strftime("%c")}'
"let g:airline_section_y = ' BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep = '⮀'
"let g:airline#extensions#tabline#left_alt_sep = '⮁'
"let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_left_sep = '⮀'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = 'LN'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '[PASTE]'
let g:airline_symbols.whitespace = 'Ξ'

" Conflicts fixed
" Lua supported

let g:lua_complete_omni=1
let g:lua_internal=0
let g:lua_compiler_name="luajit"

let g:indentLine_enabled=0
let g:indentLine_char='.'

" remove whitespace on save
"autocmd BufWritePre * :FixWhitespace

" }}}

" For GVIM/MACVIM {{{
if has('gui_running')
  " disabled the toolbar
  set guioptions-=T
  " disabled the menubar
  "set guioptions-=m
  " disabled the left scroller
  set guioptions-=L
  set guioptions-=l
  " disabled the right scroller
  set guioptions-=R
  set guioptions-=r
  " disabled the windows look tabber.
  set guioptions-=e
  "set transparency=30
  set showtabline=2
  set columns=160
  set lines=40
  noremap <D-M-left> :tabprevious<cr>
  noremap <D-M-right> :tabnext<cr>
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<cr>
endif
" }}}

" vi:ft=vim fdm=manual sw=2 ts=2

