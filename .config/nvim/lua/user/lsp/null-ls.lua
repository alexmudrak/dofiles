-- Get code from: https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/lsp/null-ls.lua
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
local linting = null_ls.builtins.code_actions
local diagnostic = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = true,
	sources = {
		formatting.stylua,
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--line-length", "79" } }),
        formatting.isort.with({ extra_args = { "--line-length", "79", "--profile", "black" } }),
        formatting.ruff.with({ args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" } }),
        -- diagnostic.ruff.with({ args = { "-n", "-e", "--stdin-filename", "$FILENAME", "-" }}),
		-- diagnostics.flake8
	},
})
