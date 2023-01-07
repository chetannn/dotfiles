-- must be set before calling require
require("nvim-tree").setup({
        view = {
                side = "right",
                adaptive_size = true
        }
})

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
