call plug#begin('~/.vim/plugged')

Plug 'romgrk/barbar.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'Olical/conjure'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'clojure-vim/clojure.vim', {'for': ['clojure', 'fennel']}
Plug 'NoahTheDuke/coc-clojure'
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
set number
set laststatus=0

set termguicolors
set cursorline
syntax enable
colorscheme onehalfdark

let g:airline_theme='onehalfdark'
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight NormalFloat ctermbg=232 guibg=#171717
set t_Co=256

let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:true
let bufferline.auto_hide = v:true
let bufferline.icons = v:false
let bufferline.closable = v:false
let bufferline.maximum_padding = 2

let g:conjure#log#botright = v:true
let g:conjure#log#hug#height = 1.0
let g:conjure#log#wrap = v:true
let g:conjure#log#hud#enabled = v:false

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
    "clojure",
    "zig",
    "go",
  },
  highlight = { enable = true },
  indent = { enable = true }
}
EOF

nmap <silent> gd :call CocAction('jumpDefinition') <CR>
nmap <silent> gr :call CocAction('jumpReferences') <CR>
nmap <silent> gi :call CocAction('doHover') <CR>
nnoremap <silent> rm :call delete(expand('%')) \| bdelete! <CR>
nnoremap <silent> ff :Clap files <CR>
nnoremap <silent> fs :Clap grep2 <CR>
nnoremap <silent> fr :Clap filer <CR>
nnoremap <silent> ev :ConjureEvalCurrentForm <CR>
nnoremap <silent> repl :ConjureLogVSplit <CR>
nnoremap <silent> dn :CocCommand deno.initializeWorkspace <CR>
nnoremap <silent> bc :BufferClose <CR>
nnoremap <silent> bp :BufferPrevious <CR>
nnoremap <silent> bn :BufferNext <CR>
