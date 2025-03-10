-- automatically install a packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
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
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- floating window for packer
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

-- plugins
return require('packer').startup(function(use)
  -- plugin manager
  use 'wbthomason/packer.nvim'
  -- require for packer pop up window
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  -- insert a paranthesis automatiacally
  use 'windwp/nvim-autopairs'
  -- lualine
  use 'nvim-lualine/lualine.nvim'
  -- tabline
  use 'alvarosevilla95/luatab.nvim'
  -- terminal
  use 'akinsho/toggleterm.nvim'
  -- project
  use 'ahmedkhalf/project.nvim'
  -- which-key
  use {
    'folke/which-key.nvim',
    commit = '0539da0' -- use v2.1.0
  }
  -- telescope
  use 'nvim-telescope/telescope.nvim'
  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  -- snippet
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'RRethy/vim-illuminate'
  -- formatter
  use 'nvimtools/none-ls.nvim'
  -- multiline cursor
  use 'mg979/vim-visual-multi'
  -- colorscheme
  use {
    'sainnhe/gruvbox-material',
    'craftzdog/solarized-osaka.nvim',
    'loctvl842/monokai-pro.nvim',
  }
  -- delimiters
  use 'HiPhish/rainbow-delimiters.nvim'
  -- file manager
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }
  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all configs
  if packer_bootstrap then
    require('packer').sync()
  end
end)
