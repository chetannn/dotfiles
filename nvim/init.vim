set mouse=a
set number
set relativenumber
set background=dark
set encoding=UTF-8
set autoindent
set smartindent
set splitbelow splitright
set title
set wildmenu
filetype plugin indent on
syntax on
set spell
set ttyfast
set ignorecase
set smartcase
set list
set expandtab
set nowrap
set scrolloff=8
set sidescrolloff=8
set termguicolors
set undofile
set ruler
set colorcolumn=90
set cursorline

call plug#begin()

" theme, icons and other stuffs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'overcache/NeoSolarized'
Plug 'olivercederborg/poimandres.nvim'
Plug 'morhetz/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-test/vim-test'


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" lsp
Plug 'neovim/nvim-lspconfig'

" auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'

" floaterm plugin
Plug 'voldikss/vim-floaterm'
Plug 'numToStr/FTerm.nvim'


call plug#end()

" setting space as the leader key
let mapleader = " "

colorscheme nightfox

" mappings related to telescope (fuzzy finder tool)
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Vim test related settings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" floaterm toggle default
let g:floaterm_keymap_toggle = '<Leader>ft'

" loading the lua configurations
lua require('user')
