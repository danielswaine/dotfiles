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
set cmdheight=2
syntax on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/plugged')
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
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-surround'
  Plug 'SirVer/ultisnips'
call plug#end()

" Enable Deoplete
let g:echodoc#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)
" Use tab for autocompletion.
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ternjs']

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" File Explorer Settings
let g:netrw_banner = 0

" Colour scheme.
set background=dark
let g:gruvbox_italic = 1
colorscheme gruvbox

" Modify Spell Highlight Colours
hi SpellBad ctermbg=red ctermfg=white 

" Ultisnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = '<Right>'
let g:UltiSnipsJumpForwardTrigger = '<Down>'
let g:UltiSnipsJumpBackwardTrigger ='<Up>'
" let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

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
    \ 'html': ['htmlhint'],
    \ 'markdown': ['mdl'],
    \ 'javascript': ['standard'],
    \ 'scss': ['sasslint'],
    \ 'ruby': ['rubocop'],
    \ 'bash': ['shellcheck'],
\ }

" Always keep the gutter open.
let g:ale_sign_column_always = 1

" Customise gutter indicators.
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" Add mappings for jumping between errors.
nmap <silent> [<lt> <Plug>(ale_previous_wrap)
nmap <silent> ]> <Plug>(ale_next_wrap)
