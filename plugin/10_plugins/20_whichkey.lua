vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local wk = require("which-key")

wk.setup({
  preset = "modern"
})

wk.add({
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>s", group = "Search (grep)" },
    { "<leader>x", group = "Diagnostics" },
    -- { "<leader>l", group = "LSP", icon = { icon = "󰿘", hl = "Keyword" } },
    { "<leader>b", group = "Buffer" },
    { "<leader>u", group = "User Toggles" },
})
