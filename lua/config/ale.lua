-- Ale config.

vim.g.ale_enabled = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_linters_explicit = 1
vim.g.ale_php_phpcs_executable = 'phpcs'
vim.g.ale_php_php_cs_fixer_executable = 'php-cs-fixer'
vim.g.ale_linter_aliases = {vue = {'vue', 'javascript'}}
vim.g.ale_linters = {vue = {'eslint'}, js = {'eslint'}, javascript = {'eslint'}, ts = {'eslint'}, php = {'phpcs'}}
vim.g.ale_fixers = {
  php = {'php_cs_fixer'},
  vue = {'eslint'},
  javascript = {'eslint'},
  typescript = {'eslint'},
}
vim.g.ale_fix_on_save = 1

vim.g.ale_sign_error = '!'
vim.g.ale_sign_warning = '>'
