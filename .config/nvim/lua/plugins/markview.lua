return {
  {
    "OXY2DEV/markview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Used by the code blocks
    },
    config = function()
      require("markview").setup()
    end,
  },
}
