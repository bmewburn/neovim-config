base_ignore_patterns = {
      "nuts/*",
      "node%_modules/*",
      "external_data/*",
      ".idea/*",
      ".git/*",
      "app/Domain/Smartloader/assets/libs/*",
      "storage/*",
      "_ide_helper.php",
      ".phpstorm.meta.php",
      "public/js/*",
      "public/css/*",
      "public/libs/*",
      "public/vendor/*",
}

require('telescope').setup{
  defaults = {
    file_ignore_patterns = base_ignore_patterns,
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
    layout_strategy = "vertical",
    preview_height = 10,
    winblend = 15
  }
}

function _G.findFilesNoVendor()
  ignore_table = base_ignore_patterns;
  table.insert(ignore_table, "vendor/.*");
  require('telescope.builtin').find_files{file_ignore_patterns = ignore_table, find_command = {'rg', '--files', '-u'}}
end

function _G.searchFilesNoVendor()
  ignore_table = base_ignore_patterns;
  table.insert(ignore_table, "vendor/.*");
  table.insert(ignore_table, "composer.lock");
  table.insert(ignore_table, "package-lock.json");
  require('telescope.builtin').live_grep{file_ignore_patterns = ignore_table, debounce = 100}
end


-- Telescope
vim.api.nvim_set_keymap('n', '<C-p>',
    [[:lua findFilesNoVendor()<CR>]],
    {}
);
vim.api.nvim_set_keymap('n', '<C-a>',
    ':Telescope commands<CR>',
    {}
);
vim.api.nvim_set_keymap('n', '<leader>key',
    ":Telescope keymaps<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>ff',
    ":lua searchFilesNoVendor()<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<leader>fl',
    ":lua require('telescope.builtin').grep_string{grep_open_files=true}<CR>",
    {}
);
vim.api.nvim_set_keymap('n', '<C-f>',
    ':Telescope current_buffer_fuzzy_find<CR>',
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
vim.api.nvim_set_keymap('n', '<leader>fds',
    ":Telescope lsp_document_symbols<CR>",
    {}
);
