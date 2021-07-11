require'nvim-treesitter.configs'.setup {
  -- Consistent syntax highlighting.
  highlight = {
    enable = true,
  },
  -- Incremental selection based on the named nodes from the grammar.
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  -- Indentation based on treesitter for the = operator
  indent = {
    enable = true,
  },
}
