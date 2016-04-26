"__________________________________________________________________█Pathogen init
call pathogen#infect()
syntax enable
set iskeyword+=:
let maplocalleader=","
let mapleader=","
filetype plugin indent on "Allows plugin indentation"
filetype plugin on " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
set showcmd " show command in bottom bar"
"__________________________________________________________________█Color Settings
"Color Options > lightning, solarized(dark, light), xterm16

let g:solarized_termcolors=256
set t_Co=256
set background=light

colorscheme lightning

" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
let xterm16_colormap    = 'softlight'
" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
let xterm16_brightness  = 'high'
"set lines=37 columns=90 "For default opening on boot, not working."
"___________________________________________________________________█Key Mappings

"map<F5> :%s/\t/  /g<CR>
map<F6> :%s/\t/  /g<CR>
"map<F6> :<C-U>'%s/\t/  /g'<CR> "creates No mapping error.
"map <F2> :echo 'Current time is ' . strftime('%c')<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"map!<F6>':%s/\s\+$//'<CR> "creates No mapping error. 
"Now using arrow keys for AutoComplete only

"remove page up / page down

imap <PageUp> <nop>
imap <PageDown> <nop>
imap <PageUp> <NOP>
imap <PageDown> <NOP>

imap <HOME> <nop>
imap <HOME> <NOP>
imap <End> <nop>
imap <End> <NOP>

nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>

nnoremap <HOME> <nop>
nnoremap <HOME> <NOP>
nnoremap <End> <nop>
nnoremap <End> <NOP>

"________________________________________________________________█Indent features
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
"_____________________________________________________█Vundle Set up Requirements
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set number "highlight LineNr ctermfg=grey
set relativenumber
set mouse=a "set mouse to allow clicking in NERDTree
"Note: Vim script doesnt allow commenting after the method parenthasis.

execute pathogen#infect()
filetype plugin on " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.

"______________________________________________________________________█Syntastic
"https://github.com/scrooloose/syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"_____________________________________________________█For Vundle package manager
call vundle#begin()
"tern_for_vim -  an additional package for YCM
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-auto-save'
Plugin 'vim-unimpaired'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'wimstefan/Lightning'
call vundle#end()
"_________________________________________________________█silver_searcher_config
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

"_________________________________________________█Make the 81st column stand out
"   EITHER the entire 81st column, full-screen...
"highlight ColorColumn ctermbg=magenta
"set colorcolumn=81

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" OR ELSE on April Fools day...
"highlight ColorColumn ctermbg=red ctermfg=blue
"exec 'set colorcolumn=' . join(range(2,80,3), ',')

"________________Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
"________________________________________________█Remapping CAPS terminal command
"xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"  #Esc to act as Caps Lock
"xmodmap -e "keycode 66 = Escape NoSymbol Escape"       #Caps Lock to act as Esc

set ruler "Ruler setting"
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
"__________________________________________________________________█vim-auto-save
let g:auto_save = 0 "enables auto save set to 1"
let g:auto_save_silent = 0  " do not display the auto-save notification
"_______________________________________________________________█vim-latex config
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
"_____________________________________________________________█AutoComplete_SetUp
"A combination of CTRL n & CTRL o & CTRL x 
set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"______________________________________________________________█dragvisuals.vim
runtime plugin/dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
" Remove any introduced trailing whitespace after moving
let g:DVB_TrimWS = 1
"__________________________________________________________________█NERDTree
set modifiable "Allows edit of files in buffer where files are stored."

"███████████████████████████████████████████████████████████████████████████████
