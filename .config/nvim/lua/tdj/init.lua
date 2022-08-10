-- Include the other files in /lua/tdj
require("tdj.set")
require("tdj.packer")
require("tdj.telescope")
require("tdj.cmp")
require("tdj.lsp")
-- LSP Setup
--[[
require'lspconfig'.pyright.setup{
    on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    end,
}
require'lspconfig'.pyre.setup{}
]]
