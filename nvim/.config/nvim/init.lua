require("core")
require("plugins.setup")

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
function Gh(repo)
	return "https://github.com/" .. repo
end

require("plugins")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
