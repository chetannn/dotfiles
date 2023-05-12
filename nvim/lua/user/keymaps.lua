vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("x","<leader>p", "\"_dp")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --  https://youtu.be/w7i4amO_zaE?t=1545 (Thanks prime)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
