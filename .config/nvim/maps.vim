" Clear a search
nmap <silent> <backspace> :nohlsearc<cr>
" Back to normal mode
imap jj <esc>
" Yank to system clipboard
vnoremap <silent> <leader>y :w !pbcopy<cr><cr>
" Paste from system clipboard
map <silent> <leader>v :r !pbpaste<cr>
" Go to pane in split window
map <c-h> <C-w>h
map <c-j> <C-w>j
map <c-k> <C-w>k
map <c-l> <C-w>l
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" Go to next and previous tab
nnoremap <leader>l gt
nnoremap <leader>h gT
" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader><tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader><tab> :exe "tabn ".g:lasttab<cr>

" Nerdcommenter
" Comment/uncomment single line
nnoremap <silent> <leader>c V:call nerdcommenter#Comment('x', 'toggle')<CR>
" Comment/uncomment block of code
vnoremap <silent> <leader>c :call nerdcommenter#Comment('x', 'toggle')<CR>
" Comment/uncomment entire paragraph
"nnoremap <silent> <leader>p vip:call nerdcommenter#Comment('x', 'toggle')<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
