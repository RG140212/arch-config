syntax enable

" Automatically cd into the directory that the file is in
set autochdir

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

set sw=4
set ts=4

set autoindent
set smartindent

set number

" always show the statusline
set laststatus=2

" don't remove indent on #
inoremap # X<BS>#
inoremap jj <ESC>

" do not swap "-register on visual replace put
vnoremap p "_dP

" don't create swapfiles
set noswapfile
" create backupfiles in another directory
set backupdir=~/.vim/backup

" recognize _ as a word boundary
set iskeyword-=_

set background=dark
set gfn=Inconsolata\ Medium\ 10

" let g:solarized_termcolors = 256
colorscheme solarized

" highlight current line
set cursorline

" highlight char line
set cc=100

" highlight search results
set hlsearch

" when closing tab, remove buffer
set nohidden

augroup filetypedetect
  au BufNewFile,BufRead *.qml set filetype=qml syntax=qml
augroup END
