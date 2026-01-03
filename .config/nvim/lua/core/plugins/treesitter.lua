local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
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
    "vim",
    "vimdoc",
    "markdown",
    "markdown_inline",
    "css",
    "html",
    "lua",
    "go",
    "bash",
    "c",
    "commonlisp",
    "toml",
    "yaml",
    "typescript",
    "javascript",
    "tsx",
    "jsx",
  },
  auto_install = true,
  autotag = { enable = false },
  sync_install = true,
  ignore_install = {},
})
