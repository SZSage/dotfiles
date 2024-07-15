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
          sorting_strategy = "descending",
          file_ignore_patterns = { "%.git/" }, -- ignore .git directories
          pickers = {
            find_files = { theme = "dropdown" }, -- set theme for find file pickers
          },
        },
      })
    end,
  },
  -- whichkey plugin configuration
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
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
        lsp_doc_border = true,
      },
      notify = {
        render = "compact", -- compact rendering for notifications
        stages = "slide", -- slide in effect for notifications
        top_down = false,
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
}
