vim.g.vimtex_view_method = "general"
vim.g.vimtex_view_general_viewer = "evince"
vim.g.vimtex_view_general_options = ''
vim.g.vimtex_compiler_latexmk = {
  aux_dir = '',
  out_dir = '',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  hooks = {},
  options = {
    '-pdflua',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
