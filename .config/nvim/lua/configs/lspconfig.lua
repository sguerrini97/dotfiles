require("nvchad.configs.lspconfig").defaults()

local servers = {
  "cssls",
  "eslint-lsp",
  "gofumpt",
  "gopls",
  "html",
  "intelephense",
  "pyright",
  "typescript-language-server",
}
vim.lsp.enable(servers)

local lspconfig = require "lspconfig"

local configs = {
  "lua_ls",
  "pyright",
  "ts_ls",
}

for _, config in pairs(configs) do
  lspconfig[config].setup {}
end

-- read :h vim.lsp.config for changing options of lsp servers
