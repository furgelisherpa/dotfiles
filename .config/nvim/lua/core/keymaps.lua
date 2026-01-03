-- global options
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local cmd_opts = { silent = true }

-- shorten function name
local keymap = vim.keymap.set

--remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- normal --
-- switch window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- navigate tabs
keymap("n", "<S-l>", "<cmd>tabnext<cr>", opts)
keymap("n", "<S-h>", "<cmd>tabprev<cr>", opts)
keymap("n", "<leader>tc", "<cmd>tabclose<cr>", opts)

-- buffer nav
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)

-- move text up and down
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", opts)

-- reindent an entire buffer
keymap("n", "<leader>g=", "<cmd>norm gg=G<cr>", opts)

-- shell
keymap("n", "<leader>cc", ":!", { noremap = true })

-- save my fingers when saving
keymap("n", "<leader>w", "<cmd>w!<cr>", opts)
keymap("n", "<leader>q", "<cmd>q!<cr>", { noremap = true })

-- fallback file browser
keymap("n", "<leader>e", "<cmd>Explore<cr>", { noremap = true })

-- insert --
-- press jk fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)

-- visual --
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- preserve delete register when pasting
keymap("v", "p", '"_dP', opts)

-- terminal --
-- switch terminal windows
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
