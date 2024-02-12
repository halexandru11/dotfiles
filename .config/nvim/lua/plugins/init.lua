return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"tpope/vim-surround",
	{
		"github/copilot.vim",
		config = function()
			vim.cmd([[imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")]])
			vim.cmd([[let g:copilot_no_tap_map = v:true]])
		end,
	},
	{
		"numToStr/Comment.nvim",
		name = "Comment",
		config = function()
			require("Comment").setup()
		end,
	},
	-- use({ "lervag/vimtex", opt = true, cmd = { "VimtexCompile", "VimtexStopCompile", "Start" } }) -- latex support
}
