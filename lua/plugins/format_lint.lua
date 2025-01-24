return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff" },
        tex = { "latexindent" },
        json = { "jq" },
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
