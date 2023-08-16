-- import nvim-autopairs safely
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
  return
end
  
-- configure autopairs
autopairs.setup()

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
