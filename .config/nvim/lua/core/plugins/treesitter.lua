local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if (not status_ok) then
  return
end

ts.setup({
  highlight = {
    enable = true,
    disable = { "latex" },
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'vim', 'vimdoc', 'markdown', 'markdown_inline', 'css',
    'html', 'lua', 'go', 'bash', 'c', 'commonlisp', 'php',
    'toml', 'yaml'
  },
  auto_install = true,
  autotag = { enable = true, },
  sync_install = false,
  ignore_install = {},
})
