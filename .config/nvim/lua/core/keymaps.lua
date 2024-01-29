-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

---------------------
-- General keymaps
---------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<Esc>", opts)
-- keymap.set("i", "jl", "<Esc>", opts)
-- keymap.set("i", "kl", "<Esc>", opts)
-- keymap.set("i", "JK", "<Esc>", opts)
-- keymap.set("i", "JL", "<Esc>", opts)
-- keymap.set("i", "KL", "<Esc>", opts)

-- make jk behave like Esc
keymap.set({ "i", "v" }, "jk", "<Esc>", opts)
keymap.set({ "i", "v" }, "jK", "<Esc>", opts)
keymap.set({ "i", "v" }, "Jk", "<Esc>", opts)
keymap.set({ "i", "v" }, "JK", "<Esc>", opts)

-- move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- move line up
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- move line down
keymap.set("v", "p", '"_dP', opts) -- paste without yanking

keymap.set("n", "<C-d>", "<c-d>zz", opts) -- move down half page
keymap.set("n", "<C-u>", "<c-u>zz", opts) -- move up half page
keymap.set("n", "n", "nzzzv", opts) -- keep cursor centered when searching
keymap.set("n", "N", "Nzzzv", opts) -- keep cursor centered when searching

keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") -- replace word under cursor
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>") -- make file executable

-- clear search highlights
keymap.set("n", "<leader>nh", ":noh<CR>", opts)

-- delete single character without yanking
keymap.set("n", "x", '"_x', opts)

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

-- show file tree
keymap.set("n", "<leader>e", ":Ex<CR>", opts)

---------------------
-- Plugin keymaps
---------------------

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)
