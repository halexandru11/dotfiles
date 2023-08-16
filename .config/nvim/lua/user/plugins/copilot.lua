-- change the accept suggestion from `Tab` to `Ctrl+A`
-- vim.g.copilot_no_tap_map = true
-- vim.keymap.set("i", "<C-y>", ":copilot#Accept('\\<CR>", { silent = true })

vim.cmd[[imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")]]
vim.cmd[[let g:copilot_no_tap_map = v:true]]
