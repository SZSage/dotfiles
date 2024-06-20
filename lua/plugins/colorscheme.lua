return {
  -- Configuration for nightfox.nvim
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    opts = {
      options = {
        transparent = true,
		on_colors = function(colors)
			colors.bg_statusline = "NONE" -- Set to transparent
		end,
      },
    },
    groups = {
      all = {
        NormalFloat = { fg = "fg1", bg = "bg1"},
        NeotreeNormal = { bg = "NONE" }, -- For neotree background
        NeotreeNormalNC = { bg = "NONE" }, -- For non-current window in neotree
      },
    },
  },
  -- Configuration for LazyVim with nightfox as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox", "dawnfox",
    },
  },
  -- Disable tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    enabled = false, -- This disables the tokyonight theme
  }
}
