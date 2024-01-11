--[[ vim.cmd 'colorscheme tropical' ]]

-- tokyonight
-- local colorscheme = "tokyonight-night"

-- catppuccin
-- local colorscheme = "catppuccin-latte"  --light
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macchiato"
-- local colorscheme = "catppuccin-mocha"

-- local colorscheme = "rose-pine-dawn"  -- light
-- local colorscheme = "rose-pine"
-- local colorscheme = "rose-pine-moon"
local colorscheme = "rose-pine-main" -- darkest

local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	print("Colorscheme not found")
	return
end
