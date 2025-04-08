return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	{
		"numToStr/Comment.nvim",
		name = "Comment",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},
	-- use({ "lervag/vimtex", opt = true, cmd = { "VimtexCompile", "VimtexStopCompile", "Start" } }) -- latex support
}
