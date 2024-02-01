-- Automatically install a packer 
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

-- If a packer is not loaded then do nothing
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Floating window for packer
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

-- Plugins
return require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Require for packer pop up window
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

  -- A universal dependencies for icons 
  use 'nvim-tree/nvim-web-devicons'

  -- Insert a paranthesis automatiacally
  use {
    'windwp/nvim-autopairs',
    config = function() require('user.plugins.autopairs') end
  }

  -- Cool keymaps reminding plugin
  use {
    'folke/which-key.nvim',
    config = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
      require('which-key').setup {}
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'bufWinEnter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'hiphish/rainbow-delimiters.nvim',
    },
    config = function() require('user.plugins.treesitter') end
  }

  -- File browser
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        filters = {
          dotfiles = false
        }
      }
    end
  }

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup {} end
  }

  -- Comment
  use {
    "numToStr/Comment.nvim",
    config = function() require("user.plugins.comment") end
  }

  -- Gitsigns
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("user.plugins.gitsigns") end
  }

  -- Lualine
  use {
    "nvim-lualine/lualine.nvim",
    config = function() require("user.plugins.lualine") end
  }

  -- Colorscheme
  use "rebelot/kanagawa.nvim"

  -- Lsp-Zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function() require('user.plugins.lsp-zero') end
  }

  -- Latex
  use {
    'lervag/vimtex',
    config = function() 
      vim.gavimtex_syntax_enabled = 0
      vim.api.nvim_set_var('vimtex_compiler_latexmk_engines', {
        _ = '-pdflatex',
        pdflatex = '-pdflatex',
        xelatex = '-xelatex',
        lualatex = '-lualatex',
      })
    end
  }

  -- Vimwiki
  use 'vimwiki/vimwiki'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

