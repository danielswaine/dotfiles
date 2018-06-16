set encoding=utf-8
scriptencoding utf-8

set list listchars=extends:$,nbsp:+,precedes:$,tab:>\ ,trail:-
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set shiftround shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set autoindent              " indent a new line the same amount as the line just typed
set smartindent
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set cursorline
set splitbelow splitright
set spell spelllang=en_gb
syntax on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'w0rp/ale'
  Plug 'morhetz/gruvbox'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
	Plug 'Shougo/echodoc.vim'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'zchee/deoplete-jedi'
  Plug 'ap/vim-css-color'
  Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-vinegar'
call plug#end()

" Enable Deoplete
let g:echodoc#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" Use tab for autocompletion.
" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

" File Explorer Settings
let g:netrw_banner = 0

" Colour scheme.
set background=dark
let g:gruvbox_italic = 1
colorscheme gruvbox

" Modify Spell Highlight Colours
hi SpellBad ctermbg=red ctermfg=white 

"------------------------------------------------------------------------------
" Normal mode
"------------------------------------------------------------------------------

" Use arrow keys to move between tabs.
noremap <Left> gT
noremap <Right> gt

"------------------------------------------------------------------------------
" w0rp/ale: asynchronous lint engine
"------------------------------------------------------------------------------

" Manually enable linters.
let g:ale_linters = {
    \ 'css': ['stylelint'],
    \ 'html': ['htmlhint'],
    \ 'markdown': ['mdl'],
    \ 'javascript': ['standard'],
    \ 'json': ['jsonlint'],
    \ 'python': ['pylint', 'flake8'],
    \ 'scss': ['sasslint'],
    \ 'vim': ['vint'],
    \ 'ruby': ['rubocop'],
    \ 'bash': ['shellcheck'],
    \ 'php': ['php'],
\ }

" Always keep the gutter open.
let g:ale_sign_column_always = 1

" Customise gutter indicators.
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" Add mappings for jumping between errors.
nmap <silent> [<lt> <Plug>(ale_previous_wrap)
nmap <silent> ]> <Plug>(ale_next_wrap)
