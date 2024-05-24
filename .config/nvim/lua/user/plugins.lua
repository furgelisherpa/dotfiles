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

  -- a universal dependencies for icons 
  use 'nvim-tree/nvim-web-devicons'

  -- insert a paranthesis automatiacally
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- cool keymaps reminding plugin
  use {
    'folke/which-key.nvim',
    config = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
      require('which-key').setup {}
    end
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'bufWinEnter',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'hiphish/rainbow-delimiters.nvim',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'org', 'markdown',
          'css', 'html',
          'lua', 'go',
          'vim', 'vimdoc',
          'bash', 'c',
        },
        sync_install = true,
        auto_install = true,
        highlight = {
          enable = true,
          disable = { '' },
          additional_vim_regex_highlighting = { 'markdown' },
        },
        autotag = { enable = true, },
        autopairs = { enable = true, },
        rainbow = { enable = true, },
      }
    end
  }

  -- file browser
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        filters = {
          dotfiles = false
        },
        vim.keymap.set(
        'n',
        '<leader>of',
        '<cmd>NvimTreeToggle<cr>',
        { noremap=true, silent=true, desc='Toggle file browser' })
      }
    end
  }

  -- colorizer
  use {
    'norcalli/nvim-colorizer.lua',
     config = function() require'colorizer'.setup {} end
  }

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup {} end
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
      }
    end
  }

  -- colorscheme
  use {
    'rebelot/kanagawa.nvim',
    config = function() vim.cmd([[ colorscheme kanagawa-dragon ]]) end
  }

  -- lsp-zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- lsp Support
      {'neovim/nvim-lspconfig'},
      -- autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(client, bufnr)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Goto Defination" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Hover" })
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc = "Workspace Symbol" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "Open Float" })
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "Code Action" })
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "References" })
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename idenetifier" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, remap = false, desc = "Signature Help" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Next Diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "Previous Diagnostic"})
      end)

      local mason = require('mason')
      mason.setup({})
      local mason_conf = require('mason-lspconfig')
      mason_conf.setup({
        ensure_installed = {'lua_ls', 'clangd', 'gopls'},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })

      local cmp = require('cmp')
      local cmp_select = {behavior = cmp.SelectBehavior.Select}

      cmp.setup({
        snippet = {
          expand = function(args) require'luasnip'.lsp_expand(args.body) end
        },
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp'},
          {name = 'nvim_lua'},
          {name = 'buffer'},
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end
  }

  -- latex
  use {
    'lervag/vimtex',
    config = function()
      vim.g.gavimtex_syntax_enabled = 0
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vim_compiler_method = 'latexrun'
      vim.g.maplocalleader = ','
    end
  }

  -- fuzzy finder
  use {
    'ibhagwan/fzf-lua',
    config = function ()
      require('fzf-lua').setup {
        winopts = {
          default = "belowright vnew",
        },
        vim.keymap.set('n',
        '<leader>ff',
        '<cmd>FzfLua files<cr>',
        { noremap=true, silent=true, desc='Find files' }),
        vim.keymap.set('n',
        '<leader>fcc',
        '<cmd>FzfLua files cwd=~/.config<cr>',
        { noremap=true, silent=true, desc='Find files' }),
        vim.keymap.set('n',
        '<leader>fb',
        '<cmd>FzfLua buffers<cr>',
        { noremap=true, silent=true, desc='Switch buffers' }),
      }
    end
  }

  -- neovim git
  use {
    'NeogitOrg/neogit',
    requires = {
      'sindrets/diffview.nvim',
    },
    config = function() require('neogit').setup {} end
  }

  -- tabline
  use {
    'alvarosevilla95/luatab.nvim',
    config = function() require('luatab').setup {} end
  }

  -- quick fix
  use {
    'ten3roberts/qf.nvim',
    config = function() require'qf'.setup {} end
  }

  -- automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all configs
  if packer_bootstrap then
    require('packer').sync()
  end
end)

