local status_telescope_ok, telescope = pcall(require, 'telescope')
local status_trouble_ok, _ = pcall(require, 'trouble')
if not status_telescope_ok and not status_trouble_ok then
  return
end

local trouble = require("trouble.providers.telescope")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true, desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true, desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true, desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true, desc = "Telescope help tags" })
vim.keymap.set('n', '<leader>rf', builtin.oldfiles, { noremap = true, silent = true, desc = "Telescope recent files" })
vim.keymap.set('n', '<leader>qf', builtin.quickfix, { noremap = true, silent = true, desc = "Telescope quick fix" })
vim.keymap.set('n', '<leader>ll', builtin.loclist, { noremap = true, silent = true, desc = "Telescope location list" }) vim.keymap.set('n', '<leader>vo', builtin.vim_options, { noremap = true, silent = true, desc = "Telescope vim options" })

telescope.setup({
  defaults = {
    mappings = {
      i = { ["<C-t>"] = trouble.open_with_trouble },
      n = { ["<C-t>"] = trouble.open_with_trouble },
    },
  },
})
