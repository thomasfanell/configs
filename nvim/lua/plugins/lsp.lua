--
-- LSP packages
--
return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
    -- Code completion and snippets
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    --{ "ms-jpq/coq_nvim", branch = "coq" },
    -- LSP messages
    { "j-hui/fidget.nvim" },
    -- Function definitions
    { "ray-x/lsp_signature.nvim", event = "VeryLazy"},
}
