-- keybindings.lua

vim.cmd[[

    let mapleader = ';'
    let maplocalleader = ';'

    nnoremap <leader>sv :vnew<CR>:term<CR>
    nnoremap <leader>sn :new<CR>:term<CR>
    nnoremap <leader>spv :vnew<CR>:term<space>ipython<CR>
    nnoremap <leader>spn :new<CR>:term<space>ipython<CR>

    nnoremap <leader>ss Vy<C-w>wpa
    xnoremap <leader>ss y<C-w>wpa
    nnoremap <leader>sa ggvGy<C-w>wpa
    tnoremap <C-q> <C-\><C-N>
    autocmd TermOpen * startinsert

    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    inoremap <C-h> <C-\><C-N><C-w>h
    inoremap <C-j> <C-\><C-N><C-w>j
    inoremap <C-k> <C-\><C-N><C-w>k
    inoremap <C-l> <C-\><C-N><C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
]]

print("hello world")
