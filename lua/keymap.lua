-- Navigation keymap.
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {});
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {});
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {});
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {});

-- Save
vim.api.nvim_set_keymap('n', '<leader>ss',
    ':w<CR>',
    {}
);

-- Tree
vim.api.nvim_set_keymap('n', '<leader>m',
    ":NvimTreeToggle<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>n',
    ":NvimTreeFindFile<CR>",
    {}
);

-- Buffer management
vim.api.nvim_set_keymap('n', '<leader>bd',
    ":bd<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>bc',
    ":bufdo bd<CR>",
    {}
);
