local cmp = require("cmp")
local cmp_mapping = require("cmp.config.mapping")
local cmp_types = require("cmp.types.cmp")
local luasnip = require("luasnip")

local ConfirmBehavior = cmp_types.ConfirmBehavior
local SelectBehavior = cmp_types.SelectBehavior

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
    { name = "treesitter" },
  },
  completion = {
    keyword_length = 1, -- The minimum length of a word to complete on.
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    max_width = 0,
    -- kind_icons = lvim.icons.kind,
    source_names = {
      nvim_lsp = "(LSP)",
      path = "(Path)",
      luasnip = "(Snippet)",
      buffer = "(Buffer)",
      treesitter = "(TreeSitter)",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    duplicates_default = 0,
  },
  mapping = cmp_mapping.preset.insert {
    ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
    ["<Down>"] = cmp_mapping(cmp_mapping.select_next_item { behavior = SelectBehavior.Select }, { "i" }),
    ["<Up>"] = cmp_mapping(cmp_mapping.select_prev_item { behavior = SelectBehavior.Select }, { "i" }),
    ["<C-d>"] = cmp_mapping.scroll_docs(-4),
    ["<C-f>"] = cmp_mapping.scroll_docs(4),
    ["<C-y>"] = cmp_mapping {
      i = cmp_mapping.confirm { behavior = ConfirmBehavior.Replace, select = false },
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm { behavior = ConfirmBehavior.Replace, select = false }
        else
          fallback()
        end
      end,
    },
    ["<Tab>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-Space>"] = cmp_mapping.complete(),
    ["<C-e>"] = cmp_mapping.abort(),
    ["<CR>"] = cmp_mapping(function(fallback)
      if cmp.visible() then
        local confirm_opts = {
          behavior = ConfirmBehavior.Replace,
          select = false,
        }
        local is_insert_mode = function()
          return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
        end
        if is_insert_mode() then -- prevent overwriting brackets
          confirm_opts.behavior = ConfirmBehavior.Insert
        end
        local entry = cmp.get_selected_entry()
        local is_copilot = entry and entry.source.name == "copilot"
        if is_copilot then
          confirm_opts.behavior = ConfirmBehavior.Replace
          confirm_opts.select = true
        end
        if cmp.confirm(confirm_opts) then
          return -- success, exit early
        end
      end
      fallback() -- if not exited early, always fallback
    end),
  },
})
