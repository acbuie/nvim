vim.pack.add({
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/saghen/blink.cmp", version = "main" },
})

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup()
