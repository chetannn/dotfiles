vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("x","<leader>p", "\"_dp")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") --  https://youtu.be/w7i4amO_zaE?t=1545 (Thanks prime)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- telescope keymaps
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
  )
