-- import nvim-autopairs safely
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
	return
end

local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_status then
	return
end

-- configure autotag
autotag.setup()

-- configure autopairs
autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
		html = { "string" },
	},
	disable_filetypes = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>", -- Maps to <M-e> which is Alt+e by default
		chars = { "{", "[", "(", '"', "'", "`", "<" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
	return
end

-- import nvim-cmp plugin safely (completion plugin)
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
