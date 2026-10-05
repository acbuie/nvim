vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim" },
})

require("bufferline").setup({
  options = {
    close_command = function(n)
      Snacks.bufdelete(n)
    end,
    right_mouse_command = function(n)
      Snacks.bufdelete(n)
    end,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diag)
      local ret = (diag.error and " " .. diag.error .. " " or "") .. (diag.warning and " " .. diag.warning or "")
      return vim.trim(ret)
    end,
    offsets = {
      {
        filetype = "snacks_layout_box",
        text = "Snacks.explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    separator_style = "slope",
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    indicator = {
      style = "underline",
    },
  },
})

vim.keymap.set("n", "S-h", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycle prev buffer" })
vim.keymap.set("n", "S-l", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycle next buffer" })
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycle prev buffer" })
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycle next buffer" })
vim.keymap.set("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })
vim.keymap.set("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })

vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set(
  "n",
  "<leader>bD",
  "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
  { desc = "Close all but current buffer" }
)
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close buffers to left" })
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close buffers to right" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggle buffer pin" })
vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "Close non-pinned buffers" })
