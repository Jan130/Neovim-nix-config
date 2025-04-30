-- vimtex
vim.g.vimtex_view_method = "okular"
vim.o.foldmethod = "expr"
vim.o.foldexpr="vimtex#fold#level(v:lnum)"
vim.o.foldtext="vimtex#fold#text()"
vim.o.foldlevel=2

-- lsp

-- Check if language server is available
if vim.fn.executable('texlab') ~= 1 then
  return
end

local root_files = {
  'startArticle.tex',
  '.git',
}

vim.lsp.start {
  name = 'texlab',
  cmd = { 'texlab' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
