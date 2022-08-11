local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup{
    defaults = {
        prompt_prefix = "> ", -- or " >"?
    }
}
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

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
