" set nocompatible              " required
" filetype off                  " required
" 
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin('~/.config/nvim/bundle')
" 
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" 
" " let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
" Plugin 'vim-python/python-syntax'
" Plugin 'scrooloose/nerdtree'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'preservim/nerdcommenter'
" Plugin 'lifepillar/vim-solarized8'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'edkolev/tmuxline.vim'
" 
" " All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required

set rtp+=~/.config/nvim/bundle/vim-plug.vim
call plug#begin('~/.config/nvim/bundle')

Plug 'vim-python/python-syntax'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

call plug#end()
