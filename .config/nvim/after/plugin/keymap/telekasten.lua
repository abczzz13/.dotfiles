local nnoremap = require("tdj.keymap").nnoremap
local inoremap = require("tdj.keymap").inoremap

nnoremap("<leader>zf", function() require('telekasten').find_notes() end)
nnoremap("<leader>zd", function() require('telekasten').find_daily_notes() end)
nnoremap("<leader>zg", function() require('telekasten').search_notes() end)
nnoremap("<leader>zz", function() require('telekasten').follow_link() end)
nnoremap("<leader>zT", function() require('telekasten').goto_today() end)
nnoremap("<leader>zW", function() require('telekasten').goto_thisweek() end)
nnoremap("<leader>zw", function() require('telekasten').find_weekly_notes() end)
nnoremap("<leader>zn", function() require('telekasten').new_note() end)
nnoremap("<leader>zN", function() require('telekasten').new_templated_note() end)
nnoremap("<leader>zy", function() require('telekasten').yank_notelink() end)
nnoremap("<leader>zc", function() require('telekasten').show_calendar() end)
nnoremap("<leader>zC", ":CalendarT<CR>")
nnoremap("<leader>zi", function() require('telekasten').paste_img_and_link() end)
nnoremap("<leader>zt", function() require('telekasten').toggle_todo() end)
nnoremap("<leader>zb", function() require('telekasten').show_backlinks() end)
nnoremap("<leader>zF", function() require('telekasten').find_friends() end)
nnoremap("<leader>zI", function() require('telekasten').insert_img_link({ i=true }) end)
nnoremap("<leader>zp", function() require('telekasten').preview_img() end)
nnoremap("<leader>zm", function() require('telekasten').browse_media() end)
nnoremap("<leader>za", function() require('telekasten').show_tags() end)
nnoremap("<leader>#", function() require('telekasten').show_tags() end)
nnoremap("<leader>zr", function() require('telekasten').rename_note() end)

nnoremap("<leader>z", function() require('telekasten').panel() end)

--[[
inoremap("<leader>[", "<cmd>:lua require('telekasten').insert_link({ i=true })<CR>")
inoremap("<leader>zt", " <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>")
inoremap("<leader>#", "<cmd>lua require('telekasten').show_tags({i = true})<cr>")
]]
