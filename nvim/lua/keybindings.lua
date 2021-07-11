--
-- Global Keybindings
--

local cmd = vim.cmd
local nvim_set_keymap = vim.api.nvim_set_keymap

--   <Space> - PageDown
--   -       - PageUp
nvim_set_keymap('', '<Space>', '<PageDown>', {})
nvim_set_keymap('', '-', '<PageUp>', {})

-- Tab       - pane forward
-- Backspace - pane backward
nvim_set_keymap('n', '<Tab>', '<c-w>w', {})
nvim_set_keymap('n', '<bs>', '<c-w>W', {})
