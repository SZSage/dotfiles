return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- Utility function to find the root directory
      local function get_root_dir(fname)
        return lspconfig.util.root_pattern("build.gradle", "pom.xml", ".git")(fname) or vim.fn.getcwd()
      end

      -- Specific root_dir function for lua_ls
      local function get_lua_root_dir(fname)
        local root = lspconfig.util.root_pattern(".luarc.json", ".luarc.jsonc", "init.lua", "src", ".git")(fname)
        if root then
          print("Detected Lua root directory: " .. root)
        else
          print("Fallback to current working directory for Lua root")
          root = vim.fn.getcwd()
        end
        return root
      end

      -- Configure jedi (python lsp)
      lspconfig.jedi_language_server.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/jedi-language-server" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      -- Configure clangd
      lspconfig.clangd.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/clangd" },
        filetypes = { "c" },
        root_dir = get_root_dir
      })

      -- Configure pyright
      lspconfig.pyright.setup({
        capabilities = capabilities,
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        settings = {
          pyright = {
            disableOrganizeImports = true, -- using ruff
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
        on_attach = function(client, bufnr)
          print("Attaching to client: " .. client.name)
          client.server_capabilities.completionProvider = false
          print(vim.inspect(client.server_capabilities))
        end,
      })

      -- Configure ruff_lsp
      lspconfig.ruff_lsp.setup({
        cmd = { "/Users/sage/.local/share/nvim/mason/bin/ruff-lsp" },
        filetypes = { "python" },
        root_dir = get_root_dir,
        capabilities = capabilities,
      })

      -- Configure lua_ls
      lspconfig.lua_ls.setup({
        cmd = { "lua-language-server" }, -- Ensure this path is correct if using Mason or other installer
        filetypes = { "lua" },
        root_dir = get_lua_root_dir,
        capabilities = capabilities,
      })

      -- Use LspAttach to dynamically attach lsp_signature to all LSP clients
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
            return
          end
          require("lsp_signature").on_attach({
            -- add your configuration options here
          }, bufnr)
        end,
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
