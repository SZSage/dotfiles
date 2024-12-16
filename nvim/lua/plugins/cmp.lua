-- plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }
      opts.window = {
        --completion = cmp.config.window.bordered(),
        --documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.default_options,
        documentation = cmp.config.window.default_options,
      }
      -- cmp formatting 
      opts.formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          vim_item.menu = "" -- removes spacing in the menu field
          return vim_item
        end,
      }
      return opts
    end,
  },
}
