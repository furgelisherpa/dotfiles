local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local eslint_config = {
  command = "eslint",
  prefer_local = "node_modules/.bin",
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  timeout = 5000,
  condition = function(utils)
    return utils.root_has_file({
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yaml",
      ".eslintrc.yml",
      ".eslintrc.json",
    })
  end,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.prettierd.with({
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  }}),
  require("none-ls.diagnostics.eslint_d").with(eslint_config)
}

null_ls.setup({
  sources = sources,
  on_attach = require("core.plugins.lsp.handlers").on_attach
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.fixAll.eslint" },
      },
    })
    vim.lsp.buf.format({
      async = false,
      filter = function(client) return client.name == "null-ls" end,
    })
  end,
})
