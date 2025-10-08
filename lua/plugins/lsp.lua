return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.compat" },
      { "micangl/cmp-vimtex" },
    },
    opts = {
      -- fuzzy = {
      --   max_typos = function()
      --     return 0
      --   end,
      -- },
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
        list = { selection = { preselect = false, auto_insert = true } },
      },
      sources = {
        compat = { "vimtex" },
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
        "css",

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
        "typst",
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
        "ty",
        "mypy",

        -- R
        "r-languageserver",

        -- Webdev
        "astro-language-server",
        "prettier",
        "tailwindcss-language-server",

        -- "",

        -- Config
        "json-lsp",
        "jq",
        "taplo", -- toml
        "yaml-language-server",

        -- Typesetting
        "texlab",
        "latexindent",
        "tinymist",
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
        -- ty = {
        --   diagnosticMode = "workspace",
        -- },
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
