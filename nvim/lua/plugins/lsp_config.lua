local automatic_installation = require("mason-nvim-dap.automatic_installation")

-- Utility function to find the root directory for most language servers
local function get_root_dir(fname)
  local root = require("lspconfig").util.root_pattern(
    ".git"
  )(fname)
  return root or vim.fn.getcwd();
 
  --)(fname) or require("lspconfig").util.path.dirname(fname)
end
-- Setup all plugins via Lazy.nvim
return {

  -- Mason and LSP configuration
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason lsp config utilizes mason to automatically ensure lsp servers are installed
  {
    "williamboman/mason-lspconfig.nvim",
    --dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "jdtls", "jedi_language_server", "clangd", "lua_ls", "omnisharp", "yamlls", "dockerls", "docker_compose_language_service", "basedpyright" },
      })
    end,
  },
  -- Mason DAP
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {"java-debug-adapter", "java-test"},
      automatic_installation = true
      })
    end
  },
  -- Utility plugin for configuring the Java server
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap"
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",      -- Completion framework
      "hrsh7th/cmp-nvim-lsp", -- LSP completion integration
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- Configure the LSP servers via lspconfig
      local lspconfig = require("lspconfig")

      -- Yaml LSP Config
      lspconfig.yamlls.setup({
        --cmd = { vim.fn.stdpath("data") .. "/mason/bin/yaml-language-server"},
        cmd = { "yaml-language-server", "--stdio"},
        filetypes =  { "yaml", "yml" },
        root_dir = get_root_dir,
        capabilities = capabilities
      })


      lspconfig.dockerls.setup({
        cmd = { "docker-langserver", "--stdio"},
        filetypes =  { "dockerfile" },
        root_dir = get_root_dir,
        capabilities = capabilities
      })

      lspconfig.docker_compose_language_service.setup({
        cmd = { "docker-compose-langserver", "--stdio"},
        filetypes =  { "yaml", "yml" },
        root_dir = get_root_dir,
        capabilities = capabilities
      })

      -- HTML LSP Config
      lspconfig.html.setup({
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      --[[
      -- Typescript
      lspconfig.ts_ls.setup({
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "tsx", "typescriptreact" },
        root_dir = get_root_dir,
        capabilities = capabilities
      })
      ]]--

      -- Tailwindcss
      lspconfig.tailwindcss.setup({
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes = { "typescriptreact" },
        root_dir = get_root_dir,
        capabilities = capabilities
      })

      -- C LSP Config
      lspconfig.clangd.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" },
        filetypes = { "c" },
        root_dir = get_root_dir,
      })

      lspconfig.basedpyright.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/basedpyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = get_root_dir,

        settings = {
          basedpyright = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          }
        }
      })

      lspconfig.lua_ls.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
        filetypes = { "lua" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      lspconfig.omnisharp.setup({
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp"},
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
      -- SQL LSP Configuration
      lspconfig.sqlls.setup({
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

    end,
  },
}
