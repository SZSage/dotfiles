-- Colorscheme setup
vim.cmd [[colorscheme catppuccin]]
vim.cmd [[
  highlight NormalFloat guibg=NONE
  highlight FloatBorder guibg=NONE
  highlight NvimTreeNormal guibg=NONE
  highlight LazyTerm guibg=NONE
]]
vim.opt.termguicolors = true

-- tab width set to 2 for lua files
vim.cmd([[
augroup LuaSettings
	autocmd!
	autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	augroup end
]])

-- Skips swapfile prompt
vim.api.nvim_create_autocmd("SwapExists", {
	pattern = "*",
	command = "let v:swapchoice = 'e'"
})

-- Setup for nvim-cmp and autocompletion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
 }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Setup for nvim-cmp in command line mode
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

-- Autocmds for specific filetypes
local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql", "python" },
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
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
      winhl = "Normal:NormalNC",
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Custom highlight
vim.cmd("highlight CustomBorder guibg=NONE")

