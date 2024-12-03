vim.g.mapleader = " "
-- Open the directory of the current file in netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("t", "<leader><ESC>", "<C-\\><C-n>")

-- fuzzy finding
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find files in git repo' })
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- note: lsp stuff is in after/plugin/lsp.lua because i dont want it to apply to buffers
-- that dont have lsp coverage.

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
-- track a new file in harpoon
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file) 
-- open harpoon gui
vim.keymap.set("n", "<leader>q", harpoon_ui.toggle_quick_menu) 
-- remove everything in harpoon
vim.keymap.set("n", "<leader>x", harpoon_mark.clear_all) 

-- split current buffer and open a terminal at its parent directory
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("split | terminal")
end)

-- ctrl-w + hjkl is the default bind to move between splits
-- i prefer leader
vim.keymap.set("n", "<leader>a", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>s", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<leader>w", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<leader>d", "<C-w>l", { desc = "Move to right split" })
