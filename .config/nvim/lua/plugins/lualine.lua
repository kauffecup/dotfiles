local window_width_limit = 100

local conditions = {
  hide_in_width = function()
    return vim.o.columns > window_width_limit
  end,
}

local components = {
  mode = {
    function()
      return "󰀘 "
    end,
    padding = { left = 1, right = 1 },
    color = {},
    cond = nil,
    separator = { left = '' },
  },
  filename = { "filename" },
  diff = {
    "diff",
    source = function ()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end,
    symbols = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    padding = { left = 2, right = 1 },
    cond = nil,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = " ",
      warn = " ",
      info = " ",
      hint = " ",
    },
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_client_names = {}
      local copilot_active = false

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          table.insert(buf_client_names, client.name)
        end

        if client.name == "copilot" then
          copilot_active = true
        end
      end

      local unique_client_names = table.concat(buf_client_names, ", ")
      local language_servers = string.format("[%s]", unique_client_names)

      if copilot_active then
        language_servers = language_servers .. "%#SLCopilot# %*"
      end

      return language_servers
    end,
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
  },
  location = { "location" },
  progress = {
    "progress",
    fmt = function()
      return "%P/%L"
    end,
    color = {},
    separator = { right = '' },
    left_padding = 2
  },
  spaces = {
    function()
      local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
      return "󰌒 " .. shiftwidth
    end,
    padding = 1,
  },
  filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
}

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '',
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { components.mode },
    lualine_b = { components.filename },
    lualine_c = { components.diff },
    lualine_x = {
      components.diagnostics,
      components.lsp,
      components.spaces,
      components.filetype,
    },
    lualine_y = { components.location },
    lualine_z = { components.progress },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {
      components.diagnostics,
      components.lsp,
      components.spaces,
      components.filetype,
    },
    lualine_y = { components.location },
    lualine_z = { components.progress },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
