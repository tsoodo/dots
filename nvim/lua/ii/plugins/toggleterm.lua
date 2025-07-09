return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Create a floating terminal instance
		local Terminal = require("toggleterm.terminal").Terminal

		-- Horizontal terminal
		local horizontal_terminal = Terminal:new({
			direction = "horizontal",
			opts = {
				open_mapping = [[<C-/>]], -- Default horizontal terminal
				direction = "horizontal",
			},
			-- Hide the terminal number in the buffer name
			hidden = true,
		})

		-- floating terminal
		local floating_term = Terminal:new({
			direction = "float",
			float_opts = {
				border = "curved",
				width = math.floor(vim.o.columns * 0.8),
				height = math.floor(vim.o.lines * 0.8),
			},
			-- Hide the terminal number in the buffer name
			hidden = true,
		})

		-- Function to toggle the floating terminal
		local function _floating_term_toggle()
			floating_term:toggle()
		end

		-- Function to toggle the horizontal terminal
		local function _horizontal_term_toggle()
			horizontal_terminal:toggle()
		end

		vim.keymap.set("n", "<C-S-/>", function()
			_floating_term_toggle()
		end, { desc = "Toggle floating terminal" })
		vim.keymap.set("t", "<C-S-/>", function()
			_floating_term_toggle()
		end, { desc = "Toggle floating terminal" })

		vim.keymap.set("n", "<C-/>", function()
			_horizontal_term_toggle()
		end, { desc = "Toggle horizontal terminal" })
		vim.keymap.set("t", "<C-/>", function()
			_horizontal_term_toggle()
		end, { desc = "Toggle horizontal terminal" })
	end,
}
