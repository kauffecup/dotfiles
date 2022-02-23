local cmd = vim.cmd
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

require('packer').startup(function ()
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- Base Dependencies
  use { 'kyazdani42/nvim-web-devicons', config = [[require('plugins/nvim-web-devicons')]] }
  -- Interface Plugins
  use {
    "glepnir/galaxyline.nvim",
    config = [[require('plugins/galaxyline')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'folke/trouble.nvim', requires = {'nvim-web-devicons'}, config = [[require('plugins/trouble')]] }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/vim-vsnip', -- required for autocompletion to work, even without snippets
      'onsails/lspkind-nvim',
    },
    config = [[require('plugins/nvim-cmp')]],
  }
  -- Enhancement Plugins
  use { 'prettier/vim-prettier', run = 'npm install', config = [[require('plugins/vim-prettier')]] }
  use { 'windwp/nvim-autopairs', config = [[require('plugins/nvim-autopairs')]]  }
  use 'tpope/vim-surround'
  -- Navigation Plugins
  use {
    'nvim-telescope/telescope.nvim',
    commit = '2c573b9d12f421cec74a215f79b25591fe083352',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('plugins/telescope')]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('plugins/nvim-tree')]],
  }
  -- Language Plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('plugins/nvim-treesitter')]]
  }
  use { 'neovim/nvim-lspconfig', config = [[require('plugins/nvim-lspconfig')]] } -- config for both lspconfig and lspinstall
  use { 'williamboman/nvim-lsp-installer' }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'plenary.nvim', 'nvim-lspconfig'},
    config = [[require('plugins/null-ls')]],
  }
  -- Git Plugins
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require('plugins/gitsigns')]]
  }
  -- Color Theme
  use { 'folke/tokyonight.nvim', config = [[require('plugins/tokyonight')]] }
end)
