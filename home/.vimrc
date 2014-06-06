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
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'docunext/closetag.vim.git'
Bundle 'tmhedberg/matchit.git'
Bundle 'joonty/vdebug.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'

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

" autocomplete

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType eco set omnifunc=htmlcomplete#CompleteTags

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

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=longest,list
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled
set wildignore+=tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache

set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard

" Show (partial) command in the status line
set showcmd

" autocomplete to longest common mantch and show even if there is only one
" option 
set completeopt=preview,menuone
" select using enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy paste system clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "+y
map <leader>p "+p

" toggle nerdtree
map <leader>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50

" vimux config

let g:VimuxUseNearest = 0 "don't use nearest window for output
let g:VimuxOrientation = 'h'
let g:VimuxHeight = "30"

" rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = 'call VimuxRunCommand("spring rspec {spec}\n", 0)'

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
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|cache$\|\.svn$\|cookbooks\|tmp\|web\/js\|web\/css\|web\/bundles',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }


" enable autosaving of buffer changes
let g:auto_save = 1

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
