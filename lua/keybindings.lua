-- keybindings.lua
vim.cmd [[
    let maplocalleader=';'
    let mapleader=';'
]]

-- open terminals in new vertical or horizontal split
vim.keymap.set('n', '<leader>tt', ':new +term<CR>', { silent = true })
vim.keymap.set('n', '<leader>tv', ':vnew +term<CR>', { silent = true })

-- easier window navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('i', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('i', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('i', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('i', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- omnicompletion trigger
-- vim.keymap.set('i', '<C-/>', '<C-x><C-o>')
