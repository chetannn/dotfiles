local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.setup_servers({ "rust_analyzer", "tailwindcss" })

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"typescript-language-server",
		"rust_analyzer",
		"gopls",
		"tailwindcss-language-server",
		"svelte-language-server",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

cmp.setup({
	mapping = {
		["<Tab>"] = cmp_action.tab_complete(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
})
