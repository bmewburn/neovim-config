local dap = require'dap'

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/rob/.config/nvim/debug/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}


vim.api.nvim_exec(
[[
au FileType dap-repl lua require('dap.ext.autocompl').attach()
]],
false
)

require('dap').defaults.fallback.exception_breakpoints = {''}

vim.api.nvim_set_keymap("n", "<leader>dd",
  ":lua require'dap'.toggle_breakpoint()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dn",
  ":lua require'dap'.continue()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dj",
  ":lua require'dap'.down()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dk",
  ":lua require'dap'.up()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>df",
  ":lua require'dap'.step_into()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dc",
  ":lua require'dap'.step_over()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dr",
  ":lua require'dap'.disconnect()<CR>:lua require'dap'.close()<CR>:lua require('dapui').close()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dq",
  ":lua require'dap'.close()<CR>:lua require('dapui').close()<CR>",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>dh",
  [[:lua  require('dap.ui.variables').visual_hover()<CR>]],
  {silent = true}
)
vim.api.nvim_set_keymap("n", "<leader>do",
  ":lua require'dap'.repl.open()<CR>",
  {silent = true}
)
