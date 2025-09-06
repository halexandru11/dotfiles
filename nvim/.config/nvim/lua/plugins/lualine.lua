local function get_file_path()
	-- Get the absolute path of the current file
	local current_file_path = vim.fn.expand("%:p")

	-- Get the current working directory
	local cwd = vim.fn.getcwd()

	-- Calculate the relative path
	local relative_path = vim.fn.fnamemodify(current_file_path, ":.")

	-- Ensure cwd ends with a slash for consistency
	if not vim.endswith(cwd, "/") then
		cwd = cwd .. "/"
	end

	-- Substitute the cwd in the relative path with an empty string
	relative_path = vim.fn.substitute(relative_path, "^" .. vim.fn.escape(cwd, "\\/") .. "", "", "")

	-- Split the path into directory components
	local directories = {}
	for directory in relative_path:gmatch("[^/]+") do
		table.insert(directories, directory)
	end

	-- Limit the directories to at most 3 levels
	if #directories > 3 then
		relative_path = "... > " .. table.concat(directories, " > ", #directories - 2, #directories)
	elseif #directories > 0 then
		relative_path = table.concat(directories, " > ")
	else
		relative_path = "."
	end

	-- Return the relative path
	return relative_path
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
