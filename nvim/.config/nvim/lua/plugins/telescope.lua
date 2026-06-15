-- Two important keymaps to use while in Telescope are:
--  - Insert mode: <c-/>
--  - Normal mode: ?
--
-- This opens a window that shows you all of the keymaps for the current
-- Telescope picker. This is really useful to discover what Telescope can
-- do as well as how to actually do it!

---@type (string|vim.pack.Spec)[]
local telescope_plugins = {
	Gh("nvim-lua/plenary.nvim"),
	Gh("nvim-telescope/telescope.nvim"),
	Gh("nvim-telescope/telescope-ui-select.nvim"),
}
if vim.fn.executable("make") == 1 then
	table.insert(telescope_plugins, Gh("nvim-telescope/telescope-fzf-native.nvim"))
end

-- NOTE: You can install multiple plugins at once
vim.pack.add(telescope_plugins)

-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	-- You can put your default mappings / updates / etc. in here
	--  All the info you're looking for is in `:help telescope.setup()`
	defaults = {
		mappings = {
			i = {
				["<C-n>"] = "cycle_history_next",
				["<C-p>"] = "cycle_history_prev",
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
			n = {
				["n"] = "cycle_history_next",
				["p"] = "cycle_history_prev",
				["j"] = "move_selection_next",
				["k"] = "move_selection_previous",
				["<C-c>"] = "close",
			},
		},
	},
	-- pickers = {}
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
})

-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]iles [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fa", builtin.builtin, { desc = "[F]iles [A]ction" })
vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind by [S]tring" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]iles [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]iles [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]iles Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "[F]ind [C]ommands" })
-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config"), follow = true })
end, { desc = "[F]ind [N]eovim files" })

-- Add Telescope-based LSP pickers when an LSP attaches to a buffer.
-- If you later switch picker plugins, this is where to update these mappings.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf

		-- Find references for the word under your cursor.
		vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })

		-- Jump to the implementation of the word under your cursor.
		-- Useful when your language has ways of declaring types without an actual implementation.
		vim.keymap.set("n", "gi", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })

		-- Jump to the definition of the word under your cursor.
		-- This is where a variable was first declared, or where a function is defined, etc.
		-- To jump back, press <C-t>.
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })

		-- Fuzzy find all the symbols in your current document.
		-- Symbols are things like variables, functions, types, etc.
		vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })

		-- Fuzzy find all the symbols in your current workspace.
		-- Similar to document symbols, except searches over your entire project.
		vim.keymap.set(
			"n",
			"gW",
			builtin.lsp_dynamic_workspace_symbols,
			{ buffer = buf, desc = "Open Workspace Symbols" }
		)

		-- Jump to the type of the word under your cursor.
		-- Useful when you're not sure what type a variable is and you want to see
		-- the definition of its *type*, not where it was *defined*.
		vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
	end,
})

-- Override default behavior and theme when searching
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })
