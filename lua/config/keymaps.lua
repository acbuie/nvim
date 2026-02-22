vim.g.mapleader = " "

local keymap = vim.keymap

-- jk
keymap.set("i", "jk", "<esc>", { desc = "Exit Insert mode with `jk`" })

-- Indent in visual mode
keymap.set("v", "<Tab>", ">gv", { desc = "Indent line" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "Unindent line" })

-- save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- LSP
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
end, { desc = "Hover documentation" })
