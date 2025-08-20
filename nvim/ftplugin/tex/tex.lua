local ls = require("luasnip")

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
