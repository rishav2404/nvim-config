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

nmap("<leader>cv", function()
  require("crates").show_versions_popup()
end, "Crates: Show versions")

nmap("<leader>cf", function()
  require("crates").show_features_popup()
end, "Crates: Show features")

nmap("<leader>cu", function()
  require("crates").update_crate()
end, "Crates: Update crate")

nmap("<leader>cU", function()
  require("crates").update_crates()
end, "Crates: Update all crates")

nmap("<leader>ch", function()
  require("crates").show_popup()
end, "Crates: Show information")

