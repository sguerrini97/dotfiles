require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
