filetype plugin indent on

set spl=nl

set shiftwidth=2
set tabstop=2
set iskeyword+=:
set tw=100
set cc=100

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats="pdf"
" let g:Imap_UsePlaceHolders=0
let g:Tex_UseMakefile=0
let g:Tex_GotoError=0
let g:Tex_ViewRule_pdf='evince &>/dev/null'
