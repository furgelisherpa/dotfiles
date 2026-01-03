-- automatically install a packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = packer_user_config,
	pattern = "plugins.lua",
	callback = function()
		vim.cmd("source " .. vim.fn.expand("<afile>"))
		vim.cmd("PackerSync")
	end,
})

-- if a packer is not loaded then do nothing
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- floating window for packer
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- plugins
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- plugin manager

	-- require for packer pop up window
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	use("windwp/nvim-autopairs") -- insert a paranthesis automatiacally
	use("nvim-lualine/lualine.nvim") -- lualine
	use("akinsho/toggleterm.nvim") -- terminal
	use("nvim-telescope/telescope.nvim") -- telescope
  use({
    "nvimtools/none-ls.nvim",
    requires = "nvimtools/none-ls-extras.nvim"
  }) -- formatter
	use("mg979/vim-visual-multi") -- multiline cursor
	use("windwp/nvim-ts-autotag") -- autotag
	use("blazkowolf/gruber-darker.nvim") -- colorscheme
	use("norcalli/nvim-colorizer.lua") -- color highlighter

	-- which-key
	use({
		"folke/which-key.nvim",
		commit = "0539da0", -- use v2.1.0
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippet
	use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
	use("rafamadriz/friendly-snippets")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("RRethy/vim-illuminate")

	-- file manager
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
	})

  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "sindrets/diffview.nvim",
      "dinhhuy258/git.nvim"
    },
  })

	-- automatically set up your configuration after cloning packer.nvim
	-- put this at the end after all configs
	if packer_bootstrap then
		require("packer").sync()
	end
end)
