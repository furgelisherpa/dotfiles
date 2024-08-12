local astatus_ok, alpha = pcall(require, "alpha")
local sstatus_ok, startify = pcall(require, "alpha.themes.startify")
if not (astatus_ok or sstatus_ok) then
  return
end

startify.section.header.val = {
  [[                     __                ]],
  [[      ___    __  __ /\_\    ___ ___    ]],
  [[     / _ `\ /\ \/\ \\/\ \  / __` __`\  ]],
  [[    /\ \/\ \\ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[    \ \_\ \_\\ \___/  \ \_\ \_\ \_\ \_\]],
  [[     \/_/\/_/ \/__/    \/_/\/_/\/_/\/_/]],
}
startify.section.top_buttons.val = {
  startify.button("e", "New file" ,     "<cmd>ene <BAR> startinsert <cr>"),
  startify.button("r", "Recent files",  "<cmd>Telescope oldfiles<cr>"),
  startify.button("p", "Find projects", "<cmd>Telescope projects<cr>"),
  startify.button("c", "Neovim Config", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim'})<cr>"),
  startify.button("h", "Help" ,         "<cmd>tabe | help | wincmd o<cr>"),
  startify.button("q", "Quit Neovim" ,  "<cmd>qa<cr>"),
}
startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
startify.section.bottom_buttons.val = {}

alpha.setup(startify.config)
