-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/rob/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/rob/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/rob/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/rob/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/rob/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\asl\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\nÏ\2\0\0\6\0\16\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\27:VGit hunk_preview<CR>\15<leader>gp\1\0\2\vsilent\2\fnoremap\2\29:VGit buffer_history<CR>\15<leader>gh\1\0\2\vsilent\2\fnoremap\2\19:VGit diff<CR>\15<leader>gd\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\nñ\2\0\0\6\0\16\0\0266\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0B\0\1\1K\0\1\0\bset\rmaterial\frequire\1\0\2\vsilent\2\fnoremap\2B:lua require('material.functions').change_style(\"darker\")<CR>\15<leader>cd\1\0\2\vsilent\2\fnoremap\2C:lua require('material.functions').change_style(\"lighter\")<CR>\15<leader>cl\6n\20nvim_set_keymap\bapi\vdarker\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config/dap\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n®\2\0\0\5\0\16\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\14\0004\4\0\0=\4\f\3=\3\15\2B\0\2\1K\0\1\0\ttray\1\0\2\rposition\vbottom\vheight\3\n\fsidebar\relements\1\0\2\rposition\tleft\nwidth\0032\1\3\0\0\vscopes\vstacks\nicons\1\0\0\1\0\3\rcircular\bâ†º\rexpanded\bï‚©\14collapsed\bï‚«\nsetup\ndapui\frequire\18termguicolors\20nvim_set_option\bapi\bvim\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n’\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\0012\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\4\0\0\t.git\n.idea\14.DS_Store\21nvim_tree_ignore\27nvim_tree_quit_on_open\20nvim_tree_width\6g\bvim\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/nvim_context_vt"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  phpactor = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/opt/phpactor"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nû\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fcommand\arg\fpattern\20\\b@*(KEYWORDS):\14highlight\1\0\5\nafter\afg\fkeyword\twide\vbefore\5\18comments_only\1\fpattern\22.*<(KEYWORDS)\\s*:\rkeywords\tTODO\1\0\0\balt\1\2\0\0\ttodo\1\0\2\ncolor\fwarning\ticon\6?\1\0\1\nsigns\2\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["twig.vim"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/twig.vim"
  },
  ["vgit.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tvgit\frequire\0" },
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vgit.nvim"
  },
  ["vim-composer"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-composer"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-laravel"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-laravel"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/rob/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\2\nÏ\2\0\0\6\0\16\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\27:VGit hunk_preview<CR>\15<leader>gp\1\0\2\vsilent\2\fnoremap\2\29:VGit buffer_history<CR>\15<leader>gh\1\0\2\vsilent\2\fnoremap\2\19:VGit diff<CR>\15<leader>gd\6n\20nvim_set_keymap\bapi\bvim\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: vgit.nvim
time([[Config for vgit.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tvgit\frequire\0", "config", "vgit.nvim")
time([[Config for vgit.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config/dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n®\2\0\0\5\0\16\0\0236\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\v\0005\4\n\0=\4\f\3=\3\r\0025\3\14\0004\4\0\0=\4\f\3=\3\15\2B\0\2\1K\0\1\0\ttray\1\0\2\rposition\vbottom\vheight\3\n\fsidebar\relements\1\0\2\rposition\tleft\nwidth\0032\1\3\0\0\vscopes\vstacks\nicons\1\0\0\1\0\3\rcircular\bâ†º\rexpanded\bï‚©\14collapsed\bï‚«\nsetup\ndapui\frequire\18termguicolors\20nvim_set_option\bapi\bvim\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\nñ\2\0\0\6\0\16\0\0266\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0B\0\1\1K\0\1\0\bset\rmaterial\frequire\1\0\2\vsilent\2\fnoremap\2B:lua require('material.functions').change_style(\"darker\")<CR>\15<leader>cd\1\0\2\vsilent\2\fnoremap\2C:lua require('material.functions').change_style(\"lighter\")<CR>\15<leader>cl\6n\20nvim_set_keymap\bapi\vdarker\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n’\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\0012\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\4\0\0\t.git\n.idea\14.DS_Store\21nvim_tree_ignore\27nvim_tree_quit_on_open\20nvim_tree_width\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n\"\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\asl\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nû\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fcommand\arg\fpattern\20\\b@*(KEYWORDS):\14highlight\1\0\5\nafter\afg\fkeyword\twide\vbefore\5\18comments_only\1\fpattern\22.*<(KEYWORDS)\\s*:\rkeywords\tTODO\1\0\0\balt\1\2\0\0\ttodo\1\0\2\ncolor\fwarning\ticon\6?\1\0\1\nsigns\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType php ++once lua require("packer.load")({'phpactor'}, { ft = "php" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
