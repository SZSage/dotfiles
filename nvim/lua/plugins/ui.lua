return {
  -- telescope plugin configuration
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      -- setup telescope with specific configuration settings
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top", -- set prompt position to the top
            },
          },
          sorting_strategy = "ascending",
          file_ignore_patterns = { "%.git/" }, -- ignore .git directories
          pickers = {
            find_files = { theme = "dropdown" }, -- set theme for find file pickers
            find_command = { "rg", "--files", "--sortr=modified" },
          },
        },
      })
    end,
  },
  -- whichkey plugin configuration
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
      -- custom configuration here
      preset = "modern",
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- noice plugin configuration
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = { enabled = false },
      },
      presets = {
        lsp_doc_border = false,
      },
      notify = {
        render = "compact", -- compact rendering for notifications
        stages = "slide", -- slide in effect for notifications
        top_down = false,
      },
    },
    {
      "folke/edgy.nvim",
      event = "VeryLazy",
      opts = {
        animate = {
          enabled = false,
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        render = "compact",
        stages = "slide",
        top_down = false,
      })
    end,
    after = "folke/noice.nvim",
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
          theme = "nordic",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "", right = "" } } },
          lualine_z = {
            { "location", separator = { left = "", right = "" } },
          },
        },
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*", -- Enable for all filetypes
        lua = {
          AARRGGBB = true,
          rgb_0x = true, -- Enable parsing "0xAARRGGBB"
          RRGGBBAA = true, -- Enable #RRGGBBAA
          RGB = false, -- Disable short #RGB
          names = false, -- Disable named colors
        },
        css = {
          RGB = true, -- Enable regular RGB hex codes
          RRGGBB = true, -- Enable #RRGGBB hex codes
          names = true, -- Enable named colors like "Blue"
          RRGGBBAA = true, -- Enable #RRGGBBAA (with alpha channel)
          css = false, -- Disable CSS functions like rgb()
        },
      }, {})
    end,
  },
}
