function Colors(color)
    color = color or 'poimandres'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
    vim.api.nvim_set_hl(0, "Structure", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

end


Colors()
