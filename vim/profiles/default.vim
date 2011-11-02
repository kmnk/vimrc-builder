" default.vim

"
syntax on

" 256 colors
set t_Co=256

" status line settings
set laststatus=2
let &statusline = '%<%f %m%r%h%w[%{(&fenc!=""?&fenc:&enc)}][%{&ff}]%=%{cfi#format("[%s()]", "no function")} %l,%c%V%8P'

" default tab space settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" show last command
set showcmd

" show matching bracket
set showmatch

"
set hlsearch

" no error alarm
set vb t_vb=

" backspace
set backspace=indent,eol,start

" break undo sequence on <C-w>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Leader>lv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Leader>lg :<C-u>source $MYGVIMRC<CR>

" create swp data to only tmp directory
set directory&
set directory-=.

augroup vimrc-auto-mkdir  "{{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  "{{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  "}}}
augroup END  "}}}

" syntax completion settings {{{
filetype on
filetype plugin on

" syntax completetion on any language {{{
autocmd VimrcAutoCmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
"}}}

set pumheight=20
set completefunc=
set omnifunc&
set omnifunc+=
"}}}

" open popup in always
set completeopt=menuone,preview
" completion targets
set complete=.,w,b,u,t,i

" encoding settings {{{
set encoding=utf-8
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencoding=utf-8
set fileformat=unix
"}}}

"
set foldmethod=marker

" vim: expandtab softtabstop=2 shiftwidth=2
