--
-- Global Keybindings
--

local function register_mappings(mappings, default_options)
  for mode, mode_mappings in pairs(mappings) do
    for _, mapping in pairs(mode_mappings) do
      local options = #mapping == 3 and table.remove(mapping) or default_options
      local prefix, cmd = unpack(mapping)
      pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
    end
  end
end

local mappings = {
  n = { -- Normal mode
    -- Better window movement
    { "<C-h>", "<C-w>h", { silent = true } },
    { "<C-j>", "<C-w>j", { silent = true } },
    { "<C-k>", "<C-w>k", { silent = true } },
    { "<C-l>", "<C-w>l", { silent = true } },

    -- Resize with arrows
    { "<A-Up>", ":resize -2<CR>", { silent = true } },
    { "<A-Down>", ":resize +2<CR>", { silent = true } },
    { "<A-Left>", ":vertical resize -2<CR>", { silent = true } },
    { "<A-Right>", ":vertical resize +2<CR>", { silent = true } },

    -- QuickFix
    { "]q", ":cnext<CR>" },
    { "[q", ":cprev<CR>" },

    --   <Space> - PageDown
    { "<Space>", "<PageDown>" },
    { "-", "<PageUp>" },
  },
  v = { -- Visual/Select mode
    -- Better indenting
    { "<", "<gv" },
    { ">", ">gv" },
  },
  [""] = {
    -- Toggle the QuickFix window
    { "<C-q>", ":call QuickFixToggle()<CR>" },
  },
}

register_mappings(mappings, { silent = true, noremap = true })
