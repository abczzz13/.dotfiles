-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'
    -- Colorschemes
    use 'folke/tokyonight.nvim'
    use 'gruvbox-community/gruvbox'
end)


-- Still need to install:
-- fzf
-- telescope
-- neogit
-- treesitter
-- cmp
-- nvim tree or nerdtree
-- 
