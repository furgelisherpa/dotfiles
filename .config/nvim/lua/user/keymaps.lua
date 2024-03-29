-- Nvim Config file
vim.keymap.set("n", "<leader>c", "<cmd>tabe $MYVIMRC<cr>", { noremap=true, silent=true, desc="Edit a config file" })

-- Tab Navigation
vim.keymap.set("n", "<leader>j", "<cmd>tabnext<cr>", { noremap=true, silent=true, desc="Next tab" })
vim.keymap.set("n", "<leader>k", "<cmd>tabp<cr>", { noremap=true, silent=true, desc="Previous tab" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete!<cr>", { noremap=true, silent=true, desc="Close current buffer" })

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap=true, silent=true, desc="Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap=true, silent=true, desc="Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap=true, silent=true, desc="Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap=true, silent=true, desc="Move right" })

-- Terminal
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap=true, silent=true, desc="Escape terminal mode" })
vim.keymap.set("n", "<leader>ot", "<cmd>15sp term://bash | startinsert<cr>", { noremap=true, silent=true, desc="Open a terminal window" })

-- Make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { noremap=true, silent=true, desc="Make executable" })

-- Create New empty window
vim.keymap.set("n", "<leader>sn", "<cmd>new<cr>", { noremap=true, silent=true, desc="Create new empty split buffer" })
vim.keymap.set("n", "<leader>vn", "<cmd>vnew<cr>", { noremap=true, silent=true, desc="Create new empty virtical split buffer" })
vim.keymap.set("n", "<leader>e", "<cmd>tabe<cr>", { noremap=true, desc="Create new empty tab buffer" })
