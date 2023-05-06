set nocompatible
filetype off

call plug#begin( has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged' )

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
" provides insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
"Plug 'sheerun/vim-polyglot'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'liuchengxu/vista.vim'
Plug 'brooth/far.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'ryanoasis/vim-devicons' " Icons without colours
"Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

Plug 'iamcco/markdown-preview.nvim'
Plug 'ferrine/md-img-paste.vim'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif

Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'
" Smart selection of the closest text object.
Plug 'gcmt/wildfire.vim'

" Visualize your Vim undo tree.
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'jiangmiao/auto-pairs'

Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'terryma/vim-multiple-cursors'
Plug 'justinmk/vim-sneak'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
"Plug 'luochen1990/rainbow'

" Plug 'neoclide/coc.nvim' { 'branch': 'master', 'do': 'npm install --frozen-lockfile' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
"Plug 'neoclide/coc-tsserver', { 'do': 'npm install --frozen-lockfile' }
Plug 'neoclide/coc-java', { 'do': 'npm install --frozen-lockfile' }
"Plug 'clangd/coc-clangd', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-html', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-eslint', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-yaml', { 'do': 'npm install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-snippets', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-css', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-highlight', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-vetur', { 'do': 'npm install --frozen-lockfile' }
"Plug 'neoclide/coc-neco', { 'do': 'npm install --frozen-lockfile' }
Plug 'iamcco/coc-vimlsp', { 'do': 'npm install --frozen-lockfile' }
"Plug 'yaegassy/coc-pylsp', {'do': 'npm install --frozen-lockfile' }
"Plug 'coc-extensions/coc-omnisharp', { 'do': 'npm install --frozen-lockfile' }
"Plug 'josa42/coc-lua', {'do': 'npm install --frozen-lockfile'}
"Plug 'xiyaowong/coc-sumneko-lua', {'do': 'npm install --frozen-lockfile'}
"Plug 'iamcco/coc-spell-checker', { 'do': 'npm install --frozen-lockfile' }
Plug 'rafamadriz/friendly-snippets'


" Color Scheme
" Plug 'blueshirts/darcula'
" Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'rainglow/vim'
Plug 'Mofiqul/vscode.nvim'
Plug 'martinsione/darkplus.nvim'

call plug#end()
