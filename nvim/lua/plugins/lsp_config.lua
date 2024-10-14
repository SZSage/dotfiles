-- Define capabilities once to reuse across LSP configurations
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Utility function to find the root directory for most language servers
local function get_root_dir(fname)
  return require("lspconfig").util.root_pattern(
    "build.xml", -- Ant
    "pom.xml", -- Maven
    "settings.gradle", -- Gradle
    "settings.gradle.kts", -- Gradle Kotlin
    "build.gradle", -- Gradle
    "build.gradle.kts", -- Gradle Kotlin
    ".git" -- Git root
  )(fname) or vim.fn.getcwd() -- Fallback to current working directory
end

return {
  {
    "nvim-java/nvim-java",
    config = function()
      require("java").setup({
        root_markers = {
          "settings.gradle",
          "settings.gradle.kts",
          "pom.xml",
          "build.gradle",
          "mvnw",
          "gradlew",
          "build.gradle",
          "build.gradle.kts",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Java (jdtls) Configuration
      lspconfig.jdtls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls" },
        settings = {
          java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            referencesCodeLens = { enabled = true },
            implementationsCodeLens = { enabled = true },
            format = { enabled = true }, -- Enable auto-formatting
          },
        },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      -- Configure jedi (Python LSP)
      lspconfig.jedi_language_server.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/jedi-language-server" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      -- Configure clangd (C, C++)
      lspconfig.clangd.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/clangd" },
        filetypes = { "c" },
        root_dir = get_root_dir,
      })

      -- Configure pyright (Python)
      lspconfig.pyright.setup({
        capabilities = capabilities,
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        settings = {
          pyright = {
            disableOrganizeImports = true, -- using ruff for this
            disableLanguageServices = true,
          },
          python = {
            analysis = {
              ignore = { "*" }, -- Using Ruff
              typeCheckingMode = "off",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              logLevel = "Information",
            },
          },
        },
      })

      -- Configure ruff_lsp (Python linter)
      lspconfig.ruff_lsp.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/ruff-lsp" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      -- Configure lua_ls (Lua)
      lspconfig.lua_ls.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/lua-language-server" },
        filetypes = { "lua" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      -- Configure omnisharp (C#, .NET)
      lspconfig.omnisharp.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp-mono" },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
        enable_ms_build_load_projects_on_demand = false,
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        enable_import_completion = true,
        organize_imports_on_format = true,
        enable_decompilation_support = true,
        analyze_open_documents_only = false,
        filetypes = { "cs", "vb", "csproj", "sln", "slnx", "props", "csx", "targets" },
        root_dir = get_root_dir,
      })
    end,
  },
}
