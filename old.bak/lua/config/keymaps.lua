-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Indent in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent line" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent line" })

-- Comment
--vim.keymap.set("n", "<leader>/", function()
--  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
-- end, { desc = "Toggle comment line" })
-- vim.keymap.set(
--  "v",
--  "<leader>/",
--  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--  { desc = "Toggle comment selection" }
-- )
