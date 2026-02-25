return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
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
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
        json = { "jq" },
        lua = { "stylua" },
        -- markdown = { "rumdl" }, -- NOTE: Should be set from lsp_format = "fallback"
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        r = { "air" },
        tex = { "latexindent" },
        typst = { "typstyle" },
        yaml = { "prettier" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
  -- For nvim-lint {},
}
