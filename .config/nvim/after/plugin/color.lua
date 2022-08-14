-- vim.g.catpuccin_flavour = "mocha"

-- require("catppuccin").setup()
-- require("onedark").setup()

vim.cmd[[colorscheme tokyonight]]

require("lualine").setup {
    options = {
        theme = "tokyonight"
    }
}
