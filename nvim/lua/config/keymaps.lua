-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move line down
vim.api.nvim_set_keymap("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move line up
vim.api.nvim_set_keymap("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- displays full error message
--vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- open terminal on to the right
-- vim.api.nvim_set_keymap("n", "<C-/>", "<cmd>vsplit | terminal<CR>", { noremap = true, silent = true })
-- Dismiss Noice Message
vim.keymap.set("n", "<leader><CR>", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})

-- maps to floating window
vim.keymap.set("n", "<leader>z", ":keepalt Lf<CR>", { noremap = true, silent = true })

-- Allow clipboard copy-paste in Neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

local rhs = '<Cmd>lua MiniAnimate.config.scroll.enable = not MiniAnimate.config.scroll.enable<CR>'
vim.keymap.set('n', '<Leader>ts', rhs, { desc = 'Toggle scroll animation' })

vim.keymap.set("n", "<C-t>", function()
  require("minty.huefy").open()
 -- require("minty.shades").open()
end, {}
)
