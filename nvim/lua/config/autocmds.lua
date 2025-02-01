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


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- use a sharp border with "FloatBorder" highlights
    border = "",
    title = "hover"
  })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
  }
)

--[[
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

--]]

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


-- Custom highlight
--vim.cmd("highlight CustomBorder guibg=NONE")

