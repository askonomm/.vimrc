call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'Olical/conjure'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'clojure-vim/clojure.vim', {'for': ['clojure', 'fennel']}
Plug 'NoahTheDuke/coc-clojure'
Plug 'NLKNguyen/papercolor-theme'
Plug 'liuchengxu/vim-clap'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release', 'for': ['clojure', 'fennel']}

call plug#end()

set backspace=indent,eol,start
set shiftwidth=2
set autoindent
set smartindent
set mouse=a
set noswapfile

" Theme
set termguicolors
syntax enable
colorscheme onehalfdark
set number
set laststatus=2
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set t_Co=256

let g:ale_fix_on_save = 1
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = {'clojure': ['clj-kondo', 'joker']}
let g:clap_open_preview = 'never'

lua <<EOF
require('nvim-treesitter.configs').setup {
ensure_installed = {
    "html",
    "javascript",
    "typescript",
    "clojure"
  },
  highlight = { enable = true },
  indent = { enable = true }
}
EOF

nmap <silent> gd :call CocAction('jumpDefinition') <CR>
nmap <silent> gr :call CocAction('jumpReferences') <CR>
nnoremap <silent> ff :Clap files <CR>
nnoremap <silent> fs :Clap grep2 <CR>
nnoremap <silent> ev :ConjureEvalCurrentForm <CR>
nnoremap <silent> dn :CocCommand deno.initializeWorkspace
