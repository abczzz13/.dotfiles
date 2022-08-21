local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "tdj.lsp.configs"
require("tdj.lsp.handlers").setup()
-- require "tdj.lsp.null-ls"
