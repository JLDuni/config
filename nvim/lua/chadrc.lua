local M = {}
M.base46 = {
	theme = "onedark",
	integrations = {"blankline"},
	transparency = false,
	theme_toggle = { "onedark", "one_light" },
}

M.ui = {
	cmp = {
		lspkind_text = true,
		style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			lsp = true,
		},
	},

	telescope = { style = "borderless" }, -- borderless / bordered

	statusline = {
		enabled = true,
		theme = "minimal", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = nil,
		modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = false,
		lazyload = true,
		treeOffsetFt = "NvimTree",
		order = { "treeOffset", "buffers", "tabs", "btns" },
		modules = nil,
		bufwidth = 21,
	},
}

M.term = {
	base46_colors = true,
	winopts = { number = false },
	sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
	float = {
		relative = "editor",
		row = 0.3,
		col = 0.25,
		width = 0.5,
		height = 0.4,
		border = "single",
	},
}

return M
