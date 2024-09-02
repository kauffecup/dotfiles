return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
        typescript = function(_, opts)
          opts.tsserver.log = "verbose"
        end,
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      -- omit logo
      local logo = [[]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")

      -- remove session and extras
      -- stylua: ignore
      opts.config.center = {
        { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
        { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
        { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
        { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
        { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
        { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
        { action = "lua require(\"mini.files\").open()",             desc = " File Explorer",   icon = " ", key = "e" },
        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
    end,
  },

  {
    "echasnovski/mini.files",
    options = {
      use_as_default_explorer = true,
    },
    keys = {
      { "<leader>fm", false },
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      { "<leader>fM", false },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<c-l>",
          next = "<c-j>",
          prev = "<c-k>",
          dismiss = "<c-h>",
        },
      },
    },
  },

  -- exclude
  { "zbirenbaum/copilot-cmp", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "MagicDuck/grug-far.nvim", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
}
