vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()

-- Enable lsps -> comment is :MasonInstall <lsp>
vim.lsp.enable("lua_ls") -- lua-language-server

-- Web
vim.lsp.enable("astro") -- astro-language-server
vim.lsp.enable("cssls") -- css-lsp
vim.lsp.enable("tailwindcss") -- tailwind-language-server

-- Python
vim.lsp.enable("ty") -- ty
vim.lsp.enable("ruff") -- ruff
