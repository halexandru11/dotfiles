local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

configs.setup {
  ensure_installed = { "javascript", "tsx", "typescript", "html", "css", "scss", "json", "yaml", "lua", "bash", "python", "regex" },
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = { enable = true },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
