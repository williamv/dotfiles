" Necessary on some Linux distros for pathogen to properly load bundles, does
" on before off to fix exit code issue
" http://tooky.github.com/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
filetype on
filetype off

" Enable plugin bundles with pathogen
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Don't maintain compatibility
set nocompatible

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Enable filetype plugins
filetype plugin indent on

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
set shiftround
set autoindent
set expandtab " Don't use tab characters
set showmatch
set showcmd
set showmode
set showbreak=...
set mat=5
set list
set wrap linebreak
set nohid

" Save info in history
set viminfo=%,'1000,f1,<500,n~/.viminfo

" Color scheme
set background=dark
colorscheme railscasts

" Add extra highlighting to comments to make them stand out
highlight comment ctermfg=cyan ctermbg=blue

" Status line
set statusline=[%n]\ %f\ %m\ %y

" Git
set statusline+=%{fugitive#statusline()}

" RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Always show the status line
set laststatus=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set foldlevel=5

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

" Remove trailing whitespace on save of these types of files
" XXX: Too slow and risky
" autocmd BufWritePre *.rb,*.haml,*.js,*.c,*.cpp,*.h,*.hpp :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\S\\@<=\\s\\+$","","")'))

" Use matching above, don't use listchars
set nolist

" Only visually wrap lines on whitespace
set lbr

" No beeping or visual bell
set noerrorbells
set vb

" Change comment highlighting - i like them extra visible
highlight Comment ctermfg=cyan guifg=cyan ctermbg=darkblue guibg=#202060
" highlight Comment guifg=#fdf6e3 guibg=#657b83 ctermfg=cyan ctermbg=blue

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

" Function to add GEM_HOME to tags path
function! SetTags()
  set tags='./tags'
  if !empty($GEM_HOME)
    let tag_path = ',' . substitute($GEM_HOME, '\(:\|$\)', '/tags,', 'g')
    set tags += tag_path
endfunction

" Command-t fuzzy finder plugin options in bundle/command-t
set wildignore+=public/javascripts/dojo/**

" Flog
:silent exe "g:flog_enable"

" Clear highlighted search items by pressing space
nmap <SPACE> <SPACE>:noh<CR>
