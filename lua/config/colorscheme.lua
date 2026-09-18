vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })

require("gruvbox").setup({
  overrides = {
    NormalFloat = { link = "Normal" },
    Pmenu = { link = "Normal" },
  }
})

vim.cmd.colorscheme("gruvbox")
