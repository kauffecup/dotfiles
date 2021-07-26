require('telescope').setup{
  defaults = {
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<Leader>f',
  [[<Cmd>lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<CR>]],
  { noremap = true, silent = true }
)
