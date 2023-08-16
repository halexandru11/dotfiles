-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
keymap.set("i", "jl", "<Esc>", { noremap = true, silent = true })
keymap.set("i", "kl", "<Esc>", { noremap = true, silent = true })
keymap.set("i", "JK", "<Esc>", { noremap = true, silent = true })
keymap.set("i", "JL", "<Esc>", { noremap = true, silent = true })
keymap.set("i", "KL", "<Esc>", { noremap = true, silent = true })

-- move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })  -- move line up
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })  -- move line down
keymap.set("v", "p", '"_dP', { noremap = true, silent = true })                -- paste without yanking

keymap.set("n", "<C-d>", "<c-d>zz", { noremap = true, silent = true })         -- move down half page
keymap.set("n", "<C-u>", "<c-u>zz", { noremap = true, silent = true })         -- move up half page
keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })               -- keep cursor centered when searching
keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })               -- keep cursor centered when searching

keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")  -- replace word under cursor
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")  -- make file executable

-- clear search highlights
keymap.set("n", "<leader>nh", ":noh<CR>", { noremap = true, silent = true })

-- delete single character without yanking
keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true })  -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true })  -- split window horizontally
keymap.set("n", "<leader>so", "<C-w>o", { noremap = true, silent = true })  -- close all windows except current
keymap.set("n", "<leader>se", "<C-w>=", { noremap = true, silent = true })  -- equalize window sizes
keymap.set("n", "<leader>sx", ":close<CR>", { noremap = true, silent = true })  -- close current window

-- resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })  -- resize window up
keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })  -- resize window down
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })  -- resize window left
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })  -- resize window right

-- stay in indent mode
keymap.set("v", "<", "<gv", { noremap = true, silent = true })  -- indent left
keymap.set("v", ">", ">gv", { noremap = true, silent = true })  -- indent right

-- show file tree
keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true })
