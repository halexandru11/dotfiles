return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/playground",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"dart",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"tsx",
				"typescript",
			},
			sync_install = false,
			auto_install = true,
			ignore_install = { "" }, -- List of parsers to ignore installing
			autopairs = { enable = true },
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "latex" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true, disable = { "yaml" } },
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
	end,
}
