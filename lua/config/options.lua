-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.tabstop = 4 -- TAB character looks like 4 spaces
vim.o.expandtab = false -- pressing TAB key will insert spaces in stead of a TAB character
vim.o.softtabstop = 4 -- # of spaces inserted instead of TAB character
vim.o.shiftwidth = 4 -- # of spaces inserted when indenting

-- line wrapping
vim.o.wrap = true
vim.o.breakindent = true
vim.o.showbreak = string.rep(" ", 3)
vim.o.linebreak = true

vim.o.termguicolors = true

vim.g.autoformat = false

vim.opt.pumblend = 0 -- adds transparecy to hover window padding

