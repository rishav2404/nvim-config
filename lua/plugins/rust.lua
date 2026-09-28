return {
  -- ============================================================
  -- Rust
  -- ============================================================

  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    ft = { "rust" },

    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },

    config = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },

              check = {
                command = "clippy",
              },

              procMacro = {
                enable = true,
              },
            },
          },
        },

        dap = {
          adapter = {
            type = "executable",
            command = "/usr/bin/lldb-dap",
            name = "lldb",
          },
        },
      }
    end,
  },

  -- ============================================================
  -- Cargo.toml / crates.io integration
  -- ============================================================

  {
    "saecki/crates.nvim",
    ft = { "toml" },

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    opts = {
      -- completion = {
      --   cmp = {
      --     enabled = true,
      --   },
      -- },

      popup = {
        border = "rounded",
      },

      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },

  -- ============================================================
  -- Debug Adapter Protocol
  -- ============================================================

  {
    "mfussenegger/nvim-dap",
  },

  -- ============================================================
  -- Debug UI
  -- ============================================================

  {
    "rcarriga/nvim-dap-ui",

    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
