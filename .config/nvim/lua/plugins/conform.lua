return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    local format_setup = {
        lsp_fallback = true,
        async = false,
	timeout_ms = 500,
    }

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = format_setup,
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format(format_setup)
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
