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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" look at spacevim
    " (https://spacevim.org/)
    " (https://github.com/ctjhoa/spacevim/blob/master/PLUGINS.md)

" document manual in vim
" compare plugin managers
    " (https://github.com/junegunn/vim-plug)
    " (https://github.com/zsh-users/antigen)
    " (https://github.com/VundleVim/Vundle.vim)
" add comment fix plugin (https://github.com/tpope/vim-commentary)
" add surround to surround text with stuff
    " (https://github.com/tpope/vim-surround)
" add start page to vim
    " (https://github.com/mhinz/vim-startify)
" add nerd tree (https://github.com/preservim/nerdtree)
    " <leader>n for shortcut (look at video for better one)
    " syntax highlighting in vim
        " (https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
" add easy motion
    " (https://github.com/easymotion/vim-easymotion)
" add git gutter
    " (https://github.com/airblade/vim-gitgutter)
" add syntastic a syntax checker
    " (https://github.com/vim-syntastic/syntastic)
" add vinegar.vim for moving around in file tree '-' == open file ex
    " (https://github.com/tpope/vim-vinegar)

" look at ctrl p plugin
    " (http://kien.github.io/ctrlp.vim/)
" look at float terminal (https://github.com/voldikss/vim-floaterm)
" look at git fugative for like in vim Git and other stuff
    " (https://github.com/tpope/vim-fugitive)
" look at polyglot for language functionality
    " (https://github.com/sheerun/vim-polyglot)
" look at highlight url (https://github.com/itchyny/vim-highlighturl)
" look at fzf for fuzzy file find (https://github.com/junegunn/fzf)
" look at coc for code completon and ide stuff
    " (https://github.com/neoclide/coc.nvim)
" look at projectionist for jumping from code to tests
    " (https://github.com/tpope/vim-projectionist)
" look at vim test for running unit tests within vim
    " (https://github.com/vim-test/vim-test)
" look at vim dim inactive windows
    " (https://github.com/blueyed/vim-diminactive)
" look at undo tree
    " (https://github.com/mbbill/undotree)

" maybe look at xml deletion stuff
    " (https://github.com/whatyouhide/vim-textobj-xmlattr)
" maybe look at instant markdown creator
    " (https://github.com/instant-markdown/vim-instant-markdown)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ENV
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

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
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set breakindent " indents word-wrapped lines as much as the parent line
set confirm
set copyindent " copy the previous indentation on autoindenting
set directory=~/.vim/swap//
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
set path+=** " Search down into subfolders
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
set splitright
set statusline=\ \%n\ %f%=%m%y%r\ %p%%\ %l:%c\ " show filename
set swapfile
set tabstop=4
set textwidth=80
set title " change the terminal's title
set titlelen=70
set titlestring=%<%F%=%P "filename & percent down screen
set undodir=$HOME/.vim/undo// " where to save undo histories
set undofile " Save undos after file closes
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu " Display all matching files when we tab complete
set wrap " enable softwrap of words

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
" set up vim manual
runtime ftplugin/man.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <space> <leader>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" <space>/ will turn off highlights
nmap <silent> <leader>/ :nohlsearch<CR>
" shortcut to open vimrc and source it
nnoremap <leader>vimrc :e $MYVIMRC<cr>
" change buffer fast
nnoremap <leader>ls :ls<cr>:b<space>
" create a scratch buffer
nnoremap <leader>sb :below 5new<cr>
" indenting in normal mode and command mode
inoremap <S-Tab> <C-d>
nnoremap <S-Tab> <<
nnoremap <Tab> >>
" repeat dot macro over a range
xmap <silent> . :normal .<cr>
" open file explorer
nnoremap <leader>e :E<cr>
"scroll the window up and down one line at a time
map <S-Up> <C-y>
map <S-Down> <C-e>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CONDITIONAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term =~ "xterm\\|rxvt" " change cursor based on mode
    let &t_SI="\<Esc>[3 q" " start insert mode, blinking underline cursor
    let &t_EI="\<Esc>[1 q" " end insert mode, blinking block
endif

if &t_Co > 2 || has("gui_running") " enable syntax highlighting
    syntax enable
endif

if !has('gui_running') " colored vim
    set t_Co=256
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" HIGHLIGHTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight StatusLine ctermfg=blue ctermbg=white
highlight StatusLineNC ctermfg=white ctermbg=darkblue
highlight VertSplit ctermfg=lightblue ctermbg=white
highlight MatchParen cterm=bold ctermfg=magenta ctermbg=lightmagenta
highlight LineNr ctermfg=grey
highlight LineNrAbove ctermfg=darkgrey
highlight LineNrBelow ctermfg=darkgrey
highlight IncSearch cterm=bold ctermfg=white ctermbg=172


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
    autocmd filetype python :echom "expanding tabs in python file"
    autocmd filetype python set expandtab
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
    :echom "trimming whitespace"
    %s/\s*$//
    ''
endfunction

function! RemoveCarriageReturn()
    :echom "removing carriage returns"
    %s/\r*$//
    ''
endfunction
