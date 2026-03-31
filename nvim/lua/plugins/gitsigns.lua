return {
	"lewis6991/gitsigns.nvim",
	config = function()
		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
	end,
}
