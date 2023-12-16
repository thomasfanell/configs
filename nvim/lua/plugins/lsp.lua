return {
    -- Automatic LSP install management
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
        }
    },
    -- LSP client configuration
    {
        "VonHeikemen/lsp-zero.nvim"
    },
    -- Code completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-path"},
            {"L3MON4D3/LuaSnip"},
            {"saadparwaiz1/cmp_luasnip"},
            {
                "ray-x/lsp_signature.nvim",
                event = "VeryLazy",
            },
        }
    },
    -- nvim lua goodies
    {"folke/neodev.nvim"},
    -- nvim & LSP status notifications
    {"j-hui/fidget.nvim"},
}
