require("nvim-tree").setup({
        view = {
                side = "right",
                adaptive_size = true
        }
})



vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
