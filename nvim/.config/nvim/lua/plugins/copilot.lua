return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.keymap.set(
			"i",
			"<C-y>",
			'copilot#Accept("")',
			{ silent = true, expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" }
		)
		vim.keymap.set(
			"i",
			"<C-S-y>",
			"<Plug>(copilot-accept-word)",
			{ silent = true, desc = "Accept Copilot suggestion word" }
		)

		-- Default keybindings
		vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", { silent = true, desc = "Dismiss Copilot suggestion" })
		vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { silent = true, desc = "Next Copilot suggestion" })
		vim.keymap.set(
			"i",
			"<M-[>",
			"<Plug>(copilot-previous)",
			{ silent = true, desc = "Previous Copilot suggestion" }
		)
		vim.keymap.set("i", "<M-\\>", "<Plug>(copilot-suggest)", { silent = true, desc = "Trigger Copilot suggestion" })
	end,
}
