set nocompatible
nnoremap ; :
let mapleader="'"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

" -- Plugins --------------------------------------------------------
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ----- Apperance --------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ileodo/dracula-vim', {'name':'dracula'}
Plugin 'altercation/vim-colors-solarized'

" ----- Vim as a programmer's text editor --------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'

" ----- Working with Git -------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features --------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux --------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ---------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Chiel92/vim-autoformat'

" ----- Extras/Advanced plugins ------------------
" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'

call vundle#end()

filetype plugin indent on
syntax on

" Auto reload .vimrc
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" -- General settings -----------------------------------------------
" ----- Apperance --------------------------------
set number          " line number
set ruler           " display cursor's coordinate
set showcmd         "
set nowrap          " no wrap
set noea            " set equalalways, keep the splipt size
hi clear SignColumn " sign column for plugins
set background=dark
colorscheme dracula
" ----- Functionality ----------------------------
set backspace=indent,eol,start " enhanced backspace
set wildmenu    " Auto-Complete for vim commands
set colorcolumn=80
" Beep
set visualbell
set vb t_vb=""
" Change horizontal split to vertical
nnoremap <Leader>ww :let g:curwin=expand("%")\|wincmd c\|wincmd j\|execute ":vnew ".g:curwin<CR>
set splitright
set splitbelow
" No swap files etc
set nobackup
set nowb
set noswapfile
set scrolloff=8
" ----- Searching --------------------------------
set hlsearch    " highlight search result
set incsearch   " real-time search
set cursorline  " highlight cursor's line
set ignorecase  " ignore case when searching
set smartcase
set mouse=a     " Enable mouse mode
" ----- Code Folding -----------------------------
set foldmethod=syntax   " fold code by syntax
set nofoldenable        " turn off when starting vim
" ----- Tab --------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" ----- Shortcuts --------------------------------
nmap LB 0
nmap LE $
" ---------- system clipboard ----------
nmap <Leader>y "+y " copy to system clipboard
nmap <Leader>yy "+yy " copy to system clipboard
nmap <Leader>p "+p " paste from system clipboard
" Support copying stuff between vim instances (due to using PuTTY)
"vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vimbuf<CR>
"nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/.vimbuf<CR>
"map <silent> ,p :sview ~/.vimbuf<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>:set nopaste<CR>p :set paste<CR>
"map <silent> ,P :sview ~/.vimbuf<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>:set nopaste<CR>P :set paste<CR>

" ----------  pannels - ----------------
nmap <Leader>q :q<CR>   " close current pannel
nmap <Leader>w :w<CR>   " save current pannel

nmap <Leader>WQ :wa<CR>:q<CR>   " save all pannels and exit
nmap <Leader>Q :qa!<CR>         " quit without save

nmap <leader>M %    " jump between pairs of chars
" use <Enter> to accept suggestion in popup.
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" -- Plugins Settings ------------------------------------------------
" ----- bling/vim-airline settings ---------------
" Always show statusbar
set laststatus=2
" Fancy font
let g:airline_powerline_fonts = 1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'

" ----- jistr/vim-nerdtree-tabs ------------------
" Open/close NERDTree Tabs with \pt [panel tree]
nmap <leader>pt :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
" let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeWinSize=25
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1 " delete buffer when deleting file

" ----- scrooloose/syntastic settings ------------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ----- majutsushi/tagbar settings ---------------
" Open/close tagbar with \ps [pannel structure]
nnoremap <leader>ps :TagbarToggle<CR>
let tagbar_left=1
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0',
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \ 'm:members:0:1',
            \ 'n:namespaces:0:1',
            \ 'p:functions_prototypes:0:1',
            \ 's:structs:0:1',
            \ 't:typedefs:0:1',
            \ 'u:unions:0:1',
            \ 'v:global:0:1',
            \ 'x:external:0:1'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ }
            \ }
nmap <Leader>tn :tnext<CR> " next tag
nmap <Leader>tp :tprevious<CR> " previous tag
" Build ctags
nnoremap <F5> :!ctags $(find -name "*.c" -o -name "*.h" -o -name "*.cpp")<CR>

" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings ----------
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings ------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings ----------------
" better man page support
noremap K :SuperMan <cword><CR>

" ----- nathanaelkane/vim-indent-guides ----------
" toggle indent guide by 'i [indent]
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" ----- derekwyatt/vim-fswitch -------------------
" switch between *.cpp and *.h by 'sw [switch]
nmap <silent> <Leader>sw :FSHere<cr>

" ----- Valloric/YouCompleteMe -------------------
" Jump to Declariatoin ;jc [Jump deClaratoin]
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" Jump to Definition(only #include files and opened files) 'jd [Jump Definition]
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
" Color Schema
highlight Pmenu ctermfg=15 ctermbg=12 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" enable ycm in comments
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_string=0
" enable .ycm_extra_conf.py
let g:ycm_confirm_extra_conf=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" ycm for tags
let g:ycm_collect_identifiers_from_tags_files=0
"" include standard C++ lib tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" open  OmniCppComplete by ';
inoremap <leader>; <C-x><C-o>

" show complete content in preview list
set completeopt-=preview

let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
" disable cache
let g:ycm_cache_omnifunc=0
" ycm for syntax keywords
let g:ycm_seed_identifiers_with_syntax=1

" Override in .share
if filereadable('._share/etc/.vimrc')
    source ._share/etc/.vimrc
endif

" Override in .envs
if filereadable('._env/etc/.vimrc')
    source ._env/etc/.vimrc
endif

" Override in .local
if filereadable('._local/etc/.vimrc')
    source ._local/etc/.vimrc
endif "
