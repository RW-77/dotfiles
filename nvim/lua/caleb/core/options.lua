vim.cmd("let g:netrw_liststyle = 3")

vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.smartindent = true -- copy indent from current line when starting new one

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- search settings 
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = "indent,eol,start" -- allows backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to right
vim.opt.splitbelow = true -- split horizontal window to bottom
