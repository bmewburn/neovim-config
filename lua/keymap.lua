-- Navigation keymap.
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {});
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {});
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {});
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {});

-- Save
vim.api.nvim_set_keymap('n', '<leader>ss',
    ':w<CR>',
    {silent = true}
);

-- Tree
vim.api.nvim_set_keymap('n', '<leader>m',
    ":NvimTreeToggle<CR>",
    {silent = true}
);
vim.api.nvim_set_keymap('n', '<leader>n',
    ":NvimTreeFindFile<CR>",
    {silent = true}
);

-- Buffer management
vim.api.nvim_set_keymap('n', '<leader>bd',
    ":bd<CR>",
    {silent = true}
);
vim.api.nvim_set_keymap('n', '<leader>bc',
    ":bufdo bd<CR>",
    {silent = true}
);
