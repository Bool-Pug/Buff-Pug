require("nvchad.configs.lspconfig").defaults()

----------------------------------------------------------------------
-- Cross-Device Java Helper for Kotlin Language Server
----------------------------------------------------------------------
local function get_kotlin_env()
  local env = {}
  local handle = io.popen("java -version 2>&1")
  if handle then
    local result = handle:read("*a")
    handle:close()
    
    -- If the host device is running Java 25, find a safe fallback path
    if result and (result:find('version "25') or result:find('25%.%d')) then
      local fallback_paths = {
        -- macOS paths
        "/opt/homebrew/opt/openjdk@21",
        "/opt/homebrew/opt/openjdk@17",
        "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",
        "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home",
        -- Linux paths
        "/usr/lib/jvm/java-21-openjdk",
        "/usr/lib/jvm/java-17-openjdk",
        "/usr/lib/jvm/java-21-openjdk-amd64",
        "/usr/lib/jvm/java-17-openjdk-amd64",
      }
      for _, path in ipairs(fallback_paths) do
        if vim.fn.isdirectory(path) == 1 then
          env.JAVA_HOME = path
          env.JAVACMD = path .. "/bin/java"
          break
        end
      end
    end
  end
  return env
end
----------------------------------------------------------------------

-- 1. Enable standard servers normally
local standard_servers = { "html", "cssls", "pyright" }
vim.lsp.enable(standard_servers)

-- 2. Enable Kotlin separately with our cross-device environment fallback
vim.lsp.config("kotlin_language_server", {
  cmd_env = get_kotlin_env(),
})
vim.lsp.enable("kotlin_language_server")

-- 3. Enable Java (when you are ready to add it)
-- vim.lsp.enable("jdtls")

-- read :h vim.lsp.config for changing options of lsp servers
