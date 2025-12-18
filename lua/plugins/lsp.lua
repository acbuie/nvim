return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      highlight = enable,
      indent = enable,

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
}
