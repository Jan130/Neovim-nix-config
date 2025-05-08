vim.bo.comments = ':---,:--'

-- Check if lua-language-server is available
if vim.fn.executable('marksman') ~= 1 then
  return
end

local root_files = {
  '.marksman.toml',
  '.git',
}

vim.lsp.start {
  name = 'marksman',
  cmd = { 'marksman', 'server' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
