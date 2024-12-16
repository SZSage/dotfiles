-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Left column and similar settings
vim.opt.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true -- display lines as single line
vim.opt.sidescrolloff = 8 -- number of columns to keep the left/right of cursor

vim.opt.pumblend = 0 -- adds transparecy to hover window padding

--vim.opt.guicursor = "" -- changes cursor

-- Tab spacing/behavior
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 4 -- TAB character looks like 4 spaces
vim.opt.softtabstop = 4 -- # of spaces inserted instead of TAB character
vim.opt.shiftwidth = 4 -- # of spaces inserted when indenting
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)
vim.opt.linebreak = true
vim.opt.smartindent = true

--- General Behaviors
vim.opt.backup = false --disable backup file creation
vim.opt.termguicolors = true
vim.g.autoformat = false
vim.g.loaded_netrw = 1 -- prevents loading of the core netrw file explorer (replaced with nvim-tree and telescope)
vim.g.loaded_netrwPlugin = 1 -- prevents loading of netrwPlugin, which provides additional features like dir browsing.
vim.opt.conceallevel = 0 -- all text in buffer is displayed without hiding/replacing
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a" -- enable mouse support
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 100 -- set faster completion
vim.opt.writebackup = false -- prevent editing of files being edited elsewhere
