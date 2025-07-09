-- lua/ii/keys.lua
local k = vim.keymap
local opts = { noremap = true, silent = true }

-- general
vim.g.mapleader = " "

-- ZenMode keymaps
k.set("n", "<leader>z", ":ZenMode <CR>", opts)

-- Lazy stuff
k.set("n", "<leader>L", ":Lazy <CR>", opts)

-- Jumplist
k.set("n", "<C-i>", "<C-i>", opts)

-- New tab
k.set("n", "te", ":tabedit | Telescope find_files<Return>")
k.set("n", "<tab>", ":tabnext<Return>", opts)
k.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
k.set("n", "ss", ":split<Return><C-w>w", opts)
k.set("n", "sv", ":vsplit<Return><C-w>w", opts)
-- Select all
k.set("n", "<C-a>", "gg<S-v>G")

-- Move line down in normal mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)

-- Move line up in normal mode
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move selected lines down in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- Move selected lines up in visual mode
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
