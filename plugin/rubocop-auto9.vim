" rubocop-auto9 A plugin for running ruby static code analyzer (rubocop) inside vim
" Maintainer: Rui F. David (rfdavid)
" Version: 1.0
" License: The Unlicense

if exists('g:loaded_rubocop_auto9') || &cp
  finish
endif

let g:loaded_rubocop_auto9 = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists('g:rubocop_command') 
  let g:rubocop_command = "rubocop"
endif

function! s:RuboCopAuto9(args)
  if expand('%') == ""
    echom "You must first load a ruby file"
    return
  endif

  if executable(g:rubocop_command) == 0
    echom "Cannot find rubocop executable!"
    return 
  endif

  silent write
  let l:rubocop_arguments = " -fe emacs " . a:args . " " . expand('%') 
  let l:rubocop_fix_suggestions  = system(g:rubocop_command . l:rubocop_arguments)
  cexpr rubocop_fix_suggestions
  copen

  exec "nnoremap <silent> <buffer> q :ccl<CR>"
  exec "nnoremap <silent> <buffer> o <CR><C-W>:ccl<CR>"
  exec "nnoremap <silent> <buffer> f :ccl<CR>:RuboCopAuto9Correct<CR>"
endfunction

function! s:RuboCopAuto9Correct()
  echom system(g:rubocop_command . " --auto-correct " . expand('%') . " | tail -n 1") 
  silent edit!
endfunction

command! -nargs=* RuboCopAuto9 :call s:RuboCopAuto9(<q-args>)
command! -nargs=0 RuboCopAuto9Correct :call s:RuboCopAuto9Correct()

nnoremap <leader>9 :RuboCopAuto9<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
