-- init.lua
-- Daniel's Neovim init file.

require('plugins')
require('keybindings')
require('zettelkasten')

if vim.loop.os_uname().sysname == 'Windows_NT' then
    -- Windows specific config
    require('windows')
end

vim.api.nvim_create_autocmd( 'UIEnter', {
    -- GUI settings for Nvim-Qt
    once = true,
    callback = function() require('ginit') end
})

-- basic settings
vim.o.showtabline = 0
vim.o.laststatus = 2
vim.o.cmdheight = 2
vim.o.signcolumn = 'yes'

vim.g.maplocalleader = ';'
vim.g.mapleader = ';'
vim.o.cursorline = 0

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = 1
vim.o.smartindent = 1

vim.cmd.filetype({'plugin', 'indent', 'on'})

-- colors
vim.o.termguicolors = 1
vim.g.material_style = 'darker'
-- vim.g.material_style = 'lighter'
vim.cmd.colorscheme('material')

-- better search
vim.opt.path:append('**')
vim.o.wildmenu = 1
vim.o.incsearch = 1
vim.o.hlsearch = 1
vim.o.ic = 1
vim.keymap.set(
    'n',
    '<C-c>',
    ':let @/ = "" <CR>',
    { silent = true }
    )
