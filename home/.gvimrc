" Load window size out of saved sessions
set sessionoptions+=resize

" fullscreen maximizes vertically AND horizontally
set fuoptions=maxvert,maxhorz

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
let NERDShutUp = 1 " so it doesn't complain about types it doesn't know

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" bind command-option-l to toggle line numbers
nmap <silent> <D-M-l> :set invnumber<CR>

" open tabs with command-<tab number>
map <silent> <D-1> :tabn 1<CR>
map <silent> <D-2> :tabn 2<CR>
map <silent> <D-3> :tabn 3<CR>
map <silent> <D-4> :tabn 4<CR>
map <silent> <D-5> :tabn 5<CR>
map <silent> <D-6> :tabn 6<CR>
map <silent> <D-7> :tabn 7<CR>
map <silent> <D-8> :tabn 8<CR>
map <silent> <D-9> :tabn 9<CR>

" Command-Return for fullscreen
macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

"turn off needless toolbar on gvim/mvim
set guioptions-=T

source ~/.vimrc

" Use window transparency, must be done after loading .vimrc
set transparency=3
