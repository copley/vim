set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set t_Co=256
syntax on



colorscheme vividchalk
set background=dark

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'marijhn/tern_for_vim'
Plugin 'rail.vim'
Plugin 'ryhsd/open-pdf.vim'
call vundle#end()
filetype plugin indent on


" These are the tweaks I apply to YCM's config, you don't need them but
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

execute pathogen#infect()
call pathogen#helptags()

