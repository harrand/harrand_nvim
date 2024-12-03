local first_path = vim.fn.stdpath("config")
print("first path: " .. first_path)

local on_first_install = function()
	-- this code is ran once ever.
	local firstfile = io.open(first_path .. "/first", "w")
	firstfile:write()
	firstfile:close()

	-- todo: stuff that runs the first time this config is used
	print("Fetching packer...")
	local job = vim.fn.jobstart(
		"git clone https://github.com/wbthomason/packer.nvim",
		{
			cwd = first_path
		}
	)
	vim.fn.jobwait({job})
end

-- First time install
local firstfile = io.open(first_path .. "/first", "r")
if firstfile ~= nil then
	io.close(firstfile)
	-- not the first time
else
	-- first time
	on_first_install()
end

require("harrand.config")
require("harrand.remap")
require("harrand.packer")
