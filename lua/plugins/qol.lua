return {
  -- {
  --   "numToStr/Comment.nvim",
  --   opts = function()
  --     local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
  --     return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
  --   end,
  -- },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = { Timeout = 300 },
  },
}
