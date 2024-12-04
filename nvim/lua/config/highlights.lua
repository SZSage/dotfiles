
-- Nordic Colorscheme
local C = require("nordic.colors")
-- Function to set highlights
local function set_highlight(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

set_highlight("NeoTreeGitUntracked", { fg = C.gray5 })
