vim.g.mapleader = " "
-- Open the directory of the current file in netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find files in git repo' })
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file) 
vim.keymap.set("n", "<leader>q", harpoon_ui.toggle_quick_menu) 
vim.keymap.set("n", "<leader>x", harpoon_mark.clear_all) 

vim.keymap.set("n", "<leader>t", function()
	vim.cmd("split | terminal")
end)
