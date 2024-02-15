local status_treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_treesitter_ok then
  return
end

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
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { '' },
    additional_vim_regex_highlighting = { 'markdown' },
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
