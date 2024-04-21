return {
	'kristijanhusak/vim-dadbod-ui',
	dependencies = {
	{ 'tpope/vim-dadbod' },
	{ 'pbogut/vim-dadbod-ssh' },
	{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },
	},
  cmd = {
	'DBUI',
	'DBUIToggle',
	'DBUIAddConnection',
	'DBUIFindBuffer',
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 30
		vim.g.db_ui_show_help = 0
		vim.g.db_ui_use_nvim_notify = 0
		vim.g.db_ui_win_position = "right"
		vim.g.db_ui_force_echo_notifications = 1
	end,
}
