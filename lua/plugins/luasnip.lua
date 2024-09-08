return {
  "L3MON4D3/LuaSnip",
  dependencies =
  { "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip", },

  config = function()
    require("luasnip")
    -- require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_snipmate").lazy_load()
  end
}
