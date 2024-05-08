-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
require('mini.animate').setup({
  open = { enable = false },
  close = { enable = false },
})

require("notify").setup({
  background_colour = "#000000",
})


-- setting for automatically change colorscheme based on light/dark mode from system
--[[
require('auto-dark-mode').setup({
  update_interval = 1000,
  set_dark_mode = function()
    print("Setting dark mode")
    vim.api.nvim_set_option('background', 'dark')
    vim.cmd('colorscheme nightfox')
    vim.fn.system('echo -e "\\eP\\e]11;#1D2021\\e\\\\"')
  end,
  set_light_mode = function()
    print("Setting light mode")
    vim.api.nvim_set_option('background', 'light')
    vim.cmd('colorscheme dawnfox')
    vim.fn.system('echo -e "\\eP\\e]11;#FBF1C7\\e\\\\"')
  end
})
]]



-- setup must be called before loading
require('lualine').setup( {
  options = {
    theme = 'nightfox'
  }
})

-- [[ Configure Treesitter ]]
-- see `:help nvim-treesitter`
require("nvim-treesitter.configs").setup {
	-- add languages to be installed here that you want installed for treesitter
	ensure_installed = {"sql"},
	highlight = { enable = true },
	indent =  { enable = true},
	incremental_selection = {
		enable = true,
	}

}

local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

