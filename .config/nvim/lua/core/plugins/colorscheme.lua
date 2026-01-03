local status_ok, colo = pcall(require, "gruber-darker")
if not status_ok then
  vim.cmd.colorscheme("vim")
  return
end

colo.setup({
  bold = true,
  invert = {
    signs = false,
    tabline = false,
    visual = false,
  },
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = true,
  },
  undercurl = true,
  underline = true,
})

vim.opt.background = "dark"
vim.cmd.colorscheme("gruber-darker")
