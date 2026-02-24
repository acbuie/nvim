return {
  "folke/which-key.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", config = true },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    preset = "modern",
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>s", group = "Search (grep)" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>l", group = "LSP", icon = { icon = "󰿘", hl = "Keyword" } },
      { "<leader>b", group = "Buffer" },
      { "<leader>u", group = "User Toggles" },
    },
  },
}
