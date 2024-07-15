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
					disable = { "dart" },
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
						typescript = { { "prettierd", "prettier", "biome" } },
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
		{
			"mfussenegger/nvim-lint",
			event = {
				"BufReadPre",
				"BufNewFile",
				config = function()
					local lint = require("lint")
					lint.linters_by_ft = {
						javascript = { "eslint_d" },
						typescript = { "eslint_d" },
					}
				end,
			},
		},
		{
			"stevearc/oil.nvim",
			opts = {},
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("oil").setup({
					default_file_explorer = true,
					columns = {
						"icon",
					},
					buf_options = {
						buflisted = false,
						bufhidden = "hide",
					},
					win_options = {
						wrap = false,
						signcolumn = "no",
						cursorcolumn = false,
						foldcolumn = "0",
						spell = false,
						list = false,
						conceallevel = 3,
						concealcursor = "nvic",
					},
					delete_to_trash = true,
					-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
					skip_confirm_for_simple_edits = true,
					-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
					-- (:help prompt_save_on_select_new_entry)
					prompt_save_on_select_new_entry = true,
					-- Oil will automatically delete hidden buffers after this delay
					-- You can set the delay to false to disable cleanup entirely
					-- Note that the cleanup process only starts when none of the oil buffers are currently displayed
					cleanup_delay_ms = 2000,
					lsp_file_methods = {
						-- Time to wait for LSP file operations to complete before skipping
						timeout_ms = 1000,
						-- Set to true to autosave buffers that are updated with LSP willRenameFiles
						-- Set to "unmodified" to only save unmodified buffers
						autosave_changes = false,
					},
					-- Constrain the cursor to the editable parts of the oil buffer
					-- Set to `false` to disable, or "name" to keep it on the file names
					constrain_cursor = "editable",
					-- Set to true to watch the filesystem for changes and reload oil
					experimental_watch_for_changes = false,
					keymaps = {
						["g?"] = "actions.show_help",
						["<CR>"] = "actions.select",
						["<C-s>"] = {
							"actions.select",
							opts = { vertical = true },
							desc = "Open the entry in a vertical split",
						},
						["<C-h>"] = {
							"actions.select",
							opts = { horizontal = true },
							desc = "Open the entry in a horizontal split",
						},
						["<C-t>"] = {
							"actions.select",
							opts = { tab = true },
							desc = "Open the entry in a horizontal split",
						},
						["<C-p>"] = "actions.preview",
						["q"] = "actions.close",
						["<C-l>"] = "actions.refresh",
						["-"] = "actions.parent",
						["_"] = "actions.open_cwd",
						["`"] = "actions.cd",
						["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
						["gs"] = "actions.change_sort",
						["gx"] = "actions.open_external",
						["g."] = "actions.toggle_hidden",
						["g\\"] = "actions.toggle_trash",
					},
					use_default_keymaps = true,
					view_options = {
						show_hidden = false,
						is_hidden_file = function(name, bufnr)
							return name == ".git"
						end,
						is_always_hidden = function(name, bufnr)
							return false
						end,
						natural_order = true,
						sort = {
							{ "type", "asc" },
							{ "name", "asc" },
						},
					},
					-- Configuration for the floating window in oil.open_float
					float = {
						-- Padding around the floating window
						padding = 2,
						max_width = 0,
						max_height = 0,
						border = "rounded",
						win_options = {
							winblend = 0,
						},
						override = function(conf)
							return conf
						end,
					},
					-- Configuration for the actions floating preview window
					preview = {
						max_width = 0.9,
						min_width = { 40, 0.4 },
						width = nil,
						max_height = 0.9,
						min_height = { 5, 0.1 },
						height = nil,
						border = "rounded",
						win_options = {
							winblend = 0,
						},
						update_on_cursor_moved = true,
					},
					progress = {
						max_width = 0.9,
						min_width = { 40, 0.4 },
						width = nil,
						max_height = { 10, 0.9 },
						min_height = { 5, 0.1 },
						height = nil,
						border = "rounded",
						minimized_border = "none",
						win_options = {
							winblend = 0,
						},
					},
					keymaps_help = {
						border = "rounded",
					},
				})
			end,
		},
	},
}
