
-- Basic configs.
vim.wo.number = true
vim.wo.signcolumn = 'yes:1'
vim.api.nvim_set_option('hidden', true)
vim.api.nvim_set_option('cursorline', true)
vim.api.nvim_set_option('mouse', 'a')
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('tabstop', 4)

-- Plugins
require('plugins')

-- Split layout
vim.api.nvim_set_option('splitbelow', true)
vim.api.nvim_set_option('splitright', true)

-- Map the leader.
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Autoformat
vim.api.nvim_exec(
[[
autocmd BufWritePre *.dart lua vim.lsp.buf.formatting()
]]
,
false)

-- Indentation
vim.api.nvim_exec(
[[
filetype plugin indent on
autocmd BufEnter * set autoindent
]],
false
)

-- Remove trailing whitespaces on save.
vim.api.nvim_exec(
[[
autocmd BufWritePre * %s/\s\+$//e
]],
false
)

-- I am to slow to release some keys
vim.cmd(":command! W w")
vim.cmd(":command! Wq wq")
vim.cmd(":command! Wqa wqa")
vim.cmd(":command! Q q")
vim.cmd(":command! Qa qa")
-- I keep using q accidentally too frequent.
vim.cmd("nnoremap Q q")
vim.cmd("nnoremap q <Nop>")

-- Color scheme and gui options.
vim.o.guifont = "MesloLGSDZ Nerd Font Mono"

-- Telescope
require('config/telescope')

-- Shared Keybinds
require('keymap')

-- Specific configs
require('config/php')

-- TreeSitter
require('config/treesitter')

-- Autocomplete and lsp.
require('config/lsp')

-- Ale
require('config/ale')

-- Testing
require('testing')

-- Laravel helpers
require('config/laravel')

-- Helpers
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
