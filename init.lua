-- init.lua

require("plugins")
require("keybindings")

if vim.loop.os_uname().sysname == "Windows_NT" then
    require("windows")
end

-- basic settings

vim.o.showtabline = 0
vim.o.laststatus = 2
vim.o.cmdheight = 2
-- vim.o.guioptions-=e

vim.g.maplocalleader = ';'
vim.g.mapleader = ';'
vim.o.cursorline = 1

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = 1
vim.o.smartindent = 1

-- colors
vim.o.termguicolors = 1
vim.g.material_style = 'darker'
vim.cmd [[colorscheme material]]

-- better search
vim.cmd([[ set path+=** ]])  -- find lua alternative
vim.o.wildmenu = 1
vim.o.incsearch = 1
vim.o.hlsearch = 1
vim.o.ic = 1
vim.cmd([[ nnoremap <silent> <C-c> :let @/ = "" <CR> ]]) -- find lua alternative

-- custom zettelkasten
vim.cmd [[
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
]]
