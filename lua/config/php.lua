local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- PHPActor
--lspconfig.phpactor.setup{capabilities = capabilities}
lspconfig.intelephense.setup{
  capabilities = capabilities,
  init_options = {
    licenceKey = os.getenv('INTELEPHENSELICENCE'),
  },
}

-- Php specific key maps.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('x', '<leader>em',
    [[:<C-U>call phpactor#ExtractMethod(visualmode())<CR>]],
    opts
)
vim.api.nvim_set_keymap('x', '<leader>ee',
    [[:<C-U>call phpactor#ExtractExpression(visualmode())<CR>]],
    opts
)
vim.api.nvim_buf_set_keymap(0, '', '<leader>pt',
    [[:call phpactor#Transform()<CR>]],
    opts
)
vim.api.nvim_buf_set_keymap(0, '', '<leader>pce', 
    [[:call phpactor#ClassExpand()<CR>]],
    opts
)
vim.api.nvim_buf_set_keymap(0, '', '<leader>pp',
    [[:call phpactor#ContextMenu()<CR>]],
    opts
)

-- make $ part of the keyword.
vim.api.nvim_exec(
[[
autocmd FileType php set iskeyword+=$
]], 
false
)

