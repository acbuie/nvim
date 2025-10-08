local py_exec = function()
  local virtual = os.getenv("VIRTUAL_ENV")
  return { "--python-executable", virtual .. "/bin/python3" }
end

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
      linters_by_ft = {
        python = { "mypy" },
      },
      linters = {
        mypy = {
          prepend_args = py_exec(),
        },
      },
    },
  },
}
