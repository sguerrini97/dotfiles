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

-- add cmp_nvim_lsp capabilities to lspconfig
-- should run before any language server configuration
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- mason language server autosetup
require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			if server_name == "lua_ls" then
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			else
				require("lspconfig")[server_name].setup({})
			end
		end,
	},
})

-- set options
local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

-- color scheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight-night")

-- reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- enable features for when there is a language server active on the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

-- completion
local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = cmp.mapping.preset.insert({
		-- Enter to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})
