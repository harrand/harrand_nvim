-- $HINIT expands to the directory containing this config file.
vim.fn.setenv("HINIT", vim.fn.stdpath("config"))

vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4

vim.opt.wrap = false

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local file_dir = vim.fn.expand("%:p:h")
    if file_dir ~= "" then
      vim.cmd("silent! lcd " .. file_dir)
    end
  end,
})
