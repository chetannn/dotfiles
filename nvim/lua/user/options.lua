local options = {
mouse="a",
number=true,
relativenumber=true,
background=dark,
encoding="UTF-8",
autoindent = true,
smartindent = true,
title=true,
wildmenu=true,
syntax="on",
spell=true,
ttyfast=true,
ignorecase=true,
smartcase=true,
list=true,
smarttab=true,
expandtab=true,
scrolloff=8,
sidescrolloff=8,
termguicolors=true,
undofile=true,
backup=false,
ruler=true,
cursorline=true,
clipboard="unnamedplus",
nu=true,
hlsearch=true,
incsearch=true,
updatetime=50
}

for k,v in pairs(options) do
        vim.opt[k] = v
end
