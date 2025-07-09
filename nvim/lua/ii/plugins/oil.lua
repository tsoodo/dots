return {
    "stevearc/oil.nvim",
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
        require("oil").setup(opts) -- pass the opts defined above
        vim.keymap.set({ "n", "x" }, "sf", function()
            require("oil").open()
        end, { silent = true })
        vim.keymap.set("n", "t", function()
            local dir = require("oil").get_current_dir()
            if not dir then
                vim.notify("Could not get current Oil directory", vim.log.levels.ERROR)
                return
            end
            vim.fn.chdir(dir)
            print("Changed directory to " .. dir)
        end, { desc = "Set CWD to current Oil dir" })
    end,
}
