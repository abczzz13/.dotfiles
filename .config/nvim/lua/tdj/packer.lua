-- This file can be loaded by calling `lua require("plugins")` from your init.vim

--[[Still need to install:
-- fzf
-- telescope
-- neogit
-- treesitter
-- cmp
-- nvim tree or nerdtree
-- "kyazdani42/nvim-web-devicons"
-- maybe jedi-vim
-- Poet-V
]]
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
    use "nvim-telescope/telescope-file-browser.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    } 
    use "nvim-treesitter/nvim-treesitter-context"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind.nvim"

    -- nvim-cmp auto-completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    
    -- Luasnip for nvim-cmp
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- null-ls
    use "jose-elias-alvarez/null-ls.nvim"

    -- Colorschemes
    use "folke/tokyonight.nvim"
    use "gruvbox-community/gruvbox"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "EdenEast/nightfox.nvim"
    use "ful1e5/onedark.nvim"
    use "rebelot/kanagawa.nvim"

    -- Utilities
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    use "kyazdani42/nvim-web-devicons"
end)

