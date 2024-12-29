return {

	{
		"stevearc/conform.nvim",
		name = "conform",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", lsp_format = "fallback" },
					typescript = { "prettierd", "prettier", stop_after_first = true },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
