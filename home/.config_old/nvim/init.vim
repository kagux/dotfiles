call plug#begin('~/.config/nvim/plugged')

" Nertdree and plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-surround'
Plug 'Townk/vim-autoclose'
Plug 'benmills/vimux'
Plug 'docunext/closetag.vim'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'janko-m/vim-test'

" improved search
Plug 'haya14busa/incsearch.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kagux/vim-ultisnips-javascript'

" Syntax check
Plug 'neomake/neomake'

" rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'

" visually displaying indent levels
Plug 'nathanaelkane/vim-indent-guides'

" more text objects
Plug 'wellle/targets.vim'

Plug '907th/vim-auto-save'

" highlight search letters
Plug 'unblevable/quick-scope' 

"todo list manager
Plug 'vitalk/vim-simple-todo'

" Apache syntax
Plug 'apeschel/vim-syntax-apache'

" dockerfile syntax
Plug 'honza/dockerfile.vim'

"Open URI with your favorite browser
Plug 'tyru/open-browser.vim'

"markdown
Plug 'tpope/vim-markdown'

"Realtime preview Markdown, reStructuredText, textile
Plug 'kannokanno/previm'

"local vim configs to use in projects
Plug 'embear/vim-localvimrc'

"themes
Plug 'morhetz/gruvbox'

"sass
Plug 'cakebaker/scss-syntax.vim'

"less
Plug 'groenewege/vim-less'

"coffescript
Plug 'AndrewRadev/vim-eco'
Plug 'kchmck/vim-coffee-script'

"js
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'

"ruby
Plug 'vim-ruby/vim-ruby'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'slim-template/vim-slim'
Plug 'kagux/vim-rubocop-autocorrect'

"php
Plug 'StanAngeloff/php.vim'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"yaml
Plug 'chase/vim-ansible-yaml'

"tmux integration
Plug 'christoomey/vim-tmux-navigator'

"elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim', { 'branch': 'elixir-sense' }
nnoremap <silent> H :call alchemist#exdoc()<CR>

"golang
Plug 'fatih/vim-go'


"fast search in files
Plug 'rking/ag.vim'

" autocomplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ervandew/supertab'
Plug 'christianrondeau/vim-base64'
call plug#end()

let mapleader=","
nnoremap <leader><leader> <c-^> " switch between current and prev buffers

" show line numbers
set nu

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
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources={}
" let g:deoplete#sources._=['buffer', 'file', 'ultisnips']
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" autocomplete to longest common mantch and show even if there is only one option 
set completeopt=menuone,longest

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
let g:SuperTabDefaultCompletionType = "<c-n>"



"""""""" END AUTOCOMPLETE

" Backups and swap
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.config/backup
set directory=~/.config/backup

set nohidden
set history=10000
set ruler
set switchbuf=useopen

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
let g:test#strategy = 'vimux'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>aa :TestSuite --only async<CR>
nmap <silent> <leader>l :TestLast<CR>

" Silversearcher config
"
" bind K to grep word under cursor
nnoremap K :Ag<CR>
nnoremap \ :Ag<SPACE>

" config fzf as ctrlp
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tab split'
      \ }
nnoremap <c-p> :FZF<cr>

let FILETAG=expand("./tags")
if filereadable(FILETAG)
    set tags=tags
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" Autosave and syntax check """""""""""""""""""""""""
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
" let g:auto_save_events = ["InsertLeave", "TextChanged", "CursorHold", "CompleteDone"]

autocmd! BufWritePost * Neomake

"
"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction



silent! nunmap CR-]

" Realtime preview
let g:previm_enable_realtime = 1



noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gp :Gpush<CR>

" highlight jsx in js files
let g:jsx_ext_required = 0


"rainbow parantheses config
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" read local vimrc files
set exrc
set secure


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"or you'll miss snippets with short (single or double char) names from Deoplete completion list
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:go_fmt_autosave = 0

" Ctrl-c as Esc
inoremap <C-c> <Esc>

" Ctrl-i as ctrl-A to increment
noremap <C-i> <C-A>

let g:localvimrc_persistent=2

" use an undo file
set undofile
set undodir=$HOME/.config/tmp/undo
set undolevels=1000
set undoreload=10000
