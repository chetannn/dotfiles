require('telescope').setup {
        defaults = {
                file_ignore_patterns = { "node_modules", "vendor" }
        }
}

vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])

