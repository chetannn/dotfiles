local function find_config(bufnr, config_files)
	return vim.fs.find(config_files, {
		upward = true,
		stop = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
		path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
	})[1]
end

local function biome_or_prettier(bufnr)
	local has_biome_config = find_config(bufnr, { "biome.json", "biome.jsonc" })
	if has_biome_config then
		return { "biome", stop_after_first = true }
	end

	local has_prettier_config = find_config(bufnr, {
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.json5",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.toml",
		"prettier.config.js",
		"prettier.config.cjs",
	})
	if has_prettier_config then
		return { "prettier", stop_after_first = true }
	end

	return { "prettier", stop_after_first = true }
end

local filetypes_with_dynamic_formatter = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
	"css",
	"scss",
	"less",
	"html",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"markdown.mdx",
	"graphql",
	"handlebars",
}

return {

	{
		"stevearc/conform.nvim",
		name = "conform",
		config = function()
			local result = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
			}

			require("conform").setup({
				formatters_by_ft = (function()
					for _, ft in ipairs(filetypes_with_dynamic_formatter) do
						result[ft] = biome_or_prettier
					end
          return result
				end)(),
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
