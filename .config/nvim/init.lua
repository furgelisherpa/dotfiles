-- Author: CoffeeWise

require("user.options")
require("user.keymaps")
require("user.plugins")

vim.cmd([[
" took from lukesmith's neovim config
" disable automatic comment on newline
augroup RemoveFormatOptions
autocmd!
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" disable linenumbers in terminal mode
autocmd TermOpen * setlocal nonu nornu

" transparent background
" augroup user_colors
" autocmd!
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" augroup END
]])
