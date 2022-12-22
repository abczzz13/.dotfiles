function SetColorScheme(color)
    -- Fallback theme
    color = color or "tokyonight"

    -- Set Theme
    vim.cmd.colorscheme(color)

    -- Set Theme for lualine
    require("lualine").setup {
        options = {
            theme = color
        }
    }

    -- Set specific colors for line numbering in tokyonight
    if color == "tokyonight" then
        vim.cmd[[highlight CursorlineNr guifg=000000]]
        vim.cmd[[highlight LineNr guifg=#b2b2b2]]
    end

    -- Set transparancy
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
