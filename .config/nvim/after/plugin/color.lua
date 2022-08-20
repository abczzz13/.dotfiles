-- vim.g.catpuccin_flavour = "mocha"

-- require("catppuccin").setup()
-- require("onedark").setup()

vim.cmd [[
try
    colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]

require("lualine").setup {
    options = {
        theme = "tokyonight"
    }
}
