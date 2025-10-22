-- inverse forward search
local function TexFocusVim()
  vim.fn.system({ "open", "-a", "iTerm" })
  vim.cmd.redraw()
end

local au_group = vim.api.nvim_create_augroup("vimtex_events", {})

vim.api.nvim_create_autocmd("User", {
  pattern = "VimtexEventViewReverse",
  group = au_group,
  callback = function()
    TexFocusVim()
  end,
})

-- document viewer
vim.g.vimtex_view_method = "skim"
-- do not focus skim after forward search
vim.g.vimtex_view_skim_activate = 0

-- use lualatex as the default engine used by the latexmk compiler backend
vim.g.vimtex_compiler_latexmk_engines = {
  ['_'] = '-lualatex',
}

vim.g.vimtex_compiler_latexmk = {
  ['aux_dir'] = 'aux',
  ['out_dir'] = 'output'
}

-- trigger continuous compilation
vim.keymap.set("n", "<localleader>C", "<Plug>(vimtex-compile)")
-- stop continuous compilation
vim.keymap.set("n", "<localleader>q", "<Plug>(vimtex-stop)")
-- save document and then trigger single-shot compilation
vim.keymap.set("n", "<localleader>c", "<Cmd>update<CR><Cmd>VimtexCompileSS<CR>")

-- suppress VimTex QuickFix when no erros are present
vim.g.vimtex_quickfix_open_on_warning = 0

-- trigger VimtexView (forward search)
vim.keymap.set("n", "<localleader>v", "<Plug>(vimtex-view)")

