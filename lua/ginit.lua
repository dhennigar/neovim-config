-- ginit.lua
-- GUI settings for Nvim-Qt

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.cmd [[GuiFont! Cascadia Code]]
else
    vim.cmd [[GuiFont! monospace]]
end
