return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  enabled = false,
  dependencies = {
    -- You may not need this if you don't lazy load
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  -- override default configuration
  config = function()
    require("markview").setup({
      list_items = {
        enable = true,
        shift_width = 0,
        marker_minus = {
          add_padding = false,
          text = "•",
          hl = "rainbow5",
        },
      },
    })
  end,
}
