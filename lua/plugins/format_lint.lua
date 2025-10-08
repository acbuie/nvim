return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
        json = { "jq" },
        markdown = { "prettier" },
        python = { "ruff" },
        tex = { "latexindent" },
        typst = { "typstyle", lsp_format = "fallback" },
        yaml = { "prettier" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        mypy = {
          -- Only use mypy with `pyproject.toml` found
          condition = function(ctx)
            return vim.fs.find({ "pyproject.toml" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
