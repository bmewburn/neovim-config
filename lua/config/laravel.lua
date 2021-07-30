-- Function to go to the opposite file.
function _G.twillBrotherFile()
  local filePath = vim.fn.expand('%:p:h')
  local fileName = vim.fn.expand('%:t')

  if string.find(filePath, 'resources/views/admin/blocks') then
    filePath = filePath:gsub('resources/views/admin/blocks', 'resources/views/site/blocks')
  elseif string.find(filePath, 'resources/views/site/blocks') then
    filePath = filePath:gsub('resources/views/site/blocks', 'resources/views/admin/blocks')
  else
    return
  end

  dump(filePath)
  vim.api.nvim_command('e ' .. filePath .. '/' .. fileName)
end

vim.api.nvim_set_keymap('n', '<leader>ts',
    [[:lua twillBrotherFile()<CR>]],
    {silent = true}
);
