return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    require("gruvbox").setup({
      overrides = {
        NormalFloat = { link = "Normal" },
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
