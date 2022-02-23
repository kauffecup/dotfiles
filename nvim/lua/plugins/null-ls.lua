local nls = require('null-ls')
local helpers = require('null-ls.helpers')

local function eslint_condition(utils)
  local has_js_config = utils.root_has_file('.eslintrc.js') or utils.root_has_file('.eslintrc.cjs')
  local has_yaml_config = utils.root_has_file('.eslintrc.yaml') or utils.root_has_file('.eslintrc.yml')
  local has_json_config = utils.root_has_file('.eslintrc.json')
  return has_js_config or has_yaml_config or has_json_config
end

require("null-ls").setup({
  sources = {
    nls.builtins.diagnostics.eslint_d.with({
      condition = eslint_condition
    }),
    nls.builtins.formatting.eslint_d.with({
      condition = eslint_condition
    }),
  }
})
