vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'rebelot/kanagawa.nvim'

use 'tpope/vim-commentary'

use 'tpope/vim-surround'

use 'tpope/vim-sleuth'

use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    {'neovim/nvim-lspconfig'},
    {                             
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
})

  end)
