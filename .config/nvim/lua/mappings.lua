require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "dN", function()
  vim.diagnostic.goto_prev()
end, opts)
map("n", "dn", function()
  vim.diagnostic.goto_next()
end, opts)
map("n", "dm", function()
  vim.diagnostic.open_float()
end, opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
