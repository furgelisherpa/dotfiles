local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

ibl.setup {
  indent = { char = "▏" },
  whitespace = { remove_blankline_trail = false },
  scope = { enabled = false },
}
