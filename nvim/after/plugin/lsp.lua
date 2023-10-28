local lsp_zero = require("lsp-zero")
local null_ls = require("null-ls")
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	lsp_zero.buffer_autoformat()
end)

lsp_zero.setup_servers({ "tsserver", "rust_analyzer", "tailwindcss" })

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"gopls",
		"tailwindcss",
	},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "typescriptreact", "lua", "go" },
		["rust_analyzer"] = { "rust" },
	},
})

cmp.setup({
	mapping = {
		["<Tab>"] = cmp_action.tab_complete(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.stylua,
	},
})
