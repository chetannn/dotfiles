local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})



lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)


lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ['intelephense'] = { 'php' },
    ['null-ls'] = {'javascript', 'typescript', 'typescriptreact', 'lua', 'go' },
  }
})


lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'rust_analyzer',
  'gopls',
  'tailwindcss'
})



lsp.setup()

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.gofumpt
    },
})
