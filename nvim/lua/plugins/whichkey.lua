return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    preset = "modern",
    notify = "true",
    win = {
      no_overlap = "false" -- popup to overlap with cursor
    }
  },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
