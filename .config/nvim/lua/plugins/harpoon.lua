return {
	"ThePrimeagen/harpoon",
	name = "harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-f>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" })
		end)

		vim.keymap.set("n", "<A-n>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-e>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-i>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-o>", function()
			harpoon:list():select(4)
		end)
	end,
}
