local which_key = require "which-key"

which_key.setup({})

which_key.register({
  e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  s = {
    name = "Search",
    f = { "<cmd>Telescope find_files<CR>", "Find File" },
    t = { "<cmd>Telescope live_grep<CR>", "Text" },
    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    R = { "<cmd>Telescope registers<CR>", "Registers" },

    h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    C = { "<cmd>Telescope commands<CR>", "Commands" },
    l = { "<cmd>Telescope resume<CR>", "Resume last search" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>",
      "Colorscheme",
    },
  },
}, {
  prefix = "<leader>",
})
