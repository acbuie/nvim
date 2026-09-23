return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "Snacks" },
      },
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
