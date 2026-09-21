vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()

-- Enable
vim.lsp.enable("lua_ls") -- lua-language-server
