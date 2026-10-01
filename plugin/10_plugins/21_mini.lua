vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.comment" },
  { src = "https://github.com/nvim-mini/mini.pairs" },
  { src = "https://github.com/nvim-mini/mini.surround" },
  { src = "https://github.com/nvim-mini/mini.cursorword" },
})

require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.cursorword").setup()
