local util = require("lspconfig.util")

local root_files = {
	".luarc.json",
	".luarc.jsonc",
	".luacheckrc",
	".stylua.toml",
	"stylua.toml",
	"selene.toml",
	"selene.yml",
}

return {
	default_config = {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_dir = function(fname)
			local root = util.root_pattern(unpack(root_files))(fname)
			if root and root ~= vim.env.HOME then
				return root
			end
			root = util.root_pattern("lua/")(fname)
			if root then
				return root
			end
			return util.find_git_ancestor(fname)
		end,
		single_file_support = true,
		log_level = vim.lsp.protocol.MessageType.Warning,
		docs = {},
	},
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = { vim.env.VIMRUNTIME } },
		},
	},
}
