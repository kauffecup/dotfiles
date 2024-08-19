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
        { action = "Oil",                                            desc = " File Explorer",   icon = " ", key = "-" },
        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
    end,
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(path)
          return path == ".." or path == ".git"
        end,
      },
      window_options = {
        wrap = true,
      },
      -- remap keys so we can have consistency for splits and pane navigation
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<leader>|"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<leader>-"] = {
          "actions.select",
          opts = { horizontal = true },
          desc = "Open the entry in a horizontal split",
        },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = "actions.preview",
        ["q"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
    },
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "File explorer",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },

  -- exclude
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
