return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    local ls = require("luasnip")
    local extras = require("luasnip.extras")

    ls.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
    require("luasnip.loaders.from_lua").load({paths = {"~/.config/nvim/lua/caleb/plugins/luasnippets/"}})
    require("luasnip.loaders.from_lua").lazy_load({paths = {"~/.config/nvim/lua/caleb/plugins/luasnippets/"}})

  end
}
