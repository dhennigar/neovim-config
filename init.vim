" daniel's neovim configuration

" basics
let maplocalleader = ';'
let mapleader = ','
set cursorline
set backspace=indent,eol,start
set cmdheight=2

" windows specific settings
if has('win32')
  nnoremap <Leader>p :cd D:\Projects<CR>
  nnoremap <Leader>h :cd ~<CR>

  let &shell = has('win32') ? 'powershell' : 'pwsh'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=

  set t_u7= " fix for windows terminal
endif

" terminal and split shortcuts
nnoremap <Leader>tv :vsplit<CR>:term<CR>
nnoremap <Leader>th :split<CR>:term<CR>
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tn :tabNext<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <M-h> <C-w><C-h>
nnoremap <M-j> <C-w><C-j>
nnoremap <M-k> <C-w><C-k>
nnoremap <M-l> <C-w><C-l>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

set noswapfile

" vim-plug
call plug#begin()

Plug 'tpope/vim-surround'			" add/remove delimiters
Plug 'tpope/vim-fugitive'			" git integration
Plug 'tpope/vim-commentary'			" comment stuff out
Plug 'tpope/vim-vinegar'			" better netrw
" Plug 'tpope/vim-markdown'			" markdown runtime files
Plug 'tpope/vim-flagship'			" status line
" Plug 'tpope/vim-abolish'			" quickly search and replace words

Plug 'folke/tokyonight.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'jalvesaq/Nvim-R'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'airblade/vim-rooter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" recommended for flagship
set laststatus=2
set showtabline=0
set guioptions-=e

" color scheme
set termguicolors
let g:material_style = 'darker'
colorscheme material

" better search
set path+=**
set wildmenu
set incsearch
set hlsearch
set ic
nnoremap <silent> <C-c> :let @/ = "" <CR>
let @/ = ""

" vim-rooter
let g:rooter_patterns = ['requirements.txt', 'src', '.git', 'renv', 'scripts', 'data', 'results']
let g:rooter_change_directory_for_non_project_files = ''

" nvim-treesitter
lua << EOF
    require 'nvim-treesitter.configs'.setup {
       sync_install = true,
       auto_install = true,
       highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
       },
       indent = {
         enable = true
       }
     }
    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
EOF

" nvim-r
let R_nvim_wd = 1
let R_rconsole_width = winwidth(0) / 2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
let R_nvimpager = 'tab'
let R_objbr_place = 'console,above'
let R_assign_map = '<M-,>'
autocmd Filetype r inoremap <M-.> <space>%>%<CR>

" zettelkasten
function NewNote (title)
    exec 'split ~/Notes/' . a:title . '.md'
    exec 'normal!i# ' . a:title
    exec '.s/-/ /g'
endfunction

function SearchNotes ()
    new
    exec 'FZF ~/Notes/'
endfunction

command -nargs=1 NewNote :call NewNote(<f-args>)
command -nargs=0 SearchNotes :call SearchNotes()

nnoremap <leader>nn :NewNote<space>
nnoremap <leader>ns :SearchNotes<CR>
