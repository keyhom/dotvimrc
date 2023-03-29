let s:is_neovim = has('nvim')

function! CommonSetup()
    filetype plugin indent on
    syntax on

    set tabstop=4
    set shiftwidth=4
    set expandtab
    set splitbelow
    set previewheight=1
    set signcolumn=yes
    set encoding=utf-8
    set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set confirm
    set report=0
    set number
    set relativenumber
    set scrolloff=5
    set showmatch
    set showcmd
    set title
    set laststatus=2
    set noerrorbells
    set novisualbell
    set matchtime=2
    set backspace=2
    set autoread
    set ruler
    set mouse=a
    set cmdheight=2
    set hidden
    set modeline
    set autoindent
    set smartindent
    set smarttab
    set nobackup
    set nowritebackup
    set noswapfile
    set history=1000
    set updatetime=500
    if !s:is_neovim
        set ttymouse=sgr
        set balloondelay=250
        set t_ut=
        set vb t_vb=
        au GuiEnter * set t_vb=
        set nocompatible
        set t_Co=256
    endif
    if has("patch-8.1.1904")
        set completeopt+=popup
        set completepopup=align:menu,border:off,hightlight:Pmenu
    endif
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    set bg=
endfunction

function! NerdTreeSetup()
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
    let g:NERDCustomDelimiters = {
          \ 'as3': { 'left' : '//', 'leftAlt': '/*', 'rightAlt': '*/' },
          \ 'shaderlab': { 'left' : '//', 'leftAlt': '/*', 'rightAlt': '*/' },
          \ 'cg': { 'left' : '//', 'leftAlt': '/*', 'rightAlt': '*/' },
          \ 'glsl': { 'left' : '//', 'leftAlt': '/*', 'rightAlt': '*/' },
          \ 'hlsl': { 'left' : '//', 'leftAlt': '/*', 'rightAlt': '*/' },
          \ }
endfunction

function! KeyMappingSetup()
    let mapleader=","
    let g:mapleader=","

    cmap w!! %!sudo tee >/dev/null %

    " easier navigation between split windows
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
    nmap <F9> :TagbarToggle<cr>
    nmap <F8> :NERDTreeToggle<cr>
    nmap <F3> :GundoToggle<cr>
    " nmap <leader>l :IndentLinesToggle<cr>
    nmap <leader><cr> :nohl<cr>
    vnoremap <leader>y "+y
    vnoremap <leader>p "+p
    nnoremap <leader>p "+p
    " Bash like keys for the command line.
    " Spell checking
    nmap <silent> <leader>ss :setlocal spell!<cr>
    " Toggle paste mode
    nmap <silent> <leader><leader>p :setlocal paste!<cr>
    " Fast quit file
    nmap <silent> <leader><space>q :q<cr>
    " Fast write file
    nmap <silent> <leader><space>w :w<cr>
    cno <C-H> <HOME>
    cno <C-L> <END>
    cno <C-P> <Up>
    cno <C-N> <Down>

    nmap <leader><space>p :CtrlP<cr>

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-y>" : "\<TAB>"
    inoremap <silent><expr> <CR>
          \ pumvisible() ? "\<C-y>" : "\<CR>"
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <S-CR> <ESC>o
    inoremap <C-S-CR> <ESC>O
endfunction

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

function! EasyMotionSetup()
    " easy-motion
    let g:EasyMotion_leader_key = '<leader>'
endfunction

function! AirLineSetup()
    " Set full path for vim-airline.
    let g:airline_section_c = '%F'
    "let g:airline_symbols.dirty='⚡'
    let g:airline#extensions#tabline#enabled=1

    set fillchars+=stl:\ ,stlnc:\ 

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    " unicode symbols
    " let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    " let g:airline_symbols.linenr = '☰'
    " let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    let g:airline_symbols.paste = '[PASTE]'
    " let g:airline_symbols.spell = 'Ꞩ'
    " let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    " let g:airline_left_sep = ''
    " let g:airline_left_alt_sep = ''
    " let g:airline_right_sep = ''
    " let g:airline_right_alt_sep = ''
    " let g:airline_symbols.branch = ''
    " let g:airline_symbols.readonly = ''
    " let g:airline_symbols.linenr = '☰'
    " let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.dirty='⚡'

    " old vim-powerline symbols
    " let g:airline_left_sep = '⮀'
    " let g:airline_left_alt_sep = '⮁'
    " let g:airline_right_sep = '⮂'
    " let g:airline_right_alt_sep = '⮃'
    " let g:airline_symbols.branch = '⭠'
    " let g:airline_symbols.readonly = '⭤'
    " let g:airline_symbols.linenr = '⭡'

    " let g:airline_powerline_fonts = 1
    let g:airline_exclude_preview = 1
endfunction

function! CtrlPSetup()
    " ctrlp
    set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store,*/proj.*/*  " MacOSX/Linux
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)$|proj\.\v$|node_modules)',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

    let g:ctrlp_working_path_mode=''
    let g:ctrlp_follow_symlinks=1
    " let g:ctrlp_match_window_reversed=0
    let g:ctrlp_max_height=15
    let g:ctrlp_mruf_max=500
endfunction

function! OtherSetup()
    let g:UltiSnipsExpandTrigger = '<Enter>'
    let g:UltiSnipsListSnippets = '<C-TAB>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    set cursorline
    set cursorcolumn

    if exists('g:neovide')
        let g:neovide_cursor_vfx_mode = 'ripple'
    endif
endfunction

function! IndentLineSetup()
    let g:indentLine_enabled=1
    let g:indentLine_char='¦'
    let g:indentLine_first_char='¦'
    " let g:indentLine_char = '┊'
    " let g:indentLine_color_term = 239
    " let g:indentLine_color_gui = '#A4E57E'
    let g:indentLine_color_tty_light = 4
    let g:indentLine_color_tty_dark = 2
    let g:indentLine_faster = 1
    let g:indentLine_leadingSpaceChar = '·'
    let g:indentLine_leadingSpaceEnabled = 0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_start_level = 2
endfunction

function! CocSetup()
    let g:coc_global_extensions = ['coc-tsserver', 'coc-clangd', 'coc-html', 'coc-eslint', 'coc-yaml', 'coc-snippets', 'coc-css', 'coc-highlight', 'coc-vetur', 'coc-omnisharp', 'coc-sumneko-lua', 'coc-spell-checker']
    "inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
endfunction

call NerdTreeSetup()
call CommonSetup()
call KeyMappingSetup()
call AirLineSetup()
call EasyMotionSetup()
call CtrlPSetup()
call OtherSetup()
call IndentLineSetup()
call CocSetup()

color material

