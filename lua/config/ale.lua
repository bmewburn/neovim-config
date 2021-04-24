-- Ale config.

vim.g.ale_enabled = 0
vim.g.ale_disable_lsp = 1
vim.g.ale_linters_explicit = 1
vim.g.ale_php_phpcs_executable = 'phpcs'
vim.g.ale_php_php_cs_fixer_executable = 'php-cs-fixer'
vim.g.ale_linter_aliases = {vue = {'vue', 'javascript'}}
vim.g.ale_linters = {vue = {'eslint'}, js = {'eslint'}, ts = {'eslint'}, php = {'phpcs'}}
vim.g.ale_fixers = {}
vim.g.ale_fixers.php = {'php_cs_fixer'}
vim.g.ale_fixers.vue = {'eslint'}
vim.g.ale_fixers.javascript = {'eslint'}
vim.g.ale_fixers.typescript = {'eslint'}
vim.g.ale_fix_on_save = 0

vim.g.ale_sign_error = '!'
vim.g.ale_sign_warning = '>'
