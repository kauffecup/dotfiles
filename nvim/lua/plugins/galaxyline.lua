-- Don't dispay mode in command line (lualine already shows it)
vim.cmd('set noshowmode')

local gl = require 'galaxyline'
local condition = require 'galaxyline.condition'
local colors = require('galaxyline.theme').default
local gls = gl.section

gl.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

table.insert(gls.left, {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.blue,
        i = colors.green,
        v = colors.magenta,
        [""] = colors.magenta,
        V = colors.magenta,
        c = colors.violet,
        no = colors.blue,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
        ic = colors.yellow,
        R = colors.red,
        Rv = colors.red,
        cv = colors.blue,
        ce = colors.blue,
        r = colors.cyan,
        rm = colors.cyan,
        ["r?"] = colors.cyan,
        ["!"] = colors.blue,
        t = colors.blue,
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return "▊"
    end,
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { "NONE", colors.alt_bg },
  },
})

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return "  "
    end,
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { colors.orange, colors.alt_bg },
  },
})

table.insert(gls.left, {
  GitBranch = {
    provider = "GitBranch",
    condition = condition.check_git_workspace,
    separator = " ",
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { colors.grey, colors.alt_bg },
  },
})

table.insert(gls.left, {
  DiffAdd = {
    provider = "DiffAdd",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.green, colors.alt_bg },
  },
})

table.insert(gls.left, {
  DiffModified = {
    provider = "DiffModified",
    condition = condition.hide_in_width,
    icon = " 柳",
    highlight = { colors.blue, colors.alt_bg },
  },
})

table.insert(gls.left, {
  DiffRemove = {
    provider = "DiffRemove",
    condition = condition.hide_in_width,
    icon = "  ",
    highlight = { colors.red, colors.alt_bg },
  },
})

table.insert(gls.mid, {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon_color,
      colors.bg
    },
  },
})
 
table.insert(gls.mid, {
  SFileName = {
    provider = "FileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.grey, colors.alt_bg },
  },
})

table.insert(gls.right, {
  DiagnosticError = {
    provider = "DiagnosticError",
    icon = "  ",
    highlight = { colors.red, colors.alt_bg },
  },
})
table.insert(gls.right, {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    icon = "  ",
    highlight = { colors.orange, colors.alt_bg },
  },
})

table.insert(gls.right, {
  DiagnosticInfo = {
    provider = "DiagnosticInfo",
    icon = "  ",
    highlight = { colors.yellow, colors.alt_bg },
  },
})

table.insert(gls.right, {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    icon = "  ",
    highlight = { colors.blue, colors.alt_bg },
  },
})

table.insert(gls.right, {
  TreesitterIcon = {
    provider = function()
      if next(vim.treesitter.highlighter.active) ~= nil then
        return "  "
      end
      return ""
    end,
    separator = " ",
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { colors.green, colors.alt_bg },
  },
})

table.insert(gls.right, {
  ShowLspClient = {
    provider = function(msg)
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return ""
      end
      return " ";
    end,
    condition = function()
      local tbl = { ["dashboard"] = true, [" "] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    highlight = { colors.blue, colors.alt_bg },
  },
})

table.insert(gls.right, {
  LineInfo = {
    provider = "LineColumn",
    separator = "  ",
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { colors.grey, colors.alt_bg },
  },
})

table.insert(gls.right, {
  PerCent = {
    provider = "LinePercent",
    separator = " ",
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { colors.grey, colors.alt_bg },
  },
})

table.insert(gls.right, {
  Space = {
    provider = function()
      return " "
    end,
    separator = " ",
    separator_highlight = { "NONE", colors.alt_bg },
    highlight = { colors.grey, colors.alt_bg },
  },
})

table.insert(gls.short_line_left, {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { colors.grey, colors.alt_bg },
  },
})


table.insert(gls.short_line_left, {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.grey, colors.alt_bg },
  },
})
