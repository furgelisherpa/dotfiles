local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("core.plugins.lsp.mason")
require("core.plugins.lsp.handlers").setup()
require("core.plugins.lsp.none-ls")
