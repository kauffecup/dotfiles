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
    'hoob3rt/lualine.nvim',
    requires = {{ 'nvim-web-devicons' }},
    config = [[require('plugins/p-lualine')]]
  }
  use { 'hrsh7th/nvim-compe', config = [[require('plugins/p-compe')]] }
  -- Navigation Plugins
  use {
    'junegunn/fzf',
    run = [[fn['fzf#install']()]],
    config = [[require('plugins/p-fzf')]],
  }
  use 'junegunn/fzf.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{ 'nvim-web-devicons' }},
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
  -- Git Plugins
  use 'mhinz/vim-signify'
  use { 'tpope/vim-fugitive', config = [[require('plugins/p-vim-fugitive')]] }
  -- Color Theme
  use { 'folke/tokyonight.nvim', config = [[require('plugins/p-tokyonight')]] }
end)
