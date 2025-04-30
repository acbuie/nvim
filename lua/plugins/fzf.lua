return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      file_ignore_patterns = {
        "node_modules/",
        ".git/",
        ".venv/",
        "dist/",
        "build/",
      },
    },
    keys = {
      { "<leader>/", false },
      { "<leader>fw", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    },
  },
}
