-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")

require("config.jdtls")
-- Personal Floating Help script
require("config.floating_help")
require("config.highlights")

-- Personal status column configuration
--require("config.statuscolumn")
--vim.opt_local.statuscolumn = "%!v:lua.require('statuscolumn').myStatuscolumn()"

vim.diagnostic.enable(0)  -- Enables diagnostics globally
