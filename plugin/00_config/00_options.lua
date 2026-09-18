vim.g.mapleader = " "
-- vim.g.maplocalleader = "\"

vim.o.relativenumber = true
vim.o.number = true
vim.o.cursorline = true -- Highlight line
vim.o.wrap = false
vim.o.scrolloff = 10 -- 10 line offset from cursor
vim.o.sidescrolloff = 8 -- 8 cols offset

-- tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true -- Case sensitive if upper case included

-- ui
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes" -- Always show sign col
vim.o.winborder = "rounded"
vim.diagnostic.config({ virtual_text = true })

-- split
vim.o.splitright = true
vim.o.splitbelow = true

-- misc
vim.o.backspace = "indent,eol,start"
vim.o.clipboard = "unnamedplus"
