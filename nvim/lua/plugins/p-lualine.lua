-- Don't dispay mode in command line (lualine already shows it)
vim.cmd('set noshowmode')

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    icons_enabled = true
  }
}
