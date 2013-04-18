syntax on

" Automatically cd into the directory that the file is in
set autochdir

set sw=4
set ts=4

set autoindent
set smartindent

set number

set statusline=%F       "full path of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

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
set gfn=Inconsolata\ Medium\ 11

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
