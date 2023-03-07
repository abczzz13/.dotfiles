-- Automatically install packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        print("Installing packer close and reopen Neovim...")
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use({"wbthomason/packer.nvim"})
    use({"williamboman/mason.nvim"})

    -- Telescope
    use({"nvim-lua/plenary.nvim"})
    use({"nvim-lua/popup.nvim"})
    use({
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    })
    use({"nvim-telescope/telescope-file-browser.nvim"})

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    use({"nvim-treesitter/nvim-treesitter-context"})

    -- LSP
    use({"neovim/nvim-lspconfig"})
    use({"williamboman/mason-lspconfig.nvim"})
    use({"onsails/lspkind.nvim"})
    use({"williamboman/nvim-lsp-installer"}) -- in process of replacing with mason
    use({"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    -- nvim-cmp auto-completion
    use({"hrsh7th/nvim-cmp"})
    use({"hrsh7th/cmp-nvim-lsp"})
    use({"hrsh7th/cmp-nvim-lua"})
    use({"hrsh7th/cmp-buffer"})
    use({"hrsh7th/cmp-path"})
    use({"hrsh7th/cmp-cmdline"})
    use({"saadparwaiz1/cmp_luasnip"})

    -- Luasnip for nvim-cmp
    use({"L3MON4D3/LuaSnip"})

    -- null-ls
    use({"jose-elias-alvarez/null-ls.nvim"})

    -- debugging with DAP
    use({"mfussenegger/nvim-dap"})
    use({"mfussenegger/nvim-dap-python"})
    use({"rcarriga/nvim-dap-ui"})

    -- Commenting
    use({"numToStr/Comment.nvim"})
	use({"JoosepAlviste/nvim-ts-context-commentstring"})

    -- Autopairs
    use({"windwp/nvim-autopairs"})

    -- Undotree
    use({"mbbill/undotree"})

    use ({"ThePrimeagen/harpoon"})

    -- NvimTree
    use({"kyazdani42/nvim-tree.lua",
        requires = {
        "kyazdani42/nvim-web-devicons",
        },
        -- tag = "nightly",
    })

    -- Bufferline
    use({"akinsho/bufferline.nvim"})
    use({"moll/vim-bbye"})

    -- Alpha Greeter
    use {
        "goolord/alpha-nvim",
        config = function ()
            require'alpha'.setup(require"alpha.themes.dashboard".config)
        end
    }

    -- Zettelkasten
    use({"renerocksai/telekasten.nvim"})
    use({"renerocksai/calendar-vim"})

    -- Gitsigns
    use({"lewis6991/gitsigns.nvim"})
    use({"ThePrimeagen/git-worktree.nvim"})

    -- Indentation
    use ({"lukas-reineke/indent-blankline.nvim"})

    -- Colorschemes
    use({"folke/tokyonight.nvim"})

    -- Utilities
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use({"kyazdani42/nvim-web-devicons"})

    use({"towolf/vim-helm"})
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
