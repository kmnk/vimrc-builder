" set runtimepath to local .vim
let s:local_dot_vim_dir_path = expand('<sfile>:h:h') . '/vim/dot.vim'
execute 'set runtimepath+=' . s:local_dot_vim_dir_path

" initial settings
" my mapleader
let mapleader = ','

" favorite color theme
colorscheme lucius

" local settings
let s:profiles_dir_path = expand('<sfile>:h:h') . '/vim/profiles/'
let s:profile_names = [
\ 'default',
\ 'unite',
\ 'plugins'
\]

" get ready (no need for editing) {{{
" initialize VimrcAutoCmd augroup {{{
augroup VimrcAutoCmd
  autocmd!
augroup END
"}}}

" source bundle at first
execute printf('source %sbundles.vim', s:profiles_dir_path)

" source local settings {{
let g:path_to_vim_profile = '~/.vim_profile'
if filereadable(expand(g:path_to_vim_profile))
  execute printf('source %s', expand(g:path_to_vim_profile))
endif
"}}}

" source profiles {{{
function! s:source_profiles(names)"{{{
  for l:name in a:names
    let l:path = printf('%s%s.vim', s:profiles_dir_path, l:name)
    if filereadable(l:path)
      execute printf('source %s', l:path)
    endif
  endfor
endfunction"}}}
command! -nargs=+ ResourceProfile call s:call_source_profiles(<q-args>)
function! s:call_source_profiles(args)"{{{
  call s:source_profiles(split(a:args, '[, :]'))
endfunction"}}}
call s:source_profiles(s:profile_names)
"}}}
"}}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
