return {
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-sleuth" },
	{ "christoomey/vim-tmux-navigator" },
	{ "tpope/vim-sleuth" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "javascript", "typescript", "rust", "c", "lua", "query", "go" },
				sync_install = false,
				auto_install = true,
				indent = {
					enable = true,
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	-- LSP Support
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { pattern = "^:", icon = ">", lang = "vim" },
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({
				enabled = true,
				cloak_character = "*",
				highlight_group = "Comment",
				cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
				try_all_patterns = true,
				patterns = {
					{
						file_pattern = ".env*",
						cloak_pattern = "=.+",
						replace = nil,
					},
				},
			})
		end,
	},
	{
		{
			"rose-pine/neovim",
			name = "rose-pine",
			config = function()
				require("rose-pine").setup({
					variant = "moon",
					dark_variant = "moon",
					bold_vert_split = false,
					dim_nc_background = false,
					disable_background = false,
					disable_float_background = false,
					disable_italics = true,
				})
			end,
		},
		{
			"ThePrimeagen/harpoon",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"stevearc/conform.nvim",
			event = { "BufWritePre", "BufReadPre" },
			config = function()
				local conform = require("conform")

				conform.setup({
					formatters_by_ft = {
						lua = { "stylua" },
						javascript = { { "prettierd", "prettier" } },
						typescript = { { "prettierd", "prettier" } },
						svelte = { { "prettierd", "prettier" } },
						javascriptreact = { { "prettierd", "prettier" } },
						typescriptreact = { { "prettierd", "prettier" } },
						css = { { "prettierd", "prettier" } },
						rust = { "rustfmt" },
						go = { "gofumpt" },
						yaml = { "yamlfix" },
					},
					format_on_save = { timeout_ms = 1000, lsp_fallback = true, async = false },
				})
			end,
		},
	},
}
