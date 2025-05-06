vim.g.mapleader = " "
vim.g.maplocalleader = ";"


vim.keymap.set('n', '<leader>pv', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "clear search highlights" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split existing windows equally" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>L", '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/caleb/plugins/luasnippets"})<CR>', { desc = "Make updates to lua snippets immediately available" })
