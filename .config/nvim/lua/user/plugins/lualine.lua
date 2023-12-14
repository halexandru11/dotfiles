-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local function get_directory()
	local dir_name = vim.fn.expand("%:p:h")
	local tail = vim.fn.fnamemodify(dir_name, ":t")
	return tail
end

local config = {
	options = {
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "", right = "" } },
		},
		lualine_b = {
			"filename",
			"branch",
			{
				"diagnostics",
				-- sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
			},
		},
		lualine_c = {
			"diff",
		},
		lualine_x = { "progress" },
		lualine_y = { { get_directory } },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	-- 	tabline = {},
	-- 	extensions = {},
}

lualine.setup(config)
