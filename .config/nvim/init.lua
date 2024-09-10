require("config.lazy")

-- quit
vim.api.nvim_set_keymap("n", "<Space>q", ":q<cr>", { noremap = true })
-- close tab
vim.api.nvim_set_keymap("n", "<Space>c", ":tabclose<cr>", { noremap = true })
-- line numbers
vim.cmd("set number")

-- telescope
local telescopebuiltin = require("telescope.builtin")
vim.keymap.set("n", "<Space>ff", telescopebuiltin.find_files, {})
vim.keymap.set("n", "<Space>st", telescopebuiltin.live_grep, {})

-- mason
require("mason").setup()

-- language servers
require("lspconfig").beancount.setup({}) -- Beancount
require("lspconfig").dockerls.setup({}) -- Docker
require("lspconfig").gopls.setup({}) -- Go
require("lspconfig").ts_ls.setup({}) -- JavaScript/TypeScript
require("lspconfig").ltex.setup({}) -- LaTeX
require("lspconfig").intelephense.setup({}) -- PHP
require("lspconfig").pyright.setup({}) -- Python
require("lspconfig").rust_analyzer.setup({}) -- Rust
