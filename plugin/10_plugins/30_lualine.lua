vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local lualine = require("lualine")

vim.o.laststatus = vim.g.lualine_laststatus

local lsp_clients = function()
  -- Only get lsp client for active buffer
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if next(clients) == nil then
    return "󰣖 —"
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end

  return "󰣖 " .. table.concat(c, "|")
end

local config = {
  options = {
    theme = "gruvbox",
    globalstatus = vim.o.laststatus == 3,
    disabled_filetypes = { statusline = { "snacks_dashboard" } },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "filename", separator = "" },
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
    },
    lualine_c = {
      "branch",
      {
        "diff",
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.modified,
              removed = gitsigns.removed,
            }
          end
        end,
      },
    },
    lualine_x = {
      {
        function()
          return "  " .. require("dap").status()
        end,
        cond = function()
          return package.loaded["dap"] and require("dap").status() ~= ""
        end,
        color = function()
          return { fg = Snacks.util.color("Debug") }
        end,
      },
    },
    lualine_y = {
      { lsp_clients },
    },
    lualine_z = {
      { "progress", separator = " ", paddings = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
  },
}

lualine.setup(config)
