"========================[Vundle Set up Requirements]====================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"=======================[Vundle set up above]============================


"sets clearer colour in terminal
set t_Co=256
"allow syntax highlighting
syntax on


"change number colour
highlight LineNr ctermfg=grey
set number
"set mouse to allow clicking in NERDTree
set mouse=a
"pathogen method below required for YCM package
execute pathogen#infect()

"===========================[Syntastic]==========
"https://github.com/scrooloose/syntastic"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"===========================[Syntastic]==========


"======================[For Vundle package manager]==========
call vundle#begin()
"tern_for_vim -  an additional package for YCM
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

"==============[YCM config methods]=================
let ycm_add_preview_to_completeopt=1
let g:ycm_confirm_extra_conf=1
set completeopt-=preview


"============[Indents with 4 spaces for Tabs]========
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


"====[ Make the 81st column stand out ]====================

" EITHER the entire 81st column, full-screen...
"highlight ColorColumn ctermbg=magenta
"set colorcolumn=81

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" OR ELSE on April Fools day...
"highlight ColorColumn ctermbg=red ctermfg=blue
"exec 'set colorcolumn=' . join(range(2,80,3), ',')



"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"=====[ Highlight the match in red ]=============
" for /"someword"
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction


"=====[ Remapping CAPS terminal command ]================

"xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"   #this will make Esc to act as Caps Lock
"xmodmap -e "keycode 66 = Escape NoSymbol Escape"        #this will make Caps Lock to act as Esc
