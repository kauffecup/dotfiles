local function diagnostics_indicator(num, _, diagnostics, _)
  local result = {}
  local symbols = {
    error = "",
    warning = "",
    info = "",
  }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. " " .. count)
    end
  end
  result = table.concat(result, " ")
  return #result > 0 and result or ""
end

-- can't be set in settings.lua because default tabline would flash before bufferline is loaded
vim.opt.showtabline = 2

require("bufferline").setup({
  options = {
    right_mouse_command = "vert sbuffer %d",
    indicator = {
      icon = "▎",
      style = "icon",
    },
    buffer_close_icon = "󰅖",
    modified_icon = " ",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true,  -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = diagnostics_indicator,
  }
})
