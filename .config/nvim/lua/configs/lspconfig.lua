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

-- Specific configs
vim.lsp.config["elixirls"].setup {
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
  vim.lsp.config[config].setup {}
end

-- read :h vim.lsp.config for changing options of lsp servers
