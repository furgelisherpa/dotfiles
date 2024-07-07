vim.g.vimtex_view_method = 'zathura'
vim.g.maplocalleader = ','
vim.o.foldmethod = "expr"
vim.o.foldexpr="vimtex#fold#level(v:lnum)"
vim.o.foldtext="vimtex#fold#text()"
vim.o.foldlevel=2
