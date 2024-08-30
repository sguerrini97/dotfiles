require("config.lazy")

-- quit
vim.api.nvim_set_keymap('n', '<Space>q', ':q<cr>', { noremap = true })
-- close tab
vim.api.nvim_set_keymap('n', '<Space>c', ':tabclose<cr>', { noremap = true })

