local py_exec = function()
  local virtual = os.getenv("VIRTUAL_ENV")
  if virtual then
    return { "--python-executable", virtual .. "/bin/python3" }
  else
    return nil
  end
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
        json = { "jq" },
        markdown = { "prettier" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
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
