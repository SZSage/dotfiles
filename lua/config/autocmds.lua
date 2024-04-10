-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd [[
  highlight NormalFloat guibg=NONE
  highlight FloatBorder guibg=NONE
  highlight NvimTreeNormal guibg=NONE
  highlight LazyTerm guibg=NONE
]]
-- setup must be called before loading
vim.cmd("colorscheme nightfox")
require('lualine').setup({
	{
		options = {
			theme = "nightfox"
		}
	}
})

-- config/autocmds.lua
local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
local cmp = require("cmp")
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



-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste"
})

-- displays a small diagnostic window
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
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

vim.cmd("highlight CustomBorder guibg=NONE")
local cmp = require("cmp")
vim.opt.completeopt = { "menu", "menuone", "noselect" }
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
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
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
	}),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

