local knap_status, knap = pcall(require, "knap")

if not knap_status then
	return
end

local keymap = vim.keymap

keymap.set({ "n", "v", "i" }, "<leader><leader>s", function()
	knap.toggle_autopreviewing()
end)

keymap.set({ "n", "v", "i" }, "<leader><leader>c", function()
	knap.forward_jump()
end)

keymap.set({ "n", "v", "i" }, "<leader><leader>e", function()
	knap.close_viewer()
end)
