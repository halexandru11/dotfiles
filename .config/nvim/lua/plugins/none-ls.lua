return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
		local code_actions = null_ls.builtins.code_actions
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local diagnostics = null_ls.builtins.diagnostics
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			debug = false,
			sources = {
				-- code actions
				-- code_actions.eslint_lsp,
				code_actions.proselint,
				code_actions.refactoring,

				-- diagnostics
				-- diagnostics.eslint_language_server,
				-- diagnostics.flake8.with({ extra_args = { "--max-line-length", "80", "--ignore=E501,W503" } }),
				-- diagnostics.ruff_lsp,
				-- diagnostics.luacheck,
				-- diagnostics.proselint,

				-- formatting
				formatting.black.with({ extra_args = { "--line-length", "80" } }),
				formatting.clang_format,
				formatting.dart_format,
				-- formatting.latexindent,
				formatting.stylua,
				formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
				-- formatting.rustfmt,
			},
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false, bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
