return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "clangd", "html", "ts_ls" },
				automatic_installation = false,
				automatic_setup = false,
				automatic_enable = false,
				handlers = nil,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function setup_server(server_name, config)
				config = config or {}
				config.capabilities = capabilities

				vim.lsp.config(server_name, config)
				vim.lsp.enable(server_name)
			end

			setup_server("lua_ls")
			setup_server("pyright")
			setup_server("clangd")
			setup_server("html")
			setup_server("ts_ls")
			setup_server("gopls")
			setup_server("jdtls")

			vim.keymap.set("n", "<C-h>", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename símbolo com LSP" })
			vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.diagnostic.setloclist()<CR>", {})
			vim.keymap.set("n", "<leader>le", vim.lsp.buf.declaration, {})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
