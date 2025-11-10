return {
  "vague2k/vague.nvim",
  dependencies = {
    "catppuccin/nvim",           -- Adding a light theme option
    "nvim-lualine/lualine.nvim", -- Add lualine as dependency to ensure it's loaded
  },
  config = function()
    -- Check if system is in light or dark mode
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null || echo 'Light'")
    local system_appearance = "Light" -- Default to Light
    if handle ~= nil then
      system_appearance = handle:read("*a"):gsub("%s+", "")
      handle:close()
    end

    local colors = {}
    if system_appearance == "Light" then
      -- Define light theme colors
      colors = {
        bg = "#f5f5f5",
        fg = "#2d2d2d",
        floatBorder = "#c0c0c0",
        line = "#e0e0e0",
        comment = "#8a8a8a",
        builtin = "#0f7c78",
        func = "#a83232",
        string = "#b46b0e",
        number = "#b46504",
        property = "#4b4b6a",
        constant = "#5d5d8a",
        parameter = "#7d5280",
        visual = "#e5e5e5",
        error = "#d32f2f",
        warning = "#ed6c02",
        hint = "#3949ab",
        operator = "#546e7a",
        keyword = "#1565c0",
        type = "#00695c",
        search = "#bbdefb",
        plus = "#388e3c",
        delta = "#f57c00",
      }
      -- Use a light colorscheme when system is in light mode
      require("vague").setup({
        transparent = true,
        colors = colors,
      })
      vim.cmd("colorscheme vague")
    else
      -- Use vague (dark theme) when system is in dark mode
      require("vague").setup({ transparent = true })
      vim.cmd("colorscheme vague")
      -- Get the dark theme colors after setup
      -- The vague.colors module might not have a get() function in some versions
      -- Let's use a safer approach to get colors
      local ok, vague_colors = pcall(require, "vague.colors")
      if ok and type(vague_colors.get) == "function" then
        colors = vague_colors.get()
      else
        -- Fallback colors for dark mode if we can't get them from the theme
        colors = {
          bg = "#1a1a1a",
          fg = "#d4d4d4",
          floatBorder = "#3a3a3a",
          line = "#2a2a2a",
          comment = "#6a6a6a",
          builtin = "#4ec9b0",
          func = "#ce9178",
          string = "#d7ba7d",
          number = "#b5cea8",
          property = "#9cdcfe",
          constant = "#4fc1ff",
          parameter = "#c586c0",
          visual = "#264f78",
          error = "#f44747",
          warning = "#ff8800",
          hint = "#569cd6",
          operator = "#d4d4d4",
          keyword = "#569cd6",
          type = "#4ec9b0",
          search = "#264f78",
          plus = "#6a9955",
          delta = "#ce9178",
        }
      end
    end
    -- Create custom lualine theme based on our color scheme
    local custom_theme = {
      normal = {
        a = { bg = colors.keyword, fg = colors.bg, gui = "bold" },
        b = { bg = colors.line, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.func, fg = colors.bg, gui = "bold" },
        b = { bg = colors.line, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.parameter, fg = colors.bg, gui = "bold" },
        b = { bg = colors.line, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.string, fg = colors.bg, gui = "bold" },
        b = { bg = colors.line, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.constant, fg = colors.bg, gui = "bold" },
        b = { bg = colors.line, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.bg, fg = colors.comment },
        b = { bg = colors.bg, fg = colors.comment },
        c = { bg = colors.bg, fg = colors.comment },
      },
    }
    -- Register the custom theme
    require("lualine").setup({
      options = {
        theme = custom_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
              modified = "", -- Text to show when the file is modified
              readonly = " 󰌾 ", -- Text to show when the file is non-modifiable or readonly
              unnamed = "[No Name]", -- Text to show for unnamed buffers
            },
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
