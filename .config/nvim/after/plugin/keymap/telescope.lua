local Remap = require("tdj.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
--[[ nnoremap("<C-p>", function() ]]
--[[     require('telescope.builtin').git_files() ]]
--[[ end) ]]
nnoremap("<leader>pf", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<leader>pa", function()
    require('telescope.builtin').live_grep()
end)

nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
    require('telescope.builtin').help_tags()
end)

-- TODO: Fix this immediately
nnoremap("<leader>vwh", function()
    require('telescope.builtin').help_tags()
end)
--[[
nnoremap("<leader>vrc", function()
    require('tdj.telescope').search_dotfiles({ hidden = true })
end)
nnoremap("<leader>gc", function()
    require('tdj.telescope').git_branches()
end)
nnoremap("<leader>td", function()
    require('tdj.telescope').dev()
end)
]]

-- Move this to the 'right' place
vim.api.nvim_set_keymap(
    "n",
    "<space>ts",
    ":Telescope <CR>",
    { noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser<CR>",
  { noremap = true }
)
--[[
vim.api.nvim_set_keymap(
    "n",
    "<F4>",  
    "<cmd>:lua require('tdj.telescope').reload()<CR>",
    { noremap = true, silent = true }
)
]]
