-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
require("mini.animate").setup({
  open = { enable = false },
  close = { enable = false },
})

require("config.jdtls")
-- Personal Floating Help script
require("config.floating_help")

vim.diagnostic.enable(0)  -- Enables diagnostics globally


-- Custom debugging utility functions

_G.dd = function(...) -- Defines global function dd(...) which calls the below method
  Snacks.debug.inspect(...)
end

_G.bt = function()
  Snacks.debug.backtrace()
end

vim.print = _G.dd


-- Allow clipboard copy-paste in Neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
