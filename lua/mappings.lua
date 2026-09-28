require "nvchad.mappings"

local map = vim.keymap.set

-- ============================================================
-- General
-- ============================================================

map("n", ";", ":", {
  desc = "CMD enter command mode",
})

map("i", "jk", "<ESC>", {
  desc = "Escape insert mode",
})

-- Normal mode: Start visual selection with Shift + Arrow
map("n", "<S-Left>", "v<Left>", { desc = "Select left" })
map("n", "<S-Right>", "v<Right>", { desc = "Select right" })

-- Visual mode: Extend visual selection with Shift + Arrow
map("v", "<S-Left>", "<Left>", { desc = "Extend selection left" })
map("v", "<S-Right>", "<Right>", { desc = "Extend selection right" })

-- Normal Mode
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- Visual Mode (Moves selected blocks of text)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- ============================================================
-- Debugger
-- ============================================================

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, {
  desc = "Debugger: Toggle breakpoint",
})

map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Condition: "))
end, {
  desc = "Debugger: Conditional breakpoint",
})

map("n", "<leader>dc", function()
  require("dap").continue()
end, {
  desc = "Debugger: Continue",
})

map("n", "<leader>di", function()
  require("dap").step_into()
end, {
  desc = "Debugger: Step into",
})

map("n", "<leader>do", function()
  require("dap").step_over()
end, {
  desc = "Debugger: Step over",
})

map("n", "<leader>dO", function()
  require("dap").step_out()
end, {
  desc = "Debugger: Step out",
})

map("n", "<leader>dt", function()
  require("dap").terminate()
end, {
  desc = "Debugger: Terminate",
})

map("n", "<leader>dr", function()
  require("dap").repl.open()
end, {
  desc = "Debugger: REPL",
})

map("n", "<leader>dl", function()
  require("dap").run_last()
end, {
  desc = "Debugger: Run last",
})

map("n", "<leader>du", function()
  require("dapui").toggle()
end, {
  desc = "Debugger: Toggle UI",
})

map("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, {
  desc = "Debugger: Inspect variable",
})
