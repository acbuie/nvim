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
  },
}
