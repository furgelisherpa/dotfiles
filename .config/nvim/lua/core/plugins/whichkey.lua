local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["x"] = { "<cmd>!chmod +x %<cr>", "Make Executable" },
  ["s"] = { "<cmd>set spell!<cr>", "Toggle Spell Checking" },
  ["cc"] = { "<cmd>!compiler %<cr>", "Compile" },
  ["db"] = { "<cmd>tabe | Alpha<cr>", "Alpha Dashboard" },
  ["p"] = { "<cmd>MarkdownPreviewToggle<cr>", "Preview Markdown"},

  f = {
    name = "Find",
    ["f"] = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Files"
    },
    ["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["t"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    ["h"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    ["m"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    ["r"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    ["R"] = { "<cmd>Telescope registers<cr>", "Registers" },
    ["k"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    ["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  b = {
    name = "Buffer",
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["d"] = { "<cmd>bdelete!<CR>", "Delete" },
    ["f"] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    ["t"] = { "<cmd>filetype detect<cr>", "Detect Filetype" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
  },

  t = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
