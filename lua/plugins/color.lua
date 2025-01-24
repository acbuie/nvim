return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      overrides = {
        NormalFloat = { link = "Normal" },
        Pmenu = { link = "NormalFloat" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
    -- -- NOTE: Leaving, but uneeded due to `overrides` above.
    -- -- Fancy stuff to load color changes
    --
    -- init = function()
    --   local function augroup(name)
    --     return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
    --   end
    --   vim.api.nvim_create_autocmd("ColorScheme", {
    --     group = augroup("highlight_syntax"),
    --     callback = function()
    --       -- blink.cmp
    --       -- vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Normal" })
    --       -- vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "Normal" })
    --     end,
    --   })
    -- end,
  },
}
