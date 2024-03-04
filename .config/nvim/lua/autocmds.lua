vim.api.nvim_create_autocmd({"BufRead", "BufWinEnter", "BufNewFile"}, {
  nested = true,
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if not (vim.fn.expand "%" == "" or buftype == "nofile") then
      vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
    end
  end,
})
