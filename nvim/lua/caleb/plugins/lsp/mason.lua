return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- enable mason and configure icons
        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "hdl_checker",
                "dockerls",
            }
        })
    end,
}
