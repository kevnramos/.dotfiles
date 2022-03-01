" ~/.vimrc
"     __      __  ______
"    /\ \  __/\ \/\  __  \
"    \ \ \/\ \ \ \ \ \_\  \
"     \ \ \ \ \ \ \ \  _  /
"      \ \ \_/ \_\ \ \ \\  \
"       \ \____^___/\ \_\ \_\
"         \/__//__/  \/_/\/_/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""LINKS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (vim videos)
" https://vimeo.com/user1690209/videos
" (vim script book)
" https://learnvimscriptthehardway.stevelosh.com/
" (https://spacevim.org/)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CHOOSE A FUZZY FILE FINDER
" look at ctrl p plugin (http://kien.github.io/ctrlp.vim/)
" look at fzf for fuzzy file find (https://github.com/junegunn/fzf)

" SYNTAX PLUGINS
" syntax highlighting in vim (https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
" add syntastic a syntax checker (https://github.com/vim-syntastic/syntastic)
" look at polyglot for language functionality (https://github.com/sheerun/vim-polyglot)

" CODE COMPLETION
" look at coc for code completon and ide stuff (https://github.com/neoclide/coc.nvim)
" You Complete Me (https://github.com/ycm-core/YouCompleteMe)
" LSP language completion
" CTags GNU global tags

" MOVING AROUND
" make your own text objects (https://vimawesome.com/plugin/textobj-user)
" look at projectionist for jumping from code to tests (https://github.com/tpope/vim-projectionist)
" look at vim test for running unit tests within vim (https://github.com/vim-test/vim-test)

" look at float terminal (https://github.com/voldikss/vim-floaterm)
" look at vim dim inactive windows (https://github.com/blueyed/vim-diminactive)
" look at tagbar a class outline viewer for Vim (https://github.com/preservim/tagbar)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ENV
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" make directories
if !isdirectory($HOME . '/.vim/undo')
    call mkdir($HOME . '/.vim/undo', 'p')
endif
if !isdirectory($HOME . '/.vim/swap')
    call mkdir($HOME . '/.vim/swap', 'p')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set autoread
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set breakindent " indents word-wrapped lines as much as the parent line
set colorcolumn=80
set confirm
set copyindent " copy the previous indentation on autoindenting
set directory=~/.vim/swap//
set encoding=utf-8
set expandtab
set foldmethod=syntax " files fold based on syntax
set formatoptions=jrolq
set hidden " this lets you use buffers in the right way
set history=1000 " remember more commands and search history
set hlsearch " enable hightlighting when searching
set ignorecase " ignore case when searching
set incsearch " incremental searching
set laststatus=2 " always show statusline
set linebreak " wrap long lines
set list " show hidden chars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set nofoldenable " files not folded on open
set path+=** " search down into subfolders
set rnu nu
set ruler " show percent down page " useless with statusline
set scrolloff=5 " keep a certain ammount of context
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4
set showbreak=↪\ "show line wrap
set showcmd " show command which is being typed
set showmatch " set show matching parenthesis
set sidescrolloff=10
set smartcase " search is case insensitive unless one is capital
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=4
set splitright
set statusline=\ \%n\ %f%=%m%y%r\ %p%%\ %l:%c\ " show filename
set swapfile
set tabstop=4
set textwidth=80
set title " change the terminal's title
set titlelen=70
set titlestring=%<%F%=%P "filename & percent down screen
set undodir=$HOME/.vim/undo// " where to save undo histories
set undofile " save undos after file closes
set undolevels=1000 " how many undos
set undoreload=10000 " number of lines to save
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu " display all matching files when we tab complete
set wrap " enable softwrap of words

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LEADER MAPS
map <space> <leader>
let g:mapleader=" "
nnoremap <leader>ls :ls<cr>:b<space>
nnoremap <leader>sb :below botright 5new<cr>
nnoremap <leader>te :below botright term<cr>
" reselect pasted text
nmap <leader>gp `[v`]
nmap <leader>q :q<cr>
nmap <leader>ws <c-w>s
nmap <leader>wv <c-w>v
nmap <leader>w= <c-w>=
nmap <leader>w+ <c-w>+
nmap <leader>tn :tabnew<cr>
nmap <leader>bd :bdelete<cr>
nmap <leader>/ :nohlsearch<cr>
nmap <leader>co :copen<cr>
nmap <leader>cc :cclose<cr>
"" OTHER MAPS
" easy window navigation
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
" indenting
inoremap <s-tab> <c-d>
nnoremap <s-tab> <<
nnoremap <tab> >>
vnoremap <s-tab> <gv
vnoremap <tab> >gv
" repeat dot macro over a range
xmap . :normal .<cr>
" scroll window
map <s-up> <c-y>
map <s-down> <c-e>
nnoremap Y y$
" inner line
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CONDITIONAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change cursor based on mode
if &term =~ "xterm\\|rxvt"
    let &t_SI="\<Esc>[3 q" " start insert mode, blinking underline cursor
    let &t_EI="\<Esc>[1 q" " end insert mode, blinking block
