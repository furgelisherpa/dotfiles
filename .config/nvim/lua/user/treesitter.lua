local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if (not status_ok) then
  return
end

ts.setup {
  highlight = {
    enable = true,
    disable = {""},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'vim', 'vimdoc',
    'org', 'markdown',
    'markdown_inline',
    'css', 'html',
    'lua', 'go',
    'bash', 'c',
  },
  auto_install = true,
  autotag = { enable = true, },
}
