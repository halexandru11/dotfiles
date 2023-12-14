--[[ vim.cmd 'colorscheme tropical' ]]

-- tokyonight
-- local colorscheme = "tokyonight-night"

-- catppuccin
-- local colorscheme = "catppuccin-latte"
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macchiato"
local colorscheme = "catppuccin-mocha"

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	print("Colorscheme not found")
	return
end
