local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

-- set python3 host program
vim.api.nvim_set_var("python3_host_prog", "/usr/bin/python3")
--vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    --{ import = "lazyvim.plugins.extras.lang.clangd" },
    --{ import = "lazyvim.plugins.extras.ui.edgy" },
    --{ import = "lazyvim.plugins.extras.ui.mini-animate" },
    --{ import = "lazyvim.plugins.extras.lang.python" },
    --{ import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.vscode" },

    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    --{ import = "lazyvim.plugins.extras.lang.json" },
    -- import/override with your plugins
    { import = "plugins" },
	--{ import = "plugins.obsidian" },
	{ import = "plugins.sqlite_viewer" },
	{ import = "plugins.disabled" },
	{ import = "plugins.colorscheme" },
	{ import = "plugins.dap"},
	{ import = "plugins.comment" },
	{ import = "plugins.noice" },
	{ import = "plugins.neogit"},
	{ import = "plugins.ui"},
	{ import = "plugins.transparent" },
	{ import = "plugins.wilder" },
	{ import = "plugins.markdown-preview" },
	{ import = "plugins.css_color" },
	{ import = "plugins.harpoon2" },
	{ import = "plugins.nui"}
	--{ import = "plugins.jupyter" }
    --{ "craftzdog/solarized-osaka.nvim" },
    --{ import = "plugins.treesitter" },
    --{ import = "plugins.edgy" },
    --{ import = "plugins.python" },
    --{ import = "plugins.DAPCore" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = {"nightfox"} },
  checker = { enabled = true, notify = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
		"tokyonight",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})


