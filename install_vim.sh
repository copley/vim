#!/bin/bash
# install_vimrc.sh
# This script installs a custom Vim configuration file (~/.vimrc)
# containing various settings, plugin configurations, and key mappings.

# Backup any existing .vimrc file
if [ -f "$HOME/.vimrc" ]; then
    echo "Backing up existing ~/.vimrc to ~/.vimrc.bak"
    cp "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi

# Write the Vim configuration to ~/.vimrc
cat << 'EOF' > "$HOME/.vimrc"
" Load Pathogen
execute pathogen#infect()
filetype plugin indent on
syntax enable

let g:pymode_python = 'python3'

" Pathogen initialization
map <F7> mzgg=G`z " .cshrc is the bash script file, also fixes file indentation
call pathogen#infect()
syntax enable
set iskeyword+=:
let maplocalleader=","
let mapleader=","
filetype plugin indent on   " Allow plugin indentation
filetype plugin on          " REQUIRED for Latex-Suite when opening a tex file
set showcmd                 " Show command in bottom bar

" Color Settings
let g:solarized_termcolors = 256
set t_Co = 256
set background = light
let g:bluedrake_256 = 1
colorscheme default         " Options: default, sprinkles, lightning, etc.
let xterm16_colormap = 'softlight'
let xterm16_brightness = 'high'

" Key Mappings
map <F6> :%s/\t/  /g<CR>:w<CR>
map <F2> :!ruby
map <F12> :NERDTree<CR>
set clipboard = unnamedplus
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Remove certain keys in insert mode
imap <PageUp> <nop>
imap <PageDown> <nop>
imap <HOME> <nop>
imap <End> <nop>
" Remove certain keys in normal mode
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
nnoremap <HOME> <nop>
nnoremap <End> <nop>

" Allow easy movement between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Indent features
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" Vundle setup requirements
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set number
set mouse=a

execute pathogen#infect()
filetype plugin on

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vundle plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-auto-save'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'ternjs/tern_for_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'wimstefan/Lightning'
call vundle#end()

" Silver Searcher config
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Highlight the 81st column of wide lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Show tabs, trailing whitespace, non-breaking spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Terminal key remapping (commented out)
" xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
" xmodmap -e "keycode 66 = Escape NoSymbol Escape"

set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" vim-auto-save
let g:auto_save = 0
let g:auto_save_silent = 0

" vim-latex config
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor = 'latex'
set sw=2
set iskeyword+=:

let g:Tex_FormatDependency_pdf = "dvi,pdf"
let g:Tex_MultipleCompileFormats = "dvi"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_dvi = "xdvi"
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:vimtex_fold_enabled = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_toc_resize = 0
let g:vimtex_toc_hide_help = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_latexmk_enabled = 1
let g:vimtex_latexmk_callback = 0
let g:vimtex_complete_recursive_bib = 0
set clipboard = unnamedplus

" AutoComplete setup
set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" dragvisuals.vim
runtime plugin/dragvisuals.vim
vmap <expr> <LEFT>  DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN>  DVB_Drag('down')
vmap <expr> <UP>    DVB_Drag('up')
vmap <expr> D       DVB_Duplicate()
let g:DVB_TrimWS = 1

" NERDTree settings
set modifiable
autocmd BufEnter * lcd %:p:h

" End of Vim configuration
EOF

echo "Vim configuration installed successfully at ~/.vimrc"
