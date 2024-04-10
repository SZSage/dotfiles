
return {
  {
	"EdenEast/nightfox.nvim",
	opts = {
		options = {
				transparent = true,
			},
		},
		groups = {
			all = {
				NormalFloat = { fg = "fg1", bg = "bg1"},
				NeotreeNormal = { bg = "NONE" }, -- Assuming 'NeotreeNormal' is the correct group for neotree background
				NeotreeNormalNC = { bg = "NONE" }, -- 'NC' stands for non-current window
			},
		},
	},
  -- Configure LazyVim 
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  }
}



