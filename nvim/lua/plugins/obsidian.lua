return {
  {
    "epwalsh/obsidian.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- To ensure UI is disabled to prevent conflicts with markdown.
      ui = {
        enabled = false,
        checkboxes = {},
        bullets = {},
        external_link_icon = {},
      },
      workspaces = {
        {
          name = "personal",
          path = "/Users/sage/Documents/ObsidianSync/Obsidian-Vault-Sync",
        },
      },
      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "open", url }) -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,

      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- set to false to disable completion.
        nvim_cmp = true,
        -- trigger completion at 2 chars.
        min_char = 2,
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Daily",
        date_format = "%Y/%m-MMMM/%Y-%m-%d-dddd",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "Templates/Daily Note Template/Template, Daily Note",
      },

      -- Where to put new notes. Valid options are
      --  * "current_dir" - put new notes in the same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "current_dir",

      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        if title ~= nil and title ~= "" then
          -- Transform the title into a valid file name and return it
          return title:gsub("[^A-Za-z0-9 ]", "")
        else
          -- Fallback: If no title is provided, generate a random ID
          local suffix = ""
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
          return tostring(os.time()) .. "-" .. suffix
        end
      end,

      -- Custom function to generate note file names based on the ID, target directory, and title
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- Use the ID directly to generate the file path
        local filename = spec.id
        local path = spec.dir / filename
        return path:with_suffix(".md")
      end,
    },
  },
}
