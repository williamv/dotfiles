filetype plugin on
set nocompatible

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


syntax enable
set ruler
set nu
set timeoutlen=250
set bs=2
set hls
set formatoptions=tcqr
set ts=2 sw=2 " Insert two spaces
set smarttab
set expandtab " Don't use tab characters
set showmatch
set mat=5
set list
" Save info in history
set viminfo=%,'1000,f1,<500,n~/.viminfo

highlight comment ctermfg=cyan ctermbg=blue

" Git branch info plugin
set laststatus=2 " Enables the status line at the bottom of Vim
"set statusline=%{GitBranchInfoString()}
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))

" Taglist for f3 button
let Tlist_Sort_Type = 'name'
nmap <F3> :TlistToggle<cr>

" Spell checking
set spell spelllang=en_au
" set spell spelllang=en_au.UTF-8

" Ruby completion
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1

" Whitespace highlighting
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Show leading whitespace that includes spaces, and trailing whitespace.
autocmd BufWinEnter * match ExtraWhitespace /\(\S\+\)\@<=\s\+$\| \+\ze\t\|[^\t]\zs\t\+/

" Use matching above, don't use listchars
set nolist

" Only visually wrap lines on whitespace
set lbr

" No beeping or visual bell
set noerrorbells
set vb

" Change comment highlighting - i like them extra visible
highlight Comment ctermfg=cyan guifg=cyan ctermbg=blue guibg=blue

" Incremental search
set incsearch

" Highlight the current line the cursor is on
set cursorline

" Flashes matching brackets and parenthesis
set showmatch

" Make shift + y act like shift + C
nnoremap Y y$

" Buf explorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.

