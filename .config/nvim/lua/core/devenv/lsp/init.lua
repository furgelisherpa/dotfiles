local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "core.devenv.lsp.mason"
require("core.devenv.lsp.handlers").setup()
