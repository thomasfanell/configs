require("nvim-treesitter.configs").setup({
    ensure_installed = {"vim", "lua", "c", "cpp", "python", "rust", "javascript", "typescript"},
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})
