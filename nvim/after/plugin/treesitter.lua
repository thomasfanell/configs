require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "bash", "c", "c_sharp", "cmake", "cpp", "doxygen", "java", "javascript",
        "json", "kotlin", "lua", "make", "objc", "python", "rust", "swift", "toml",
        "typescript", "vim", "xml", "yaml"
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}
