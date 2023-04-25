-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "clang-format", filetypes = { "cpp" } },
    {
        command = "prettier",
        filetypes = {
            "javascriptreact",
            "javascript",
            "typescript",
            "typescriptreact",
            "css",
            "ruby"
        }
    },
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = {capabilities = capabilities}
require("lvim.lsp.manager").setup("clangd", opts)

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        command = "eslint_d",
        filetypes = {
            "javascriptreact",
            "javascript",
            "typescript",
            "typescriptreact"
        }
    }
}

-- Plugin Configuration
-- Use default theme for these telescope pickers
lvim.builtin.telescope.pickers.live_grep.theme = nil
lvim.builtin.telescope.pickers.grep_string.theme = nil

-- Add additional shortcut for buffer search (also exists via <leader>bf)
lvim.builtin.which_key.mappings["s"]["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["s"]["T"] = { "<cmd>Telescope grep_string<cr>", "String" }

-- Simpler launch screen
lvim.builtin.alpha.dashboard.section.header.val = ""

-- Additional Plugins
lvim.plugins = {
    { "zbirenbaum/copilot.lua" },
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
          vim.defer_fn(function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            }) -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
            require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
          end, 100)
        end,
    },
    -- {
    --   "zbirenbaum/copilot-cmp",
    --   after = { "copilot.lua" },
    --   config = function()
    --     require("copilot_cmp").setup()
    --   end
    -- },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
