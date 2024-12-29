local options = {
	mouse = "a",
	number = true,
	relativenumber = true,
	encoding = "UTF-8",
	autoindent = true,
	smartindent = true,
	title = true,
	wildmenu = false,
	syntax = "on",
	spell = true,
	ttyfast = true,
	ignorecase = true,
	smartcase = true,
	list = true,
	tabstop = 2,
	shiftwidth = 2,
	smarttab = true,
	expandtab = true,
	scrolloff = 8,
	sidescrolloff = 8,
	termguicolors = true,
	undofile = true,
	backup = false,
	ruler = true,
	cursorline = true,
	nu = true,
	hlsearch = false,
	incsearch = true,
	updatetime = 50,
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

for k, v in pairs(options) do
	vim.opt[k] = v
end
