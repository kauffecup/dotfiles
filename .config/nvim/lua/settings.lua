--
-- General Settings
-- :h defaults
--

-- File encoding
if vim.fn.has('vim_starting') then
  vim.o.encoding = 'utf-8'
  vim.o.fileencoding = 'utf-8'
  vim.o.fileencodings = 'utf-8'
end

-- ============================================================================
-- ===                           EDITING OPTIONS                            ===
-- ============================================================================

-- Use spaces instead of tabs.
vim.o.expandtab = true
-- Tab key indents by 2 spaces.
vim.o.softtabstop = 2
-- >> indents by 2 spaces.
vim.o.shiftwidth = 2
-- Do not wrap long lines by default
vim.o.wrap = false
-- Disable line/column number in status line
vim.o.ruler = false
-- Yank and paste with the system clipboard
vim.o.clipboard = 'unnamedplus'
-- Only one line for command line
vim.o.cmdheight = 1
-- so that `` is visible in markdown files
vim.o.conceallevel = 0
-- treesitter based folding
vim.o.foldmethod = 'expr'
-- required to keep multiple buffers and open multiple buffers
vim.o.hidden = true
-- highlight all matches on previous search pattern
vim.o.hlsearch = true
-- force all horizontal splits to go below current window
vim.o.splitbelow = true
-- force all vertical splits to go to the right of the current window
vim.o.splitright = true

-- ============================================================================
-- ===                                  UI                                  ===
-- ============================================================================

-- Enable mouse for all modes
vim.o.mouse = 'a'
-- Enable syntax highlighting
vim.cmd('syntax on')
-- Enable true color support
vim.o.termguicolors = true
-- Enable line numbers
vim.cmd('set number')
-- pop up menu height
vim.o.pumheight = 10
-- we dont need to see things like -- INSERT -- anymore
vim.o.showmode = false
-- highlight the current line
vim.o.cursorline = true
-- set numbered lines
vim.o.number = true
-- set number column width to 2 {default 4}
vim.o.numberwidth = 2
-- always show the sign column, otherwise it would shift the text each time
vim.o.signcolumn = 'yes'
-- minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 8
-- minimal number of screen lines to keep left and right of the cursor.
vim.o.sidescrolloff = 8

-- ============================================================================
-- ===                                 MISC                                 ===
-- ============================================================================

-- ignore case when searching
vim.o.ignorecase = true
-- if the search string has an upper case letter in it, the search will be case sensitive
vim.o.smartcase = true
-- Automatically re-read file if a change was detected outside of vim
vim.cmd('set autoread')
-- creates a swap file
vim.o.swapfile = false
-- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.ttimeoutlen = 100
-- set the title of window to the value of the titlestring
vim.o.title = true
-- Eagerly disable netrw (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
