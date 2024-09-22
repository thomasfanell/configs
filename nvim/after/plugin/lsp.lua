require("mason").setup {}

lsp_zero = require("lsp-zero")

require("mason-lspconfig").setup {
    ensure_installed = {
        "vimls",
        "lua_ls",
        "clangd",
        "neocmake",
        "pylsp",
        "rust_analyzer",
    },
    handlers = {
        lsp_zero.default_setup,
    },
}

--
-- LSP messages
--
require("fidget").setup {}

--
-- Function signatures
--
require("lsp_signature").setup {}

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
-- Format on save
--
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

lsp_zero.on_attach(function(client, bufnr)
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
    -- Format on save
    lsp_format_on_save(bufnr)
end)

-- Configure LSPs
-------------------------------------------------------------------------------

local lspconfig = require "lspconfig"

lspconfig.clangd.setup {}
lspconfig.neocmake.setup {}
lspconfig.vimls.setup {}
lspconfig.rust_analyzer.setup {}

lspconfig.lua_ls.setup {
    Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        -- diagnostics = { disable = { "missing-fields" } },
    },
}

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391' },
                    maxLineLength = 120
                }
            }
        }
    }
}
