return {
    -- the colorscheme should be available when starting Neovim
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- LSP
    { -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { "j-hui/fidget.nvim", opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            "folke/neodev.nvim",
        },
    },

    -- CMP
    { -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" , "onsails/lspkind.nvim" },
    },

    -- Treesitter
    { -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
    },

    -- Telescope
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" } },
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
    { -- Add indentation guides even on blank lines
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
    { -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        -- See `:help lualine.txt`
        opts = {
            options = {
                --[[ icons_enabled = false, ]]
                component_separators = "|",
                section_separators = "",
            },
        },
    },

    -- null-ls

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
    { "ThePrimeagen/harpoon",  opts = {} },

    -- NvimTree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },

    -- Bufferline
    { "akinsho/bufferline.nvim",     opts = {} },

    -- Zettelkasten
    { "renerocksai/telekasten.nvim", opts = {} },

    -- Gitsigns
    { -- Adds git releated signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
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

    -- WhichKeys
    { 'folke/which-key.nvim', opts = {} },

    -- Alpha
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },
    -- Test: not sure if I want it:
    --[[ {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }, ]]
    require "tdj.autoformat",

}
