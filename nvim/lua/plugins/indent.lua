return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		dofile(vim.g.base46_cache .. "blankline")
		require("ibl").setup({
			indent = { char = "▏" },
			scope = { enabled = true },
		})
	end,
}
