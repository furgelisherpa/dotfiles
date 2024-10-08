-- fix weird naming for terminal windows
vim.api.nvim_create_augroup('Terminal', { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = 'Terminal',
  callback = function()
    if vim.bo.buftype == "terminal" then
      local buf_num = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_name(buf_num, "terminal")
    end
  end,
})
