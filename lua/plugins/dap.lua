return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
          type = "server",
          host = "127.0.0.1",
          port = "${port}",
          executable = {
              -- !!!change me!!!
              command = "/home/grigirii/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb",
              args = { "--port", "${port}" },
          },
      }

      dap.configurations.rust = {
          {
              name = "Launch",
              type = "codelldb",
              request = "launch",
              program = function()
                  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
          },
      }
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup(
        {
          library = { plugins = { "nvim-dap-ui" }, types = true },
        }
      )
    end,
  }
}
