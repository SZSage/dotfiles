-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
require("mini.animate").setup({
  open = { enable = false },
  close = { enable = false },
})

require("notify").setup({
  background_colour = "#000000",
})

-- ############################################################################
--                             Neovide section
-- ############################################################################

-- The copy and paste sections were found on:
-- https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.g.experimental_layer_grouping = true
  -- Specify the font used by Neovide
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14"
  -- This is limited by the refresh rate of your physical hardware, but can be
  -- lowered to increase battery life
  -- This setting is only effective when not using vsync,
  -- for example by passing --no-vsync on the commandline.
  vim.g.neovide_refresh_rate = 60
  -- This is how fast the cursor animation "moves", default 0.06
  vim.g.neovide_cursor_animation_length = 0.04
  -- Default 0.7
  vim.g.neovide_cursor_trail_size = 0.7

  vim.o.tabstop = 4 -- TAB character looks like 4 spaces
  vim.o.expandtab = false -- pressing TAB key will insert spaces in stead of a TAB character
  vim.o.softtabstop = 4 -- # of spaces inserted instead of TAB character
  vim.o.shiftwidth = 4 -- # of spaces inserted when indenting
  vim.o.wrap = true
  vim.o.breakindent = true
  vim.o.showbreak = string.rep(" ", 3)
  vim.o.linebreak = true
  vim.g.autoformat = false
  vim.opt.pumblend = 0 -- adds transparency to hover window padding
  vim.opt.guicursor = "n:block,i:hor50"
  vim.opt.scrolloff = 5 -- minimal number of screen lines to keep above and below the cursor

  -- Set global transparency for all floating windows
  vim.o.winblend = 20
  vim.o.pumblend = 20 -- Set transparency for the completion popup menu

  -- Ensure floating windows also have transparency
  vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
  vim.cmd [[highlight FloatBorder guibg=NONE ctermbg=NONE]]
  vim.cmd [[highlight NormalFloat guibg=NONE ctermbg=NONE]]
  vim.cmd [[highlight Pmenu guibg=NONE ctermbg=NONE]]

  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.neovide_transparency_point or 0.8)))
  end
  -- Set transparency and background color (title bar color)
  vim.g.neovide_transparency = 0.0
  vim.g.neovide_transparency_point = 0.5
  vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- Configure Telescope
  require('telescope').setup{
    defaults = {
      winblend = 20,  -- Set transparency for Telescope
    }
  }

  -- Configure LSP floating windows
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    winblend = 20,  -- Set transparency for LSP hover windows
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    winblend = 20,  -- Set transparency for LSP signature help windows
  })

  -- Produce particles behind the cursor, if want to disable them, set it to ""
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
end

-- Allow clipboard copy-paste in Neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
