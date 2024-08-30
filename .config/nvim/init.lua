require("config.lazy")

-- quit
vim.api.nvim_set_keymap('n', '<Space>q', ':q<cr>', { noremap = true })
-- close tab
vim.api.nvim_set_keymap('n', '<Space>c', ':tabclose<cr>', { noremap = true })


-- telescope
local telescopebuiltin = require("telescope.builtin")
vim.keymap.set('n', '<Space>ff', telescopebuiltin.find_files, {})
vim.keymap.set('n', '<Space>st', telescopebuiltin.live_grep, {})
