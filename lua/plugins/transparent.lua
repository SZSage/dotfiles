
return {
	"xiyaowong/transparent.nvim",
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
				}, -- table: additional groups that should be cleared
				exclude_groups = {
					"CursorLine",
					"CursorLineNr",
					"CursorColumn",
				}, -- table: groups you don't want to clear,
		}
}
