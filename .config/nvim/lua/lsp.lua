-- From the docs, "It's important that you set up the plugins in the following order:
--   1. mason.nvim
--   2. mason-lspconfig.nvim
--   3. Setup servers via lspconfig
require("mason").setup()
require("mason-lspconfig").setup()

local defaults = {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

require("lspconfig").bashls.setup(defaults)
require("lspconfig").cssls.setup(defaults)
require("lspconfig").eslint.setup(defaults)
require("lspconfig").gopls.setup(defaults)
require("lspconfig").jsonls.setup(defaults)
require("lspconfig").lemminx.setup(defaults)
require("lspconfig").lua_ls.setup(defaults)
require("lspconfig").solargraph.setup(defaults)
require("lspconfig").svls.setup(defaults)
require("lspconfig").tailwindcss.setup(defaults)
require("lspconfig").tsserver.setup(defaults)
require("lspconfig").vimls.setup(defaults)
require("lspconfig").yamlls.setup(defaults)

require("lspconfig").clangd.setup(defaults)

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
