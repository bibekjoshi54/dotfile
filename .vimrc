set nocompatible              " required
filetype off                  " required

" Vundle is used to install package in the Vim
" First install the vundle from git to .vim/ 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'textobj-user'
Plugin 'textobj-indent'
Plugin 'Toggle'
Plugin 'fugitive.vim'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'davidhalter/jedi-vim'
" Bundle "MarcWeber/vim-addon-mw-utils"
"# Bundle "garbas/vim-snipmate"
"# Bundle "honza/vim-snippets"
Plugin 'Syntastic'
Plugin 'surround.vim'
Bundle 'repeat.vim'
Bundle 'https://github.com/tpope/vim-unimpaired.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'Solarized'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Bundle 'https://github.com/pseewald/nerdtree-tagbar-combined'
Plugin 'wesQ3/vim-windowswap'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'klen/python-mode'
call vundle#end()            " required

call plug#begin('~/.vim/plugged')
Plug 'hzchirs/vim-material'
" Initialize plugin system
call plug#end()
filetype plugin indent on    " required
map <Leader>v :source $MYVIMRC<CR>:!ctags<CR><CR>:PluginInstall<CR>q<CR>
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Pep8 is really necessary
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
" Let us set some some screen spliting rules

"split navigations
"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let g:SimpylFold_docstring_preview=1 "Shows the docstring for the folded code

set encoding=utf-8
let python_highlight_all=1
syntax on

set ls=2            " allways show status line
set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set hls             " highlight searches
set ruler           " show the cursor position all the time
set number          " show line numbers
set ttyfast         " smoother changes

set expandtab       " space instead of tab
set nowrap          " don't wrap lines, let them continue
" set omnifunc=syntaxcomplete#Complete " set autocomplete"
set completeopt-=preview " don't open scratch pad

" make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
set cursorline

" Highlight matches when jumping to next
set incsearch
set hlsearch

set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabsto
set title                " change the terminal's title
" set visualbell           " don't beep
set noerrorbells         " don't beep

" No funny stuff. trailing spaces tabs etc
set listchars=tab:>~,nbsp:_,trail:.
set list

syntax on
"""""""""""" Start Powerline Settings """"""""""""""""

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15
        colorscheme PaperColor              " set color scheme
    endif
endif

""""""""""" END of PowerLine Settings  """""""""""""""

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='material'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Palenight
 let g:material_style='palenight'
 set background=dark
 colorscheme vim-material

highlight DiffAdd            cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete         cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange         cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText           cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
highlight Comment            cterm=bold
highlight vimLineComment     cterm=bold
highlight htmlSpecialTagName cterm=bold
highlight MatchParen         ctermbg=0 ctermfg=none
highlight SpecialKey         term=bold ctermfg=11 gui=bold guifg=Yellow

" Git commands
"
"   - show status
"   - blame
"   - diff
"   - use '-' to stage/unstange changes in git status window
"   - ctrl+n/p to navigate through files in git status window
map <Leader>gs :Gstatus<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gd :Git diff<CR><CR>

set showtabline=0
" search open buffers
map <Leader>t :CtrlSpace<CR>
" search by filename
map <Leader>p :CtrlSpace O<CR>
set hidden " required for CtrlSpace

" no more shift for :
noremap ; :

" keep selection while indenting files
vnoremap > >gv
vnoremap < <gv

set foldlevelstart=20
set foldmethod=indent

nnoremap <Leader>f :NERDTreeToggle<Enter>
" Netrw options
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
let NERDSpaceDelims=1
let NERDDefaultNesting=0

" <Leader>c for snippet suggestion
inoremap <Leader>c <C-x><C-o><C-p>
"" split vertical window
nnoremap <Leader>w <C-w>v<C-w>l
"" split horizontal window
nnoremap <Leader>s <C-w>s<C-w>j

let g:jedi#force_py_version = 3

" NERDTree setting defaults to work around http://github.com/scrooloose/nerdtree/issues/489
"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
let NERDTreeMinimalUI = 1

" Autocompletiom setting
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-f>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['python']

" syntax highlight
" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" Additional mappings for Esc (useful for MacBook with touch bar)
" inoremap jj <Esc>
" inoremap jk <Esc>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let NERDTreeQuitOnOpen = 1
:set mouse=a
