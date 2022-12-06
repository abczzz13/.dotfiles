-- vim.g.catpuccin_flavour = "mocha"

-- require("catppuccin").setup()
-- require("onedark").setup()

vim.cmd[[colorscheme tokyonight]]

require("lualine").setup {
    options = {
        theme = "tokyonight"
    }
}

vim.cmd[[highlight CursorlineNr guifg=000000]]
vim.cmd[[highlight LineNr guifg=#b2b2b2]]