endif
" enable syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax enable
endif
" colored vim
if !has('gui_running')
    set t_Co=256
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" HIGHLIGHTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    colorscheme macvim
    set background=dark
else
    colorscheme default
endif
highlight StatusLine ctermfg=blue ctermbg=white guifg=white guibg=#1e90ff
highlight StatusLineNC ctermfg=white ctermbg=darkblue guifg=darkblue guibg=white
highlight VertSplit ctermfg=lightblue ctermbg=white guifg=white guibg=lightblue
highlight MatchParen cterm=bold ctermfg=magenta ctermbg=lightmagenta
highlight LineNr ctermfg=grey guifg=#a9a9a9 guibg=NONE
highlight LineNrAbove ctermfg=darkgrey guifg=#696969
highlight LineNrBelow ctermfg=darkgrey guifg=#696969
highlight Search guibg=yellow
highlight IncSearch cterm=bold ctermfg=white ctermbg=172 gui=bold guifg=white guibg=orange
let g:markdown_fenced_languages = [ 'html', 'python', 'ruby', 'vim', 'bash', 'sh', 'css']
highlight ColorColumn ctermbg=236 guibg=#4d4d4d

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" AUTOCMD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup saving_vimrc
    autocmd!
    autocmd BufWritePost vimrc echom "sourcing vimrc"
    autocmd BufWritePost vimrc source $MYVIMRC
    autocmd BufWritePost .vimrc echom "sourcing vimrc"
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END
augroup pip_python
    autocmd!
    autocmd filetype python :IndentLinesToggle
augroup END
augroup show_trailing_spaces
    autocmd!
    " show trailing spaces
    autocmd VimEnter,WinEnter * match ErrorMsg '\s\+$'
augroup END
augroup change_statusline_color
    autocmd!
    autocmd InsertEnter * highlight StatusLine ctermfg=magenta ctermbg=white
    autocmd InsertEnter * highlight StatusLineNC ctermfg=white ctermbg=darkmagenta
    autocmd InsertLeave * highlight StatusLine ctermfg=blue ctermbg=white
    autocmd InsertLeave * highlight StatusLineNC ctermfg=white ctermbg=darkblue
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://vim.fandom.com/wiki/Remove_unwanted_spaces
function! TrimWhiteSpace()
    echom "trimming whitespace"
    silent %s/\s*$//
    ''
endfunction
command TrimWhiteSpace :call TrimWhiteSpace()
function! RemoveCarriageReturn()
    echom "removing carriage returns"
    silent %s/\r*$//
    ''
endfunction
command RemoveCarriageReturn :call RemoveCarriageReturn()
function! CombineWhiteSpace()
    echom "combining white space"
    silent v/./,/./-j
    ''
endfunction
command CombineWhiteSpace :call CombineWhiteSpace()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
" set up vim manual (:Man [func])
runtime ftplugin/man.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win64')
    set guifont=Consolas:h12
elseif has('gui_macvim')
    set guifont=JetBrains\ Mono:h13
    set macligatures
