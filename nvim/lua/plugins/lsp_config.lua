-- Define capabilities once to reuse across LSP configurations
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Utility function to find the root directory for most language servers
local function get_root_dir(fname)
  return require("lspconfig").util.root_pattern(
    --"build.xml", -- Ant
   -- "pom.xml", -- Maven
    --"settings.gradle", -- Gradle
    --"settings.gradle.kts", -- Gradle Kotlin
    --"build.gradle", -- Gradle
    --"build.gradle.kts", -- Gradle Kotlin
    ".git" -- Git root
  )(fname) or require("lspconfig").util.path.dirname(fname)
end

-- Setup all plugins via Lazy.nvim
return {
  
  -- Add nvim-java plugin before configuring jdtls
  --[[
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
  --]]
  
  -- Mason and LSP configuration
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          --"jdtls",
          "jedi_language_server",
          "clangd",
          "pyright",
          "ruff_lsp",
          "lua_ls",
          "omnisharp",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Configure the LSP servers via lspconfig
      local lspconfig = require("lspconfig")
    --[[
      lspconfig.jdtls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/packages/jdtls/jdtls" },
        root_dir = get_root_dir,
        capabilities = capabilities,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            referencesCodeLens = { enabled = true },
            implementationsCodeLens = { enabled = true },
            format = { enabled = true }, -- Enable auto-formatting
          },
        },
      })
      --]]

      lspconfig.jedi_language_server.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/jedi-language-server" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" },
        filetypes = { "c" },
        root_dir = get_root_dir,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        settings = {
          python = {
            analysis = {
              ignore = { "*" }, -- Ruff for linting
              typeCheckingMode = "basic", -- Keep basic type checking enabled for Pyright
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              logLevel = "Information",
            },
          },
        },
      })

      lspconfig.ruff_lsp.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/ruff-lsp" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
        filetypes = { "lua" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

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
