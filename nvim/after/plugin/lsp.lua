local lsp_zero = require('lsp-zero')
local null_ls = require("null-ls")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
  'tsserver',
  'rust_analyzer',
  'gopls',
  'tailwindcss'
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.gofumpt
    },
})
