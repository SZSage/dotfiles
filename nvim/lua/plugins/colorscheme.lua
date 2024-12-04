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
        --NormalFloat = { fg = "fg1", bg = "bg1"},
        --NeotreeNormal = { bg = "NONE" }, -- For neotree background
        --NeotreeNormalNC = { bg = "NONE" }, -- For non-current window in neotree
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
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        bright_border = false,
        which_key = true,
        transparent = {
          bg = true,
          float = true, -- Enable transparency for floating windows
        },
        cursorline = {
          theme = "dark",
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.85,
        },
        ts_context = {
          dark_background = "true",
        },
        on_highlight = function(highlights, palette)
            -- Override Neo-tree highlights
            highlights.NeoTreeDirectoryIcon = { fg = palette.green.base }
            highlights.NeoTreeDirectoryName = { fg = palette.green.base }
            highlights.NeoTreeFileIcon = { fg = palette.green.base }
        end,
      })
    end,
  },
  -- Configuration for LazyVim with nightfox as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
      "catppuccin",
      "nightfox",
      "dawnfox",
    },
  },
  -- Disable tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    enabled = false, -- This disables the tokyonight theme
  },
}
