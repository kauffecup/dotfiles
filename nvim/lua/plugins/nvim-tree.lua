local cmd = vim.cmd
local g = vim.g
local nvim_set_keymap = vim.api.nvim_set_keymap

nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<Cr>', {})
nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<Cr>', {})
nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<Cr>', {})

-- Icons
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback

require'nvim-tree'.setup {
  view = {
    mappings = {
      list = {
        { key = 'd', cb = tree_cb('remove') },
        { key = 'm', cb = tree_cb('rename') },
        { key = 'M', cb = tree_cb('full_rename') },
        { key = 't', cb = tree_cb('tabnew') },
        { key = {'<Esc>', '<C-d>', 'q'}, cb = tree_cb('close') }
      }
    }
  }
}

-- Colors
cmd('highlight NvimTreeFolderIcon ctermfg=blue')
cmd('highlight NvimTreeGitDirty ctermfg=green')
cmd('highlight NvimTreeGitStaged ctermfg=yellow')
cmd('highlight NvimTreeGitNew ctermfg=blue')