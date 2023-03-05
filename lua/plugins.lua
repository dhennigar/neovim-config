-- plugins.lua

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug('tpope/vim-surround')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-commentary')
Plug('tpope/vim-vinegar')
Plug('tpope/vim-flagship')
Plug('tpope/vim-abolish')

-- Plug("mtikekar/nvim-send-to-term")
Plug('https://gitlab.com/HiPhish/repl.nvim')
Plug('airblade/vim-rooter')
Plug('windwp/nvim-autopairs')

Plug('jalvesaq/Nvim-R')
Plug('jalvesaq/cmp-nvim-r')

Plug('vim-pandoc/vim-pandoc')
Plug('vim-pandoc/vim-pandoc-syntax')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/nvim-cmp')

Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug('junegunn/fzf.vim')

Plug('folke/tokyonight.nvim')
Plug('ellisonleao/gruvbox.nvim')
Plug('marko-cerovac/material.nvim')
Plug('rockerBOO/boo-colorscheme-nvim')

vim.call('plug#end')

-- rooter
vim.g.rooter_patterns = { '.git', '_darcs', '.hg', 'src', 'scripts', 'Makefile', '.renvignore', '.gitignore' }

-- autopairs
require("nvim-autopairs").setup {}

-- REPL.nvim
vim.cmd [[
    " Send the text of a motion to the REPL
    nmap <leader>rs  <Plug>(ReplSend)
    " Send the current line to the REPL
    nmap <leader>rss <Plug>(ReplSendLine)
    " Send the selected text to the REPL
    vmap <leader>rs  <Plug>(ReplSend)
]]

-- Nvim-R
vim.g.R_nvim_wd = 1
vim.g.R_rconsole_width = 0
vim.g.R_open_example = 0
vim.g.R_nvimpager = 'no'
vim.g.R_objbr_auto_start = 1
vim.g.R_objbr_place = 'script,right'
vim.g.R_assign_map = '<M-,>'
vim.keymap.set('i', '<M-.>', '<Space>%>%<CR>')
vim.g.R_set_omnifunc = {'r', 'rmd', 'quarto', 'rnoweb', 'rhelp', 'rrst'}
