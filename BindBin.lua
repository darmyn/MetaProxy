local Bind = require "Bind"

local BindBin = {}
BindBin.__index = BindBin

function BindBin.new()
	local self = setmetatable({}, BindBin)

	self.binds = {}

	return self
end

function BindBin:Fire(...)
	print("FIRE")
	for _, bind in pairs(self.binds) do
		bind:Fire(...)
	end
end

function BindBin:Bind(callback)
	local bind = Bind.new(self, callback)
	table.insert(self.binds, bind)
	return bind
end

function BindBin:Unbind()
	for _, bind in pairs(self.binds) do
		if bind.connected then
			bind:Unbind()
		end
	end
	table.clear(self.binds)
end

return BindBin