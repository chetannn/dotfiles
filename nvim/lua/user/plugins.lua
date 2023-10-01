return {
    { 'rebelot/kanagawa.nvim' },
    { 'tpope/vim-commentary' },
    { "tpope/vim-surround" },
    { "tpope/vim-sleuth" },
    { "christoomey/vim-tmux-navigator" },
    { "tpope/vim-sleuth" },
    { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate' },
    { "VonHeikemen/lsp-zero.nvim", branch = 'v3.x', },
  -- LSP Support
   {'neovim/nvim-lspconfig'},
   {'williamboman/mason.nvim'},
   {'williamboman/mason-lspconfig.nvim'},
  -- Autocompletion
   {'hrsh7th/nvim-cmp'},
   {'hrsh7th/cmp-nvim-lsp'},
   {'L3MON4D3/LuaSnip'},
   { "jose-elias-alvarez/null-ls.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },
   {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
   },
   { "catppuccin/nvim", name = "catppuccin" },
}
