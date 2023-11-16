return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
        ensure_installed = {
            "pyright",
            "ruff",
            "mypy",
        }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "rust_analyzer",
        "sqlls",
      },
      automatic_installation = true
    })
  end,
}
