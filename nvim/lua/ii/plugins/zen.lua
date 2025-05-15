return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.8,           -- shade the backdrop of the Zen window
      width = 80,               -- width of the Zen window
      height = 1,               -- height of the Zen window
      options = {
        signcolumn = "no",      -- disable signcolumn
        number = false,         -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false,     -- disable cursorline
        cursorcolumn = false,   -- disable cursor column
        foldcolumn = "0",       -- disable fold column
        list = false,           -- disable whitespace characters
      },
    },
    plugins = {
      -- disable some global vim options (vim.o...)
      options = {
        enabled = true,
        ruler = false,                -- disables the ruler text in the cmd line area
        showcmd = false,              -- disables the command in the last line of the screen
        laststatus = 0,               -- hide the statusline in zen mode
      },
      twilight = { enabled = true },  -- enable twilight (ataraxis)
      gitsigns = { enabled = false }, -- disables git signs
    },
  },
}
