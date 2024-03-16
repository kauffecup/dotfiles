local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      only_sort_text = true, --don't include the filename in the search results
    },
    grep_string = {
      only_sort_text = true,
    },
    buffers = {
      initial_mode = "normal",
    },
    git_files = {
      hidden = true,
      show_untracked = true,
    },
    colorscheme = {
      enable_preview = true,
    },
    git_commits = {
      mappings = {
        i = {
          ["<CR>"] = function() -- show diffview for the selected commit
            local entry = action_state.get_selected_entry()
            -- close Telescope window properly prior to switching windows
            actions.close(vim.api.nvim_get_current_buf())
            vim.cmd(("DiffviewOpen %s^!"):format(entry.value))
          end,
        },
      },
    },
    git_bcommits = {
      mappings = {
        i = {
          ["<CR>"] = function() -- show diffview for the selected commit of current buffer
            local entry = action_state.get_selected_entry()
            -- close Telescope window properly prior to switching windows
            actions.close(vim.api.nvim_get_current_buf())
            vim.cmd(("DiffviewOpen %s^!"):format(entry.value))
          end,
        },
      },
    },
    git_branches = {
      mappings = {
        i = {
          ["<CR>"] = function() -- show diffview comparing the selected branch with the current branch
            local entry = action_state.get_selected_entry()
            -- close Telescope window properly prior to switching windows
            actions.close(vim.api.nvim_get_current_buf())
            vim.cmd(("DiffviewOpen %s.."):format(entry.value))
          end,
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

require("telescope").load_extension("fzf")
