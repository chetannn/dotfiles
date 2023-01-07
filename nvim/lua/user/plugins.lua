local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]] return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
use {'dracula/vim', as = 'dracula'}
use { 'kyazdani42/nvim-web-devicons' }
use {
        'kyazdani42/nvim-tree.lua',
        requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function() 
                require('user.plugins.nvim-tree')
        end 
}
use { 
'nvim-lualine/lualine.nvim',   
requires = { 'kyazdani42/nvim-web-devicons', opt = true },
 config = function() 
         require('lualine').setup() 
 end
 }

use { 'voldikss/vim-floaterm' }
use { 'nvim-lua/plenary.nvim' }
use {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function() 
          require('user.plugins.telescope')
  end
}
use {
        'neovim/nvim-lspconfig',
        config = function()
          require('user.plugins.lsp')
        end
}
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-path' }
use { 'L3MON4D3/LuaSnip' }
use { 'hrsh7th/nvim-cmp' }
use { 'morhetz/gruvbox'}
use { 'overcache/NeoSolarized' }
use { 'nvim-treesitter/nvim-treesitter',
run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
config = function()
        require('user.plugins.treesitter')
end
}
use  { 'vim-test/vim-test' } 
use { 'EdenEast/nightfox.nvim' }
use { 
  'olivercederborg/poimandres.nvim',
  config = function()
    require('poimandres').setup {
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
    }
    vim.cmd('colorscheme poimandres')
  end
}
use {
    'tamton-aquib/duck.nvim',
    config = function()
        vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🎅") end, {})
        vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end
}

 if packer_bootstrap then
    require('packer').sync()
  end
end)
