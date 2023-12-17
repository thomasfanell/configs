local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
    local map_keys = function(keys, func, desc)
        desc = "[LSP]: " .. desc
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end
    local tb = require("telescope.builtin")
    map_keys("K", vim.lsp.buf.hover, "Hover Documentation")
    map_keys("gd", tb.lsp_definitions, "Go to definition")
    map_keys("gr", tb.lsp_references, "Go to references")
    map_keys("gI", tb.lsp_implementations, "Go to implementation")
    map_keys("<leader>rn", vim.lsp.buf.rename, "Rename")
    map_keys("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map_keys("<leader>D", tb.lsp_type_definitions, "Type definitions")
    map_keys("<leader>ds", tb.lsp_document_symbols, "Document symbols")
    map_keys("<leader>ws", tb.lsp_dynamic_workspace_symbols, "Workspace symbols")
    map_keys("<leader>F", vim.lsp.buf.format, "Format document")
    map_keys('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end)

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
    },
    handlers = {
        lsp_zero.default_setup,
    },
}

--
-- nvim lua goodies
--
require("neodev").setup {}

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
-- Requires manual installation of binaries.
-- See: https://github.com/nolanderc/glsl_analyzer
--
lspconfig.glsl_analyzer.setup {}

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
