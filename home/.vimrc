" Don't maintain compatibility, be vIMproved
set nocompatible

" Required to load vundle
filetype off

" let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" plugins to use with vundle
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-foreplay'
Bundle 'sexy-railscasts'
Bundle 'VimClojure'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rails.git'
Bundle 'ctrlp.vim'
Bundle 'endwise.vim'
Bundle 'extradite.vim'
Bundle 'github-theme'
Bundle 'SuperTab'
Bundle 'vim-coffee-script'
Bundle 'epmatsw/ag.vim'
Bundle 'The-NERD-Commenter'

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
set hidden " Don't abandon changes to a buffer when it becomes hidden

" Make sure there are at lease 5 lines above/below the cursor when scrolling
" vertically
set so=5

" Save info in history
" '1000 = save marks for 1000 files
" f1 = save global marks
" <500 = save 500 lines per register
" % = save the buffer list
" @1000 = save 1000 lines of input history
set viminfo=%,@1000,'1000,f1,<500
" Save 1000 lines of history
set history=1000

" Color scheme
set background=dark
colorscheme sexy-railscasts

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
highlight Comment ctermfg=cyan ctermbg=darkblue guifg=cyan guibg=#202060

" Incremental search
set incsearch

" Ignore case unless search contains different case characters
set ignorecase
set smartcase

" Highlight the current line the cursor is on
set cursorline

" Flashes matching brackets and parenthesis
set showmatch

" Make shift + y act like shift + C
nnoremap Y y$

" Buf explorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.

" Command-t fuzzy finder plugin options in bundle/command-t
set wildignore+=.git,*.o,*.obj,*.pdf,*.class,*.swp,*.tmp,tmp,log,private,out,dist,vendor,conf/vms

" Clear highlighted search items by pressing space
nmap <SPACE> <SPACE>:noh<CR>

" Turn off the ESC key, this is to train me to use CTRL-C or capslock, which
" are more efficient
" imap <ESC> <Nop>

" Highlight clojurescript like clojure
au BufNewFile,BufRead *.cljs set filetype=clojure

" Fancy synmbols for powerline
let g:Powerline_symbols = 'fancy'

" Automatically determine indenting using fuzzy matching. e.g. the a line starting "(with-"
" will be indented two spaces.
let vimclojure#FuzzyIndent=1

" Highlight built-in functions from clojure.core and friends
let vimclojure#HighlightBuiltins=1

" Highlight functions from contrib
let vimclojure#HighlightContrib=1

" As new symbols are identified using VimClojure's dynamic features, automatically
" highlight them.
let vimclojure#DynamicHighlighting=1

" Color parens so they're easier to match visually
let vimclojure#ParenRainbow=1

" Use tags in gems
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(
      \ pathogen#split(&tags) +
      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))
