local treesitter = require('nvim-treesitter.configs')
treesitter.setup({
  ensure_installed = {
    'bash',
    'c',
    'lua',
    'vim',
    'vimdoc',
    'html',
    'css',
    'java',
    'javascript',
    'typescript',
    'python',
    'markdown',
    'markdown_inline',
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
})
