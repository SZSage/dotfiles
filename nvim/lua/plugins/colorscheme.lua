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
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = function()
      return {
        --[[add custom lualine config here]]
        options = {
          theme = "catppuccin",
        },
      }
    end,
  },
  -- Configuration for LazyVim with nightfox as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", "nightfox", "dawnfox",
    },
  },
  -- Disable tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    enabled = false, -- This disables the tokyonight theme
  }
}
