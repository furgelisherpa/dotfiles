-- disable vi compatibility
vim.opt.compatible = false

-- disable a intro
vim.opt.shortmess:append 'I'

-- use blinking block cursor in insert mode
vim.opt.guicursor = 'n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- remove a '~' character
vim.opt.fillchars = { eob = ' ' }

-- hide a current mode status i.e INSERT, NORMAL, VISUAL, BLAH, BLAH
vim.opt.showmode = false

-- open help window in buttom screen
vim.opt.splitbelow = true
vim.opt.splitright = true

-- enable undofile
vim.opt.undofile = true

-- enable incsearch and disable highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- enable relativeline numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- disable swapfile and backups
vim.opt.swapfile = false
vim.opt.backup = false

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- use 2 spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- assigning space as a mapleader
vim.g.mapleader = " "

-- show tabline intelligently
vim.opt.showtabline = 1

-- enable cursorline
vim.opt.cursorline = false

-- enable a colorcolumn
vim.opt.colorcolumn = "80"

-- enable folding
vim.opt.foldmethod= "marker"
vim.opt.foldmarker="{{{,}}}"
vim.opt.foldenable = true
vim.opt.foldlevel = 2
vim.opt.foldlevelstart = 0
vim.opt.foldnestmax = 10

-- appearance
vim.opt.termguicolors = true
vim.opt.laststatus = 3

-- disable mouse
vim.opt.mouse = ""

-- timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- auto remove comment in 'o' "O"
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- hyphenated words recognized by searches
vim.opt.iskeyword:append "-"

-- clean
vim.opt.conceallevel = 2
