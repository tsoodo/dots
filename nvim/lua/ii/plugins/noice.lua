return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            scrollbar = false
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            -- Or use a highlight group
            -- background_colour = "Normal",
        }
    }
}
