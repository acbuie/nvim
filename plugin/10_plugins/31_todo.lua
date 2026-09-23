vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
})

require("todo-comments").setup()

vim.keymap.set("n", "<leader>st", function()
  Snacks.picker.todo_comments()
end, { desc = "Todo" })

vim.keymap.set("n", "<leader>sT", function()
  Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
end, { desc = "Todo/Fix/Fixme" })
