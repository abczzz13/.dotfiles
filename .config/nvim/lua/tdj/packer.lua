local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
  }
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

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
    use({"onsails/lspkind.nvim"})
    use({"williamboman/nvim-lsp-installer"})
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

    -- Gitsigns
    use({"lewis6991/gitsigns.nvim"})

    -- Indentation
    use ({"lukas-reineke/indent-blankline.nvim"})

    -- Colorschemes
    use({"folke/tokyonight.nvim"})
    use({"gruvbox-community/gruvbox"})
    use({"catppuccin/nvim", as = "catppuccin"})
    use({"EdenEast/nightfox.nvim"})
    use "ful1e5/onedark.nvim"
    use({"rebelot/kanagawa.nvim"})

    -- Utilities
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use({"kyazdani42/nvim-web-devicons"})

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
