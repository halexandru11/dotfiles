return {
	{
		"xiyaowong/transparent.nvim",
		config = function() end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("rose-pine-main")
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin-latte")
			-- vim.cmd.colorscheme("catppuccin-frappe")
			-- vim.cmd.colorscheme("catppuccin-macchiato")
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("tokyonight-night")
		-- 	vim.cmd.colorscheme("tokyonight-storm")
		-- 	vim.cmd.colorscheme("tokyonight-day")
		-- 	vim.cmd.colorscheme("tokyonight-moon")
		-- end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("kanagawa-wave")
		-- 	vim.cmd.colorscheme("kanagawa-dragon")
		-- 	vim.cmd.colorscheme("kanagawa-lotus")
		-- end,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("nightfly")
		-- end,
	},
}
