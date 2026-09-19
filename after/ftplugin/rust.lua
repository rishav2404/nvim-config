local map = vim.keymap.set

local opts = {
  buffer = true,
  silent = true,
}

local function nmap(lhs, rhs, desc)
  map("n", lhs, rhs, vim.tbl_extend("force", opts, {
    desc = desc,
  }))
end

-- ============================================================
-- Rust / rust-analyzer
-- ============================================================

nmap("<leader>rr", function()
  vim.cmd.RustLsp("runnables")
end, "Rust: Runnables")

nmap("<leader>rt", function()
  vim.cmd.RustLsp("testables")
end, "Rust: Testables")

nmap("<leader>re", function()
  vim.cmd.RustLsp("explainError")
end, "Rust: Explain error")

nmap("<leader>rc", function()
  vim.cmd.RustLsp("openCargo")
end, "Rust: Open Cargo.toml")

nmap("<leader>rp", function()
  vim.cmd.RustLsp("parentModule")
end, "Rust: Parent module")

nmap("<leader>rm", function()
  vim.cmd.RustLsp("expandMacro")
end, "Rust: Expand macro")

-- ============================================================
-- Formatting
-- ============================================================

nmap("<leader>rf", function()
  vim.lsp.buf.format({ async = false })
end, "Rust: Format")

vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

