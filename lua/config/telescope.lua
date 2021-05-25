require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "nuts/*",
      "node_modules/*",
      "external_data/*",
      ".idea/*",
      ".git/*",
      "app/Domain/Smartloader/assets/libs/*"
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-u'
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
    [[:lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '-u'}})<CR>]],
    {}
);
vim.api.nvim_set_keymap('n', '<C-a>',
    ':Telescope commands<CR>',
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
