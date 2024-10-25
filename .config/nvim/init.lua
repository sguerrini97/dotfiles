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
require("lspconfig").intelephense.setup({}) -- PHP
require("lspconfig").jdtls.setup({}) -- Java
require("lspconfig").ltex.setup({}) -- LaTeX
require("lspconfig").pyright.setup({}) -- Python
require("lspconfig").rust_analyzer.setup({}) -- Rust
require("lspconfig").ts_ls.setup({}) -- JavaScript/TypeScript

-- set options
local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
