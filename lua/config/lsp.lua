-- All lsp/autocomplete related config
local lspconfig = require'lspconfig'

require('lspkind').init()
require('lspsaga').init_lsp_saga()

-- nvim compe
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local on_attach = function(client, buffer)
  require'lsp_signature'.on_attach();
end

--
-- Setup the lsp configs.
--

-- Rust
-- curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-mac -o ~/.local/bin/rust-analyzer
lspconfig.rust_analyzer.setup{
  cmd = {'/Users/rob/.local/bin/rust-analyzer'},
  capabilities = capabilities,
  on_attach = on_attach
}

-- C
lspconfig.sourcekit.setup{}

-- Dart
lspconfig.dartls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
  }
}

-- Vue
lspconfig.vuels.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- TS
lspconfig.tsserver.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

-- PHPActor
lspconfig.phpactor.setup{
  cmd = {"/Users/rob/.local/share/nvim/site/pack/packer/opt/phpactor/bin/phpactor", "language-server"},
  capabilities = capabilities,
  on_attach = on_attach
}

--lspconfig.intelephense.setup{
--  capabilities = capabilities,
--  on_attach = on_attach,
--  init_options = {
--    licenceKey = os.getenv('INTELEPHENSELICENCE'),
--  },
--}


-- nvim-compe setup
--

-- Set completeopt to have a better completion experience
vim.api.nvim_set_option('completeopt', 'menuone,noinsert');

-- Avoid showing message extra message when using completion
vim.cmd [[set shortmess+=c]]

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

-- Keymaps for confirming and scrolling.
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({'delta': +4})", {silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#confirm({'delta': -4})", {silent = true, expr = true})

-- Some keymaps for when open.
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Format document
vim.api.nvim_set_keymap("n", "<leader>fd", ":lua vim.lsp.buf.formatting()<CR>", {silent = true})

-- LspSaga
vim.api.nvim_set_keymap("n", "<leader>a", ":Lspsaga code_action<CR>", {silent = true})
vim.api.nvim_set_keymap("v", "<leader>a", ":<C-U>Lspsaga range_code_action<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "gr", ":Lspsaga lsp_finder<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":Lspsaga hover_doc<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>en", ":Lspsaga diagnostic_jump_next<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>ep", ":Lspsaga diagnostic_jump_prev<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>rn", ":Lspsaga rename<CR>", {silent = true})

-- Diagnostics quickfix.
vim.api.nvim_set_keymap("n", "<leader>dl", ":LspTroubleWorkspaceOpen<CR>", {});


