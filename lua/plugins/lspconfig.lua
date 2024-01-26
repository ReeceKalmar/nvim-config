return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "jdtls", "lua_ls", "clangd", "html", "tsserver", "pylsp", "tailwindcss" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabalities = require("cmp_nvim_lsp").default
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig/configs")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.emmet_ls.setup({
				-- on_attach = on_attach,
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			})
			lspconfig.typos_lsp.setup({ capabalities = capabalities })
			lspconfig.lua_ls.setup({ capabalities = capabalities })
			lspconfig.tsserver.setup({ capabalities = capabalities })
			lspconfig.jdtls.setup({ capabalities = capabalities })
			lspconfig.clangd.setup({ capabalities = capabalities })
			lspconfig.html.setup({ capabalities = capabalities })
			lspconfig.pylsp.setup({ capabalities = capabalities })

			lspconfig.pyright.setup({ capabalities = capabalities })
			lspconfig.tailwindcss.setup({ capabalities = capabalities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
		end,
	},
}
