return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-repeat",
	"szw/vim-maximizer",
	{ "xiyaowong/transparent.nvim", config = function() end },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
