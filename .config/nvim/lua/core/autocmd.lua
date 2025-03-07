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

-- auto switch cwd to current buffers path
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local cbftype = vim.bo.filetype
    local ibftype = { "checkhealth", "help", "terminal"}
    for _, type in ipairs(ibftype) do
      if cbftype == type then return end
    end
    local dir = vim.fn.expand("%:p:h")
    vim.cmd("cd " .. dir)
  end,
})