else " linux
    set guifont=Monospace\ 12
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VIM PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/vim-plug/
" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" run pluginstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
" start vim plug list
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/junegunn/vim-easy-align'
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
Plug 'https://github.com/nixon/vim-vmath'
    vmap <expr> ++ VMATH_YankAndAnalyse()
    nmap ++ vip++
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/airblade/vim-gitgutter'
    highlight! link SignColumn LineNr
    set foldtext=gitgutter#fold#foldtext()
    highlight GitGutterAdd cterm=bold ctermfg=green gui=bold guifg=green
    highlight GitGutterChange cterm=bold ctermfg=214 gui=bold guifg=orange
    highlight GitGutterDelete cterm=bold ctermfg=red gui=bold guifg=red
    let g:gitgutter_sign_modified_removed = '±'
    nmap <leader>gqf :GitGutterQuickFix \| copen<cr>
Plug 'https://github.com/cespare/vim-toml'
Plug 'https://github.com/mhinz/vim-startify'
    " dont use 'qeibsvt'
    let g:startify_bookmarks =
        \ [
        \     { "x": "~/.vimrc" },
        \     { "y": "~/.bashrc" },
        \     { "z": "~/.zshrc" },
        \     { "d": "~/.dotfiles"},
        \ ]
    let g:startify_change_to_vcs_root = 0
    let g:ascii = [
        \ ' __      __  ______',
        \ '/\ \  __/\ \/\  __  \',
        \ '\ \ \/\ \ \ \ \ \_\  \',
        \ ' \ \ \ \ \ \ \ \  _  /',
        \ '  \ \ \_/ \_\ \ \ \\  \',
        \ '   \ \____^___/\ \_\ \_\',
        \ '     \/__//__/  \/_/\/_/'
        \ ]
    let g:startify_custom_header = 'startify#pad(g:ascii)'
    let g:startify_custom_footer = 'startify#pad(startify#fortune#boxed())'
    let g:startify_fortune_use_unicode = 1
    let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   Most Recently Used in '.getcwd()]},
        \ { 'type': 'files',     'header': ['   Most Recently Used']},
        \ { 'type': 'sessions',  'header': ['   Sessions']},
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']},
        \ { 'type': 'commands',  'header': ['   Commands']},
        \ ]
    let g:startify_session_persistence = 1
    let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]
    map <leader>st :Startify<cr>
    map <leader>ss :SSave<cr>
    map <leader>sl :SLoad<cr>
Plug 'https://github.com/junegunn/vim-peekaboo'
    let g:peekaboo_delay=500
Plug 'https://github.com/vim-scripts/ReplaceWithRegister'
Plug 'https://github.com/mbbill/undotree', {'on':'UndotreeToggle'}
    let g:undotree_WindowLayout = 2
    let g:undotree_ShortIndicators = 1
    nnoremap U :UndotreeToggle<cr>
    let g:undotree_SetFocusWhenToggle = 1
if exists('##TextYankPost')
    Plug 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = 100
    highlight HighlightedyankRegion cterm=reverse gui=reverse
endif
Plug 'https://github.com/Yggdroot/indentLine', {'on':'IndentLinesToggle'}
    autocmd! User indentLine doautocmd indentLine Syntax
    let g:indentLine_enabled = 0
    let g:indentLine_char_list = ['|', '¦', '┆', '┊']
    map <leader>ie :IndentLinesToggle<cr>
Plug 'https://github.com/rhysd/git-messenger.vim'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/preservim/nerdtree', {'on':'NERDTreeToggle'}
    nnoremap <leader>n :NERDTreeToggle<CR>
    augroup nerd_loader
        autocmd!
        autocmd BufEnter,BufNew *
            \  if isdirectory(expand('<amatch>'))
            \|   call plug#load('nerdtree')
            \|   execute 'autocmd! nerd_loader'
            \| endif
    augroup END
Plug 'https://github.com/junegunn/gv.vim'
    nmap <leader>gl :GV<cr>
Plug 'https://github.com/easymotion/vim-easymotion'
    nmap s <Plug>(easymotion-overwin-f)
    nmap s <Plug>(easymotion-overwin-f2)
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/AndrewRadev/splitjoin.vim', {'for': ['python','c','sh']}
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/tacahiroy/ctrlp-funky'
call plug#end()

" moved this outside of plug because it was not working otherwise
augroup tpope_commentary
    autocmd!
    autocmd FileType c setlocal commentstring=//\ %s
augroup END
