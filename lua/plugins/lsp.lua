return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = { preset = "enter" },
      completion = {
        menu = {
          border = "rounded", --{ "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
          scrolloff = 1,
          scrollbar = false,
          --   draw = {
          --     columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          --   },
        },
        documentation = {
          window = {
            border = "rounded",
          },
        },
        list = { selection = "auto_insert" },
      },
      appearance = { nerd_font_variant = "Nerd Font Mono" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        -- disable = { "latex" }, -- Disable latex
      },
      auto_install = true,
      ensure_installed = {
        -- Shell
        "bash",
        "fish",
        "printf",

        -- Web
        "astro",
        "html",
        "javascript",
        "tsx",
        "typescript",

        -- Config/Data
        "csv",
        "json",
        "jsonc",
        "toml",
        "xml",
        "yaml",

        -- Nvim
        "lua",
        "luadoc",
        "vim",
        "vimdoc",

        -- DS
        "python",
        "query",
        "r",

        -- Other
        "latex",
        "markdown",
        "markdown_inline",
        "regex",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",
        "selene",

        -- Python
        "ruff",
        "pyright",
        "mypy",

        -- R
        "r-languageserver",

        -- Webdev
        "astro-language-server",

        -- Config
        "json-lsp",
        "jq",
        "taplo", -- toml
        "yaml-language-server",

        -- Latex
        "texlab",
        "latexindent",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          keys = {
            { "<leader>co", LazyVim.lsp.action["source.organizeImports"], desc = "Organize Imports" },
          },
        },
        pyright = {
          -- Only use as LSP, no diagnostics or type checking
          settings = {
            pyright = { disableOrganizeImports = true },
            python = {
              analysis = {
                diagnostic = "off",
                typeCheckingMode = "off",
              },
            },
          },
        },
      },
    },
  },
}
