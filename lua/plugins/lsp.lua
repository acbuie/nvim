return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },

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
        "prisma",

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
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",
        "stylua",
        -- "selene",

        -- Python
        "ruff",
        "ty",
        -- "mypy",

        -- R
        "r_language_server",

        -- Webdev
        "astro",
        -- "prettier",
        "cssls",
        "html",
        "prismals",
        "tailwindcss",
        "ts_ls",

        -- Config
        "jsonls",
        -- "jq",
        "taplo", -- toml
        "yamlls",

        -- Typesetting
        "texlab",
        -- "latexindent",
        "tinymist",
        "mdx_analyzer",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          -- NOTE: Doesn't actually seem to work
          ensure_installed = {
            "jq",
            "prettier",
            "selene",
            "latexindent",
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
        config = function()
          -- lua_ls config
          vim.lsp.config("lua_ls", {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = { vim.env.VIMRUNTIME },
                  checkThirdParty = true,
                },
              },
            },
          })
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "prettier" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        tex = { "latexindent" },
        typst = { "typstyle", lsp_format = "fallback" },
        yaml = { "prettier" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  -- For nvim-lint {},
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      appearance = {
        nerd_font_variant = "normal",
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
}
