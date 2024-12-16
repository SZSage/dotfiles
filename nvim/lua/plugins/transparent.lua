
return {
	"xiyaowong/transparent.nvim",
      enabled = true,
			opts = {
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				extra_groups = {
					"NvimTreeNormal",
					"NormalFloat",
					"NvimTreeEndOfBuffer",
					"StatusLine",
					"StatusLineNC",
          "TelescopeBorder",
          "GitSignsAdd",
          "GitSignsChange",
          "NeoTreeFloatBorder",
          -- For borders transparency
          "FloatBorder",
          "WinSeparator",
          "WhichKeyFloat",
          "WhichKeyBorder",
          "LspInfoBorder",
          -- Cmdline and LSP documentation borders
          "NoiceCmdline",
          "NoiceCmdlineBorder",
          "NoiceCmdlinePopupBorder",
          "Pmenu",
          "Float",
          "NormalFloat",
          "CmpPmenuBorder", -- For cmp.nvim borders (autocomplete)
          "LspInfoBorder", -- General LSP floating windows
          "LspDiagnosticsBorder", -- Diagnostics floating windows
          "FloatBorder",         -- General float border
          -- LSP-specific groups
          "DiagnosticFloatingBorder", -- Diagnostic float border
          "HoverBorder",         -- Border for hover actions

				}, -- table: additional groups that should be cleared
				exclude_groups = {
					"CursorLine",
					"CursorLineNr",
					"CursorColumn",
				}, -- table: groups you don't want to clear,
		}
}
