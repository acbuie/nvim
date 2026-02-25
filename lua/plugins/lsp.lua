return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local opts = {
        lsps = {
          -- NOTE: Does not auto install, each needs to be installed with Mason

          -- Lua
          {
            "lua_ls",
            {
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
            },
          },

          -- R
          {
            "r_language_server",
            {
              on_attach = function(client, _)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end,
            },
          },
          { "air" },
          {
            "jarl",
            -- Custom config as it is not yet available
            {
              cmd = { "jarl", "server" },
              filetypes = { "r", "rmd" },
              root_markers = { ".git" },
              root_dir = function(bufnr, on_dir)
                on_dir(vim.fs.root(bufnr, ".git") or vim.uv.os_homedir())
              end,
            },
          },

          -- Rust
          { "rust-analyzer" },

          -- Python
          { "ty" },
          { "ruff" },

          -- Typesetting
          { "rumdl" },
          { "tinymist" },

          -- Web
          { "html" },
          { "ts_ls" },
          { "astro" },
        },
      }
      return opts
    end,
    config = function(_, opts)
      for _, lsp in pairs(opts.lsps) do
        local name, config = lsp[1], lsp[2]
        if config then
          vim.lsp.config(name, config)
        end
        vim.lsp.enable(name)
      end
    end,
  },
}
