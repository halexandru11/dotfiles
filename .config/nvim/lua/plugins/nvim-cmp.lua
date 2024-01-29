return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- buffer completion source for nvim-cmp
    "hrsh7th/cmp-path", -- path completion source for nvim-cmp
    "hrsh7th/cmp-cmdline", -- cmdline completion source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- snippets completion source for nvim-cmp
    "hrsh7th/cmp-nvim-lsp", -- nvim-lsp completion source for nvim-cmp
    "hrsh7th/cmp-nvim-lua", -- nvim-lua completion source for nvim-cmp
    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "rafamadriz/friendly-snippets" -- snippets collection
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require( "luasnip")
    require("luasnip/loaders/from_vscode").lazy_load()

    local kind_icons = {
      Text = "󰊄",
      Method = "m",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "󰫧",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "󰌆",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "󰉺",
    }
    -- find more here: https://www.nerdfonts.com/cheat-sheet

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-a>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- Accept currently select item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected item.
        ["<CR>"] = cmp.config.disable,
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)  -- This concatenates the kind icon with the kind name
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[NvimLua]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]

          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },
        { name = "path" },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      window = {
        documentation = cmp.config.window.bordered(),
      },
    })
  end
}
