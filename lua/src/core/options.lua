local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.wrap = false

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- ui
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- split
opt.splitright = true
opt.splitbelow = true

-- misc
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
