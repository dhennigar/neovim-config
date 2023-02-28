-- zettelkasten.lua
-- custom note taking system
vim.cmd [[
    function! NewNote (title)
        exec 'split ~/Notes/' . a:title . '.md'
        exec 'normal!i# ' . a:title
        exec '.s/-/ /g'
    endfunction

    function! SearchNotes ()
        new
        exec 'FZF ~/Notes/'
    endfunction

    command! -nargs=1 NewNote :call NewNote(<f-args>)
    command! -nargs=0 SearchNotes :call SearchNotes()

    nnoremap <leader>nn :NewNote<space>
    nnoremap <leader>ns :SearchNotes<CR>
]]
