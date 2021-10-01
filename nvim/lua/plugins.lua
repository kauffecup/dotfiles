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
  use { 'kyazdani42/nvim-web-devicons', config = [[require('plugins/p-nvim-web-devicons')]] }
  -- Interface Plugins
  use {
    "glepnir/galaxyline.nvim",
    config = [[require('plugins/p-galaxyline')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use { 'hrsh7th/nvim-compe', config = [[require('plugins/p-compe')]] }
  -- Enhancement Plugins
  use { 'prettier/vim-prettier', run = 'npm install', config = [[require('plugins/p-vim-prettier')]] }
  use { 'windwp/nvim-autopairs', config = [[require('plugins/p-autopairs')]]  }
  use 'tpope/vim-surround'
  -- Navigation Plugins
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('plugins/p-telescope')]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('plugins/p-nvim-tree')]],
  }
  -- Language Plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('plugins/p-treesitter')]]
  }
  use 'kabouzeid/nvim-lspinstall'
  use { 'neovim/nvim-lspconfig', config = [[require('plugins/p-lspconfig')]] } -- config for both lspconfig and lspinstall
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {'plenary.nvim', 'nvim-lspconfig'},
    config = [[require('plugins/p-null-ls')]],
  }
  -- Git Plugins
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require('plugins/p-gitsigns')]]
  }
  -- Color Theme
  use { 'folke/tokyonight.nvim', config = [[require('plugins/p-tokyonight')]] }
end)
