-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move line down
vim.api.nvim_set_keymap("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move line up
vim.api.nvim_set_keymap("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- displays full error message
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- open terminal on to the right
-- vim.api.nvim_set_keymap("n", "<C-/>", "<cmd>vsplit | terminal<CR>", { noremap = true, silent = true })
-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})


