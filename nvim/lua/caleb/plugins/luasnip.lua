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

    -- LATEX Keymaps
    vim.keymap.set({"i"}, "<C-K>", function()
      if ls.expandable() then
        ls.expand()
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "jk", function()
      if ls.locally_jumpable(1) then
        ls.jump(1)
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("jk", true, false, true), "n", true)
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "kj", function()
      if ls.locally_jumpable(-1) then
        ls.jump(-1)
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("kj", true, false, true), "n", true)
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})
  end
}
