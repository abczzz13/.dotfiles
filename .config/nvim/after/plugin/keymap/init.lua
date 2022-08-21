local Remap = require("tdj.keymap")

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
inoremap("jk", "<esc>")
nnoremap("<leader>lf", ":lua vim.lsp.buf.format()<CR>")

-- Better window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<leader>e", ":NvimTreeToggle<CR>")

--[[Resize with arrows
nnoremap("C-Up", ":resize +2<CR>")
nnoremap("C-Down", ":resize -2<CR>")
nnoremap("C-Left", ":vertical resize -2<CR>")
nnoremap("C-Right", ":vertical resize +2<CR>")
]]

-- Navigate buffers
nnoremap("<S-l>",":bnext<CR>")
nnoremap("<S-h>",":bprevious<CR>")

-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move text up and down
vnoremap("<A-j>", ":m .+1<CR>==")
vnoremap("<A-k>", ":m .-2<CR>==")
vnoremap("p", '"_dP') -- see if I like it

-- Move text up and down in Visual Block
xnoremap("J", ":move '>+1<CR>gv-gv")
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")
