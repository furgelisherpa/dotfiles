-- tab navigation
vim.keymap.set("n", "<leader>j", "<cmd>tabnext<cr>", { noremap=true, silent=true, desc="Next tab" })
vim.keymap.set("n", "<leader>k", "<cmd>tabp<cr>", { noremap=true, silent=true, desc="Previous tab" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete!<cr>", { noremap=true, silent=true, desc="Close current buffer" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap=true, silent=true, desc="Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap=true, silent=true, desc="Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap=true, silent=true, desc="Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap=true, silent=true, desc="Move right" })

-- terminal
vim.keymap.set("t", "<A-x>", "<C-\\><C-n>", { noremap=true, silent=true, desc="Escape terminal mode" })
vim.keymap.set("n", "<leader>ot", "<cmd>13sp term://bash | startinsert<cr>", { noremap=true, silent=true, desc="Open a terminal window" })

-- make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { noremap=true, silent=true, desc="Make executable" })

-- create new empty window
vim.keymap.set("n", "<leader>sn", "<cmd>new<cr>", { noremap=true, silent=true, desc="Create new empty split buffer" })
vim.keymap.set("n", "<leader>vn", "<cmd>vnew<cr>", { noremap=true, silent=true, desc="Create new empty virtical split buffer" })
vim.keymap.set("n", "<leader>e", "<cmd>tabe<cr>", { noremap=true, desc="Create new empty tab buffer" })

vim.keymap.set("n", "<leader>qf", "<cmd>lua vim.diagnostic.setqflist()<cr>", { noremap=true, desc="Quick fix" })
vim.keymap.set("n", "<leader>td", "<cmd>vim TODO * | copen<cr>", { noremap=true, desc="Quick fix" })
