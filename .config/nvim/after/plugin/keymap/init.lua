local Remap = require("tdj.keymap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Personal remaps
nnoremap("<leader>pv", "<cmd>Ex<CR>")
inoremap("jk", "<esc>")
inoremap("<C-c", "<esc>")
nnoremap("<leader>lf", ":lua vim.lsp.buf.format()<CR>")

-- ThePrimeagen remaps: special Paste, Yank and Delete
xnoremap("<leader>p", "\"_dP")

nnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+Y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>y", "\"+y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Smooth scrollign with Ctrl d/u
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzz")
nnoremap("N", "Nzz")

--
nnoremap("<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>") -- :UndotreeToggle
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

nnoremap("<leader>t", ":NvimTreeToggle<CR>")

-- Make file executable
nnoremap("<leader>x", ":!chmod +x %<CR>", { silent = true })

--[[Resize with arrows
nnoremap("C-Up", ":resize +2<CR>")
nnoremap("C-Down", ":resize -2<CR>")
nnoremap("C-Left", ":vertical resize -2<CR>")
nnoremap("C-Right", ":vertical resize +2<CR>")
]]

-- Navigate buffers
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

nnoremap("<C-k>", ":cnext<CR>zz")
nnoremap("<C-j>", ":cprev<CR>zz")

nnoremap("<leader>k", ":lnext<CR>zz")
nnoremap("<leader>j", ":lprev<CR>zz")

-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move text up and down
vnoremap("<A-j>", ":m .+1<CR>==")
vnoremap("<A-k>", ":m .-2<CR>==")
-- vnoremap("p", '"_dP') -- see if I like it

-- Move text up and down in Visual Block
xnoremap("<C-l>", ":move '>+1<CR>gv=gv")
xnoremap("<C-;", ":move '<-2<CR>gv=gv")
xnoremap("<A-j>", ":move '>+1<CR>gv=gv")
xnoremap("<A-k>", ":move '<-2<CR>gv=gv")

vnoremap("K", ":move '<-2<CR>gv=gv")
vnoremap("J", ":move '>+1<CR>gv=gv")

-- LSP Diagnostics
nnoremap("<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
nnoremap("<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
nnoremap("<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
nnoremap("<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
inoremap("<A-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap('<leader>rn', "<cmd>lua vim.lsp.buf.rename()<CR>")
nnoremap('<leader>ds', function()
    require('telescope.builtin').lsp_document_symbols()
end)
nnoremap('<leader>ws', function()
    require('telescope.builtin').lsp_dynamic_workspace_symbols()
end)

-- vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-,>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- DAP debug
nnoremap("<leader><cr>", "<cmd>:lua require'dap'.continue()<cr>")
nnoremap("<leader>da", "<cmd>:lua require('dapui').toggle()<cr>")
