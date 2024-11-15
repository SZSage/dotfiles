
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
        command = "/usr/bin/python3"; -- path to the Python executable
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
            return "/usr/bin/python3" -- Replace with the correct Python path
          end,
        },
      }

      -- Java debugger adapter
      dap.adapters.java = {
        type = "executable";
        command = "/opt/homebrew/Cellar/openjdk/23/libexec/openjdk.jdk/Contents/Home/bin/java";
        args = { "-m", "java-debug-adapter.adapter" };
      }
    
      -- define how to start debugger for Java files
      dap.configurations.java = {
        type = "launch";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        javaPath = function()
          return "/opt/homebrew/Cellar/openjdk/23/libexec/openjdk.jdk/Contents/Home/bin/java"
        end;
      }

    end,
  },
}
