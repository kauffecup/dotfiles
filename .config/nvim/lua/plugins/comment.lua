require("Comment").setup({
  -- Ignore empty lines to be ignored while comment/uncomment.
  ignore = "^$",

  -- Sets commentstring opotion based on cursor location in file
  pre_hook = function(...)
    local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    if loaded and ts_comment then return ts_comment.create_pre_hook()(...) end
  end,
})
