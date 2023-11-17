-- Author: CoffeeWise
-- Description: Real Chad's neovim config

-- {{{ Options Management

-- disable a intro
vim.opt.shortmess:append('I')

-- use blinking block cursor in insert mode
vim.opt.guicursor = 'n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- remove a '~' character
vim.opt.fillchars = { eob = ' ' }

-- hide a current mode status i.e INSERT, NORMAL, VISUAL, BLAH, BLAH
vim.opt.showmode = false

-- open help window in buttom screen
vim.opt.splitbelow = true
vim.opt.splitright = true

-- enable undofile
vim.opt.undofile = true

-- enable incsearch and disable highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- enable relativeline numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- disable swapfile and backups
vim.opt.swapfile = false
vim.opt.backup = false

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- use 2 spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- assigning space as a mapleader
vim.g.mapleader = " "

-- show tabline intelligently
vim.opt.showtabline = 1

-- enable cursorline
vim.opt.cursorline = true

-- enable a colorcolumn
vim.opt.colorcolumn = "80"

-- enable folding
vim.opt.foldmethod= "marker"
vim.opt.foldmarker="{{{,}}}"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 2

-- }}}

-- {{{ Autocmd group

-- what it does is 
-- disable automatic commenting on newline
-- stole from a luke smith's config, lol
vim.cmd([[
augroup RemoveFormatOptions
autocmd!
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
]])

-- disable a linenumbers in terminal mode
vim.cmd([[
autocmd TermOpen * setlocal nonu nornu
]])

-- }}}

-- {{{ Keybindings

-- File Browser
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { noremap=true, silent=true, desc="Toggle file browser" })

-- Paste without lossing yanked text
vim.keymap.set("n", "<leader>p", "\"_dP", { noremap=true, silent=true, desc="Paste without loosing data" })

-- Nvim Config file
vim.keymap.set("n", "<leader>c", "<cmd>tabe $MYVIMRC<cr>", { noremap=true, silent=true, desc="Edit a config file" })

-- Notes
vim.keymap.set("n", "<leader>n", "<cmd>tabe $HOME/notes.md<cr>", { noremap=true, silent=true, desc="Write a notes" })

-- Tab Navigation
vim.keymap.set("n", "<leader>e", ":tabe ", { noremap=true, desc="Edit new file in a tab" })
vim.keymap.set("n", "<leader>h", "<cmd>tabfirst<cr>", { noremap=true, silent=true, desc="First tab" })
vim.keymap.set("n", "<leader>j", "<cmd>tabnext<cr>", { noremap=true, silent=true, desc="Next tab" })
vim.keymap.set("n", "<leader>k", "<cmd>tabp<cr>", { noremap=true, silent=true, desc="Previous tab" })
vim.keymap.set("n", "<leader>l", "<cmd>tablast<cr>", { noremap=true, silent = true, desc="Last tab" })
vim.keymap.set("n", "<leader>x", "<cmd>tabc<cr>", { noremap=true, silent=true, desc="Close tab" })

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap=true, silent=true, desc="Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap=true, silent=true, desc="Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap=true, silent=true, desc="Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap=true, silent=true, desc="Move right" })

-- Terminal Navigaton
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap=true, silent=true, desc="Escape terminal mode" })
vim.keymap.set("n", "<leader>t", "<cmd>sp term://bash | resize -10 | startinsert<cr>", { noremap=true, silent=true, desc="Open a terminal window" })

-- }}} 

-- {{{ Plugin Management

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
local status_ok, packer = pcall(require, "packer")
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
}
)

-- Plugins
return require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Require for packer pop up window
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Powerful commenting plugin
  use { 
    'numToStr/Comment.nvim',
    config = function() require("Comment").setup{} end
  }

  -- Insert a paranthesis automatiacally
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Cool keymaps reminding plugin
  use {
    "folke/which-key.nvim",
    config = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
      require("which-key").setup {}
    end
  }

  -- Easy on Eye Colorscheme
  use {
    "sainnhe/everforest",
    config = function() vim.cmd([[ colorscheme everforest ]]) end
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- LSP server installer
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      lsp_zero.setup_servers({'clangd'})

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {"clangd"},
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  }

  -- File browser  
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require("nvim-tree").setup {} end
  }

  -- A Git wrapper
  use 'tpope/vim-fugitive'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- }}}
