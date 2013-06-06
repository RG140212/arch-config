" enable syntax highlighting
syntax on

" enable plugins for filetypes
filetype plugin on

" automatically cd into the directory that the file is in
set autochdir

set shiftwidth=4
set tabstop=4

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
" vim style command-mode shortcut
inoremap jj <ESC>

" easier tabbing in insert mode
inoremap <C-s-t> <ESC>:tabprevious<Enter>i
inoremap <C-t> <ESC>:tabnext<Enter>i

" easier tabbing in cmd mode
noremap H :tabprevious<Enter>
noremap L :tabnext<Enter>

" easier window navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

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

set scrolloff=10

" highlight search results
set hlsearch

" when closing tab, remove buffer
set nohidden

" useful functions
function ScssToSass()
	:%g/\t*}$/d
	:%s/{$//
	:%s/\vimport ['"](.*)['"]/import \1/
	:%s/;// | %s/@include /+/
	:%s/\v^(\s*)(\w[^/]+)(\/\/.*)/\1\3\r\1\2/
	:%s/\v\s+$//
endfunction

command ScssToSass :exec ScssToSass()
