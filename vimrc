" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation fetches from;
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'takac/vim-hardtime'
Plug 'vim-scripts/DoxygenToolkit.vim'
call plug#end()

colorscheme onedark
set background=dark

" map spacebar as leader key
nnoremap <space> <nop>
let mapleader=" "

" my mappings
:command! W w
:command! Q q
:command! WQ wq
:command! Wq wq
:command! Toc VimtexTocOpen
:command! RemoveWhiteSpace %s/\s\+$//e

set confirm

" change cursor in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" disable scroll using mouse
" set mouse=a
nmap <ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
imap <ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
vmap <ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>

" setting to keep cursor line in middle
set scrolloff=5

" Vim loads indentation and plugins acc. to detected filetype
"filetype plugin indent on
filetype plugin on

" Vim jumps to last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Run current script in python with F5
" nnoremap <F5> :! python %<cr>
nnoremap <F5> :! python3 %<cr>

" Set spell check"
" set spell spelllang=en_us

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
noremap <silent> <C-_> :Commentary<cr>
" use // for c, cpp type files
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
" use # for cmake, Cmakelists.txt type files
autocmd FileType cmake setlocal commentstring=#\ %s


" Enable syntax highlighting
syntax enable

" make hidden characters like tabs or EOL visible
set listchars=nbsp:_,trail:.,tab:▸\ ,eol:¬
" set list

" disable auto-commenting when entering new line
autocmd FileType * setlocal formatoptions+=c formatoptions+=r formatoptions-=o

" enter the current millenium
set nocompatible

" hide buffers instead of closing when switching to another buffer
set hidden

" use every file in current dir and child dir while "find" ind
set path=**

" wildmenu for fuzzy file finding
set wildmenu

set foldmethod=indent  " Default fold method
" set the method for folding depending on language
autocmd FileType c,cpp,java,scala set foldmethod=syntax
autocmd FileType sh,ruby,python   set foldmethod=indent
" level of nesting to fold
" set foldnestmax=0
set nofoldenable
" set foldlevel=0

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Set tabs width to 4, it is still \t
set tabstop=4
" Set shiftwidth to 0 which makes it equal to tabwidth by default. This is
" needed to use proper indentation
set shiftwidth=0

" Expand tabs into spaces
set expandtab|retab

" Indent when moving to the next line while writing code
set autoindent

" Show the matching part of the pair for [] {} and ()
set showmatch

" setting smart indentation
set smartindent

" set color column
hi ColorColumn ctermbg=darkgrey guibg=lightgrey
set colorcolumn=80
" set textwidth
set textwidth=80
" disable autowrap text when writing in insert mode
set formatoptions-=t
" disable wrapping the lines
set nowrap


" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Mouse click
" set mouse=a

" Show a visual line under the cursor's current line
" set cursorline

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
       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'filetype' ] ]
       \ },
       \ 'component_function': {
       \   'gitbranch': 'fugitive#head'
       \ },
       \ }

" Expand trigger
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsSnippetsDirectories=[$HOME.'/.vim/UltiSnips']


" fuzzy file finder (fzf) bindings
autocmd VimEnter * command! -bang -nargs=? GFiles call fzf#vim#gitfiles(<q-args>, {'options': '--no-preview'}, <bang>0)
autocmd VimEnter * command! -bang -nargs=? Files call fzf#vim#files(<q-args>, {'options': '--no-preview'}, <bang>0)
autocmd VimEnter * command! -bang -nargs=? Buffers call fzf#vim#buffers(<q-args>, {'options': '--no-preview'}, <bang>0)
nnoremap <leader>og :GFiles<CR>
nnoremap <leader>of :Files<CR>
nnoremap <leader>ob :Buffers<CR>
nnoremap <leader><space> :b#<CR>

" Move between spltis
nmap <leader>k :wincmd k<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>h :wincmd h<CR>
nmap <leader>l :wincmd l<CR>

" open directory tree on left side
nnoremap <leader>t :20Lexplore<CR>

" catkin build
nnoremap <leader>cbt :terminal catkin build --this<CR>

" find go to next/previous underscore
nnoremap <leader>f f_
nnoremap <leader>F F_

" search for selected text
vnoremap // y/<C-R>"<CR>

" Autocomplete
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
set completeopt=menu,menuone,longest
inoremap <silent> <expr> <Tab> SimpleAutoComplete(0)
inoremap <silent> <expr> <S-Tab> SimpleAutoComplete(1)

function! SimpleAutoComplete(is_backwards)
    let directions = ["\<C-n>", "\<C-p>"]
    let indent_directions = ["\<Tab>", "\<C-h>"]
    let direction_index = a:is_backwards ? 1 : 0
    if pumvisible() " if completion menu is visible just cycle through it
        return directions[direction_index]
    endif

    " get the current line as string (excluding empty spaces and tabs)
    let pos = getpos('.') " get cursor position return a list (buff, row, col)
    let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")

    " Indent/De-indent if current line is empty string
    if empty(substr)
        return indent_directions[direction_index]
    endif

    if match(substr, '\/') != -1 " if the line contains a '/' do file path completion
        return "\<C-x>\<C-f>" . directions[direction_index]
    endif

    return directions[direction_index] " normal completion compl-generic
endfunction

" needed so that the snippets recognize .tex files
let g:tex_flavor='latex'

" opens pdf file using zathura
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0

" netrw file browsing
let g:netrw_banner=0 " hide banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1          "open splits to the right
let g:netrw_liststyle=3     "tree view

" autocmd BufWritePost *.md silent! !pandoc <afile> -o /tmp/myFile.pdf
" autocmd BufWritePost *.md !pandoc <afile> -o /tmp/myFile.pdf

" vim-hardtime settings
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 500
let g:hardtime_ignore_buffer_patterns = ["index", ".*\.txt"]
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

hi Normal guibg=NONE ctermbg=NONE
