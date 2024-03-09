-- From the docs, "It's important that you set up the plugins in the following order:
--   1. mason.nvim
--   2. mason-lspconfig.nvim
--   3. Setup servers via lspconfig
require("mason").setup()
require("mason-lspconfig").setup()

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
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
end

local defaults = {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

require("lspconfig").bashls.setup(defaults)
require("lspconfig").clangd.setup(defaults)
require("lspconfig").cssls.setup(defaults)
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

require("lspconfig").eslint.setup({
  capabilities = defaults.capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.clang_format,

    null_ls.builtins.diagnostics.luacheck,
  },
  on_attach = on_attach,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufopts = function(desc)
      return { buffer = ev.buf, desc = desc }
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts('Go to Declaration'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('Go to Definition'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts('Go to Implementation'))
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts('Singature Help'))
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts('Type Definition'))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts('Rename with LSP'))
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts('Code Action'))
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts('Go to Reference'))
  end,
})

local signs = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
