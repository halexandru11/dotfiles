-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- line numbers
vim.o.number = true -- shows absolute line number on cursor line
vim.o.relativenumber = true -- show relative line numbers
vim.o.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.cursorline = true -- Show which line your cursor is on

-- tabs & indentation
vim.o.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.o.shiftwidth = 2 -- 2 spaces for indent width
vim.o.expandtab = true -- expand tab to spaces
vim.o.autoindent = true -- copy indent from current line when starting new one

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true -- show search matches as you type
vim.o.hlsearch = false -- highlight all matches on screen
vim.o.inccommand = 'split' -- Preview substitutions live, as you type!

vim.o.breakindent = true -- Enable break indent
vim.o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

vim.o.mouse = 'a' -- enable mouse mode
vim.o.showmode = false -- Don't show the mode, since it's already in the status line

vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.wrap = false -- enable line wrapping

vim.o.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor.

vim.o.termguicolors = true -- turn on termguicolors for nightfly colorscheme to work

-- vim.g.netrw_list_hide = "^\\./$,^\\.\\./$"
-- vim.g.netrw_hide = 1
