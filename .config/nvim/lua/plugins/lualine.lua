local function get_file_path()
	local current_file_path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()

	-- Calculate the relative path
	local relative_path = vim.fn.fnamemodify(current_file_path, ":.")
	if not vim.endswith(cwd, "/") then
		cwd = cwd .. "/"
	end
	relative_path = vim.fn.substitute(relative_path, "^" .. vim.fn.escape(cwd, "\\/") .. "", "", "")

	return "./" .. relative_path
end

return {
	"nvim-lualine/lualine.nvim",
	name = "lualine",
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "", right = "" } },
				},
				lualine_b = {
					{
						get_file_path,
						icon = "󰉋",
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
					},
				},
				lualine_c = {
					"diff",
				},
				lualine_x = {},
				lualine_y = {
					"progress",
					{
						"location",
						padding = { left = 0, right = 1 },
						color = { fg = "", gui = "bold" },
					},
				},
				lualine_z = {
					{
						"branch",
						separator = { left = "", right = "" },
					},
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
		})
	end,
}
