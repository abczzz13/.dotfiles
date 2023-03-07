require("tokyonight").setup {
    transparent = true,
    styles = {
       sidebars = "transparent",
       floats = "transparent",
    }
}

function SetColorScheme(color)
    -- Fallback theme
    color = color or "tokyonight"

    -- Set Theme
    vim.cmd.colorscheme(color)

    -- Set Theme for lualine
    require("lualine").setup {
        options = {
            theme = color
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    path = 1,
                }
            },
        },
    }

    -- Set specific colors for line numbering in tokyonight
    if color == "tokyonight" then
        vim.cmd[[highlight Normal ctermbg=NONE guibg=NONE]]
        vim.cmd[[highlight NvimTreeNormal ctermbg=None guibg=None]]
        vim.cmd[[highlight CursorlineNr guifg=000000]]
        vim.cmd[[highlight LineNr guifg=#b2b2b2]]
        -- vim.cmd[[highlight DiffChange guibg=blue]]
    end

    -- Set transparancy
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
