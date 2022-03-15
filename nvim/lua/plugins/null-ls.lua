local nls = require("null-ls")
require("null-ls.helpers")
local lsputil = require("lspconfig.util")

local function check_dir_for_eslint(dir)
  return (
    lsputil.path.exists(lsputil.path.join(dir, ".eslintrc"))
    or lsputil.path.exists(lsputil.path.join(dir, ".eslintrc.js"))
    or lsputil.path.exists(lsputil.path.join(dir, ".eslintrc.cjs"))
    or lsputil.path.exists(lsputil.path.join(dir, ".eslintrc.yaml"))
    or lsputil.path.exists(lsputil.path.join(dir, ".eslintrc.yml"))
    or lsputil.path.exists(lsputil.path.join(dir, ".eslintrc.json"))
  )
end

local function eslint_condition()
  local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:h")
  return check_dir_for_eslint(filepath) or lsputil.path.traverse_parents(filepath, check_dir_for_eslint)
end

local diagnostics = nls.builtins.diagnostics
local formatting = nls.builtins.formatting

nls.setup({
  sources = {
    diagnostics.eslint_d.with({ runtime_condition = eslint_condition }),
    formatting.eslint_d.with({ runtime_condition = eslint_condition }),
    formatting.prettier.with({ runtime_condition = function() return vim.fn.mode() == 'V' end})
  },
  root_dir = function(fname)
    return lsputil.path.traverse_parents(fname, function(dir)
      return lsputil.path.exists(dir .. '/package.json') and (dir .. '/package.json')
    end)
  end,
  debug = true
})
