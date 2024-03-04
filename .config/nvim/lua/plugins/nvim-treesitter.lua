require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "typescript",
    "tsx",
    "yaml",
  },
  highlight = {
    enable = true,
  }
})
