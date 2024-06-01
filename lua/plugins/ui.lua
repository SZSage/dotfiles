return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = false,
        theme = "nightfox",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {},
    config = function()
      vim.api.nvim_set_keymap(
        "n",
        "<Leader>K",
        '<cmd>lua require("pretty_hover").hover()<CR>',
        { noremap = true, silent = true }
      ) -- Register the key mapping with which-key
      local wk = require("which-key")
      wk.register({
        ["<Leader>K"] = { "<cmd>lua require('pretty_hover').hover()<CR>", "Pretty Hover" },
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false, -- disable noice's signature help
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      notify = {
        render = "compact",
        stages = "slide",
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
