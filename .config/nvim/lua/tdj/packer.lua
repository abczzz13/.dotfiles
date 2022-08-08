-- This file can be loaded by calling `lua require('plugins')` from your init.vim

--[[Still need to install:
-- fzf
-- telescope
-- neogit
-- treesitter
-- cmp
-- nvim tree or nerdtree
-- 'kyazdani42/nvim-web-devicons'
]]
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Telescope
    use "nvim-lua/plenary.nvim"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "nvim-telescope/telescope-file-browser.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    } 
    -- LSP
    use "neovim/nvim-lspconfig"

    -- Colorschemes
    use "folke/tokyonight.nvim"
    use "gruvbox-community/gruvbox"
end)

