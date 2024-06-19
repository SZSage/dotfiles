return {
  -- lualine plugin configuration
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "nightfox",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- telescope plugins configuration
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
  -- pretty hover plugin configuration
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {},
    config = function()
      -- set keybindings for pretty hover
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>K",
        '<cmd>lua require("pretty_hover").hover()<CR>',
        { noremap = true, silent = true }
      )
      -- register keybindings for "which key" plugin
      local wk = require("which-key")
      wk.register({
        ["<Leader>K"] = { "<cmd>lua require('pretty_hover').hover()<CR>", "Pretty Hover" },
      })
    end,
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
