--
-- General Settings
-- :h defaults
--

local cmd = vim.cmd
local env = vim.env
local o = vim.o
local opt = vim.opt

-- File encoding
if vim.fn.has('vim_starting') then
  o.encoding = 'utf-8'
  o.fileencoding = 'utf-8'
  o.fileencodings = 'utf-8'
end

-- Load plugins according to detected filetype
cmd('filetype plugin indent on')

-- ============================================================================
-- ===                           EDITING OPTIONS                            ===
-- ============================================================================

-- Use spaces instead of tabs.
o.expandtab = true
-- Tab key indents by 2 spaces.
o.softtabstop = 2
-- >> indents by 2 spaces.
o.shiftwidth = 2
-- Do not wrap long lines by default
cmd('set nowrap')
-- Don't highlight current cursor line
cmd('set nocursorline')
-- Disable line/column number in status line
cmd('set noruler')
-- Yank and paste with the system clipboard
o.clipboard = 'unnamed'
-- Only one line for command line
o.cmdheight = 1

-- ============================================================================
-- ===                                  UI                                  ===
-- ============================================================================

-- Enable mouse for all modes
o.mouse = 'a'
-- Enable syntax highlighting
cmd('syntax on')
-- Enable true color support
cmd('set termguicolors')
-- Enable line numbers
cmd('set number')

-- ============================================================================
-- ===                                 MISC                                 ===
-- ============================================================================

-- ignore case when searching
cmd('set ignorecase')
-- if the search string has an upper case letter in it, the search will be case sensitive
cmd('set smartcase')
-- Automatically re-read file if a change was detected outside of vim
cmd('set autoread')
