return {
  -- change nvim-lspconfig options
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
      pyright = {
        capabilities = {
          textDocument = {
            publishDiagnostics = {
              tagSupport = {
                valueSet = { 2 },
              },
            },
          },
        },
      },
      ruff_lsp = {},
    },
  },
}
