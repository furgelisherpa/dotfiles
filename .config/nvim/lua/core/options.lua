-- disable vi compatibility
vim.opt.compatible = false

-- disable a intro
vim.opt.shortmess:append("I")

-- use blinking block cursor in insert mode
vim.opt.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

-- remove a "~" character
vim.opt.fillchars = { eob = " " }

-- hide a current mode status i.e INSERT, NORMAL, VISUAL, BLAH, BLAH
vim.opt.showmode = false

-- open help window in buttom screen
vim.opt.splitbelow = true
vim.opt.splitright = true

-- hide buffers instead of closing them
vim.opt.history = 5000

-- enable undofile
vim.opt.undolevels = 1000
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo//")

-- enable incsearch and disable highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- enable relativeline numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- disable swapfile and backups
vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("$HOME/.local/share/nvim/backup//")

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- use 2 spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.list = true

-- show tabline intelligently
vim.opt.showtabline = 1

-- enable cursorline
vim.opt.cursorline = false

-- enable a colorcolumn
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

-- enable folding
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{{{,}}}"
vim.opt.foldenable = true
vim.opt.foldlevel = 2
vim.opt.foldlevelstart = 0
vim.opt.foldnestmax = 10

-- appearance
vim.opt.termguicolors = true
vim.opt.laststatus = 2

-- disable mouse
vim.opt.mouse = ""

-- timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- hyphenated words recognized by searches
vim.opt.iskeyword:append("-,$,_")

-- clean
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- spell lang
vim.opt.spelllang = "en_us"
vim.opt.spell = false

-- auto write the file when switching to edit another file
vim.opt.autowrite = true

-- live view of substitutions when you type %s/foo/bar
vim.opt.inccommand = "nosplit"

-- by default, swap out all instances in a line during substitutions
vim.opt.gdefault = true

-- remove excess # when joining two lines of comments
vim.opt.formatoptions:append("j")

-- ignore hated files generally at vim level (Some autocomplete engines picks up
-- on and add their own ignored files to the mix)
vim.opt.wildignore:append("*.swp,*.bak,*.pyc,*.class,*/tmp/*")

-- display special characters like '.' for spaces and '>-' of tabs
vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = "» ",
}

-- set the default window border to rounded
vim.o.winborder = "rounded"

-- session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
