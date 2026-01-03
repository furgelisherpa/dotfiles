local servers = {
	"lua_ls",
	"pyright",
	"html",
	"cssls",
	"tailwindcss",
	"ts_ls",
  "clangd"
}

local tools = {
  "eslint_d",
	"prettierd",
	"stylua",
}

local settings = {
	ensure_installed = tools,
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
