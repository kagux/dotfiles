set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'benmills/vimux'
Bundle 'docunext/closetag.vim.git'
Bundle 'tmhedberg/matchit.git'
Bundle 'joonty/vdebug.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'
Bundle 'kagux/vim-test-runner'
Bundle 'Shougo/neocomplete.vim'

"themes
Bundle 'morhetz/gruvbox.git'

"sass
Bundle 'cakebaker/scss-syntax.vim'

"less
Bundle 'groenewege/vim-less'

"coffescript
Bundle 'AndrewRadev/vim-eco.git'
Bundle 'kchmck/vim-coffee-script.git'

"js
Bundle 'mustache/vim-mustache-handlebars'

"ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'ecomba/vim-ruby-refactoring.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'

"php
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'StanAngeloff/php.vim.git'
Bundle 'evidens/vim-twig.git'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'shawncplus/phpcomplete.vim'

"git
Bundle 'tpope/vim-fugitive.git'

"fast search in files
Bundle 'rking/ag.vim'

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
colorscheme gruvbox

filetype plugin indent on 

"""""""" AUTOCOMPLETE

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType eco set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" autocomplete to longest common mantch and show even if there is only one option 
set completeopt=preview,menuone,longest

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

"""""""" END AUTOCOMPLETE

" select suggestion using tab and navigate with C-j and C-k
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))

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
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ctrlp config

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let g:ctrlp_map = '<c-p>'
" Set no max file limit
let g:ctrlp_max_files = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping for window navigation
" "
" " If you're in tmux it'll keep going to tmux splits if you hit the end of
" " your vim splits.
" "
" " For the tmux side see:
" "
" https://github.com/aaronjensen/dotfiles/blob/e9c3551b40c43264ac2cd21d577f948192a46aea/tmux.conf#L96-L102
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$TMUX')
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		silent! execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			call system("tmux select-pane -" . a:tmuxdir)
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
endif

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
