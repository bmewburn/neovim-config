require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "nuts/*",
      "node_modules/*",
      "external_data/*",
      "vendor/*",
      ".idea/*",
      ".git/*",
      "app/Domain/Smartloader/assets/libs/*"
    },
    layout_strategy = "center",
    preview_cutoff = 10,
    preview_height = 10,
    results_height = 10,
    winblend = 10
  }
}

-- Telescope
vim.api.nvim_set_keymap('n', '<C-p>',
    ':Telescope find_files<CR>',
    {}
);
vim.api.nvim_set_keymap('n', '<C-a>',
    ':Telescope find_files<CR>',
    {}
);
vim.api.nvim_set_keymap('n', '<C-f>',
    ':Telescope current_buffer_fuzzy_find<CR>',
    {}
);
vim.api.nvim_set_keymap('n', '<leader>key',
    ":Telescope keymaps<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>ff',
    ":lua require('telescope.builtin').live_grep()<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>fw',
    ":lua require('telescope.builtin').grep_string()<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<C-e>',
    [[:lua require'telescope.builtin'.buffers { file_ignore_patterns = {}, show_all_buffers = true, sort_lastused = true, default_selection_index = 1, ignore_current_buffer = true }<CR>]],
    {silent = true}
);
vim.api.nvim_set_keymap('n', '<leader>gs',
    ":Telescope git_status<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>fs',
    ":Telescope lsp_dynamic_workspace_symbols<CR>",
    {}
);
