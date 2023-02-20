-- plugins.lua

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-surround')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-commentary')
Plug('tpope/vim-vinegar')
Plug('tpope/vim-markdown')
Plug('tpope/vim-flagship')
Plug('tpope/vim-abolish')

Plug('folke/tokyonight.nvim')
Plug('ellisonleao/gruvbox.nvim')
Plug('marko-cerovac/material.nvim')
Plug('rockerBOO/boo-colorscheme-nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- R
Plug('jalvesaq/Nvim-R')
Plug('jalvesaq/cmp-nvim-r')

-- Python
Plug 'skywind3000/asyncrun.vim'

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/nvim-cmp')

Plug('airblade/vim-rooter')

Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug('junegunn/fzf.vim')

vim.call('plug#end')

-- lsp bindings
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

-- lsp set up
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)
lspconfig.lua_ls.setup {}
lspconfig.r_language_server.setup {}
lspconfig.pyright.setup {}

 -- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    completion = {
--        autocomplete = false
      keyword_length = 4
    },
    formatting = {
      
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
        else
          fallback()
        end
        end, {"i","s","c",}),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
      { name = 'cmp_nvim_r', max_item_count = 5},
      { name = 'nvim_lsp', max_item_count = 5},
      { name = 'vsnip', max_item_count = 5}, -- For vsnip users.
    }, {
      { name = 'buffer' },
    }),
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
})

require 'cmp_nvim_r'.setup({
      filetypes = {'r', 'rmd', 'quarto'},
      doc_width = 58
})

-- Nvim-R
vim.g.R_nvim_wd = 1
vim.g.R_rconsole_width = 1
vim.g.R_nvimpager = 'tab'
vim.g.R_objbr_place = 'console,above'
vim.g.R_assign_map = '<M-,>'
vim.cmd[[ inoremap <M-.> <Space>%>%<CR> ]]
vim.cmd[[ autocmd VimResized * let R_rconsole_width = winwidth(0) / 2 ]]

--ASyncRun
vim.g.asyncrun_open = 1
