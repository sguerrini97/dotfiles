require("nvchad.configs.lspconfig").defaults()

local servers = {
  "cssls",
  "dartls",
  "elixirls",
  "gopls",
  "html",
  "intelephense",
  "jdtls",
  "lua_ls",
  "pyright",
  "ts_ls",
}
vim.lsp.enable(servers)

local lspconfig = require "lspconfig"

-- Specific configs
lspconfig["elixirls"].setup {
  cmd = { vim.fn.expand "$HOME/.local/share/nvim/mason/bin/elixir-ls" },
}

-- Generic configs
local configs = {
  "dartls",
  "lua_ls",
  "pyright",
  "ts_ls",
}

for _, config in pairs(configs) do
  lspconfig[config].setup {}
end

-- read :h vim.lsp.config for changing options of lsp servers
