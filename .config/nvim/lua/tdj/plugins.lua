return {
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    -- { "nvim-tree/nvim-web-devicons", tag = "nerd-v2-compat" },

    -- LSP
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        -- priority = 1000, -- make sure to load this before all the other start plugins
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            "folke/neodev.nvim",
        },
    },

    -- CMP
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        -- priority = 1000, -- make sure to load this before all the other start plugins
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim" },
    },

    -- Treesitter
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
    },
    {
        "tzachar/local-highlight.nvim",
        config = function()
            require("local-highlight").setup({
                -- file_types = { "python", 'cppgcc' },
                hlgroup = 'Search',
                cw_hlgroup = nil,
            })
        end
    },

    -- Telescope
    { "nvim-lua/plenary.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim" }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
            return vim.fn.executable "make" == 1
        end,
    },

    -- Commenting
    { "numToStr/Comment.nvim", opts = {} },

    -- Indentation
    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            char = "┊",
            show_trailing_blankline_indent = false,
            show_current_context = true,
            show_current_context_start = true,
            show_end_of_line = true,
        },
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append "eol:↴"
        end,
    },

    -- Lualine
    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = 'tokyonight',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            return require "tdj.null-ls"
        end
    },

    -- debugging with DAP

    -- Autopairs

    -- Undotree
    {
        "mbbill/undotree",
        config = function()
        end,
        opts = {},
    },

    -- Harpoon
    { "ThePrimeagen/harpoon",    opts = {} },

    -- NvimTree
    {
        "nvim-tree/nvim-tree.lua",
        commit = "45400cd7e02027937cd5e49845545e606ecf5a1f",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- dependencies = { "nvim-tree/nvim-web-devicons", tag = "nerd-v2-compat" },
        config = function()
            require("nvim-tree").setup({})
        end,
    },

    -- Bufferline
    { "akinsho/bufferline.nvim", opts = {} },

    -- Zettelkasten
    {
        "renerocksai/telekasten.nvim",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
        opts = function()
            return require "tdj.zettelkasten"
        end,
    },

    -- Gitsigns
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = '[P]review [H]unk' })
            end,
        },
    },
    {
        "tpope/vim-fugitive",
        config = function()
        end,
        opts = {},
    },
    { "ThePrimeagen/git-worktree.nvim", opts = {} },

    -- Make Helm / yaml files readable
    {
        "towolf/vim-helm",
        config = function()
        end,
        opts = {}
    },

    -- Alpha
    {
        'goolord/alpha-nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- dependencies = { "nvim-tree/nvim-web-devicons", tag = "nerd-v2-compat" },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end,
    },
    -- Test: not sure if I want it:
    --[[ {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }, ]]
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-y>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-J>",
                        prev = "<M-K>",
                        dismiss = "<M-]>",
                    },
                },
            })
        end,
    },
    -- { "github/copilot.vim" },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end
    -- },
    {
        "hashivim/vim-terraform"
    },
    {
        "NoahTheDuke/vim-just"
    },
    require "tdj.autoformat",
    -- require "tdj.set",
}
