vim.keymap.set("x", "<leader>p", '"_dp')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --  https://youtu.be/w7i4amO_zaE?t=1545 (Thanks prime)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Delete a word backwards (This is from https://github.com/craftzdog/dotfiles-public/blob/master/.config/nvim/lua/config/keymaps.lua)
vim.keymap.set("n", "dw", 'vb"_d')

-- telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- oil keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
