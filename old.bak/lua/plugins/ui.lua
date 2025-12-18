return {
  {
    "SmiteshP/nvim-navic",
    init = function()
      vim.g.navic_silence = true

      -- Get buffer lsp info
      LazyVim.lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)

      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local lsp_clients = function()
        -- Only get lsp client for active buffer
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })

        if next(clients) == nil then
          return "󰣖 "
        end

        local c = {}
        for _, client in pairs(clients) do
          table.insert(c, client.name)
        end

        return "󰣖 " .. table.concat(c, "|")
      end

      --NOTE: Modified `gruvbox` lualine theme, defined with gruvbox colors
      local colors = require("gruvbox").palette
      local custom_theme = {
        normal = {
          a = { bg = colors.neutral_blue, fg = colors.dark0, gui = "bold" },
          b = { bg = colors.dark2, fg = colors.light1 },
          c = { bg = colors.dark0, fg = colors.dark4 },
          x = { bg = colors.dark0, fg = colors.dark4 },
          y = { bg = colors.dark2 },
          z = { bg = colors.neutral_aqua, fg = colors.light1 },
        },
        insert = {
          a = { bg = colors.neutral_yellow, fg = colors.dark0, gui = "bold" },
          -- b = { bg = colors.dark2, fg = colors.light1 },
          -- c = { bg = colors.dark0, fg = colors.dark4 },
          z = { bg = colors.neutral_aqua, fg = colors.light1 },
        },
        visual = {
          a = { bg = colors.neutral_orange, fg = colors.dark0, gui = "bold" },
          -- b = { bg = colors.dark2, fg = colors.light1 },
          -- c = { bg = colors.dark0, fg = colors.dark4 },
          z = { bg = colors.neutral_aqua, fg = colors.light1 },
        },
        replace = {
          a = { bg = colors.neutral_red, fg = colors.dark0, gui = "bold" },
          -- b = { bg = colors.dark2, fg = colors.light1 },
          -- c = { bg = colors.dark0, fg = colors.dark4 },
          z = { bg = colors.neutral_aqua, fg = colors.light1 },
        },
        command = {
          a = { bg = colors.neutral_green, fg = colors.dark0, gui = "bold" },
          -- b = { bg = colors.dark2, fg = colors.light1 },
          -- c = { bg = colors.dark0, fg = colors.dark4 },
          z = { bg = colors.neutral_aqua, fg = colors.light1 },
        },
        inactive = {
          a = { bg = colors.dark1, fg = colors.light1, gui = "bold" },
          -- b = { bg = colors.dark2, fg = colors.light1 },
          -- c = { bg = colors.dark1, fg = colors.dark4 },
        },
      }

      --NOTE: Similar to default LazyVim setup. Updates may update the functions used.
      local opts = {
        options = {
          theme = custom_theme,
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
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_c = {
            "branch",
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
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
            Snacks.profiler.status(),
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Statement") }
              end,
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
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
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function()
                return { fg = Snacks.util.color("Special") }
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", paddings = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = { lsp_clients },
        },

        -- winbar = {
        --   lualine_a = {
        --     { "navic", color_correction = "dynamic", navic_opts = { highlight = true } },
        --   },
        -- },
      }

      return opts
    end,
  },
}
