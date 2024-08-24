local colorscheme = "moonfly"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

-- override background color to be as dark as the terminal
vim.api.nvim_set_hl(0, 'Normal', { bg = 'Black' })
