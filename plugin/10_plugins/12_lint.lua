vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

-- Linter configuration
require("lint").linters_by_ft = {
  lua = { "selene" },
  markdown = { "markdown-lint" },
}

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})
