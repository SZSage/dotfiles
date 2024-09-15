return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "tree-sitter-grammars/tree-sitter-markdown",
  },
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  config = function()
    require("render-markdown").setup({
      code = { position = "left" },
      bullet = {
        enabled = true,
        -- Replaces '-'|'+'|'*' of 'list_item'
        -- How deeply nested the list is determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
        -- Highlight for the bullet icon
        icons = { "•", "◦", "◆", "◇" },
        highlight = "RenderMarkdownBullet",
      },
      heading = {
        position = "inline",
        icons = { "􀃋 ", "􀃍 ", "􀃏 ", "􀃑 ", "􀃓 ", "􀃕 " },
        backgrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
      },
    })
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "markdown", "markdown_inline" },
      highlight = {
        enable = true,
      },
    })
  end,
}
