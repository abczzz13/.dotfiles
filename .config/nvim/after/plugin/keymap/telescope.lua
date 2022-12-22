local Remap = require("tdj.keymap")
local nnoremap = Remap.nnoremap

-- nnoremap("<C-p>", ":Telescope<CR>")
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<C-p>", function()
    require('telescope.builtin').git_files({})
end)
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
nnoremap("<leader>pd", function()
    require('telescope.builtin').diagnostics()
end)
nnoremap("<leader>vwh", function()
    require('telescope.builtin').help_tags()
end)
nnoremap("<leader>gc", function()
    require('tdj.telescope').git_branches()
end)
nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

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
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
--[[
vim.api.nvim_set_keymap(
    "n",
    "<F4>",
    "<cmd>:lua require('tdj.telescope').reload()<CR>",
    { noremap = true, silent = true }
)
]]
