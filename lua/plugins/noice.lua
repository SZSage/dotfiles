return {
	{
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
	-- add any options here
		presets = {
			lsp_doc_border = true,
		},
		notify = {
				render = "compact",
				stages = "slide",
				top_down = false
			}
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
		}
	},
  -- Configuration for nvim-notify directly if needed outside of noice.nvim control
	{
		"rcarriga/nvim-notify",
		config = function()
			require('notify').setup({
				render = "compact",  -- renderer
				stages = "slide",
				top_down = false,
			})
		end,
		after = "folke/noice.nvim"  -- ensure this loads after noice.nvim if independent configuration is crucial
	}
}
