-- Author: CoffeeWise

require("user.options")
require("user.keymaps")
require("user.plugin")

vim.cmd([[
"colorscheme
colorscheme kanagawa-dragon

" literally stole from a luke smith's config, lol
" what it does is 
" disable automatic commenting on newline
augroup RemoveFormatOptions
autocmd!
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" disable a linenumbers in terminal mode
autocmd TermOpen * setlocal nonu nornu

" set transparent background
" augroup user_colors
" autocmd!
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" augroup END
]])
