vim.pack.add({
  { src = "https://github.com/SmiteshP/nvim-navic" },
})

require("nvim-navic").setup({
  highlight = true,
  lsp = {
    auto_attach = true,
  },
})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
