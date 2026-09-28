require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- No need to manually enable completion with blink.cmp
-- blink.cmp handles completion automatically
