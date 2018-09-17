" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation fetches from;
" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'lervag/vimtex'
" Plug 'taketwo/vim-ros'
" Plug 'vim-latex/vim-latex'
" Initialize plugin system
call plug#end()
" Call color scheme
" colo molokai
color new_theme
" let g:molokai_original

" my mappings
cmap W w
cmap Q q
nnoremap <Up> kzz
nnoremap <Down> jzz
"filetype plugin indent on

" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Run current python3 script with F9
" nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
" nnoremap <buffer> <F9> :exec '!ipython -i' shellescape(@%, 1)<cr>
" Run current script in python with F5
nnoremap <F5> :! python %<cr>

" Set spell check"
" set spell spelllang=en_us
"set spell spelllang=es

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Copy in the clipboard
vnoremap <C-c> "+y
vnoremap <C-v> "+p

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Comment lines or blocks
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> @ :s/^#//<cr>:noh<cr>

" Enable syntax highlighting
syntax enable

" disable wrapping the lines
set nowrap
" folding setting
set foldmethod=indent   
set foldnestmax=10
"set nofoldenable
set foldlevel=10

" Show line numbers
set number

" Set tabs width to 4, it is still \t
set tabstop=4
" Set shiftwidth to 0 which makes it equal to tabwidth by default. This is
" needed to use proper indentation
set shiftwidth=0

" Expand tabs into spaces
set expandtab

" Indent when moving to the next line while writing code
set autoindent

" Show the matching part of the pair for [] {} and ()
set showmatch

" setting smart indentation
set smartindent

" Enable all Python syntax highlighting features
"let python_highlight_all = 1

" Mouse click
" set mouse=a

" Show a visual line under the cursor's current line
set cursorline

" Easier indentation of code blocks
" In visual mode (v), select several lines of code press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Hack to make light-line appear...
set laststatus=2

" Get rid of default vim mode
set noshowmode

" Eliminate delay between INSERT and ESCAPE
set timeoutlen=1000 ttimeoutlen=0

" Light-line configuration
 let g:lightline = {
       \ 'colorscheme': 'powerline',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'readonly', 'filename', 'modified' ] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'filetype' ] ]
       \ }}

" Minimal configuration for jedi-vim
let g:jedi#show_call_signatures = "2"
"autocmd FileType python setlocal completeopt-=preview

" Allow tab-completion for directories
"let g:SuperTabDefaultCompletionType = "context"
"
" Expand trigger
"let g:UltiSnipsExpandTrigger="<c-j>"
" let g:ycm_key_list_previous_completion=['<Up>']
let g:UltiSnipsExpandTrigger="<c-a>"

" Take out function preview from YCM
set completeopt-=preview

" YCM/Jedi-vim variables to work together
" https://github.com/Valloric/YouCompleteMe/issues/234
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:jedi#auto_initialization = 1
"let g:jedi#completions_enabled = 0
" this enables auto-complete from imports with ctrl-o
let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#smart_auto_mappings = 1
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "2"
let g:jedi#show_call_signatures_delay = 1


" Syntastic configuration
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']


" Window
nmap <leader>s<left>  :topleft  vnew<CR>
nmap <leader>s<right> :botright vnew<CR>
nmap <leader>s<up>    :topleft  new<CR>
nmap <leader>s<down>  :botright new<CR>

" Move between spltis
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" needed so that the snippets recognize .tex files
let g:tex_flavor='latex'
