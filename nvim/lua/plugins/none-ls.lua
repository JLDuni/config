return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.diagnostics.cppcheck.with({
						args = { "--enable=all", "--inconclusive", "--std=c99", "$FILENAME" },
					}),

					null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.golangci_lint,
				},
			})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
		end,
	},
}
