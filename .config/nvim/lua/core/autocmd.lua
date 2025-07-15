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
    local btypes = { "help", "nofile", "terminal", "quickfix" }
    local cbuftype = vim.bo.buftype
    if vim.tbl_contains(btypes, cbuftype) then return end
    local dir = vim.fn.expand("%:p:h")
    if dir ~= "" and vim.fn.isdirectory(dir) == 1 then
      vim.cmd("cd " .. vim.fn.fnameescape(dir))
    end
  end,
})
