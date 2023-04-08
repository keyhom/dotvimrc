" set rtp+=~/vimfiles
" source ~/_vimrc
" source ~/AppData/Local/nvim-data/site/autoload/plug.vim

exec 'source ' . fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/plugin.vim'
exec 'source ' . fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/setting.vim'

" source <sfile>:h/plugin.vim
" source <sfile>:h/setting.vim

let g:is_darwin = 0
let g:is_linux = 0
let g:is_windows = 0

if has('unix')
    let s:uname = system("echo -n \"$(uname)\"")
    if !v:shell_error && s:uname == "Darwin"
        let g:is_darwin = 1
    elseif !v:shell_error && s:uname == "Linux"
        let g:is_linux = 1
    endif
elseif has('win32') || has('win64')
    let g:is_windows = 1
endif

if exists('g:neovide')
    if g:is_darwin
        set guifont=Cascadia\ Code\ PL,SF\ Mono,Monaco,Menlo,Monospaced:h12
    elseif g:is_windows
        set guifont=Cascadia\ Code\ PL,SF\ Mono,Monaco,Menlo,Monospaced:h10
    endif
endif
