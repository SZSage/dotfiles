
-- This is an example of configuring the nvim-dap for Python debugging
return {
  -- ... your existing configuration ...

  -- Add the DAP plugin specification
  {
    "mfussenegger/nvim-dap",
    -- Additional configuration for nvim-dap
    config = function()
      local dap = require('dap')

      -- Configure the Python debugger adapter
      dap.adapters.python = {
        type = 'executable';
        command = "/opt/homebrew/bin/python3"; -- Replace with the path to the Python executable
        args = { '-m', 'debugpy.adapter' };
      }

      -- Define how to start the debugger for Python files
      dap.configurations.python = {
        {
          -- Name of the configuration, visible in the UI
          name = 'Launch File',
          -- Type of configuration, for Python use 'python'
          type = 'python',
          request = 'launch',
          -- This will start the current file being edited
          program = "${file}",
          pythonPath = function()
            -- Return the path to the Python executable
            return "/opt/homebrew/bin/python3" -- Replace with the correct Python path
          end,
        },
      }

      -- You can add other configurations for DAP below
    end,
  },
}
