vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

keymap_mapper.set("x","<leader>p", "\"_dp")

