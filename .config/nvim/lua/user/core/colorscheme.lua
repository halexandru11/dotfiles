--[[ vim.cmd 'colorscheme tropical' ]]

-- tokyonight
-- local colorscheme_name = "tokyonight-night"
-- local flavor = ""

-- catppuccin
-- local colorscheme_name = "catppuccin"
-- local flavour = "-latte"      --light
-- local flavour = "-frappe"
-- local flavour = "-macchiato"
-- local flavour = "-mocha"      -- dark

-- rose-pine
local colorscheme_name = "rose-pine"
-- local flavour = "-dawn"       -- light
-- local flavour = ""
-- local flavour = "-moon"
local flavour = "-main" -- darkest

local status_load, colorscheme = pcall(require, colorscheme_name)
if not status_load then
	error("Couldn't load colorscheme " .. colorscheme_name)
end

colorscheme.setup({
	disable_background = true,
})

local status_set, _ = pcall(vim.cmd, "colorscheme " .. colorscheme_name .. flavour)
if not status_set then
	error("Couldn't set colorscheme " .. colorscheme_name .. flavour)
end
