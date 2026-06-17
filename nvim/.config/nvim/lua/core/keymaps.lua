--  See `:help vim.keymap.set()`

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})

local function opts(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>", opts())
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts("Open diagnostic [Q]uickfix list"))

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", opts("Exit terminal mode"))

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", opts("Move focus to the left window"))
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", opts("Move focus to the right window"))
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", opts("Move focus to the lower window"))
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", opts("Move focus to the upper window"))

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", opts("Move window to the left"))
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", opts("Move window to the right"))
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", opts("Move window to the lower"))
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", opts("Move window to the upper"))

vim.keymap.set({ "i" }, "<C-c>", "<Esc>", opts()) -- make Ctrl-C behave like Esc
vim.keymap.set("v", "p", '"_dP', opts()) -- paste without yanking
vim.keymap.set("n", "x", '"_x', opts()) -- delete single character without yanking
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts("Copy to system clipboard"))
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], opts("Copy to system clipboard"))
vim.keymap.set(
	"n",
	"<leader>rr",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<Left><Left><Left>",
	opts("Replace whole word under cursor")
)

vim.keymap.set("n", "<C-d>", "<c-d>zz", opts()) -- move down half page
vim.keymap.set("n", "<C-u>", "<c-u>zz", opts()) -- move up half page
vim.keymap.set("n", "n", "nzzzv", opts()) -- keep cursor centered when searching
vim.keymap.set("n", "N", "Nzzzv", opts()) -- keep cursor centered when searching

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts()) -- move line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts()) -- move line down

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts("[S]plit window [V]ertically"))
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts("[S]plit window [H]orizontally"))
vim.keymap.set("n", "<leader>so", "<C-w>o", opts("Close all [o]ther windows"))
vim.keymap.set("n", "<leader>se", "<C-w>=", opts("[S]plit [E]qualize window sizes"))
vim.keymap.set("n", "<leader>sx", ":close<CR>", opts("Close current window"))
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts("[M]aximize current window"))

-- resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts()) -- resize window up
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts()) -- resize window down
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts()) -- resize window left
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts()) -- resize window right

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", opts()) -- indent left
vim.keymap.set("v", ">", ">gv", opts()) -- indent right

-- move trough quickfix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", opts())
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", opts())
