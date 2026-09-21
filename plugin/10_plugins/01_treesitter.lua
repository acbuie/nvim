vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  },
})

local ts = require("nvim-treesitter")

ts.setup()

-- Install parsers
ts.install({
  "lua",
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" then
      local ok = pcall(vim.cmd, "TSUpdate")
      if ok then
        vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
      else
        vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Start treesitter",
  pattern = { "*" },
  callback = function()
    local filetype = vim.bo.filetype
    if filetype and filetype ~= "" then
      local success = pcall(function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end)
      if not success then
        return
      end
    end
  end,
})
