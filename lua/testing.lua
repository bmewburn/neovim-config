-- All settings/keybinds related to testing
vim.api.nvim_set_keymap('n', '<leader>tn', 
    ":TestNearest<CR>", 
    {}
);
vim.api.nvim_set_keymap('n', '<leader>tf', 
    ":TestFile<CR>", 
    {}
);
vim.api.nvim_set_keymap('n', '<leader>ts', 
    ":TestSuite<CR>", 
    {}
);
vim.api.nvim_set_keymap('n', '<leader>tl', 
    ":TestLast<CR>", 
    {}
);
vim.api.nvim_set_keymap('n', '<leader>tv', 
    ":TestVisit<CR>", 
    {}
);

-- Custom function to close the existing terminal if still open.
vim.api.nvim_exec(
[[
function! CustomStrategy(cmd)
  " Close the previous one if it exists.
  silent execute 'bd! term://'
  execute 'bel 10 new'
  call termopen(a:cmd)
  wincmd p " switch back to last window
endfunction
]],
false
)

vim.api.nvim_set_option('test#custom_strategies', "{'custom': function('CustomStrategy')}")
vim.api.nvim_set_option('test#strategy', 'custom')
vim.api.nvim_set_option('test#neovim#term_poisition', 'bel 10')

-- More project specific.
vim.api.nvim_set_option('test#javascript#cypress#options', 'run --config-file tests/cypress/cypress.json')
--
-- One for normal, one for xdebug.
vim.api.nvim_set_option('test#php#phpunit#executable', 'php artisan test')
vim.api.nvim_set_option('test#php#phpunit#executable', 'php -dxdebug.remote_enable=1 -dxdebug.remote_connect_back=1 -dxdebug.remote_autostart=1 ./vendor/bin/phpunit')
