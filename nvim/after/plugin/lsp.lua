--
-- Automatic LSP install
--
require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = {
        "vimls",
        "lua_ls",
        "clangd",
        "cmake",
        "pyright",
        "rust_analyzer",
    }
}
--
-- nvim lua goodies
--
require("neodev").setup {}

--
-- LSP client setup
--
local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

--
-- LSP server configurations
--
local lspconfig = require("lspconfig")
lspconfig.vimls.setup {}
lspconfig.lua_ls.setup {
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        -- diagnostics = { disable = { "missing-fields" } },
    },
}
lspconfig.clangd.setup {}
lspconfig.cmake.setup {}
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {}


--
-- Code completion
--
local cmp = require("cmp")
local luasnip = require "luasnip"
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup {}
cmp.setup {
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
}

--
-- Function signatures
--
require("lsp_signature").setup {}
