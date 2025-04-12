return {
    { "ellisonleao/gruvbox.nvim" },

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        opts = {
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            -- transparent = false,
            theme = "wave",
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "kanagawa",
        },
    }
}
