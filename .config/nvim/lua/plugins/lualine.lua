
local function get_directory()
	local dir_name = vim.fn.expand("%:p:h")
	local tail = vim.fn.fnamemodify(dir_name, ":t")
	return tail
end

return {
  "nvim-lualine/lualine.nvim",
  name = "lualine",
  config = function()
    require('lualine').setup({
        options = {
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = "" } },
          },
          lualine_b = {
            "filename",
            { "branch", color = { fg = "", gui = "bold" } },
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
            },
          },
          lualine_c = {
            "diff",
          },
          lualine_x = {
            "fileformat",
            "filetype",
          },
          lualine_y = {
            "progress",
            {
              "location",
              padding = { left = 0, right = 1 },
              color = { fg = "", gui = "bold" },
            },
          },
          lualine_z = {
            { get_directory, icon = "󰉋", separator = { left = "", right = "" } },
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
