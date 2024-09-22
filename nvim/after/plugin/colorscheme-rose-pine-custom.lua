require "rose-pine".setup {
    --- @usage "main" | "moon" | "dawn"
    variant = "main",
    dark_variant = "main",
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = true,

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },
    --
    -- Override style and color
    --
    palette = {
        -- Override the builtin palette per variant
        main = {
            iris = "#E0DEF4",
            foam = "#9EB9BD",
            pine = "#759e94",
            rose = "#B17181",
            gold = "#939E75",
            love = "#D4597C",
        },
    },

    highlight_groups = {
        --
        -- Types
        --
        ["@type"] = { fg = "foam", italic = false, bold = true },

        --
        -- Functions
        --
        ["@function.builtin"] = { fg = "rose", italic = false, bold = true },

        --
        -- Keywords
        --
        Keyword1 = { fg = "#6180A4", italic = false, bold = false },
        Keyword2 = { fg = "#93B4DA", italic = false, bold = false },

        ["@keyword"] = { link = "Keyword1" },
        ["@keyword.operator"] = { link = "Keyword1" },
        ["@keyword.import"] = { link = "Keyword1" },
        ["@keyword.storage"] = { link = "Keyword1" },
        ["@keyword.repeat"] = { link = "Keyword1" },
        ["@keyword.directive"] = { link = "Keyword1" },
        ["@keyword.directive.define"] = { link = "Keyword1" },
        ["@keyword.conditional"] = { link = "Keyword1" },
        ["@keyword.conditional.ternary"] = { link = "Keyword1" },
        ["@keyword.debug"] = { link = "Keyword2" },
        ["@keyword.return"] = { link = "Keyword2" },
        ["@keyword.exception"] = { link = "Keyword2" },
        ["@keyword.doxygen"] = { fg = "subtle", italic = false, bold = true },

        --
        -- Identifiers
        --
        ["@variable.builtin"] = { link = "@keyword" },
        ["@constant.builtin"] = { link = "@keyword" },

        --
        -- Literals
        --
        ["@string"] = { fg = "#D2C9AB" },
        ["@boolean"] = { link = "@keyword" },

        --
        -- Attributes
        --
        ["@attribute"] = { fg = "#737B79", italic = false, bold = false },

        --
        -- LSP semantics
        --
        ["@lsp.type.comment.c"] = { fg = "muted" },
        ["@lsp.type.comment.cpp"] = { fg = "muted" },
        ["@lsp.type.macro"] = { fg = "#77B59D", italic = false, bold = true },
        ["@lsp.typemod.property.classScope"] = { fg = "iris", italic = false, bold = false },
        ["@lsp.mod.constructorOrDestructor.cpp"] = { fg = "foam", italic = false, bold = false },
    }
}
