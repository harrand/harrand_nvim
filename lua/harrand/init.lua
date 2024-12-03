require("harrand.config")
require("harrand.remap")

local packpath = vim.o.packpath
local first_path = packpath:match("([^,]+)")  -- This matches everything before the first comma
print(first_path)

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
			cwd = first_path,
			on_exit = function() print("Finished fetching packer") end
		}
	)
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
