-- Colorscheme setup

vim.opt.termguicolors = true

-- tab width set to 2 for specific filetypes
vim.cmd([[
augroup GeneralFileSettings
	autocmd!
  " Lua settings
	autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  " HTML settings
	autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  " tsx settings
	autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  " css settings
  autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	augroup end
]])

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L")
    end
  end,
})

-- Skips swapfile prompt
vim.api.nvim_create_autocmd("SwapExists", {
	pattern = "*",
	command = "let v:swapchoice = 'e'"
})

vim.cmd [[
  augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require"config.jdtls".setup_jdtls()
  augroup end
]]

-- Autocmds for specific filetypes
local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    cmp.setup.buffer({
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
        { name = "luasnip" },
      },
    })
  end,
  group = autocomplete_group,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    cmp.setup.buffer({
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
      },
    })
  end,
  group = autocomplete_group,
})


-- Disable autoformat for C files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Turn off paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

-- Display diagnostic window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'none',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
      winhl = "Normal:NormalNC",
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
-- Custom highlight
--vim.cmd("highlight CustomBorder guibg=NONE")

