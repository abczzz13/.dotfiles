-- Include the other files in /lua/tdj
require("tdj.set")
--[[ require("tdj.packer") ]]
--[[ require("tdl.plugin") ]]
--[[ require("tdj.telescope") ]]
require("tdj.telescope_simple")
require("tdj.cmp_simple")
--[[ require("tdj.cmp") ]]
--[[ require("tdj.lsp") ]]
require("tdj.lsp_simple")
--[[ require("tdj.autopairs") ]]
--[[ require("tdj.comment") ]]
--[[ require("tdj.gitsigns") ]]
--[[ require("tdj.nvim-tree") ]]
--[[ require("tdj.bufferline") ]]
--[[ require("tdj.indent") ]]
--[[ require("tdj.dap") ]]
require("tdj.zettelkasten")

local augroup = vim.api.nvim_create_augroup
local TdjGroup = augroup("tdj", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TdjGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
