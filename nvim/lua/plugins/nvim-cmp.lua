local nvim_set_keymap = vim.api.nvim_set_keymap
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
}

require('nvim-autopairs.completion.cmp').setup({
  map_cr = true,
  map_complete = true,
  auto_select = true,
  map_char = {
    all = '(',
    tex = '{'
  }
})
