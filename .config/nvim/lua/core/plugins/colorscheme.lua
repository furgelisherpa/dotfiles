local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

local status_ok, trans = pcall(require, 'transparent')
if not status_ok then
  return
end

-- override background color to be as dark as the terminal
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'Black' })

trans.setup({
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
    "Oil",
  },
  exclude_groups = {},
  on_clear = function() end,
})
