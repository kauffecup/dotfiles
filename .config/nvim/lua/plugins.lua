local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins/lualine")
    end,
    event = "VimEnter",
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins/bufferline")
    end,
    branch = "main",
    event = "User FileOpened",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "folke/which-key.nvim",
    config = function()
      require("plugins/which-key")
    end,
    cmd = "WhichKey",
    event = "VeryLazy",
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins/telescope")
    end,
    dependencies = { "telescope-fzf-native.nvim", "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "Telescope",
  },
  { "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins/nvim-tree")
    end,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
    config = function()
      require("plugins/nvim-treesitter")
    end,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "User FileOpened",
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    lazy = true,
    event = "User FileOpened",
    dependencies = "mason.nvim",
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
    event = "User FileOpened",
    lazy = true,
  },
  { "nvimtools/none-ls.nvim", lazy = true },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins/nvim-cmp")
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "cmp-nvim-lsp", "cmp-buffer", "cmp-path", "cmp_luasnip" },
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_lua").lazy_load()
    end,
    event = "InsertEnter",
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("plugins/copilot")
    end,
    cmd = "Copilot",
    event = "InsertEnter",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins/gitsigns")
    end,
    event = "User FileOpened",
    cmd = "Gitsigns",
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("plugins/diffview")
    end,
    event = "User FileOpened",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins/comment")
    end,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
  {
    -- Lazy loaded by Comment.nvim pre_hook
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
})
