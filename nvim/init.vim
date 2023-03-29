" set rtp+=~/vimfiles
" source ~/_vimrc
" source ~/AppData/Local/nvim-data/site/autoload/plug.vim

exec 'source ' . fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/plugin.vim'
exec 'source ' . fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/setting.vim'

" source <sfile>:h/plugin.vim
" source <sfile>:h/setting.vim

if exists('g:neovide')
    set guifont=Cascadia\ Code\ PL,SF\ Mono,Monaco,Menlo,Monospaced:h10
endif
