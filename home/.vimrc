set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" original repos on github
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'kien/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'docunext/closetag.vim.git'
Plugin 'tmhedberg/matchit.git'
Plugin 'joonty/vdebug.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
" Plugin 'kagux/vim-test-runner'
Plugin 'janko-m/vim-test'
Plugin 'Valloric/YouCompleteMe'

" Apache syntax
Plugin 'apeschel/vim-syntax-apache'

" dockerfile syntax
Plugin 'honza/dockerfile.vim'

"Open URI with your favorite browser
Plugin 'tyru/open-browser.vim'

"markdown
Plugin 'tpope/vim-markdown'

"Realtime preview Markdown, reStructuredText, textile
Plugin 'kannokanno/previm'

"visually highlight indents
Plugin 'nathanaelkane/vim-indent-guides.git'

"local vim configs to use in projects
Plugin 'embear/vim-localvimrc'

"themes
Plugin 'morhetz/gruvbox.git'

"sass
Plugin 'cakebaker/scss-syntax.vim'

"less
Plugin 'groenewege/vim-less'

"coffescript
Plugin 'AndrewRadev/vim-eco.git'
Plugin 'kchmck/vim-coffee-script.git'

"js
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'jelera/vim-javascript-syntax'

"ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'slim-template/vim-slim'

"php
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'StanAngeloff/php.vim.git'
Plugin 'evidens/vim-twig.git'
Plugin '2072/PHP-Indenting-for-VIm'

"git
Plugin 'tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter'

"fast search in files
Plugin 'rking/ag.vim'

"yaml
Plugin 'chase/vim-ansible-yaml'

"tmux integration
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

let mapleader=","
nnoremap <leader><leader> <c-^> " switch between current and prev buffers

" show line numbers
set nu

" backspace config
:set backspace=indent,eol,start

" make sure that terminal is seen as 256 color
set term=screen-256color

" color theme
syntax enable
if !has("gui_running")
  let g:gruvbox_italic=0
endif
set t_Co=256
set background=dark    " Setting dark mode "
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

filetype plugin indent on 

"""""""" AUTOCOMPLETE

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType eco set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" autocomplete to longest common mantch and show even if there is only one option 
set completeopt=menuone,longest

" select suggestion using tab and navigate with C-j and C-k
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_cache_omnifunc = 1



"""""""" END AUTOCOMPLETE

" Backups and swap
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set nohidden
set history=10000
set ruler
set switchbuf=useopen
set encoding=utf-8

" Whitespace stuff

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
autocmd Filetype php setlocal ts=4 sw=4 expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show (partial) command in the status line
set showcmd

" toggle nerdtree
map <leader>f :NERDTreeToggle<CR>
map <leader>F :NERDTreeFind<CR>
let g:NERDTreeWinSize=50

" vimux config

let g:VimuxUseNearest = 1 "use nearest pane for output
let g:VimuxOrientation = 'h'
let g:VimuxHeight = "30"

" test-runner
" let g:test#strategy = 'vimux'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

let g:test_runner_run_command = 'call VimuxRunCommand("{test_command}")'
let g:test_runner_phpspec_command = 'bin/phpspec run -f dot {tests_path}'
let g:test_runner_phpunit_command = 'bin/phpunit {tests_path}'
let g:test_runner_rspec_command = 'spring rspec {tests_path}'

" Silversearcher config
"
" bind K to grep word under cursor
nnoremap K :Ag<CR>
nnoremap \ :Ag<SPACE>

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --skip-vcs-ignores --nocolor -g ""'
endif

" ctrlp config

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let g:ctrlp_map = '<c-p>'
" Set no max file limit
let g:ctrlp_max_files = 0

let FILETAG=expand("./tags")
if filereadable(FILETAG)
    set tags=tags
endif

inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" Autosave and syntax check """""""""""""""""""""""""
set updatetime=200
autocmd CursorHold,CursorHoldI,InsertLeave * call AutoSave()

function! AutoSave()
  if &modified
    silent! wa
    SyntasticCheck
    echo "(AutoSaved at " . strftime("%T") . ")"
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction



silent! nunmap CR-]

" Realtime preview
let g:previm_enable_realtime = 1
