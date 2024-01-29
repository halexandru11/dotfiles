return {
  {"nvim-ts-autotag"},
  {
    "windwp/nvim-autopairs",
    name="nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
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

--      require("nvim-autopairs.completion.cmp")
--      cmp = require("cmp")
--
--      -- make autopairs and completion work together
--      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  }
}
