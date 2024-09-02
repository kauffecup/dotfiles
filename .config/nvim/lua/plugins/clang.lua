local function get_bazel_target_output(target, config)
  local cmd = string.format("bazel cquery %s --output=files --config=%s", target, config)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()
  return result:gsub("^%s*(.-)%s*$", "%1") -- Trim whitespace
end

local function get_fullscreen_tests()
  local bazel_output = get_bazel_target_output("//fullscreen:FullscreenTests", "debug")
  local bazel_root = "/private/var/tmp/_bazel_jkaufman/3330af182fb32176c161c7964ff189e0/execroot/figma"
  return bazel_root .. "/" .. bazel_output
end

local function build_tests()
  print("Current working directory: " .. vim.fn.getcwd())
  local cmd = "./fullscreen/fs build FullscreenTests --hardlink"

  print("Building tests...")
  local output = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    print("Build failed. Output:\n" .. output)
    return false
  else
    print("Build completed successfully.")
    return true
  end
end

return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end

      dap.listeners.before["launch"]["build_tests"] = function(session, config)
        if not build_tests() then
          print("Aborting debug session due to build failure.")
          return false -- This will prevent the debug session from starting
        end
        return true -- Continue with the launch
      end

      dap.configurations.cpp = {
        {
          type = "codelldb",
          request = "launch",
          name = "Currently focused test",
          args = function()
            local filename = vim.fn.expand("%:t:r")
            return { "-#", string.format("[#%s]", filename) }
          end,
          program = function()
            return get_fullscreen_tests()
          end,
          initCommands = {
            function()
              local executable_path = get_fullscreen_tests()
              return string.format("platform settings -w %s/../../../../..", executable_path)
            end,
            "command script import ${workspaceFolder}/fullscreen/scripts/xcode/figma.py",
          },
        },
      }
    end,
  },
}
