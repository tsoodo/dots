return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        'filename',
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                        symbols = {
                            modified = '', -- Text to show when the file is modified
                            readonly = ' 󰌾 ', -- Text to show when the file is non-modifiable or readonly
                            unnamed = '[No Name]', -- Text to show for unnamed buffers
                        }
                    }
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        })
    end
}
