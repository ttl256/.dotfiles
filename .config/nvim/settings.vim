"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HOW TO LIVE WITH VIM
"
" Check setting's current status: set <option>?
" Example: set hlsearch?
" Check where a setting was set the way it is: verbose set <option>?
" Example: verbose set hlsearch?
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" formatoptions=jcroql
" /usr/local/Cellar/neovim/0.4.4/share/nvim/runtime/ftplugin/

""" Backup, swap, undo
" Set backup files which contain a version of a file before the edit
set backup
if !isdirectory($HOME . "/tmp")
	call mkdir($HOME . "/tmp", "p")
endif
for i in ["backup", "swap", "undo"]
	if !isdirectory($HOME . "/tmp/" . i)
		call mkdir($HOME . "/tmp/" . i, "p")
	endif
endfor
set backupdir^=$HOME/tmp/backup//
" Set swap files which contain unsaved changes
" vim -r show all files that have swap file
" vim -r <filename> to restore file from swap
" then save file and delete swap file
set swapfile
set directory^=$HOME/tmp/swap//
" Set undo files which keep undo tree of an edited file
set undofile
set undodir^=$HOME/tmp/undo//
"""

let mapleader=","
set encoding=utf-8
set tabstop=4
set shiftwidth=4

" Number lines in hybrid mode. Absolute + relative.
set number relativenumber
" Show matching brackets.
set showmatch
" Case insensitive matching.
set ignorecase
" When typing an upper case letter consider it seriously.
set smartcase
" Highlight search results.
set hlsearch
" Dynamically display pattern match while searching.
set incsearch
" Define characters to display when 'list' is set to show eol, tabs and
" spaces. Use ':set list' to toggle hidden characters.
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»

" COLORS
" Create colorscheme BadWhitespace. Further used in ftplugin/python.vim.
" Works only BEFORE colorscheme command.
autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=red
" 'syntax enable' keeps your custom highlighting. 'syntax on' forces
" VIM's default highlighting.
let g:python_highlight_all=1
syntax enable
if has('nvim')
	set termguicolors
else
	set t_Co=256
endif

colorscheme codedark
" highlight ColorColumn guibg=#403f3f
"
" set colorcolumn=+1

" SOFT WRAPPING
"
" Text wraps at the rigth side of the terminal to look nicer.
set wrap
" Don't wrap inside a word, use word boundary to wrap.
set linebreak

" HARD WRAPPING (VIM inserts eol)
"
" 'help fo'
" 'help fo-table'
"set textwidth=80
"set fo=tcroqp
"set fo-=l
"set fo-=j

" FOLDING
set foldmethod=indent
set foldlevel=99

set pumheight=7

" Change keyboard layout to russian with Ctrl-^
" Mapping for commands in normal mode stays the same
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" NERDTree
let NERDTreeShowHidden=1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

set completeopt=menu,menuone


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event
" handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
