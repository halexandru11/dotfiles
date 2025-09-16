local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>e", ":Ex<CR>", opts) -- show file tree
keymap.set({ "i" }, "<C-c>", "<Esc>", opts) -- make Ctrl-C behave like Esc
keymap.set("v", "p", '"_dP', opts) -- paste without yanking
keymap.set("n", "x", '"_x', opts) -- delete single character without yanking
keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<Left><Left><Left>") -- replace word under cursor

keymap.set("n", "<C-d>", "<c-d>zz", opts) -- move down half page
keymap.set("n", "<C-u>", "<c-u>zz", opts) -- move up half page
keymap.set("n", "n", "nzzzv", opts) -- keep cursor centered when searching
keymap.set("n", "N", "Nzzzv", opts) -- keep cursor centered when searching

-- move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- move line up
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- move line down

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "<leader>so", "<C-w>o", opts) -- close all windows except current
keymap.set("n", "<leader>se", "<C-w>=", opts) -- equalize window sizes
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current window
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- maximize current window

-- resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts) -- resize window up
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts) -- resize window down
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- resize window left
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- resize window right

-- stay in indent mode
keymap.set("v", "<", "<gv", opts) -- indent left
keymap.set("v", ">", ">gv", opts) -- indent right

-- move trough quickfix list
keymap.set("n", "<C-S-n>", "<cmd>cnext<CR>zz", opts)
keymap.set("n", "<C-S-p>", "<cmd>cprev<CR>zz", {})
