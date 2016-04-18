call pathogen#infect()
syntax enable
set iskeyword+=:
let maplocalleader=","
let mapleader=","
"filetype plugin indent on

"=====================[color settings below]=======
"set background=light
"set background=dark
"colorscheme default 

let g:solarized_termcolors=256
set t_Co=256
"highlight column numbers background black
"highlight LineNr ctermbg=black
"highlight column nubers white 
"highlight LineNr ctermfg=darkgrey
"=====================[color settings Above]=======

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <Esc><Esc> :w<CR>
"for mapping keys to behve better on text wrap
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
"========================[Vundle Set up Requirements]====================
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
"=======================[Vundle set up above]============================

"highlight LineNr ctermfg=grey
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
Plugin 'vim-latex/vim-latex'
Plugin 'vim-auto-save'
Plugin 'vim-unimpaired'
Plugin 'lervag/vimtex'
call vundle#end()



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
"=====[ Highlight matches when jumping to next ]=============
"Maps 'n' key to jump to the next match during search
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>
"// Highlight method below not working.
"then Highlight the match in red
" for /"someword" -- COMMENT HERE LEAVE
"function! HLNext (blinktime)
"    let [bufnum, lnum, col, off] = getpos('.')
"    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"    let target_pat = '\c\%#'.@/
"    let ring = matchadd('WhiteOnRed', target_pat, 101)
"    redraw
"    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"    call matchdelete(ring)
"    redraw
"endfunction


"=====[ Remapping CAPS terminal command ]================
"xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"   #this will make Esc to act as Caps Lock
"xmodmap -e "keycode 66 = Escape NoSymbol Escape"        #this will make Caps Lock to act as Esc
"=======[Ruler setting]====================
set ruler
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"=================[vim-auto-save]===========
let g:auto_save = 0 "enables auto save set to 1"
let g:auto_save_silent = 0  " do not display the auto-save notification
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
"=================[vim-auto-save]===========

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

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


" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:


"set g:Tex_CompileRule <fmt> =". . ." 
"set compilation rule (fmt is dvi, pdf, etc.)
let g:Tex_FormatDependency_pdf = "dvi,pdf"
"define dependency
let g:Tex_MultipleCompileFormats = "dvi"
"generate dvi target in multiple passes (intelligently)
"let TCLevel 3
"ignore warnings matching first 3 patterns in
"let g:Tex_IgnoredWarnings
"set TCLevel strict
"display all errors and warnings
let g:Tex_DefaultTargetFormat = "pdf"
"set default target to pdf
let g:Tex_ViewRule_dvi = "xdvi" 
"set dvi viewer
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:vimtex_fold_enabled = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_toc_resize = 0
let g:vimtex_toc_hide_help = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_latexmk_enabled = 1
let g:vimtex_latexmk_callback = 0
let g:vimtex_complete_recursive_bib = 0
set clipboard=unnamedplus "allows for normal Copy/Paste like Windows & Linux"
