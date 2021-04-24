-- This ensures that packer is recompiled on plugins.lua update
vim.api.nvim_exec(
[[
autocmd BufWritePost plugins.lua PackerCompile
]],
false
)

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
    use { 'glepnir/galaxyline.nvim',
    	branch = 'main',
	config = function() require'statusline' end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use { 'lewis6991/gitsigns.nvim',
    	config = function() require'gitsigns'.setup() end,
    	requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
    	requires = {
            'nvim-lua/popup.nvim',
	    'nvim-lua/plenary.nvim'
	}
    }

    -- LSP related stuff.
    use { 'hrsh7th/nvim-compe',
        requires = {
	    'hrsh7th/vim-vsnip',
	    'onsails/lspkind-nvim'
        }
    }
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
          require("trouble").setup {}
      end
    }

    -- LSP PHP
    use { 'phpactor/phpactor',
    	branch = 'master',
	ft = 'php',
        run = 'composer install --no-dev -o'
    }

    -- Formatting
    use 'w0rp/ale'

    -- Debugging
    use 'puremourning/vimspector'

    -- Testing
    use 'vim-test/vim-test'

    -- Handy
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    -- Color scheme
    use 'fenetikm/falcon'

    -- Plugin
    use '~/.config/nvim/lua/plugin/nvim_context_vt'
end)
