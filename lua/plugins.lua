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
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            -- Tree width.
            vim.g.nvim_tree_width = 50
            vim.g.nvim_tree_quit_on_open = 1
            vim.g.nvim_tree_ignore = {".git", ".idea", ".DS_Store"}
        end
    }
    use {
        'tanvirtin/vgit.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function ()
            require('vgit').setup()
        end

    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            require'bufferline'.setup{}
        end
    }

    -- Telescope
    use {'nvim-lua/plenary.nvim', branch='async_jobs_v2'}
    use { 'nvim-telescope/telescope.nvim',
        branch = 'async_v2',
    	requires = {
            'nvim-lua/popup.nvim'
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

          -- KeyMap
          vim.api.nvim_set_keymap('n', '<leader>gd', ':VGit diff<CR>', {
              noremap = true,
              silent = true,
          })
          vim.api.nvim_set_keymap('n', '<leader>gh', ':VGit buffer_history<CR>', {
              noremap = true,
              silent = true,
          })
          vim.api.nvim_set_keymap('n', '<leader>gp', ':VGit hunk_preview<CR>', {
              noremap = true,
              silent = true,
          })
      end
    }

    -- LSP PHP
    use { 'phpactor/phpactor',
    	branch = 'master',
	ft = 'php',
        run = 'composer install --no-dev -o && ./vendor/bin/phpactor extension:install "phpactor/language-server-phpstan-extension"'
    }
    use {
        "ray-x/lsp_signature.nvim",
    }
    use { "nelsyeung/twig.vim" }

    -- Formatting
    use 'w0rp/ale'

    -- Debugging
    use {
        'mfussenegger/nvim-dap',
        config = function()
            require('config/dap')
        end
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            vim.api.nvim_set_option('termguicolors', true)
            require("dapui").setup({
                icons = {
                    expanded = "",
                    collapsed = "",
                    circular = "↺"
                },
                sidebar = {
                    elements = {
                        "scopes",
                        "stacks",
                    },
                    width = 50,
                    position = "left"
                },
                tray = {
                    elements = {},
                    height = 10,
                    position = "bottom"
                }
            })
    end
    }

    -- Laravel
    use {
      'noahfrederick/vim-laravel',
      requires = {
        'noahfrederick/vim-composer',
        'tpope/vim-projectionist',
        'tpope/vim-dispatch',
      }
    }

    -- Testing
    use 'vim-test/vim-test'

    -- Handy
    use 'tpope/vim-surround'
    use 'tpope/vim-sleuth'


    -- Commenter
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup()
        end
    }

    -- Color scheme
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'sl' end,
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    }
    use {
        'marko-cerovac/material.nvim',
        config = function()
            vim.g.material_style = 'darker'
            vim.api.nvim_set_keymap('n', '<leader>cl', [[:lua require('material.functions').change_style("lighter")<CR>]], { noremap = true, silent=true})
            vim.api.nvim_set_keymap('n', '<leader>cd', [[:lua require('material.functions').change_style("darker")<CR>]], { noremap = true, silent=true})
            require('material').set()
        end
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
            signs = true,
            keywords = {
                TODO = { icon = "?", color = "warning", alt = {"todo"} },
            },
            highlight = {
                before = "",
                keyword = "wide",
                after = "fg",
                pattern = [[.*<(KEYWORDS)\s*:]],
                comments_only = false,
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                pattern = [[\b@*(KEYWORDS):]],
            },
        }
      end
    }

    -- Plugin
    use 'haringsrob/nvim_context_vt'
end)
