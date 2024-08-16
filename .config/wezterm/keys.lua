local wezterm = require("wezterm")

local act = wezterm.action
local M = {}

M.mod = "SUPER"
M.extraMod = "SHIFT|SUPER"

M.smart_split = wezterm.action_callback(function(window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
  else
    window:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
  end
end)

---@class config Config
function M.setup(config)
  config.disable_default_key_bindings = true
  config.keys = {
    -- Scrollback
    { mods = M.mod, key = "k", action = act.ScrollByPage(-0.5) },
    { mods = M.mod, key = "j", action = act.ScrollByPage(0.5) },
    -- New Tab
    { mods = M.mod, key = "t", action = act.SpawnTab("CurrentPaneDomain") },
    -- Splits
    { mods = M.mod, key = "Enter", action = M.smart_split },
    { mods = M.mod, key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { mods = M.mod, key = "_", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    -- Close
    {
      key = "w",
      mods = M.mod,
      action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },
    {
      key = "W",
      mods = M.mod,
      action = wezterm.action.CloseCurrentTab({ confirm = true }),
    },
    -- Move Panes
    { mods = M.extraMod, key = "R", action = wezterm.action.RotatePanes("Clockwise") },
    { mods = M.extraMod, key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
    { mods = M.extraMod, key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
    { mods = M.extraMod, key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
    { mods = M.extraMod, key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
    -- Move Tabs
    { mods = M.extraMod, key = ">", action = act.MoveTabRelative(1) },
    { mods = M.extraMod, key = "<", action = act.MoveTabRelative(-1) },
    -- Acivate Tabs
    { mods = M.extraMod, key = "RightArrow", action = act({ ActivateTabRelative = 1 }) },
    { mods = M.extraMod, key = "LeftArrow", action = act({ ActivateTabRelative = -1 }) },
    -- show the pane selection mode, but have it swap the active and selected panes
    { mods = M.extraMod, key = "S", action = wezterm.action.PaneSelect({}) },
    -- Clipboard
    { mods = M.mod, key = "c", action = act.CopyTo("Clipboard") },
    { mods = M.extraMod, key = "Space", action = act.QuickSelect },
    { mods = M.extraMod, key = "X", action = act.ActivateCopyMode },
    { mods = M.mod, key = "f", action = act.Search("CurrentSelectionOrEmptyString") },
    { mods = M.mod, key = "v", action = act.PasteFrom("Clipboard") },
    -- Emojis
    {
      mods = M.mod,
      key = "u",
      action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
    },
    -- Magnify
    { mods = M.mod, key = "m", action = act.TogglePaneZoomState },
    -- Commands
    { mods = M.mod, key = "p", action = act.ActivateCommandPalette },
    -- Debug
    { mods = M.mod, key = "d", action = act.ShowDebugOverlay },
  }
end

return M
