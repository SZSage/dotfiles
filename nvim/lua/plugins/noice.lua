return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Presets for easier configuration
    opts.presets = {
      bottom_search = false , -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages sent to a split
      inc_rename = false, -- enables input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add border to hover docs and signature help
    }
    opts.notify = {
      render = "compact",
      stages = "slide",
      top_down = false,
    }
    opts.routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
        },
        opts = {
          skip = true,
        }
      }
    }
    opts.lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Optional for notifications
  },
}
